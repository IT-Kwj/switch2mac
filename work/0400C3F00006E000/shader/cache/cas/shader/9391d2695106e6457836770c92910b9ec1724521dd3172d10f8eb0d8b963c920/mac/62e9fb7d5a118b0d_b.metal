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
    float4 m_62 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_80 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_66 [[user(locn8)]];
    float4 m_70 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_84 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_74 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_60 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3615 = false;
    bool _563 = false;
    bool _375 = false;
    bool _227 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3900 = as_type<float>(_123);
        out.gl_Position.z = _3900;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_51.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = _141;
    if (_137)
    {
        float _147 = float(_107);
        _143 = _147;
    }
    float _149 = _143;
    bool _151 = _141 >= _149;
    bool _153 = !_137;
    bool _155 = _151 || _153;
    if (_155)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _117;
    if (_155)
    {
        out.m_49.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3969 = as_type<float>(_161);
        out.gl_Position.z = _3969;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = in.m_56.x;
    float _167 = in.m_56.y;
    float _169 = in.m_56.z;
    int _171 = as_type<int>(_163) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_163) & 2;
    bool _177 = _175 != 0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = _167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _183 = _167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = _167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _187 = !_173;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _193 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    bool _197 = !_177;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _203 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _205 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    bool _207 = !_179;
    float _225;
    if (!_207)
    {
        float _209 = in.m_58.x;
        float _211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _217 = _215 * _211;
        float _219 = floor(_217);
        float _221 = -_219;
        float _223 = _217 + _221;
        _225 = _223;
        _227 = true;
    }
    else
    {
        float _229 = float(_107);
        float _231 = 1.0 / _229;
        float _233 = _141 * _231;
        _225 = _233;
    }
    _227 = false;
    float _235 = _225;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    bool _241 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _243 = isnan(_235);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    bool _253 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _255 = isnan(_235);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = -_251;
    float _275 = _273 + 1.0;
    float _277 = 1.0 / _267;
    bool _279 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _281 = isnan(_235);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = _263 * _275;
    float _293 = -_263;
    float _295 = _293 + 1.0;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _299 = _289 * _295;
    float _301 = 1.0 / _271;
    float _303 = -_289;
    float _305 = _303 + 1.0;
    float _307 = _239 * _277;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _235 + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _317;
    float _321 = fma(_315, _307, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = fma(_319, _307, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = _311 * _301;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _331 = _321 * _299;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _337 = _323 * _299;
    float _339 = fma(_329, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _341 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].x, _331);
    float _343 = fma(_335, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _345 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].y, _337);
    float _347 = fma(_339, _291, _341);
    float _349 = fma(_343, _291, _345);
    float _351 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[145].x, _347);
    float _353 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[145].y, _349);
    bool _355 = !_297;
    float _373;
    if (!_355)
    {
        float _357 = in.m_58.x;
        float _359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _361 = _357 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _363 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _365 = _363 * _359;
        float _367 = floor(_365);
        float _369 = -_367;
        float _371 = _365 + _369;
        _373 = _371;
        _375 = true;
    }
    else
    {
        float _377 = float(_107);
        float _379 = 1.0 / _377;
        float _381 = _141 * _379;
        _373 = _381;
    }
    _375 = false;
    float _383 = _373;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _387 = _383 + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _397 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _399 = isnan(_383);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _413 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _415 = isnan(_383);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = 1.0 / _391;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _427;
    float _431 = -_407;
    float _433 = _431 + 1.0;
    bool _435 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _437 = isnan(_383);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _449 = 1.0 / _395;
    float _451 = 1.0 / _411;
    float _453 = _429 * _425;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _459 = _423 * _433;
    float _461 = -_423;
    float _463 = _461 + 1.0;
    float _465 = fma(_453, _387, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _467 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _469 = isnan(_383);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = _445 * _463;
    float _481 = _457 * _449;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _489 = _383 + _487;
    float _491 = _465 * _479;
    float _493 = -_445;
    float _495 = _493 + 1.0;
    float _497 = -_477;
    float _499 = _497 + 1.0;
    float _501 = fma(_481, _489, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _503 = _485 * _451;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _507 = _383 + _505;
    float _509 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[115].x, _491);
    float _511 = _407 * _499;
    float _513 = fma(_503, _507, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _515 = fma(_501, _459, _509);
    float _517 = in.m_60.x;
    float _519 = in.m_60.y;
    float _521 = fma(_513, _511, _515);
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _527 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[118].x, _521);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _531 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _533 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _535 = _527 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _537 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _531;
    out.m_62.y = _533;
    out.m_62.z = _537;
    out.m_62.w = _535;
    float _539 = _353 * _519;
    float _541 = _351 * _517;
    bool _543 = !_447;
    float _561;
    if (!_543)
    {
        float _545 = in.m_58.x;
        float _547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _549 = _545 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _551 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _553 = _551 * _547;
        float _555 = floor(_553);
        float _557 = -_555;
        float _559 = _553 + _557;
        _561 = _559;
        _563 = true;
    }
    else
    {
        float _565 = float(_107);
        float _567 = 1.0 / _565;
        float _569 = _141 * _567;
        _561 = _569;
    }
    _563 = false;
    float _571 = _561;
    float _573 = in.m_58.x;
    float _575 = in.m_58.y;
    float _577 = in.m_58.z;
    float _579 = in.m_58.w;
    float _581 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _583 = log2(_581);
    float _585 = _539 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _589 = _587 != 0;
    float _591 = _541 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _599 = _583 * _141;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _603 = _577 * 2.0;
    float _605 = _573 * 2.0;
    float _607 = _575 * 2.0;
    float _609 = _573 + _575;
    float _611 = _575 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _613 = floor(_605);
    float _615 = _573 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _617 = _609 + (-1.0);
    float _619 = fma(_611, -2.0, _593);
    float _621 = -_595;
    float _623 = fma(_615, 2.0, _621);
    float _625 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _619);
    float _627 = floor(_603);
    int _629 = int(_589);
    int _631 = _177 ? 2 : 0;
    int _633 = _629 | _631;
    int _635 = _179 ? 4 : 0;
    int _637 = _633 | _635;
    int _639 = false ? 8 : 0;
    int _641 = _637 | _639;
    int _643 = false ? 16 : 0;
    int _645 = _641 | _643;
    int _647 = false ? 32 : 0;
    int _649 = _645 | _647;
    int _651 = false ? 64 : 0;
    int _653 = _649 | _651;
    int _655 = _653 & 1;
    float _657 = -_141;
    float _659 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[76].x, _623);
    int _661 = _655;
    if (_589)
    {
        _661 = 0;
    }
    int _663 = _661;
    int _665 = _663;
    if (!_589)
    {
        _665 = 1;
    }
    int _667 = _665;
    float _669 = floor(_607);
    bool _671 = _613 >= 0.0;
    bool _673 = isnan(_613);
    bool _675 = _671 || _673;
    bool _677 = isnan(0.0);
    bool _679 = _675 || _677;
    bool _681 = _667 != 1;
    bool _683 = _613 > 0.0;
    bool _685 = _627 > 0.0;
    float _687 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _689 = _679 ? 0 : 1;
    float _691 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _693 = int(_691);
    bool _695 = _627 >= 0.0;
    bool _697 = isnan(_627);
    bool _699 = _695 || _697;
    bool _701 = isnan(0.0);
    bool _703 = _699 || _701;
    int _705 = ~_689;
    int _707 = _705 + 1;
    int _709 = _707 + 1;
    bool _711 = _669 > 0.0;
    int _713 = _703 ? 0 : 1;
    float _715 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _717 = int(_715);
    bool _719 = _669 >= 0.0;
    bool _721 = isnan(_669);
    bool _723 = _719 || _721;
    bool _725 = isnan(0.0);
    bool _727 = _723 || _725;
    int _729 = ~_713;
    int _731 = _729 + 1;
    int _733 = _731 + 1;
    int _735 = _727 ? 0 : 1;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _739 = _733;
    float _741 = as_type<float>(_667);
    float _743 = as_type<float>(_693);
    int _745 = _709;
    if (!_685)
    {
        int _747 = ~_713;
        int _749 = _747 + 1;
        _739 = _749;
    }
    int _751 = _739;
    float _753 = exp2(_599);
    if (!_681)
    {
        _741 = _575;
    }
    float _755 = _741;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _767 = _765 != 0;
    float _769 = _755;
    if (_681)
    {
        _769 = _573;
    }
    float _771 = _769;
    int _773 = ~_735;
    int _775 = _773 + 1;
    int _777 = _775 + 1;
    int _779 = _777;
    if (!_711)
    {
        int _781 = ~_735;
        int _783 = _781 + 1;
        _779 = _783;
    }
    int _785 = _779;
    float _787 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[83].z, _737);
    bool _789 = !_763;
    int _791 = _789 ? 0 : 1;
    bool _793 = !_759;
    int _795 = _793 ? 0 : 1;
    bool _797 = !_767;
    int _799 = _797 ? 0 : 1;
    float _801 = -_753;
    float _803 = _801 + 1.0;
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _807 = _805 != 0;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _811 = _809 != 0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _815 = _813 != 0;
    float _817 = float(_107);
    float _819 = float(_693);
    float _821 = 1.0 / _817;
    bool _823 = !_807;
    float _825 = _823 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _827 = _817;
    float _829 = _825;
    if (!_681)
    {
        _743 = _575;
    }
    float _831 = _743;
    float _833 = _831;
    if (!_683)
    {
        int _835 = ~_689;
        int _837 = _835 + 1;
        _745 = _837;
    }
    int _839 = _745;
    if (_681)
    {
        _833 = _573;
    }
    float _841 = _833;
    float _843 = 1.0 / _819;
    if (!_681)
    {
        _827 = _577;
    }
    float _845 = _827;
    float _847 = _845;
    if (_681)
    {
        _847 = _575;
    }
    float _849 = _847;
    float _851 = _841 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _853 = abs(as_type<int>(_825));
    float _855 = _849 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_681)
    {
        _829 = _577;
    }
    float _857 = _829;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _861 = _857;
    if (_681)
    {
        _861 = _575;
    }
    float _863 = _861;
    float _865 = fma(_855, -2.0, _601);
    float _867 = float(_853);
    float _869 = -_859;
    float _871 = fma(_851, 2.0, _869);
    float _873 = float(_751);
    float _875 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[83].w, _597);
    float _877 = _573 + (-0.5);
    float _879 = float(_717);
    float _881 = _867 * _873;
    bool _883 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _885 = isnan(1.0);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _891 = _887 || _889;
    float _893 = in.m_64.x;
    float _895 = in.m_64.y;
    float _897 = in.m_64.z;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _901 = 1.0 + _899;
    float _903 = 1.0 / _879;
    float _905 = _881 * (-2.0);
    float _907 = _843 * _141;
    bool _909 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _911 = isnan(0.0);
    bool _913 = _909 || _911;
    bool _915 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _917 = _913 || _915;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _921 = float(_839);
    float _923 = 1.0 / _901;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _927 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[78].z, _919);
    bool _929 = !_811;
    int _931 = _929 ? 0 : 1;
    float _933 = _821 * _141;
    float _935 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[78].w, _925);
    float _937 = _917 ? _803 : 0.0;
    float _939 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _927);
    int _941 = abs(_931);
    float _943 = _903 * _141;
    bool _945 = !_815;
    int _947 = _945 ? 0 : 1;
    float _949 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _935);
    float _951 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _787);
    float _953 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _875);
    float _955 = fma(_905, _893, _893);
    float _957 = -_141;
    float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[81].x, _871);
    float _961 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _865);
    float _963 = _881;
    if (_891)
    {
        float _965 = _937 * _923;
        _145 = _965;
    }
    float _967 = _145;
    float _969 = fma(_687, _905, _687);
    float _971 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[196].x, _955);
    int _973 = abs(_947);
    float _975 = _577 + _575;
    float _977 = float(_941);
    float _979 = fma(_969, _967, _971);
    float _981 = _975 + (-1.0);
    float _983 = _977 * _921;
    float _985 = float(_785);
    float _987 = _979 * 0.15915493667125701904296875;
    float _989 = float(_973);
    float _991 = _983 * (-2.0);
    float _993 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _995 = _577 + _573;
    float _997 = _987 * 6.283185482025146484375;
    float _999 = cos(_997);
    float _1001 = _989 * _985;
    float _1003 = _575 + (-0.5);
    float _1005 = fma(_991, _895, _895);
    float _1007 = fma(_993, _991, _993);
    float _1009 = _995 + (-1.0);
    float _1011 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1005);
    float _1013 = _1001 * (-2.0);
    float _1015 = _987 * 6.283185482025146484375;
    float _1017 = sin(_1015);
    float _1019 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1021 = fma(_1007, _967, _1011);
    float _1023 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1025 = fma(_1013, _897, _897);
    float _1027 = _577 + (-0.5);
    float _1029 = _1021 * 0.15915493667125701904296875;
    float _1031 = fma(_1023, _1013, _1023);
    float _1033 = _591 * _1019;
    float _1035 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1025);
    float _1037 = _1029 * 6.283185482025146484375;
    float _1039 = sin(_1037);
    float _1041 = fma(_1031, _967, _1035);
    float _1043 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1045 = _1041 * 0.15915493667125701904296875;
    float _1047 = _1029 * 6.283185482025146484375;
    float _1049 = cos(_1047);
    float _1051 = in.m_46.x;
    float _1053 = in.m_46.y;
    float _1055 = in.m_46.z;
    float _1057 = _585 * _1043;
    float _1059 = _1045 * 6.283185482025146484375;
    float _1061 = cos(_1059);
    float _1063 = _999 * _1039;
    float _1065 = _1017 * _1039;
    float _1067 = _1045 * 6.283185482025146484375;
    float _1069 = sin(_1067);
    float _1071 = _999 * _1049;
    float _1073 = _1017 * _1049;
    float _1075 = _999 * _1061;
    float _1077 = _1017 * _1061;
    float _1079 = _1049 * _1061;
    float _1081 = _1039 * _1061;
    float _1083 = _1075 * _1057;
    float _1085 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1087 = fma(_1069, _1071, _1065);
    float _1089 = -_1063;
    float _1091 = fma(_1069, _1073, _1089);
    float _1093 = -_1057;
    float _1095 = _1069 * _1093;
    float _1097 = -_1073;
    float _1099 = fma(_1069, _1063, _1097);
    float _1101 = _1077 * _1057;
    float _1103 = fma(_1087, _1033, _1083);
    float _1105 = fma(_1079, _1033, _1095);
    float _1107 = fma(_1069, _1065, _1071);
    float _1109 = fma(_1091, _1033, _1101);
    float _1111 = fma(_1099, _1085, _1103);
    float _1113 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1115 = fma(_1081, _1085, _1105);
    float _1117 = fma(_1107, _1085, _1109);
    float _1119 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1121 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1123 = fma(_1051, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1113);
    float _1125 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1127 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1119);
    float _1129 = fma(_1051, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1121);
    float _1131 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1123);
    float _1133 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1125);
    float _1135 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1127);
    float _1137 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1129);
    float _1139 = _1131 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1141 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1133);
    float _1143 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1145 = _1137 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1147 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1149 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1151 = _1139 + _1143;
    float _1153 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1155 = fma(_1051, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1147);
    float _1157 = _1145 + _1149;
    float _1159 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1161 = _1151 + _1159;
    float _1163 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1153);
    float _1165 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1155);
    float _1167 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1169 = _1157 + _1167;
    float _1171 = _1161 * _1161;
    float _1173 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1163);
    float _1175 = _1165 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1177 = fma(_1169, _1169, _1171);
    float _1179 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1181 = sqrt(_1177);
    float _1183 = _1175 + _1179;
    bool _1185 = _1181 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1189 = _1187 != 0;
    int _1191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1193 = _1191 != 0;
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1197 = _1195 != 0;
    int _1199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1201 = _1199 != 0;
    bool _1203 = !_1193;
    int _1205 = _1203 ? 0 : 1;
    bool _1207 = !_1189;
    int _1209 = _1207 ? 0 : 1;
    bool _1211 = !_1197;
    int _1213 = _1211 ? 0 : 1;
    bool _1215 = !_1201;
    int _1217 = _1215 ? 0 : 1;
    float _1219 = _1051;
    float _1221 = _1055;
    float _1223 = _1165;
    float _1225 = _1117;
    if (!_1185)
    {
        _1219 = _1157;
    }
    float _1227 = _1219;
    float _1229 = _1227;
    if (!_1185)
    {
        _1221 = _1151;
    }
    float _1231 = _1221;
    float _1233 = _1231;
    if (!_1185)
    {
        _1223 = _1183;
    }
    float _1235 = _1223;
    bool _1237 = !_1185;
    float _1239 = _1235;
    if (!_1237)
    {
        float _1241 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1243 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1245 = _1181 + _1243;
        float _1247 = _1183 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1249 = rsqrt(_1177);
        float _1251 = _1245 * _1241;
        float _1253 = _1251 * 0.15915493667125701904296875;
        float _1255 = _1253 * 6.283185482025146484375;
        float _1257 = cos(_1255);
        float _1259 = _1253 * 6.283185482025146484375;
        float _1261 = sin(_1259);
        float _1263 = _1257 + (-1.0);
        float _1265 = _1263 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1267 = fma(_1261, _1247, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1269 = fma(_1183, _1257, _1265);
        float _1271 = _1249 * _1267;
        float _1273 = fma(_1169, _1271, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1275 = fma(_1161, _1271, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1239 = _1269;
        _1229 = _1273;
        _1233 = _1275;
        _1225 = _1253;
    }
    float _1277 = _1239;
    float _1279 = _1229;
    float _1281 = _1233;
    float _1283 = _1225;
    float _1285 = -_1175;
    float _1287 = _1285 + _1277;
    float _1289 = -_1145;
    float _1291 = _1289 + _1279;
    float _1293 = -_1139;
    float _1295 = _1293 + _1281;
    float _1297 = _1287 * _1287;
    bool _1299 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1301 = isnan(0.5);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1307 = _1303 || _1305;
    float _1309 = fma(_1291, _1291, _1297);
    float _1311 = fma(_1295, _1295, _1309);
    float _1313 = sqrt(_1311);
    bool _1315 = _1313 > 0.0;
    bool _1317 = !_1315;
    float _1319 = _1281;
    float _1321 = _1279;
    float _1323 = _1277;
    float _1325 = _1283;
    float _1327 = _1291;
    if (!_1317)
    {
        float _1329 = _203 * _203;
        float _1331 = fma(_201, _201, _1329);
        float _1333 = fma(_205, _205, _1331);
        float _1335 = rsqrt(_1311);
        float _1337 = sqrt(_1333);
        float _1339 = _1291 * _1335;
        float _1341 = _1287 * _1335;
        float _1343 = _1295 * _1335;
        bool _1345 = _1337 > 0.0;
        bool _1347 = !_1345;
        _1325 = _1337;
        _1327 = _1341;
        if (!_1347)
        {
            float _1349 = rsqrt(_1333);
            float _1351 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1353 = _203 * _1349;
            float _1355 = _201 * _1349;
            float _1357 = _1341 * _1353;
            float _1359 = _205 * _1349;
            float _1361 = fma(_1339, _1355, _1357);
            float _1363 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1365 = fma(_1343, _1359, _1361);
            float _1367 = _1365 * _1363;
            float _1369 = fma(_201, _1367, _1279);
            float _1371 = fma(_203, _1367, _1277);
            float _1373 = fma(_205, _1367, _1281);
            _1319 = _1373;
            _1321 = _1369;
            _1323 = _1371;
            _1325 = _1351;
            _1327 = _1361;
        }
    }
    float _1375 = _1319;
    float _1377 = _1321;
    float _1379 = _1323;
    float _1381 = _1325;
    float _1383 = _1327;
    float _1385 = _1379;
    float _1387 = _1377;
    float _1389 = _1375;
    float _1391 = _1383;
    float _1393 = _1381;
    if (!_1307)
    {
        float _1395 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1397 = _1175 + _1395;
        float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1401 = _1145 + _1399;
        float _1403 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1405 = -_1139;
        float _1407 = _1405 + _1375;
        float _1409 = _1397 * _1397;
        float _1411 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1413 = _1139 + _1411;
        float _1415 = fma(_1401, _1401, _1409);
        float _1417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1419 = fma(_1413, _1413, _1415);
        float _1421 = sqrt(_1419);
        float _1423 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1425 = precise::min(_1421, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1427 = _1425 * _1417;
        float _1429 = -_1145;
        float _1431 = _1429 + _1377;
        float _1433 = _1423 * _1427;
        float _1435 = -_1175;
        float _1437 = _1435 + _1379;
        float _1439 = fma(_1431, _1433, _1145);
        float _1441 = fma(_1437, _1433, _1175);
        float _1443 = fma(_1407, _1433, _1139);
        _1385 = _1441;
        _1387 = _1439;
        _1389 = _1443;
    }
    float _1445 = _1385;
    float _1447 = _1387;
    float _1449 = _1389;
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1453 = _1445 + _1451;
    float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1457 = _1447 + _1455;
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1461 = _1449 + _1459;
    float _1463 = _1453 * _1453;
    float _1465 = fma(_1457, _1457, _1463);
    float _1467 = fma(_1145, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1469 = fma(_1461, _1461, _1465);
    float _1471 = rsqrt(_1469);
    float _1473 = sqrt(_1469);
    float _1475 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1477 = _1457 * _1475;
    float _1479 = _1461 * _1475;
    float _1481 = _1477 * _1477;
    float _1483 = _1479 * _1479;
    float _1485 = _1481 + _1483;
    float _1487 = sqrt(_1485);
    bool _1489 = _1487 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1491 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1493 = _1487 + _1491;
    float _1495 = _1461;
    float _1497 = _1493;
    float _1499 = _1453;
    if (_1489)
    {
        float _1501 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1495 = _1501;
    }
    float _1503 = _1495;
    if (_1489)
    {
        float _1505 = rsqrt(_1485);
        _1391 = _1505;
    }
    float _1507 = _1391;
    float _1509 = _1507;
    if (_1489)
    {
        float _1511 = _1493 * _1503;
        _1497 = _1511;
    }
    float _1513 = _1497;
    float _1515 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1489)
    {
        float _1517 = _1513 * 0.15915493667125701904296875;
        _1393 = _1517;
    }
    float _1519 = _1393;
    float _1521 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1515);
    float _1523 = _1471;
    float _1525 = _1519;
    if (_1489)
    {
        float _1527 = _1519 * 6.283185482025146484375;
        float _1529 = sin(_1527);
        _1523 = _1529;
    }
    float _1531 = _1523;
    float _1533 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1535 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1521);
    float _1537 = precise::max(0.0, _1533);
    float _1539 = _1463;
    float _1541 = _1537;
    float _1543 = _1533;
    if (_1489)
    {
        float _1545 = _1519 * 6.283185482025146484375;
        float _1547 = cos(_1545);
        _1539 = _1547;
    }
    float _1549 = _1539;
    float _1551 = -_1475;
    float _1553 = -_1537;
    float _1555 = fma(_1453, _1551, _1553);
    if (!_1489)
    {
        _1499 = _1477;
    }
    float _1557 = _1499;
    float _1559 = _1557;
    if (_1489)
    {
        float _1561 = _1555 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1541 = _1561;
    }
    float _1563 = _1541;
    float _1565 = _1531;
    if (_1489)
    {
        float _1567 = fma(_1531, _1563, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1565 = _1567;
    }
    float _1569 = _1565;
    float _1571 = floor(_1467);
    float _1573 = _1569;
    float _1575 = _1549;
    if (_1489)
    {
        float _1577 = _1549 + (-1.0);
        _1543 = _1577;
    }
    float _1579 = _1543;
    float _1581 = _1579;
    if (_1489)
    {
        float _1583 = _1507 * _1569;
        _963 = _1583;
    }
    float _1585 = _963;
    if (!_1489)
    {
        _1509 = _1555;
    }
    float _1587 = _1509;
    float _1589 = _1587;
    if (_1489)
    {
        float _1591 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1525 = _1591;
    }
    float _1593 = _1525;
    if (_1489)
    {
        float _1595 = _1477 * _1585;
        _1559 = _1595;
    }
    float _1597 = _1559;
    if (!_1489)
    {
        _1573 = _1479;
    }
    float _1599 = _1573;
    float _1601 = _1599;
    if (_1489)
    {
        float _1603 = _1479 * _1585;
        _1601 = _1603;
    }
    float _1605 = _1601;
    if (!_1489)
    {
        _1581 = _1481;
    }
    float _1607 = _1581;
    float _1609 = _1607;
    if (_1489)
    {
        float _1611 = fma(_1555, _1549, _1593);
        _1589 = _1611;
    }
    float _1613 = _1589;
    if (_1489)
    {
        float _1615 = _1597 * _1597;
        _1609 = _1615;
    }
    float _1617 = _1609;
    if (!_1489)
    {
        _1575 = _1483;
    }
    float _1619 = _1575;
    float _1621 = _1619;
    if (_1489)
    {
        float _1623 = _1605 * _1605;
        _1621 = _1623;
    }
    float _1625 = _1621;
    float _1627 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1629 = fma(_1613, _1613, _1617);
    float _1631 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1633 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1627);
    float _1635 = _1629 + _1625;
    float _1637 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1639 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1631);
    float _1641 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1633);
    float _1643 = fma(_1139, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1645 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1637);
    float _1647 = rsqrt(_1635);
    float _1649 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1651 = fma(_1473, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1649);
    float _1653 = precise::clamp(_1651, 0.0, 1.0);
    float _1655 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1639);
    float _1657 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1645);
    float _1659 = _1641 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1661 = -_1653;
    float _1663 = _1661 + 1.0;
    float _1665 = _1657 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1667 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1669 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1671 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1673 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1675 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1677 = abs(_1663);
    float _1679 = log2(_1677);
    float _1681 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1669);
    float _1683 = -_1571;
    float _1685 = _1467 + _1683;
    float _1687 = -_1675;
    float _1689 = fma(_1687, _1673, 1.0);
    float _1691 = _1647 * _1597;
    float _1693 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1681);
    float _1695 = _1647 * _1605;
    float _1697 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1699 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1701 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1693);
    float _1703 = _1647 * _1613;
    float _1705 = floor(_1643);
    float _1707 = -_1699;
    float _1709 = fma(_1703, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1707);
    float _1711 = _1679 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1713 = -_1695;
    float _1715 = fma(_1713, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1709);
    float _1717 = log2(_1689);
    float _1719 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1721 = fma(_1715, -0.5, 0.5);
    float _1723 = fma(_1715, 0.5, 0.5);
    float _1725 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1719);
    float _1727 = exp2(_1711);
    float _1729 = -_1705;
    float _1731 = _1643 + _1729;
    float _1733 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1697);
    float _1735 = fma(_1723, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1737 = _1703 + 1.0;
    float _1739 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1725);
    float _1741 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1733);
    float _1743 = fma(_1723, _1735, -0.212114393711090087890625);
    float _1745 = 1.0 / _1701;
    float _1747 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1739);
    float _1749 = _1717 * 0.693147182464599609375;
    float _1751 = fma(_1723, _1743, 1.570728778839111328125);
    float _1753 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1755 = sqrt(_1721);
    float _1757 = -_1703;
    float _1759 = fma(_1727, _1737, _1757);
    float _1761 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1741);
    float _1763 = fma(_1759, 0.5, 0.5);
    float _1765 = _1747 * _1745;
    float _1767 = _1761 * _1745;
    float _1769 = fma(_1765, 0.5, 0.5);
    float _1771 = fma(_1767, -0.5, 0.5);
    float _1773 = _1755 * 0.636619746685028076171875;
    float2 _6502 = float2(_1685, _1731);
    float _1775 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6502, float2(0.0), isnan(_6502)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6502, float2(0.0), isnan(_6502)), level(0.0)).x;
    float _1777 = -_1751;
    float _1779 = fma(_1773, _1777, 1.0);
    float3 _6518 = float3(_1769, _1771, _1753);
    float _1781 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6518, float3(0.0), isnan(_6518)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6518, float3(0.0), isnan(_6518)), level(0.0)).x;
    float3 _6529 = float3(_1769, _1771, _1753);
    float4 _1784 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6529, float3(0.0), isnan(_6529)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6529, float3(0.0), isnan(_6529)), level(0.0)).xyzw;
    float _1786 = _1784.x;
    float _1788 = _1784.y;
    float _1790 = _1784.z;
    float _1792 = _1784.w;
    float2 _6545 = float2(_1779, _1763);
    float3 _1796 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6545, float2(0.0), isnan(_6545)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6545, float2(0.0), isnan(_6545)), level(0.0)).xyz;
    float _1798 = _1796.x;
    float _1800 = _1796.y;
    float _1802 = _1796.z;
    float _1804 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1806 = int(_1804);
    int _1808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1810 = _1808 != 0;
    float _1812 = _1679 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1816 = _1814 != 0;
    float _1818 = -_953;
    float _1820 = _1818 + 1.0;
    int _1822 = abs(_791);
    float _1824 = -_949;
    float _1826 = _1824 + 1.0;
    int _1828 = abs(_1205);
    float _1830 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1832 = int(_1830);
    out.m_66.x = _1447;
    out.m_66.y = _1445;
    out.m_66.z = _1449;
    float _1834 = 0.0;
    float _1836 = _1701;
    if (_1810)
    {
        float _1838 = in.m_58.x;
        _1834 = _1838;
    }
    float _1840 = _1834;
    float _1842 = float(uint(_1806));
    float _1844 = trunc(_907);
    int _1846 = int(_1844);
    float _1848 = _1840;
    if (!_1810)
    {
        float _1850 = in.m_58.y;
        _1848 = _1850;
    }
    float _1852 = _1848;
    bool _1854 = _1806 == 0;
    float _1856 = float(uint(_1832));
    float _1858 = 1.0 / _1842;
    float _1860 = float(uint(_1846));
    float _1862 = 1.0 / _1856;
    int _1864 = as_type<int>(_1858) + (-2);
    float _1866 = trunc(_943);
    int _1868 = int(_1866);
    int _1870 = ~_1806;
    int _1872 = _1870 + 1;
    float _1874 = as_type<float>(_1864) * _1860;
    float _1876 = trunc(_1874);
    float _1878 = precise::max(_1876, 0.0);
    uint _1881 = uint(_1878);
    int _1883 = as_type<int>(_1862) + (-2);
    float _1885 = float(uint(_1868));
    float _1887 = exp2(_1812);
    float _1889 = _1874;
    if (_1810)
    {
        _1889 = 1.0;
    }
    float _1891 = _1889;
    float _1893 = _1891;
    if (!_1810)
    {
        _1893 = 1.2345600128173828125;
    }
    float _1895 = _1893;
    float _1897 = as_type<float>(_1883) * _1885;
    int _1899 = ~_1832;
    int _1901 = _1899 + 1;
    int _1903 = _1872 * int(_1881);
    int _1905 = _1903 + _1846;
    float _1907 = _1895 * _1852;
    int _1909 = ~_1806;
    int _1911 = _1909 + 1;
    float _1913 = trunc(_1897);
    float _1915 = precise::max(_1913, 0.0);
    uint _1917 = uint(_1915);
    float _1919 = float(uint(_1905));
    float _1921 = as_type<float>(_1905);
    if (_1810)
    {
        _1921 = 1.0;
    }
    float _1923 = _1921;
    float _1925 = _1923;
    if (!_1810)
    {
        _1925 = 7.345489978790283203125;
    }
    float _1927 = _1925;
    float _1929 = as_type<float>(_1864) * _1919;
    float _1931 = -_1887;
    float _1933 = _1931 + 1.0;
    float _1935 = _1927 * _573;
    float _1937 = trunc(_1929);
    float _1939 = precise::max(_1937, 0.0);
    uint _1941 = uint(_1939);
    int _1943 = _1901 * int(_1917);
    int _1945 = _1943 + _1868;
    float _1947 = float(uint(_1945));
    float _1949 = floor(_1935);
    float _1951 = as_type<float>(_1883) * _1947;
    float _1953 = float(_1846);
    int _1955 = int(_1881) + int(_1941);
    float _1957 = floor(_1907);
    float _1959 = float(_1806);
    int _1961 = _1911 * _1955;
    int _1963 = _1961 + _1846;
    bool _1965 = _1953 >= _1959;
    bool _1967 = isnan(_1953);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan(_1959);
    bool _1973 = _1969 || _1971;
    float _1975 = float(_1973);
    float _1977 = trunc(_1951);
    float _1979 = precise::max(_1977, 0.0);
    uint _1981 = uint(_1979);
    float _1983 = -_1949;
    float _1985 = _1935 + _1983;
    float _1987 = float(_1832);
    float _1989 = _1959 * _933;
    bool _1991 = uint(_1963) >= uint(_1806);
    float _1993 = _1987 * _933;
    float _1995 = trunc(_1975);
    int _1997 = int(_1995);
    bool _1999 = !_1991;
    int _2001 = _1999 ? 0 : (-1);
    float _2003 = -_1957;
    float _2005 = _1907 + _2003;
    int _2007 = ~_1955;
    int _2009 = _2007 + _2001;
    int _2011 = _2009 + 1;
    float _2013 = _1985 * _1959;
    int _2015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2017 = _2015 != 0;
    float _2019 = trunc(_1989);
    int _2021 = int(_2019);
    int _2023 = int(_1917) + int(_1981);
    int _2025 = _1806 * _2011;
    int _2027 = _2025 + _1846;
    int _2029 = ~_1832;
    int _2031 = _2029 + 1;
    float _2033 = _2005 * _1987;
    float _2035 = float(_1868);
    bool _2037 = !_1854;
    int _2039 = _2037 ? _2027 : (-1);
    int _2041 = _2031 * _2023;
    int _2043 = _2041 + _1868;
    int _2045 = ~_1997;
    int _2047 = _2045 + 1;
    int _2049 = _2047 + 1;
    float _2051 = trunc(_2013);
    int _2053 = int(_2051);
    bool _2055 = _2035 >= _1987;
    bool _2057 = isnan(_2035);
    bool _2059 = _2055 || _2057;
    bool _2061 = isnan(_1987);
    bool _2063 = _2059 || _2061;
    float _2065 = float(_2063);
    bool _2067 = uint(_2043) >= uint(_1832);
    int _2069 = _2039 * _2049;
    bool _2071 = !_2017;
    int _2073 = _2071 ? 0 : 1;
    int _2075 = _1806 + (-1);
    float _2077 = trunc(_2065);
    int _2079 = int(_2077);
    int _2081 = abs(_2073);
    int _2083 = _1997 * _2075;
    int _2085 = _2083 + _2069;
    bool _2087 = !_2067;
    int _2089 = _2087 ? 0 : (-1);
    int _2091 = _2085 * _1822;
    bool _2093 = _1832 == 0;
    int _2095 = _2053 * _2081;
    int _2097 = _2095 + _1846;
    int _2099 = ~_2023;
    int _2101 = _2099 + _2089;
    int _2103 = _2101 + 1;
    float _2105 = trunc(_1993);
    int _2107 = int(_2105);
    int _2109 = abs(_795);
    bool _2111 = !_1816;
    int _2113 = _2111 ? 0 : 1;
    int _2115 = _1832 * _2103;
    int _2117 = _2115 + _1868;
    int _2119 = abs(_799);
    int _2121 = _2021 * _2109;
    int _2123 = _2121 + _2091;
    int _2125 = ~_2079;
    int _2127 = _2125 + 1;
    int _2129 = _2127 + 1;
    float _2131 = trunc(_2033);
    int _2133 = int(_2131);
    bool _2135 = !_2093;
    int _2137 = _2135 ? _2117 : (-1);
    int _2139 = _2097 * _2119;
    int _2141 = _2139 + _2123;
    int _2143 = abs(_2113);
    float _2145 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2149 = _2147 != 0;
    int _2151 = _2137 * _2129;
    bool _2153 = !_2149;
    int _2155 = _2153 ? 0 : 1;
    int _2157 = _1832 + (-1);
    int _2159 = _2053 * _2143;
    int _2161 = _2159 + _2141;
    int _2163 = abs(_2155);
    float _2165 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2167 = abs(_1209);
    int _2169 = _2079 * _2157;
    int _2171 = _2169 + _2151;
    float _2173 = float(uint(_2161));
    int _2175 = _2171 * _1828;
    float _2177 = as_type<float>(_1864) * _2173;
    int _2179 = abs(_1213);
    int _2181 = _2133 * _2163;
    int _2183 = _2181 + _1868;
    int _2185 = ~_1806;
    int _2187 = _2185 + 1;
    int _2189 = _2107 * _2167;
    int _2191 = _2189 + _2175;
    int _2193 = abs(_1217);
    float _2195 = trunc(_2177);
    float _2197 = precise::max(_2195, 0.0);
    uint _2199 = uint(_2197);
    int _2201 = _2183 * _2179;
    int _2203 = _2201 + _2191;
    float _2205 = float(uint(_2097));
    int _2207 = ~_1832;
    int _2209 = _2207 + 1;
    int _2211 = _2133 * _2193;
    int _2213 = _2211 + _2203;
    float _2215 = as_type<float>(_1864) * _2205;
    float _2217 = float(uint(_2213));
    float _2219 = trunc(_2215);
    float _2221 = precise::max(_2219, 0.0);
    uint _2223 = uint(_2221);
    int _2225 = _2187 * int(_2199);
    int _2227 = _2225 + _2161;
    float _2229 = as_type<float>(_1883) * _2217;
    float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2233 = _2231 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2235 = float(uint(_2227));
    float _2237 = trunc(_2229);
    float _2239 = precise::max(_2237, 0.0);
    uint _2241 = uint(_2239);
    float _2243 = as_type<float>(_1864) * _2235;
    int _2245 = _2187 * int(_2223);
    int _2247 = _2245 + _2097;
    float _2249 = trunc(_2243);
    float _2251 = precise::max(_2249, 0.0);
    uint _2253 = uint(_2251);
    float _2255 = float(uint(_2247));
    int _2257 = _2209 * int(_2241);
    int _2259 = _2257 + _2213;
    float _2261 = 1.0 / _2233;
    float _2263 = as_type<float>(_1864) * _2255;
    int _2265 = ~_1806;
    int _2267 = _2265 + 1;
    float _2269 = float(uint(_2259));
    float _2271 = float(uint(_2183));
    int _2273 = int(_2199) + int(_2253);
    float _2275 = as_type<float>(_1883) * _2269;
    float _2277 = trunc(_2263);
    float _2279 = precise::max(_2277, 0.0);
    uint _2281 = uint(_2279);
    float _2283 = as_type<float>(_1883) * _2271;
    int _2285 = ~_1832;
    int _2287 = _2285 + 1;
    int _2289 = _2267 * _2273;
    int _2291 = _2289 + _2161;
    float _2293 = trunc(_2275);
    float _2295 = precise::max(_2293, 0.0);
    uint _2297 = uint(_2295);
    bool _2299 = uint(_2291) >= uint(_1806);
    int _2301 = ~_1832;
    int _2303 = _2301 + 1;
    bool _2305 = !_2299;
    int _2307 = _2305 ? 0 : (-1);
    float _2309 = trunc(_2283);
    float _2311 = precise::max(_2309, 0.0);
    uint _2313 = uint(_2311);
    int _2315 = int(_2223) + int(_2281);
    int _2317 = ~_2273;
    int _2319 = _2317 + _2307;
    int _2321 = _2319 + 1;
    int _2323 = ~_1806;
    int _2325 = _2323 + 1;
    int _2327 = int(_2241) + int(_2297);
    int _2329 = _1806 * _2321;
    int _2331 = _2329 + _2161;
    int _2333 = _2325 * _2315;
    int _2335 = _2333 + _2097;
    int _2337 = _2287 * _2327;
    int _2339 = _2337 + _2213;
    bool _2341 = !_1854;
    int _2343 = _2341 ? _2331 : (-1);
    bool _2345 = uint(_2335) >= uint(_1806);
    bool _2347 = uint(_2339) >= uint(_1832);
    int _2349 = _2303 * int(_2313);
    int _2351 = _2349 + _2183;
    int _2353 = _2343 & 3;
    bool _2355 = _2353 != 0;
    int _2357 = _2343 & 3;
    bool _2359 = _2357 != 0;
    float _2361 = float(uint(_2351));
    bool _2363 = !_2347;
    int _2365 = _2363 ? 0 : (-1);
    int _2367 = _2355 ? 0 : 1;
    bool _2369 = !_2345;
    int _2371 = _2369 ? 0 : (-1);
    bool _2373 = _2357 != 3;
    float _2375 = -_1775;
    float _2377 = _2375 + 1.0;
    int _2379 = ~_2327;
    int _2381 = _2379 + _2365;
    int _2383 = _2381 + 1;
    bool _2385 = uint(_2357) >= 2u;
    bool _2387 = _579 > 0.5;
    float _2389 = as_type<float>(_1883) * _2361;
    int _2391 = ~_2315;
    int _2393 = _2391 + _2371;
    int _2395 = _2393 + 1;
    int _2397 = _1832 * _2383;
    int _2399 = _2397 + _2213;
    int _2401 = _2385 ? 0 : 1;
    bool _2403 = uint(_2357) > 1u;
    int _2405 = _1806 * _2395;
    int _2407 = _2405 + _2097;
    bool _2409 = !_2093;
    int _2411 = _2409 ? _2399 : (-1);
    float _2413 = trunc(_2389);
    float _2415 = precise::max(_2413, 0.0);
    uint _2417 = uint(_2415);
    int _2419 = ~_2401;
    int _2421 = _2419 + 1;
    int _2423 = _2421 + 1;
    int _2425 = _2423;
    if (_2373)
    {
        int _2427 = ~_2401;
        int _2429 = _2427 + 1;
        _2425 = _2429;
    }
    int _2431 = _2425;
    int _2433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2435 = _2433 != 0;
    bool _2437 = !_1854;
    int _2439 = _2437 ? _2407 : (-1);
    int _2441 = _2411 & 3;
    bool _2443 = _2441 != 0;
    bool _2445 = !_2435;
    int _2447 = _2445 ? 0 : 1;
    bool _2449 = uint(_2441) > 1u;
    bool _2451 = !_2359;
    int _2453 = _2451 ? 0 : 1;
    int _2455 = ~_2367;
    int _2457 = _2455 + 1;
    int _2459 = _2457 + 1;
    int _2461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2463 = _2461 != 0;
    int _2465 = _2411 & 3;
    bool _2467 = _2465 != 0;
    int _2469 = _2459;
    if (!_2403)
    {
        int _2471 = ~_2367;
        int _2473 = _2471 + 1;
        _2469 = _2473;
    }
    int _2475 = _2469;
    int _2477 = _2343 >> 31;
    bool _2479 = !_2463;
    int _2481 = _2479 ? 0 : 1;
    int _2483 = _2467 ? 0 : 1;
    int _2485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2487 = _2485 != 0;
    int _2489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2491 = _2489 != 0;
    int _2493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2495 = _2493 != 0;
    int _2497 = _2477 & 3;
    bool _2499 = !_2443;
    int _2501 = _2499 ? 0 : 1;
    bool _2503 = _2357 != 3;
    int _2505 = ~_2483;
    int _2507 = _2505 + 1;
    int _2509 = _2507 + 1;
    int _2511 = _2343 + _2497;
    int _2513 = _2509;
    if (!_2449)
    {
        int _2515 = ~_2483;
        int _2517 = _2515 + 1;
        _2513 = _2517;
    }
    int _2519 = _2513;
    int _2521 = _2411 >> 31;
    bool _2523 = !_2503;
    int _2525 = _2523 ? 0 : (-1);
    bool _2527 = uint(_2441) >= 2u;
    bool _2529 = _2441 != 3;
    int _2531 = int(_2313) + int(_2417);
    int _2533 = _2521 & 3;
    int _2535 = _2527 ? 0 : 1;
    int _2537 = ~_1832;
    int _2539 = _2537 + 1;
    bool _2541 = _2441 != 3;
    int _2543 = _2411 + _2533;
    int _2545 = _2539 * _2531;
    int _2547 = _2545 + _2183;
    bool _2549 = !_2541;
    int _2551 = _2549 ? 0 : (-1);
    bool _2553 = _573 > 0.5;
    int _2555 = _2543 >> 2;
    int _2557 = ~_2535;
    int _2559 = _2557 + 1;
    int _2561 = _2559 + 1;
    float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2565 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2563;
    int _2567 = _2561;
    if (_2529)
    {
        int _2569 = ~_2535;
        int _2571 = _2569 + 1;
        _2567 = _2571;
    }
    int _2573 = _2567;
    float _2575 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2145);
    int _2577 = _2511 >> 2;
    float _2579 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2165);
    bool _2581 = uint(_2547) >= uint(_1832);
    float _2583 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2575);
    int _2585 = _2555 << 4;
    int _2587 = _2585 + 512;
    int _2589 = _2577 << 4;
    int _2591 = _2589 + 368;
    float _2593 = _2583 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _2595 = !_2581;
    int _2597 = _2595 ? 0 : (-1);
    uint _2599 = uint(int(uint(_2587) >> uint(2)));
    uint _2601 = uint(int(uint(int(_2599)) >> uint(2)));
    int _2603 = int(_2599) & 3;
    float _2605 = (*spvDescriptorSet0.vp_c9)._m0[int(_2601)][_2603];
    int _2607 = int(_2599) + 1;
    uint _2609 = uint(int(uint(_2607) >> uint(2)));
    int _2611 = _2607 & 3;
    float _2613 = (*spvDescriptorSet0.vp_c9)._m0[int(_2609)][_2611];
    bool _2615 = _571 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2617 = isnan(_571);
    bool _2619 = _2615 || _2617;
    bool _2621 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2623 = _2619 || _2621;
    float _2625 = float(_2623);
    int _2627 = ~_2531;
    int _2629 = _2627 + _2597;
    int _2631 = _2629 + 1;
    float _2633 = _2565 * _2261;
    float _2635 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2579);
    float _2637 = -_2625;
    float _2639 = _2637 + 1.0;
    int _2641 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2643 = _2641 != 0;
    uint _2645 = uint(int(uint(_2591) >> uint(2)));
    uint _2647 = uint(int(uint(int(_2645)) >> uint(2)));
    int _2649 = int(_2645) & 3;
    float _2651 = (*spvDescriptorSet0.vp_c9)._m0[int(_2647)][_2649];
    int _2653 = int(_2645) + 1;
    uint _2655 = uint(int(uint(_2653) >> uint(2)));
    int _2657 = _2653 & 3;
    float _2659 = (*spvDescriptorSet0.vp_c9)._m0[int(_2655)][_2657];
    int _2661 = _1832 * _2631;
    int _2663 = _2661 + _2183;
    float _2665 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2667 = _571 + _2665;
    float _2669 = 1.0 / _2593;
    bool _2671 = _571 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2673 = isnan(_571);
    bool _2675 = _2671 || _2673;
    bool _2677 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2679 = _2675 || _2677;
    float _2681 = float(_2679);
    float _2683 = _2635 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2685 = fma(_2633, _2667, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2687 = !_2093;
    int _2689 = _2687 ? _2663 : (-1);
    int _2691 = _2591 + 8;
    uint _2693 = uint(int(uint(_2691) >> uint(2)));
    uint _2695 = uint(int(uint(int(_2693)) >> uint(2)));
    int _2697 = int(_2693) & 3;
    float _2699 = (*spvDescriptorSet0.vp_c9)._m0[int(_2695)][_2697];
    int _2701 = int(_2693) + 1;
    uint _2703 = uint(int(uint(_2701) >> uint(2)));
    int _2705 = _2701 & 3;
    float _2707 = (*spvDescriptorSet0.vp_c9)._m0[int(_2703)][_2705];
    float _2709 = _2681 * _2639;
    float _2711 = _2683 + _2593;
    bool _2713 = _575 > 0.5;
    float _2715 = -_2681;
    float _2717 = _2715 + 1.0;
    float _2719 = _2685 * _2709;
    int _2721 = abs(_2475);
    int _2723 = _2587 + 8;
    uint _2725 = uint(int(uint(_2723) >> uint(2)));
    uint _2727 = uint(int(uint(int(_2725)) >> uint(2)));
    int _2729 = int(_2725) & 3;
    float _2731 = (*spvDescriptorSet0.vp_c9)._m0[int(_2727)][_2729];
    int _2733 = int(_2725) + 1;
    uint _2735 = uint(int(uint(_2733) >> uint(2)));
    int _2737 = _2733 & 3;
    float _2739 = (*spvDescriptorSet0.vp_c9)._m0[int(_2735)][_2737];
    float _2741 = -_189;
    int _2743 = _2553 ? as_type<int>(_2741) : as_type<int>(_189);
    float _2745 = fma(_2717, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2719);
    bool _2747 = _577 > 0.5;
    float _2749 = _2711 * _2669;
    float _2751 = _2749 * 0.5;
    int _2753 = abs(_2519);
    float _2755 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2757 = int(_2755);
    int _2759 = ~_2721;
    int _2761 = _2759 + 1;
    int _2763 = _2761 + 1;
    int _2765 = abs(_2453);
    int _2767 = abs(_2501);
    int _2769 = abs(_2573);
    float _2771 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2773 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2771);
    int _2775 = ~_2753;
    int _2777 = _2775 + 1;
    int _2779 = _2777 + 1;
    int _2781 = ~_2765;
    int _2783 = _2781 + 1;
    int _2785 = _2783 + 1;
    int _2787 = ~_2767;
    int _2789 = _2787 + 1;
    int _2791 = _2789 + 1;
    float _2793 = 1.0 / _2773;
    int _2795 = _2779 * as_type<int>(_2613);
    float _2797 = fma(_2625, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2745);
    int _2799 = abs(_2431);
    int _2801 = abs(_2525);
    int _2803 = _2763 * as_type<int>(_2659);
    int _2805 = _2791 * as_type<int>(_2605);
    int _2807 = _2805 + _2795;
    int _2809 = ~_2799;
    int _2811 = _2809 + 1;
    int _2813 = _2811 + 1;
    int _2815 = _2785 * as_type<int>(_2651);
    int _2817 = _2815 + _2803;
    int _2819 = ~_2769;
    int _2821 = _2819 + 1;
    int _2823 = _2821 + 1;
    float _2825 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2827 = int(_2825);
    int _2829 = abs(_2551);
    int _2831 = _2813 * as_type<int>(_2699);
    int _2833 = _2831 + _2817;
    float _2835 = float(uint(_2757));
    float _2837 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2839 = _2793 * _2837;
    int _2841 = ~_2801;
    int _2843 = _2841 + 1;
    int _2845 = _2843 + 1;
    int _2847 = abs(_2447);
    float _2849 = 1.0 / _2835;
    int _2851 = _2823 * as_type<int>(_2731);
    int _2853 = _2851 + _2807;
    int _2855 = ~_2829;
    int _2857 = _2855 + 1;
    int _2859 = _2857 + 1;
    int _2861 = _2845 * as_type<int>(_2707);
    int _2863 = _2861 + _2833;
    int _2865 = _2859 * as_type<int>(_2739);
    int _2867 = _2865 + _2853;
    float _2869 = abs(_2839);
    float _2871 = log2(_2869);
    int _2873 = abs(_2757);
    float _2875 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2877 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2879 = float(uint(_2873));
    float _2881 = _2875 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2883 = float(uint(_2827));
    float _2885 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2887 = abs(_2481);
    float _2889 = _2877 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2891 = ~_2847;
    int _2893 = _2891 + 1;
    int _2895 = _2893 + 1;
    float _2897 = 1.0 / _2879;
    int _2899 = ~_2887;
    int _2901 = _2899 + 1;
    int _2903 = _2901 + 1;
    float _2905 = _2885 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2907 = abs(_2827);
    float _2909 = _2871 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2911 = _2863 * _2895;
    float _2913 = _2797 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2915 = _2867 * _2903;
    float _2917 = 1.0 / _2883;
    int _2919 = _2439 * _2847;
    int _2921 = _2919 + _2911;
    out.m_68.x = _2881;
    out.m_68.y = _2889;
    out.m_68.z = _2905;
    out.m_68.w = _2913;
    int _2923 = _2689 * _2887;
    int _2925 = _2923 + _2915;
    int _2927 = as_type<int>(_2849) + (-2);
    float _2929 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2931 = float(uint(_2907));
    float _2933 = exp2(_2909);
    int _2935 = abs(_2921);
    float _2937 = -_1069;
    float _2939 = fma(_2937, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2929);
    int _2941 = as_type<int>(_2897) + (-2);
    float _2943 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2945 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2947 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2949 = 1.0 / _2931;
    float _2951 = float(uint(_2921));
    float _2953 = -_1069;
    float _2955 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2943);
    float _2957 = float(uint(_2935));
    float _2959 = -_1069;
    float _2961 = fma(_2959, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2945);
    int _2963 = as_type<int>(_2917) + (-2);
    float _2965 = as_type<float>(_2927) * _2951;
    float _2967 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2939);
    float _2969 = as_type<float>(_2941) * _2957;
    float _2971 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2973 = trunc(_2965);
    float _2975 = precise::max(_2973, 0.0);
    uint _2977 = uint(_2975);
    float _2979 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2981 = fma(_2933, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2983 = precise::clamp(_2981, 0.0, 1.0);
    float _2985 = float(uint(_2925));
    float _2987 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2971);
    int _2989 = ~_2757;
    int _2991 = _2989 + 1;
    float _2993 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2995 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2955);
    float _2997 = trunc(_2969);
    float _2999 = precise::max(_2997, 0.0);
    uint _3001 = uint(_2999);
    float _3003 = as_type<float>(_2963) * _2985;
    float _3005 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2979);
    float _3007 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2947);
    float _3009 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2961);
    int _3011 = as_type<int>(_2949) + (-2);
    float _3013 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3015 = trunc(_3003);
    float _3017 = precise::max(_3015, 0.0);
    uint _3019 = uint(_3017);
    int _3021 = abs(_2925);
    float _3023 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3025 = ~_2873;
    int _3027 = _3025 + 1;
    float _3029 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3013);
    int _3031 = ~_2827;
    int _3033 = _3031 + 1;
    float _3035 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3005);
    bool _3037 = !_2643;
    float _3039 = _3037 ? _189 : as_type<float>(_2743);
    float _3041 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3043 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2993);
    int _3045 = _2991 * int(_2977);
    int _3047 = _3045 + _2921;
    int _3049 = _3027 * int(_3001);
    int _3051 = _3049 + _2935;
    float _3053 = float(uint(_3047));
    float _3055 = float(uint(_3021));
    int _3057 = _3033 * int(_3019);
    int _3059 = _3057 + _2925;
    float _3061 = float(uint(_3051));
    float _3063 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3023);
    float _3065 = -_189;
    int _3067 = _2747 ? as_type<int>(_3065) : as_type<int>(_189);
    float _3069 = as_type<float>(_3011) * _3055;
    float _3071 = float(uint(_3059));
    float _3073 = as_type<float>(_2941) * _3061;
    float _3075 = as_type<float>(_2927) * _3053;
    float _3077 = trunc(_3069);
    float _3079 = precise::max(_3077, 0.0);
    uint _3081 = uint(_3079);
    float _3083 = -_199;
    int _3085 = _2387 ? as_type<int>(_3083) : as_type<int>(_199);
    float _3087 = as_type<float>(_2963) * _3071;
    float _3089 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2987);
    float _3091 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3007);
    bool _3093 = !_2495;
    float _3095 = _3093 ? _189 : as_type<float>(_3067);
    float _3097 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3099 = trunc(_3087);
    float _3101 = precise::max(_3099, 0.0);
    uint _3103 = uint(_3101);
    int _3105 = ~_2907;
    int _3107 = _3105 + 1;
    out.m_70.x = _3089;
    out.m_70.y = _3035;
    out.m_70.z = _3091;
    bool _3109 = !_2487;
    float _3111 = _3109 ? _199 : as_type<float>(_3085);
    float _3113 = fma(_2983, -2.0, 3.0);
    float _3115 = _2983 * _2983;
    float _3117 = -_199;
    int _3119 = _2713 ? as_type<int>(_3117) : as_type<int>(_199);
    int _3121 = _3107 * int(_3081);
    int _3123 = _3121 + _3021;
    float _3125 = trunc(_3073);
    float _3127 = precise::max(_3125, 0.0);
    uint _3129 = uint(_3127);
    float _3131 = _3115 * _3113;
    bool _3133 = !_2491;
    float _3135 = _3133 ? _199 : as_type<float>(_3119);
    float _3137 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3043);
    float _3139 = float(uint(_3123));
    float _3141 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3029);
    float _3143 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3063);
    float _3145 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3147 = trunc(_3075);
    float _3149 = precise::max(_3147, 0.0);
    uint _3151 = uint(_3149);
    float _3153 = as_type<float>(_3011) * _3139;
    float _3155 = _3041 * _3009;
    int _3157 = int(_3019) + int(_3103);
    float _3159 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3145);
    int _3161 = ~_2873;
    int _3163 = _3161 + 1;
    float _3165 = fma(_3097, _3091, _3155);
    int _3167 = ~_2827;
    int _3169 = _3167 + 1;
    float _3171 = trunc(_3153);
    float _3173 = precise::max(_3171, 0.0);
    uint _3175 = uint(_3173);
    int _3177 = int(_3001) + int(_3129);
    float _3179 = _3041 * _2967;
    int _3181 = ~_2907;
    int _3183 = _3181 + 1;
    int _3185 = _3169 * _3157;
    int _3187 = _3185 + _2925;
    float _3189 = _3041 * _2995;
    int _3191 = _3163 * _3177;
    int _3193 = _3191 + _2935;
    float _3195 = fma(_3097, _3089, _3179);
    int _3197 = int(_2977) + int(_3151);
    float _3199 = fma(_3097, _3035, _3189);
    bool _3201 = uint(_3187) >= uint(_2827);
    float _3203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3205 = ~_2757;
    int _3207 = _3205 + 1;
    float _3209 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3159);
    bool _3211 = uint(_3193) >= uint(_2873);
    float _3213 = -_3131;
    float _3215 = _3213 + 1.0;
    int _3217 = int(_3081) + int(_3175);
    int _3219 = _3207 * _3197;
    int _3221 = _3219 + _2921;
    bool _3223 = !_3201;
    int _3225 = _3223 ? 0 : (-1);
    float _3227 = fma(_3215, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3131);
    bool _3229 = _2827 == 0;
    int _3231 = _3183 * _3217;
    int _3233 = _3231 + _3021;
    int _3235 = ~_3157;
    int _3237 = _3235 + _3225;
    int _3239 = _3237 + 1;
    float _3241 = _3137 + _3195;
    int _3243 = _2921 ^ _2757;
    bool _3245 = uint(_3221) >= uint(_2757);
    int _3247 = _2827 * _3239;
    int _3249 = _3247 + _2925;
    bool _3251 = uint(_3233) >= uint(_2907);
    float _3253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3255 = !_3211;
    int _3257 = _3255 ? 0 : (-1);
    uint _3259 = uint(int(uint(_3243) >> uint(31)));
    bool _3261 = !_3245;
    int _3263 = _3261 ? 0 : (-1);
    int _3265 = ~_3257;
    int _3267 = _3177 + _3265;
    int _3269 = _3267 + 1;
    int _3271 = ~int(_3259);
    int _3273 = _3271 + 1;
    float _3275 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3277 = ~_3197;
    int _3279 = _3277 + _3263;
    int _3281 = _3279 + 1;
    int _3283 = _2925 ^ _2827;
    float _3285 = _3143 + _3165;
    int _3287 = _3269 ^ _3273;
    int _3289 = _2757 * _3281;
    int _3291 = _3289 + _2921;
    bool _3293 = _2827 == 0;
    float _3295 = _3203 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3297 = !_3251;
    int _3299 = _3297 ? 0 : (-1);
    float _3301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3303 = uint(int(uint(_3283) >> uint(31)));
    int _3305 = ~_3273;
    int _3307 = _3305 + _3287;
    int _3309 = _3307 + 1;
    float _3311 = fma(_3041, _3041, 1.0);
    bool _3313 = _2757 == 0;
    int _3315 = ~_3299;
    int _3317 = _3217 + _3315;
    int _3319 = _3317 + 1;
    float _3321 = _3141 + _3199;
    int _3323 = ~int(_3303);
    int _3325 = _3323 + 1;
    float _3327 = rsqrt(_3311);
    bool _3329 = _2757 == 0;
    bool _3331 = !_3313;
    int _3333 = _3331 ? _3291 : (-1);
    out.m_72.x = _3241;
    out.m_72.y = _3321;
    out.m_72.z = _3285;
    int _3335 = _3319 ^ _3325;
    float _3337 = _3301 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3339 = !_3229;
    int _3341 = _3339 ? _3249 : (-1);
    float _3343 = float(_3333);
    bool _3345 = !_3329;
    int _3347 = _3345 ? _3309 : (-1);
    int _3349 = ~_3325;
    int _3351 = _3349 + _3335;
    int _3353 = _3351 + 1;
    float _3355 = fma(_3295, _3343, _659);
    float _3357 = float(_3341);
    float _3359 = _3039 + 0.5;
    float _3361 = float(_3347);
    float _3363 = _3253 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3365 = !_3293;
    int _3367 = _3365 ? _3353 : (-1);
    float _3369 = fma(_3295, _3359, _3355);
    float _3371 = _3275 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3373 = fma(_3337, _3357, _959);
    float _3375 = float(_3367);
    float _3377 = -_625;
    float _3379 = fma(_3363, _3361, _3377);
    float _3381 = _3095 + 0.5;
    float _3383 = _3135 + (-0.5);
    float _3385 = _3041 * _3327;
    float _3387 = -_961;
    float _3389 = fma(_3371, _3375, _3387);
    float _3391 = fma(_3337, _3381, _3373);
    float _3393 = -_3363;
    float _3395 = fma(_3393, _3383, _3379);
    float _3397 = _3111 + (-0.5);
    float _3399 = -_951;
    float _3401 = _3399 + 1.0;
    float _3403 = -_3141;
    float _3405 = _3385 * _3403;
    float _3407 = -_3137;
    float _3409 = _3385 * _3407;
    float _3411 = -_3371;
    float _3413 = fma(_3411, _3397, _3389);
    float _3415 = -_3401;
    float _3417 = fma(_3095, _3415, _3391);
    float _3419 = fma(_3327, _2995, _3405);
    float _3421 = in.m_74.x;
    float _3423 = -_939;
    float _3425 = _3423 + 1.0;
    float _3427 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3209);
    bool _3429 = _2839 <= 8000.0;
    bool _3431 = isnan(_2839);
    bool _3433 = _3429 || _3431;
    bool _3435 = isnan(8000.0);
    bool _3437 = _3433 || _3435;
    float _3439 = float(_3437);
    float _3441 = -_3143;
    float _3443 = _3385 * _3441;
    float _3445 = fma(_3327, _2967, _3409);
    float _3447 = fma(_3111, _1820, _3413);
    float _3449 = -_3425;
    float _3451 = fma(_3039, _3449, _3369);
    float _3453 = _3439 * _3227;
    float _3455 = fma(_3327, _3009, _3443);
    float _3457 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3459 = fma(_3135, _1826, _3395);
    float _3461 = _3453 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3463 = _3427 + _1701;
    out.m_76.x = _3445;
    out.m_76.y = _3419;
    out.m_76.z = _3455;
    float _3465 = _2377 * _3461;
    float _3467 = precise::clamp(_3465, 0.0, 1.0);
    float _3469 = _3457 * _1781;
    float _3471 = _3463 * 0.5;
    out.gl_Position.x = _1747;
    out.gl_Position.y = _1761;
    out.gl_Position.z = _3427;
    out.gl_Position.w = _1701;
    bool _3473 = _1473 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3475 = isnan(_1473);
    bool _3477 = _3473 || _3475;
    bool _3479 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3481 = _3477 || _3479;
    out.m_78.x = _3451;
    out.m_78.y = _3459;
    out.m_78.z = _3417;
    out.m_78.w = _3447;
    float _3483 = _1802 * _3469;
    out.m_80.z = _3471;
    out.m_80.w = _1701;
    float _3485 = -_3467;
    float _3487 = fma(_3485, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3489 = _1792 * _3469;
    float _3491 = _3487 * _3421;
    float _3493 = -_3457;
    float _3495 = _3493 + 1.0;
    float _3497 = _3445;
    float _3499 = _3427;
    float _3501 = _3489;
    float _3503 = _3495;
    float _3505 = _3457;
    if (!_3481)
    {
        _3497 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3507 = _3497;
    float _3509 = fma(_1798, _3489, _1786);
    float _3511 = fma(_1800, _3489, _1788);
    float _3513 = _3491 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3515 = _1792 * _3495;
    float _3517 = fma(_1792, _3483, _1790);
    float _3519 = _3507;
    float _3521 = _3507;
    if (!_3481)
    {
        _1836 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3523 = _1836;
    out.m_82.x = _3513;
    float _3525 = _3523;
    float _3527 = _3523;
    if (!_3481)
    {
        _3499 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3529 = _3499;
    float _3531 = _3529;
    float _3533 = _3529;
    if (!_3481)
    {
        _3501 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3535 = _3501;
    out.m_84.x = _3509;
    out.m_84.y = _3511;
    out.m_84.z = _3517;
    out.m_84.w = _3515;
    float _3537 = _3535;
    float _3539 = _3535;
    if (!_3481)
    {
        _3503 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3541 = _3503;
    float _3543 = _3541;
    float _3545 = _3541;
    if (!_3481)
    {
        _3505 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3547 = _3505;
    bool _3549 = !_3481;
    float _3551 = _3547;
    float _3553 = _3547;
    if (!_3549)
    {
        bool _3555 = _1473 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3557 = isnan(_1473);
        bool _3559 = _3555 || _3557;
        bool _3561 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3563 = _3559 || _3561;
        if (!_3563)
        {
            float _3565 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3567 = _1473 + _3565;
            float _3569 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3571 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3569;
            float _3573 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3575 = _3573 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3577 = 1.0 / _3571;
            float _3579 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3581 = _3579 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3583 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3585 = _3583 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3587 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3589 = _3587 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3591 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3593 = _3591 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3595 = _3567 * _3577;
            float _3597 = precise::clamp(_3595, 0.0, 1.0);
            float _3599 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3601 = _3599 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3603 = fma(_3597, _3575, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3605 = fma(_3597, _3601, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3607 = fma(_3597, _3581, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3609 = fma(_3597, _3585, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3611 = fma(_3597, _3589, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3613 = fma(_3597, _3593, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3527 = _3607;
            _3545 = _3611;
            _3521 = _3603;
            _3539 = _3609;
            _3533 = _3605;
            _3553 = _3613;
            _3615 = true;
        }
        else
        {
            bool _3617 = _1473 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3619 = isnan(_1473);
            bool _3621 = _3617 || _3619;
            bool _3623 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3625 = _3621 || _3623;
            if (!_3625)
            {
                _3519 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3627 = _3519;
            _3521 = _3627;
            if (!_3625)
            {
                _3525 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3629 = _3525;
            _3527 = _3629;
            if (!_3625)
            {
                _3531 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3631 = _3531;
            _3533 = _3631;
            if (!_3625)
            {
                _3537 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3633 = _3537;
            _3539 = _3633;
            if (!_3625)
            {
                _3543 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3635 = _3543;
            _3545 = _3635;
            if (!_3625)
            {
                _3551 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3637 = _3551;
            bool _3639 = !_3625;
            _3553 = _3637;
            if (!_3639)
            {
                bool _3641 = _1473 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3643 = isnan(_1473);
                bool _3645 = _3641 || _3643;
                bool _3647 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3649 = _3645 || _3647;
                if (!_3649)
                {
                    float _3651 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3653 = _1473 + _3651;
                    float _3655 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3657 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3655;
                    float _3659 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3661 = _3659 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3663 = 1.0 / _3657;
                    float _3665 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3667 = _3665 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3669 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3671 = _3669 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3673 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3675 = _3673 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3677 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3679 = _3677 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3681 = _3653 * _3663;
                    float _3683 = precise::clamp(_3681, 0.0, 1.0);
                    float _3685 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3687 = _3685 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3689 = fma(_3683, _3661, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3691 = fma(_3683, _3687, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3693 = fma(_3683, _3667, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3695 = fma(_3683, _3671, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3697 = fma(_3683, _3675, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3699 = fma(_3683, _3679, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3527 = _3693;
                    _3545 = _3697;
                    _3521 = _3689;
                    _3539 = _3695;
                    _3533 = _3691;
                    _3553 = _3699;
                    _3615 = true;
                }
                else
                {
                    _3527 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3545 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3521 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3539 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3533 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3553 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3615 = false;
    float _3701 = _3527;
    float _3703 = _3545;
    float _3705 = _3521;
    float _3707 = _3539;
    float _3709 = _3533;
    float _3711 = _3553;
    float _3713 = fma(_3321, -0.5, 0.5);
    float _3715 = precise::clamp(_3713, 0.0, 1.0);
    float _3717 = -_3701;
    float _3719 = _3717 + _3703;
    float _3721 = -_3705;
    float _3723 = _3721 + _3707;
    float _3725 = -_3709;
    float _3727 = _3725 + _3711;
    bool _3729 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3731 = fma(_3715, _3719, _3701);
    float _3733 = fma(_3715, _3723, _3705);
    float _3735 = fma(_3715, _3727, _3709);
    float _3737 = _3731 * 0.586610972881317138671875;
    out.m_86.x = 0.0;
    float _3739 = fma(_3733, 0.298911988735198974609375, _3737);
    float _3741 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3743 = fma(_3735, 0.114477999508380889892578125, _3739);
    out.m_49.x = _3741;
    float _3745 = -_3743;
    float _3747 = _3733 + _3745;
    float _3749 = -_3743;
    float _3751 = _3731 + _3749;
    float _3753 = -_3743;
    float _3755 = _3735 + _3753;
    float _3757 = fma(_3747, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3743);
    float _3759 = fma(_3751, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3743);
    float _3761 = fma(_3755, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3743);
    out.m_88.x = _3757;
    out.m_88.y = _3759;
    out.m_88.z = _3761;
    if (!_3729)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3763 = -_1445;
    float _3765 = _3763 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3767 = -_1447;
    float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3771 = -_1449;
    float _3773 = _3771 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3775 = _3765 * _3765;
    float _3777 = fma(_3769, _3769, _3775);
    float _3779 = fma(_3773, _3773, _3777);
    float _3781 = sqrt(_3779);
    float _3783 = rsqrt(_3779);
    float _3785 = -_3781;
    float _3787 = _3785 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3789 = _3787 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3791 = precise::clamp(_3789, 0.0, 1.0);
    float _3793 = _3769 * _3783;
    float _3795 = _3765 * _3783;
    float _3797 = abs(_3791);
    float _3799 = log2(_3797);
    float _3801 = _3773 * _3783;
    float _3803 = _3793 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3805 = _3321 * _3795;
    float _3807 = -_3795;
    float _3809 = -_3803;
    float _3811 = fma(_3807, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3809);
    float _3813 = fma(_3241, _3793, _3805);
    float _3815 = -_3801;
    float _3817 = fma(_3815, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3811);
    float _3819 = fma(_3285, _3801, _3813);
    float _3821 = precise::clamp(_3819, 0.0, 1.0);
    float _3823 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3825 = _3817 + _3823;
    float _3827 = _3799 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3829 = _3825 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3831 = precise::clamp(_3829, 0.0, 1.0);
    float _3833 = exp2(_3827);
    float _3835 = _3833 * _3831;
    float _3837 = _3821 * _3835;
    float _3839 = _3837 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3841 = _3837 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3843 = _3837 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3839;
    out.m_86.y = _3841;
    out.m_86.z = _3843;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3615 = false;
    bool _563 = false;
    bool _375 = false;
    bool _227 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3900 = as_type<float>(_123);
        out.gl_Position.z = _3900;
    }
    if (!_111)
    {
        return out;
    }
    float _127 = in.m_51.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = _141;
    if (_137)
    {
        float _147 = float(_107);
        _143 = _147;
    }
    float _149 = _143;
    bool _151 = _141 >= _149;
    bool _153 = !_137;
    bool _155 = _151 || _153;
    if (_155)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _117;
    if (_155)
    {
        out.m_49.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3969 = as_type<float>(_161);
        out.gl_Position.z = _3969;
    }
    if (_155)
    {
        return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = in.m_56.x;
    float _167 = in.m_56.y;
    float _169 = in.m_56.z;
    int _171 = as_type<int>(_163) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_163) & 2;
    bool _177 = _175 != 0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = _167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _183 = _167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = _167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _187 = !_173;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _193 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    bool _197 = !_177;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _203 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _205 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    bool _207 = !_179;
    float _225;
    if (!_207)
    {
        float _209 = in.m_58.x;
        float _211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _217 = _215 * _211;
        float _219 = floor(_217);
        float _221 = -_219;
        float _223 = _217 + _221;
        _225 = _223;
        _227 = true;
    }
    else
    {
        float _229 = float(_107);
        float _231 = 1.0 / _229;
        float _233 = _141 * _231;
        _225 = _233;
    }
    _227 = false;
    float _235 = _225;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    bool _241 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _243 = isnan(_235);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    bool _253 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _255 = isnan(_235);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = -_251;
    float _275 = _273 + 1.0;
    float _277 = 1.0 / _267;
    bool _279 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _281 = isnan(_235);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = _263 * _275;
    float _293 = -_263;
    float _295 = _293 + 1.0;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _299 = _289 * _295;
    float _301 = 1.0 / _271;
    float _303 = -_289;
    float _305 = _303 + 1.0;
    float _307 = _239 * _277;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _235 + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _317;
    float _321 = fma(_315, _307, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = fma(_319, _307, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = _311 * _301;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _331 = _321 * _299;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _337 = _323 * _299;
    float _339 = fma(_329, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _341 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].x, _331);
    float _343 = fma(_335, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _345 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].y, _337);
    float _347 = fma(_339, _291, _341);
    float _349 = fma(_343, _291, _345);
    float _351 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[145].x, _347);
    float _353 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[145].y, _349);
    bool _355 = !_297;
    float _373;
    if (!_355)
    {
        float _357 = in.m_58.x;
        float _359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _361 = _357 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _363 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _365 = _363 * _359;
        float _367 = floor(_365);
        float _369 = -_367;
        float _371 = _365 + _369;
        _373 = _371;
        _375 = true;
    }
    else
    {
        float _377 = float(_107);
        float _379 = 1.0 / _377;
        float _381 = _141 * _379;
        _373 = _381;
    }
    _375 = false;
    float _383 = _373;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _387 = _383 + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _397 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _399 = isnan(_383);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _413 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _415 = isnan(_383);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = 1.0 / _391;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _427;
    float _431 = -_407;
    float _433 = _431 + 1.0;
    bool _435 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _437 = isnan(_383);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _449 = 1.0 / _395;
    float _451 = 1.0 / _411;
    float _453 = _429 * _425;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _459 = _423 * _433;
    float _461 = -_423;
    float _463 = _461 + 1.0;
    float _465 = fma(_453, _387, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _467 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _469 = isnan(_383);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = _445 * _463;
    float _481 = _457 * _449;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _489 = _383 + _487;
    float _491 = _465 * _479;
    float _493 = -_445;
    float _495 = _493 + 1.0;
    float _497 = -_477;
    float _499 = _497 + 1.0;
    float _501 = fma(_481, _489, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _503 = _485 * _451;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _507 = _383 + _505;
    float _509 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[115].x, _491);
    float _511 = _407 * _499;
    float _513 = fma(_503, _507, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _515 = fma(_501, _459, _509);
    float _517 = in.m_60.x;
    float _519 = in.m_60.y;
    float _521 = fma(_513, _511, _515);
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _527 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[118].x, _521);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _531 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _533 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _535 = _527 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _537 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _531;
    out.m_62.y = _533;
    out.m_62.z = _537;
    out.m_62.w = _535;
    float _539 = _353 * _519;
    float _541 = _351 * _517;
    bool _543 = !_447;
    float _561;
    if (!_543)
    {
        float _545 = in.m_58.x;
        float _547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _549 = _545 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _551 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _553 = _551 * _547;
        float _555 = floor(_553);
        float _557 = -_555;
        float _559 = _553 + _557;
        _561 = _559;
        _563 = true;
    }
    else
    {
        float _565 = float(_107);
        float _567 = 1.0 / _565;
        float _569 = _141 * _567;
        _561 = _569;
    }
    _563 = false;
    float _571 = _561;
    float _573 = in.m_58.x;
    float _575 = in.m_58.y;
    float _577 = in.m_58.z;
    float _579 = in.m_58.w;
    float _581 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _583 = log2(_581);
    float _585 = _539 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _589 = _587 != 0;
    float _591 = _541 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _599 = _583 * _141;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _603 = _577 * 2.0;
    float _605 = _573 * 2.0;
    float _607 = _575 * 2.0;
    float _609 = _573 + _575;
    float _611 = _575 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _613 = floor(_605);
    float _615 = _573 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _617 = _609 + (-1.0);
    float _619 = fma(_611, -2.0, _593);
    float _621 = -_595;
    float _623 = fma(_615, 2.0, _621);
    float _625 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _619);
    float _627 = floor(_603);
    int _629 = int(_589);
    int _631 = _177 ? 2 : 0;
    int _633 = _629 | _631;
    int _635 = _179 ? 4 : 0;
    int _637 = _633 | _635;
    int _639 = false ? 8 : 0;
    int _641 = _637 | _639;
    int _643 = false ? 16 : 0;
    int _645 = _641 | _643;
    int _647 = false ? 32 : 0;
    int _649 = _645 | _647;
    int _651 = false ? 64 : 0;
    int _653 = _649 | _651;
    int _655 = _653 & 1;
    float _657 = -_141;
    float _659 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[76].x, _623);
    int _661 = _655;
    if (_589)
    {
        _661 = 0;
    }
    int _663 = _661;
    int _665 = _663;
    if (!_589)
    {
        _665 = 1;
    }
    int _667 = _665;
    float _669 = floor(_607);
    bool _671 = _613 >= 0.0;
    bool _673 = isnan(_613);
    bool _675 = _671 || _673;
    bool _677 = isnan(0.0);
    bool _679 = _675 || _677;
    bool _681 = _667 != 1;
    bool _683 = _613 > 0.0;
    bool _685 = _627 > 0.0;
    float _687 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _689 = _679 ? 0 : 1;
    float _691 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _693 = int(_691);
    bool _695 = _627 >= 0.0;
    bool _697 = isnan(_627);
    bool _699 = _695 || _697;
    bool _701 = isnan(0.0);
    bool _703 = _699 || _701;
    int _705 = ~_689;
    int _707 = _705 + 1;
    int _709 = _707 + 1;
    bool _711 = _669 > 0.0;
    int _713 = _703 ? 0 : 1;
    float _715 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _717 = int(_715);
    bool _719 = _669 >= 0.0;
    bool _721 = isnan(_669);
    bool _723 = _719 || _721;
    bool _725 = isnan(0.0);
    bool _727 = _723 || _725;
    int _729 = ~_713;
    int _731 = _729 + 1;
    int _733 = _731 + 1;
    int _735 = _727 ? 0 : 1;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _739 = _733;
    float _741 = as_type<float>(_667);
    float _743 = as_type<float>(_693);
    int _745 = _709;
    if (!_685)
    {
        int _747 = ~_713;
        int _749 = _747 + 1;
        _739 = _749;
    }
    int _751 = _739;
    float _753 = exp2(_599);
    if (!_681)
    {
        _741 = _575;
    }
    float _755 = _741;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _767 = _765 != 0;
    float _769 = _755;
    if (_681)
    {
        _769 = _573;
    }
    float _771 = _769;
    int _773 = ~_735;
    int _775 = _773 + 1;
    int _777 = _775 + 1;
    int _779 = _777;
    if (!_711)
    {
        int _781 = ~_735;
        int _783 = _781 + 1;
        _779 = _783;
    }
    int _785 = _779;
    float _787 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[83].z, _737);
    bool _789 = !_763;
    int _791 = _789 ? 0 : 1;
    bool _793 = !_759;
    int _795 = _793 ? 0 : 1;
    bool _797 = !_767;
    int _799 = _797 ? 0 : 1;
    float _801 = -_753;
    float _803 = _801 + 1.0;
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _807 = _805 != 0;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _811 = _809 != 0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _815 = _813 != 0;
    float _817 = float(_107);
    float _819 = float(_693);
    float _821 = 1.0 / _817;
    bool _823 = !_807;
    float _825 = _823 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _827 = _817;
    float _829 = _825;
    if (!_681)
    {
        _743 = _575;
    }
    float _831 = _743;
    float _833 = _831;
    if (!_683)
    {
        int _835 = ~_689;
        int _837 = _835 + 1;
        _745 = _837;
    }
    int _839 = _745;
    if (_681)
    {
        _833 = _573;
    }
    float _841 = _833;
    float _843 = 1.0 / _819;
    if (!_681)
    {
        _827 = _577;
    }
    float _845 = _827;
    float _847 = _845;
    if (_681)
    {
        _847 = _575;
    }
    float _849 = _847;
    float _851 = _841 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _853 = abs(as_type<int>(_825));
    float _855 = _849 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_681)
    {
        _829 = _577;
    }
    float _857 = _829;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _861 = _857;
    if (_681)
    {
        _861 = _575;
    }
    float _863 = _861;
    float _865 = fma(_855, -2.0, _601);
    float _867 = float(_853);
    float _869 = -_859;
    float _871 = fma(_851, 2.0, _869);
    float _873 = float(_751);
    float _875 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[83].w, _597);
    float _877 = _573 + (-0.5);
    float _879 = float(_717);
    float _881 = _867 * _873;
    bool _883 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _885 = isnan(1.0);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _891 = _887 || _889;
    float _893 = in.m_64.x;
    float _895 = in.m_64.y;
    float _897 = in.m_64.z;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _901 = 1.0 + _899;
    float _903 = 1.0 / _879;
    float _905 = _881 * (-2.0);
    float _907 = _843 * _141;
    bool _909 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _911 = isnan(0.0);
    bool _913 = _909 || _911;
    bool _915 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _917 = _913 || _915;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _921 = float(_839);
    float _923 = 1.0 / _901;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _927 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[78].z, _919);
    bool _929 = !_811;
    int _931 = _929 ? 0 : 1;
    float _933 = _821 * _141;
    float _935 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[78].w, _925);
    float _937 = _917 ? _803 : 0.0;
    float _939 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _927);
    int _941 = abs(_931);
    float _943 = _903 * _141;
    bool _945 = !_815;
    int _947 = _945 ? 0 : 1;
    float _949 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _935);
    float _951 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _787);
    float _953 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _875);
    float _955 = fma(_905, _893, _893);
    float _957 = -_141;
    float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[81].x, _871);
    float _961 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _865);
    float _963 = _881;
    if (_891)
    {
        float _965 = _937 * _923;
        _145 = _965;
    }
    float _967 = _145;
    float _969 = fma(_687, _905, _687);
    float _971 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[196].x, _955);
    int _973 = abs(_947);
    float _975 = _577 + _575;
    float _977 = float(_941);
    float _979 = fma(_969, _967, _971);
    float _981 = _975 + (-1.0);
    float _983 = _977 * _921;
    float _985 = float(_785);
    float _987 = _979 * 0.15915493667125701904296875;
    float _989 = float(_973);
    float _991 = _983 * (-2.0);
    float _993 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _995 = _577 + _573;
    float _997 = _987 * 6.283185482025146484375;
    float _999 = cos(_997);
    float _1001 = _989 * _985;
    float _1003 = _575 + (-0.5);
    float _1005 = fma(_991, _895, _895);
    float _1007 = fma(_993, _991, _993);
    float _1009 = _995 + (-1.0);
    float _1011 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1005);
    float _1013 = _1001 * (-2.0);
    float _1015 = _987 * 6.283185482025146484375;
    float _1017 = sin(_1015);
    float _1019 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1021 = fma(_1007, _967, _1011);
    float _1023 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1025 = fma(_1013, _897, _897);
    float _1027 = _577 + (-0.5);
    float _1029 = _1021 * 0.15915493667125701904296875;
    float _1031 = fma(_1023, _1013, _1023);
    float _1033 = _591 * _1019;
    float _1035 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1025);
    float _1037 = _1029 * 6.283185482025146484375;
    float _1039 = sin(_1037);
    float _1041 = fma(_1031, _967, _1035);
    float _1043 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1045 = _1041 * 0.15915493667125701904296875;
    float _1047 = _1029 * 6.283185482025146484375;
    float _1049 = cos(_1047);
    float _1051 = in.m_46.x;
    float _1053 = in.m_46.y;
    float _1055 = in.m_46.z;
    float _1057 = _585 * _1043;
    float _1059 = _1045 * 6.283185482025146484375;
    float _1061 = cos(_1059);
    float _1063 = _999 * _1039;
    float _1065 = _1017 * _1039;
    float _1067 = _1045 * 6.283185482025146484375;
    float _1069 = sin(_1067);
    float _1071 = _999 * _1049;
    float _1073 = _1017 * _1049;
    float _1075 = _999 * _1061;
    float _1077 = _1017 * _1061;
    float _1079 = _1049 * _1061;
    float _1081 = _1039 * _1061;
    float _1083 = _1075 * _1057;
    float _1085 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1087 = fma(_1069, _1071, _1065);
    float _1089 = -_1063;
    float _1091 = fma(_1069, _1073, _1089);
    float _1093 = -_1057;
    float _1095 = _1069 * _1093;
    float _1097 = -_1073;
    float _1099 = fma(_1069, _1063, _1097);
    float _1101 = _1077 * _1057;
    float _1103 = fma(_1087, _1033, _1083);
    float _1105 = fma(_1079, _1033, _1095);
    float _1107 = fma(_1069, _1065, _1071);
    float _1109 = fma(_1091, _1033, _1101);
    float _1111 = fma(_1099, _1085, _1103);
    float _1113 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1115 = fma(_1081, _1085, _1105);
    float _1117 = fma(_1107, _1085, _1109);
    float _1119 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1121 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1123 = fma(_1051, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1113);
    float _1125 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1127 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1119);
    float _1129 = fma(_1051, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1121);
    float _1131 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1123);
    float _1133 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1125);
    float _1135 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1127);
    float _1137 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1129);
    float _1139 = _1131 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1141 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1133);
    float _1143 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1145 = _1137 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1147 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1149 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1151 = _1139 + _1143;
    float _1153 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1155 = fma(_1051, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1147);
    float _1157 = _1145 + _1149;
    float _1159 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1161 = _1151 + _1159;
    float _1163 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1153);
    float _1165 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1155);
    float _1167 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1169 = _1157 + _1167;
    float _1171 = _1161 * _1161;
    float _1173 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1163);
    float _1175 = _1165 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1177 = fma(_1169, _1169, _1171);
    float _1179 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1181 = sqrt(_1177);
    float _1183 = _1175 + _1179;
    bool _1185 = _1181 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1189 = _1187 != 0;
    int _1191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1193 = _1191 != 0;
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1197 = _1195 != 0;
    int _1199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1201 = _1199 != 0;
    bool _1203 = !_1193;
    int _1205 = _1203 ? 0 : 1;
    bool _1207 = !_1189;
    int _1209 = _1207 ? 0 : 1;
    bool _1211 = !_1197;
    int _1213 = _1211 ? 0 : 1;
    bool _1215 = !_1201;
    int _1217 = _1215 ? 0 : 1;
    float _1219 = _1051;
    float _1221 = _1055;
    float _1223 = _1165;
    float _1225 = _1117;
    if (!_1185)
    {
        _1219 = _1157;
    }
    float _1227 = _1219;
    float _1229 = _1227;
    if (!_1185)
    {
        _1221 = _1151;
    }
    float _1231 = _1221;
    float _1233 = _1231;
    if (!_1185)
    {
        _1223 = _1183;
    }
    float _1235 = _1223;
    bool _1237 = !_1185;
    float _1239 = _1235;
    if (!_1237)
    {
        float _1241 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1243 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1245 = _1181 + _1243;
        float _1247 = _1183 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1249 = rsqrt(_1177);
        float _1251 = _1245 * _1241;
        float _1253 = _1251 * 0.15915493667125701904296875;
        float _1255 = _1253 * 6.283185482025146484375;
        float _1257 = cos(_1255);
        float _1259 = _1253 * 6.283185482025146484375;
        float _1261 = sin(_1259);
        float _1263 = _1257 + (-1.0);
        float _1265 = _1263 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1267 = fma(_1261, _1247, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1269 = fma(_1183, _1257, _1265);
        float _1271 = _1249 * _1267;
        float _1273 = fma(_1169, _1271, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1275 = fma(_1161, _1271, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1239 = _1269;
        _1229 = _1273;
        _1233 = _1275;
        _1225 = _1253;
    }
    float _1277 = _1239;
    float _1279 = _1229;
    float _1281 = _1233;
    float _1283 = _1225;
    float _1285 = -_1175;
    float _1287 = _1285 + _1277;
    float _1289 = -_1145;
    float _1291 = _1289 + _1279;
    float _1293 = -_1139;
    float _1295 = _1293 + _1281;
    float _1297 = _1287 * _1287;
    bool _1299 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1301 = isnan(0.5);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1307 = _1303 || _1305;
    float _1309 = fma(_1291, _1291, _1297);
    float _1311 = fma(_1295, _1295, _1309);
    float _1313 = sqrt(_1311);
    bool _1315 = _1313 > 0.0;
    bool _1317 = !_1315;
    float _1319 = _1281;
    float _1321 = _1279;
    float _1323 = _1277;
    float _1325 = _1283;
    float _1327 = _1291;
    if (!_1317)
    {
        float _1329 = _203 * _203;
        float _1331 = fma(_201, _201, _1329);
        float _1333 = fma(_205, _205, _1331);
        float _1335 = rsqrt(_1311);
        float _1337 = sqrt(_1333);
        float _1339 = _1291 * _1335;
        float _1341 = _1287 * _1335;
        float _1343 = _1295 * _1335;
        bool _1345 = _1337 > 0.0;
        bool _1347 = !_1345;
        _1325 = _1337;
        _1327 = _1341;
        if (!_1347)
        {
            float _1349 = rsqrt(_1333);
            float _1351 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1353 = _203 * _1349;
            float _1355 = _201 * _1349;
            float _1357 = _1341 * _1353;
            float _1359 = _205 * _1349;
            float _1361 = fma(_1339, _1355, _1357);
            float _1363 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1365 = fma(_1343, _1359, _1361);
            float _1367 = _1365 * _1363;
            float _1369 = fma(_201, _1367, _1279);
            float _1371 = fma(_203, _1367, _1277);
            float _1373 = fma(_205, _1367, _1281);
            _1319 = _1373;
            _1321 = _1369;
            _1323 = _1371;
            _1325 = _1351;
            _1327 = _1361;
        }
    }
    float _1375 = _1319;
    float _1377 = _1321;
    float _1379 = _1323;
    float _1381 = _1325;
    float _1383 = _1327;
    float _1385 = _1379;
    float _1387 = _1377;
    float _1389 = _1375;
    float _1391 = _1383;
    float _1393 = _1381;
    if (!_1307)
    {
        float _1395 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1397 = _1175 + _1395;
        float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1401 = _1145 + _1399;
        float _1403 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1405 = -_1139;
        float _1407 = _1405 + _1375;
        float _1409 = _1397 * _1397;
        float _1411 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1413 = _1139 + _1411;
        float _1415 = fma(_1401, _1401, _1409);
        float _1417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1419 = fma(_1413, _1413, _1415);
        float _1421 = sqrt(_1419);
        float _1423 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1425 = precise::min(_1421, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1427 = _1425 * _1417;
        float _1429 = -_1145;
        float _1431 = _1429 + _1377;
        float _1433 = _1423 * _1427;
        float _1435 = -_1175;
        float _1437 = _1435 + _1379;
        float _1439 = fma(_1431, _1433, _1145);
        float _1441 = fma(_1437, _1433, _1175);
        float _1443 = fma(_1407, _1433, _1139);
        _1385 = _1441;
        _1387 = _1439;
        _1389 = _1443;
    }
    float _1445 = _1385;
    float _1447 = _1387;
    float _1449 = _1389;
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1453 = _1445 + _1451;
    float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1457 = _1447 + _1455;
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1461 = _1449 + _1459;
    float _1463 = _1453 * _1453;
    float _1465 = fma(_1457, _1457, _1463);
    float _1467 = fma(_1145, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1469 = fma(_1461, _1461, _1465);
    float _1471 = rsqrt(_1469);
    float _1473 = sqrt(_1469);
    float _1475 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1477 = _1457 * _1475;
    float _1479 = _1461 * _1475;
    float _1481 = _1477 * _1477;
    float _1483 = _1479 * _1479;
    float _1485 = _1481 + _1483;
    float _1487 = sqrt(_1485);
    bool _1489 = _1487 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1491 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1493 = _1487 + _1491;
    float _1495 = _1461;
    float _1497 = _1493;
    float _1499 = _1453;
    if (_1489)
    {
        float _1501 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1495 = _1501;
    }
    float _1503 = _1495;
    if (_1489)
    {
        float _1505 = rsqrt(_1485);
        _1391 = _1505;
    }
    float _1507 = _1391;
    float _1509 = _1507;
    if (_1489)
    {
        float _1511 = _1493 * _1503;
        _1497 = _1511;
    }
    float _1513 = _1497;
    float _1515 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1489)
    {
        float _1517 = _1513 * 0.15915493667125701904296875;
        _1393 = _1517;
    }
    float _1519 = _1393;
    float _1521 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1515);
    float _1523 = _1471;
    float _1525 = _1519;
    if (_1489)
    {
        float _1527 = _1519 * 6.283185482025146484375;
        float _1529 = sin(_1527);
        _1523 = _1529;
    }
    float _1531 = _1523;
    float _1533 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1535 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1521);
    float _1537 = precise::max(0.0, _1533);
    float _1539 = _1463;
    float _1541 = _1537;
    float _1543 = _1533;
    if (_1489)
    {
        float _1545 = _1519 * 6.283185482025146484375;
        float _1547 = cos(_1545);
        _1539 = _1547;
    }
    float _1549 = _1539;
    float _1551 = -_1475;
    float _1553 = -_1537;
    float _1555 = fma(_1453, _1551, _1553);
    if (!_1489)
    {
        _1499 = _1477;
    }
    float _1557 = _1499;
    float _1559 = _1557;
    if (_1489)
    {
        float _1561 = _1555 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1541 = _1561;
    }
    float _1563 = _1541;
    float _1565 = _1531;
    if (_1489)
    {
        float _1567 = fma(_1531, _1563, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1565 = _1567;
    }
    float _1569 = _1565;
    float _1571 = floor(_1467);
    float _1573 = _1569;
    float _1575 = _1549;
    if (_1489)
    {
        float _1577 = _1549 + (-1.0);
        _1543 = _1577;
    }
    float _1579 = _1543;
    float _1581 = _1579;
    if (_1489)
    {
        float _1583 = _1507 * _1569;
        _963 = _1583;
    }
    float _1585 = _963;
    if (!_1489)
    {
        _1509 = _1555;
    }
    float _1587 = _1509;
    float _1589 = _1587;
    if (_1489)
    {
        float _1591 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1525 = _1591;
    }
    float _1593 = _1525;
    if (_1489)
    {
        float _1595 = _1477 * _1585;
        _1559 = _1595;
    }
    float _1597 = _1559;
    if (!_1489)
    {
        _1573 = _1479;
    }
    float _1599 = _1573;
    float _1601 = _1599;
    if (_1489)
    {
        float _1603 = _1479 * _1585;
        _1601 = _1603;
    }
    float _1605 = _1601;
    if (!_1489)
    {
        _1581 = _1481;
    }
    float _1607 = _1581;
    float _1609 = _1607;
    if (_1489)
    {
        float _1611 = fma(_1555, _1549, _1593);
        _1589 = _1611;
    }
    float _1613 = _1589;
    if (_1489)
    {
        float _1615 = _1597 * _1597;
        _1609 = _1615;
    }
    float _1617 = _1609;
    if (!_1489)
    {
        _1575 = _1483;
    }
    float _1619 = _1575;
    float _1621 = _1619;
    if (_1489)
    {
        float _1623 = _1605 * _1605;
        _1621 = _1623;
    }
    float _1625 = _1621;
    float _1627 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1629 = fma(_1613, _1613, _1617);
    float _1631 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1633 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1627);
    float _1635 = _1629 + _1625;
    float _1637 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1639 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1631);
    float _1641 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1633);
    float _1643 = fma(_1139, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1645 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1637);
    float _1647 = rsqrt(_1635);
    float _1649 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1651 = fma(_1473, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1649);
    float _1653 = precise::clamp(_1651, 0.0, 1.0);
    float _1655 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1639);
    float _1657 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1645);
    float _1659 = _1641 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1661 = -_1653;
    float _1663 = _1661 + 1.0;
    float _1665 = _1657 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1667 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1669 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1671 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1673 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1675 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1677 = abs(_1663);
    float _1679 = log2(_1677);
    float _1681 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1669);
    float _1683 = -_1571;
    float _1685 = _1467 + _1683;
    float _1687 = -_1675;
    float _1689 = fma(_1687, _1673, 1.0);
    float _1691 = _1647 * _1597;
    float _1693 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1681);
    float _1695 = _1647 * _1605;
    float _1697 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1699 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1701 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1693);
    float _1703 = _1647 * _1613;
    float _1705 = floor(_1643);
    float _1707 = -_1699;
    float _1709 = fma(_1703, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1707);
    float _1711 = _1679 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1713 = -_1695;
    float _1715 = fma(_1713, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1709);
    float _1717 = log2(_1689);
    float _1719 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1721 = fma(_1715, -0.5, 0.5);
    float _1723 = fma(_1715, 0.5, 0.5);
    float _1725 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1719);
    float _1727 = exp2(_1711);
    float _1729 = -_1705;
    float _1731 = _1643 + _1729;
    float _1733 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1697);
    float _1735 = fma(_1723, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1737 = _1703 + 1.0;
    float _1739 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1725);
    float _1741 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1733);
    float _1743 = fma(_1723, _1735, -0.212114393711090087890625);
    float _1745 = 1.0 / _1701;
    float _1747 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1739);
    float _1749 = _1717 * 0.693147182464599609375;
    float _1751 = fma(_1723, _1743, 1.570728778839111328125);
    float _1753 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1755 = sqrt(_1721);
    float _1757 = -_1703;
    float _1759 = fma(_1727, _1737, _1757);
    float _1761 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1741);
    float _1763 = fma(_1759, 0.5, 0.5);
    float _1765 = _1747 * _1745;
    float _1767 = _1761 * _1745;
    float _1769 = fma(_1765, 0.5, 0.5);
    float _1771 = fma(_1767, -0.5, 0.5);
    float _1773 = _1755 * 0.636619746685028076171875;
    float2 _6502 = float2(_1685, _1731);
    float _1775 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6502, float2(0.0), isnan(_6502)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6502, float2(0.0), isnan(_6502)), level(0.0)).x;
    float _1777 = -_1751;
    float _1779 = fma(_1773, _1777, 1.0);
    float3 _6518 = float3(_1769, _1771, _1753);
    float _1781 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6518, float3(0.0), isnan(_6518)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6518, float3(0.0), isnan(_6518)), level(0.0)).x;
    float3 _6529 = float3(_1769, _1771, _1753);
    float4 _1784 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6529, float3(0.0), isnan(_6529)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6529, float3(0.0), isnan(_6529)), level(0.0)).xyzw;
    float _1786 = _1784.x;
    float _1788 = _1784.y;
    float _1790 = _1784.z;
    float _1792 = _1784.w;
    float2 _6545 = float2(_1779, _1763);
    float3 _1796 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6545, float2(0.0), isnan(_6545)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6545, float2(0.0), isnan(_6545)), level(0.0)).xyz;
    float _1798 = _1796.x;
    float _1800 = _1796.y;
    float _1802 = _1796.z;
    float _1804 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1806 = int(_1804);
    int _1808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1810 = _1808 != 0;
    float _1812 = _1679 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1816 = _1814 != 0;
    float _1818 = -_953;
    float _1820 = _1818 + 1.0;
    int _1822 = abs(_791);
    float _1824 = -_949;
    float _1826 = _1824 + 1.0;
    int _1828 = abs(_1205);
    float _1830 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1832 = int(_1830);
    out.m_66.x = _1447;
    out.m_66.y = _1445;
    out.m_66.z = _1449;
    float _1834 = 0.0;
    float _1836 = _1701;
    if (_1810)
    {
        float _1838 = in.m_58.x;
        _1834 = _1838;
    }
    float _1840 = _1834;
    float _1842 = float(uint(_1806));
    float _1844 = trunc(_907);
    int _1846 = int(_1844);
    float _1848 = _1840;
    if (!_1810)
    {
        float _1850 = in.m_58.y;
        _1848 = _1850;
    }
    float _1852 = _1848;
    bool _1854 = _1806 == 0;
    float _1856 = float(uint(_1832));
    float _1858 = 1.0 / _1842;
    float _1860 = float(uint(_1846));
    float _1862 = 1.0 / _1856;
    int _1864 = as_type<int>(_1858) + (-2);
    float _1866 = trunc(_943);
    int _1868 = int(_1866);
    int _1870 = ~_1806;
    int _1872 = _1870 + 1;
    float _1874 = as_type<float>(_1864) * _1860;
    float _1876 = trunc(_1874);
    float _1878 = precise::max(_1876, 0.0);
    uint _1881 = uint(_1878);
    int _1883 = as_type<int>(_1862) + (-2);
    float _1885 = float(uint(_1868));
    float _1887 = exp2(_1812);
    float _1889 = _1874;
    if (_1810)
    {
        _1889 = 1.0;
    }
    float _1891 = _1889;
    float _1893 = _1891;
    if (!_1810)
    {
        _1893 = 1.2345600128173828125;
    }
    float _1895 = _1893;
    float _1897 = as_type<float>(_1883) * _1885;
    int _1899 = ~_1832;
    int _1901 = _1899 + 1;
    int _1903 = _1872 * int(_1881);
    int _1905 = _1903 + _1846;
    float _1907 = _1895 * _1852;
    int _1909 = ~_1806;
    int _1911 = _1909 + 1;
    float _1913 = trunc(_1897);
    float _1915 = precise::max(_1913, 0.0);
    uint _1917 = uint(_1915);
    float _1919 = float(uint(_1905));
    float _1921 = as_type<float>(_1905);
    if (_1810)
    {
        _1921 = 1.0;
    }
    float _1923 = _1921;
    float _1925 = _1923;
    if (!_1810)
    {
        _1925 = 7.345489978790283203125;
    }
    float _1927 = _1925;
    float _1929 = as_type<float>(_1864) * _1919;
    float _1931 = -_1887;
    float _1933 = _1931 + 1.0;
    float _1935 = _1927 * _573;
    float _1937 = trunc(_1929);
    float _1939 = precise::max(_1937, 0.0);
    uint _1941 = uint(_1939);
    int _1943 = _1901 * int(_1917);
    int _1945 = _1943 + _1868;
    float _1947 = float(uint(_1945));
    float _1949 = floor(_1935);
    float _1951 = as_type<float>(_1883) * _1947;
    float _1953 = float(_1846);
    int _1955 = int(_1881) + int(_1941);
    float _1957 = floor(_1907);
    float _1959 = float(_1806);
    int _1961 = _1911 * _1955;
    int _1963 = _1961 + _1846;
    bool _1965 = _1953 >= _1959;
    bool _1967 = isnan(_1953);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan(_1959);
    bool _1973 = _1969 || _1971;
    float _1975 = float(_1973);
    float _1977 = trunc(_1951);
    float _1979 = precise::max(_1977, 0.0);
    uint _1981 = uint(_1979);
    float _1983 = -_1949;
    float _1985 = _1935 + _1983;
    float _1987 = float(_1832);
    float _1989 = _1959 * _933;
    bool _1991 = uint(_1963) >= uint(_1806);
    float _1993 = _1987 * _933;
    float _1995 = trunc(_1975);
    int _1997 = int(_1995);
    bool _1999 = !_1991;
    int _2001 = _1999 ? 0 : (-1);
    float _2003 = -_1957;
    float _2005 = _1907 + _2003;
    int _2007 = ~_1955;
    int _2009 = _2007 + _2001;
    int _2011 = _2009 + 1;
    float _2013 = _1985 * _1959;
    int _2015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2017 = _2015 != 0;
    float _2019 = trunc(_1989);
    int _2021 = int(_2019);
    int _2023 = int(_1917) + int(_1981);
    int _2025 = _1806 * _2011;
    int _2027 = _2025 + _1846;
    int _2029 = ~_1832;
    int _2031 = _2029 + 1;
    float _2033 = _2005 * _1987;
    float _2035 = float(_1868);
    bool _2037 = !_1854;
    int _2039 = _2037 ? _2027 : (-1);
    int _2041 = _2031 * _2023;
    int _2043 = _2041 + _1868;
    int _2045 = ~_1997;
    int _2047 = _2045 + 1;
    int _2049 = _2047 + 1;
    float _2051 = trunc(_2013);
    int _2053 = int(_2051);
    bool _2055 = _2035 >= _1987;
    bool _2057 = isnan(_2035);
    bool _2059 = _2055 || _2057;
    bool _2061 = isnan(_1987);
    bool _2063 = _2059 || _2061;
    float _2065 = float(_2063);
    bool _2067 = uint(_2043) >= uint(_1832);
    int _2069 = _2039 * _2049;
    bool _2071 = !_2017;
    int _2073 = _2071 ? 0 : 1;
    int _2075 = _1806 + (-1);
    float _2077 = trunc(_2065);
    int _2079 = int(_2077);
    int _2081 = abs(_2073);
    int _2083 = _1997 * _2075;
    int _2085 = _2083 + _2069;
    bool _2087 = !_2067;
    int _2089 = _2087 ? 0 : (-1);
    int _2091 = _2085 * _1822;
    bool _2093 = _1832 == 0;
    int _2095 = _2053 * _2081;
    int _2097 = _2095 + _1846;
    int _2099 = ~_2023;
    int _2101 = _2099 + _2089;
    int _2103 = _2101 + 1;
    float _2105 = trunc(_1993);
    int _2107 = int(_2105);
    int _2109 = abs(_795);
    bool _2111 = !_1816;
    int _2113 = _2111 ? 0 : 1;
    int _2115 = _1832 * _2103;
    int _2117 = _2115 + _1868;
    int _2119 = abs(_799);
    int _2121 = _2021 * _2109;
    int _2123 = _2121 + _2091;
    int _2125 = ~_2079;
    int _2127 = _2125 + 1;
    int _2129 = _2127 + 1;
    float _2131 = trunc(_2033);
    int _2133 = int(_2131);
    bool _2135 = !_2093;
    int _2137 = _2135 ? _2117 : (-1);
    int _2139 = _2097 * _2119;
    int _2141 = _2139 + _2123;
    int _2143 = abs(_2113);
    float _2145 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2149 = _2147 != 0;
    int _2151 = _2137 * _2129;
    bool _2153 = !_2149;
    int _2155 = _2153 ? 0 : 1;
    int _2157 = _1832 + (-1);
    int _2159 = _2053 * _2143;
    int _2161 = _2159 + _2141;
    int _2163 = abs(_2155);
    float _2165 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2167 = abs(_1209);
    int _2169 = _2079 * _2157;
    int _2171 = _2169 + _2151;
    float _2173 = float(uint(_2161));
    int _2175 = _2171 * _1828;
    float _2177 = as_type<float>(_1864) * _2173;
    int _2179 = abs(_1213);
    int _2181 = _2133 * _2163;
    int _2183 = _2181 + _1868;
    int _2185 = ~_1806;
    int _2187 = _2185 + 1;
    int _2189 = _2107 * _2167;
    int _2191 = _2189 + _2175;
    int _2193 = abs(_1217);
    float _2195 = trunc(_2177);
    float _2197 = precise::max(_2195, 0.0);
    uint _2199 = uint(_2197);
    int _2201 = _2183 * _2179;
    int _2203 = _2201 + _2191;
    float _2205 = float(uint(_2097));
    int _2207 = ~_1832;
    int _2209 = _2207 + 1;
    int _2211 = _2133 * _2193;
    int _2213 = _2211 + _2203;
    float _2215 = as_type<float>(_1864) * _2205;
    float _2217 = float(uint(_2213));
    float _2219 = trunc(_2215);
    float _2221 = precise::max(_2219, 0.0);
    uint _2223 = uint(_2221);
    int _2225 = _2187 * int(_2199);
    int _2227 = _2225 + _2161;
    float _2229 = as_type<float>(_1883) * _2217;
    float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2233 = _2231 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2235 = float(uint(_2227));
    float _2237 = trunc(_2229);
    float _2239 = precise::max(_2237, 0.0);
    uint _2241 = uint(_2239);
    float _2243 = as_type<float>(_1864) * _2235;
    int _2245 = _2187 * int(_2223);
    int _2247 = _2245 + _2097;
    float _2249 = trunc(_2243);
    float _2251 = precise::max(_2249, 0.0);
    uint _2253 = uint(_2251);
    float _2255 = float(uint(_2247));
    int _2257 = _2209 * int(_2241);
    int _2259 = _2257 + _2213;
    float _2261 = 1.0 / _2233;
    float _2263 = as_type<float>(_1864) * _2255;
    int _2265 = ~_1806;
    int _2267 = _2265 + 1;
    float _2269 = float(uint(_2259));
    float _2271 = float(uint(_2183));
    int _2273 = int(_2199) + int(_2253);
    float _2275 = as_type<float>(_1883) * _2269;
    float _2277 = trunc(_2263);
    float _2279 = precise::max(_2277, 0.0);
    uint _2281 = uint(_2279);
    float _2283 = as_type<float>(_1883) * _2271;
    int _2285 = ~_1832;
    int _2287 = _2285 + 1;
    int _2289 = _2267 * _2273;
    int _2291 = _2289 + _2161;
    float _2293 = trunc(_2275);
    float _2295 = precise::max(_2293, 0.0);
    uint _2297 = uint(_2295);
    bool _2299 = uint(_2291) >= uint(_1806);
    int _2301 = ~_1832;
    int _2303 = _2301 + 1;
    bool _2305 = !_2299;
    int _2307 = _2305 ? 0 : (-1);
    float _2309 = trunc(_2283);
    float _2311 = precise::max(_2309, 0.0);
    uint _2313 = uint(_2311);
    int _2315 = int(_2223) + int(_2281);
    int _2317 = ~_2273;
    int _2319 = _2317 + _2307;
    int _2321 = _2319 + 1;
    int _2323 = ~_1806;
    int _2325 = _2323 + 1;
    int _2327 = int(_2241) + int(_2297);
    int _2329 = _1806 * _2321;
    int _2331 = _2329 + _2161;
    int _2333 = _2325 * _2315;
    int _2335 = _2333 + _2097;
    int _2337 = _2287 * _2327;
    int _2339 = _2337 + _2213;
    bool _2341 = !_1854;
    int _2343 = _2341 ? _2331 : (-1);
    bool _2345 = uint(_2335) >= uint(_1806);
    bool _2347 = uint(_2339) >= uint(_1832);
    int _2349 = _2303 * int(_2313);
    int _2351 = _2349 + _2183;
    int _2353 = _2343 & 3;
    bool _2355 = _2353 != 0;
    int _2357 = _2343 & 3;
    bool _2359 = _2357 != 0;
    float _2361 = float(uint(_2351));
    bool _2363 = !_2347;
    int _2365 = _2363 ? 0 : (-1);
    int _2367 = _2355 ? 0 : 1;
    bool _2369 = !_2345;
    int _2371 = _2369 ? 0 : (-1);
    bool _2373 = _2357 != 3;
    float _2375 = -_1775;
    float _2377 = _2375 + 1.0;
    int _2379 = ~_2327;
    int _2381 = _2379 + _2365;
    int _2383 = _2381 + 1;
    bool _2385 = uint(_2357) >= 2u;
    bool _2387 = _579 > 0.5;
    float _2389 = as_type<float>(_1883) * _2361;
    int _2391 = ~_2315;
    int _2393 = _2391 + _2371;
    int _2395 = _2393 + 1;
    int _2397 = _1832 * _2383;
    int _2399 = _2397 + _2213;
    int _2401 = _2385 ? 0 : 1;
    bool _2403 = uint(_2357) > 1u;
    int _2405 = _1806 * _2395;
    int _2407 = _2405 + _2097;
    bool _2409 = !_2093;
    int _2411 = _2409 ? _2399 : (-1);
    float _2413 = trunc(_2389);
    float _2415 = precise::max(_2413, 0.0);
    uint _2417 = uint(_2415);
    int _2419 = ~_2401;
    int _2421 = _2419 + 1;
    int _2423 = _2421 + 1;
    int _2425 = _2423;
    if (_2373)
    {
        int _2427 = ~_2401;
        int _2429 = _2427 + 1;
        _2425 = _2429;
    }
    int _2431 = _2425;
    int _2433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2435 = _2433 != 0;
    bool _2437 = !_1854;
    int _2439 = _2437 ? _2407 : (-1);
    int _2441 = _2411 & 3;
    bool _2443 = _2441 != 0;
    bool _2445 = !_2435;
    int _2447 = _2445 ? 0 : 1;
    bool _2449 = uint(_2441) > 1u;
    bool _2451 = !_2359;
    int _2453 = _2451 ? 0 : 1;
    int _2455 = ~_2367;
    int _2457 = _2455 + 1;
    int _2459 = _2457 + 1;
    int _2461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2463 = _2461 != 0;
    int _2465 = _2411 & 3;
    bool _2467 = _2465 != 0;
    int _2469 = _2459;
    if (!_2403)
    {
        int _2471 = ~_2367;
        int _2473 = _2471 + 1;
        _2469 = _2473;
    }
    int _2475 = _2469;
    int _2477 = _2343 >> 31;
    bool _2479 = !_2463;
    int _2481 = _2479 ? 0 : 1;
    int _2483 = _2467 ? 0 : 1;
    int _2485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2487 = _2485 != 0;
    int _2489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2491 = _2489 != 0;
    int _2493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2495 = _2493 != 0;
    int _2497 = _2477 & 3;
    bool _2499 = !_2443;
    int _2501 = _2499 ? 0 : 1;
    bool _2503 = _2357 != 3;
    int _2505 = ~_2483;
    int _2507 = _2505 + 1;
    int _2509 = _2507 + 1;
    int _2511 = _2343 + _2497;
    int _2513 = _2509;
    if (!_2449)
    {
        int _2515 = ~_2483;
        int _2517 = _2515 + 1;
        _2513 = _2517;
    }
    int _2519 = _2513;
    int _2521 = _2411 >> 31;
    bool _2523 = !_2503;
    int _2525 = _2523 ? 0 : (-1);
    bool _2527 = uint(_2441) >= 2u;
    bool _2529 = _2441 != 3;
    int _2531 = int(_2313) + int(_2417);
    int _2533 = _2521 & 3;
    int _2535 = _2527 ? 0 : 1;
    int _2537 = ~_1832;
    int _2539 = _2537 + 1;
    bool _2541 = _2441 != 3;
    int _2543 = _2411 + _2533;
    int _2545 = _2539 * _2531;
    int _2547 = _2545 + _2183;
    bool _2549 = !_2541;
    int _2551 = _2549 ? 0 : (-1);
    bool _2553 = _573 > 0.5;
    int _2555 = _2543 >> 2;
    int _2557 = ~_2535;
    int _2559 = _2557 + 1;
    int _2561 = _2559 + 1;
    float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2565 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2563;
    int _2567 = _2561;
    if (_2529)
    {
        int _2569 = ~_2535;
        int _2571 = _2569 + 1;
        _2567 = _2571;
    }
    int _2573 = _2567;
    float _2575 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2145);
    int _2577 = _2511 >> 2;
    float _2579 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2165);
    bool _2581 = uint(_2547) >= uint(_1832);
    float _2583 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2575);
    int _2585 = _2555 << 4;
    int _2587 = _2585 + 512;
    int _2589 = _2577 << 4;
    int _2591 = _2589 + 368;
    float _2593 = _2583 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _2595 = !_2581;
    int _2597 = _2595 ? 0 : (-1);
    uint _2599 = uint(int(uint(_2587) >> uint(2)));
    uint _2601 = uint(int(uint(int(_2599)) >> uint(2)));
    int _2603 = int(_2599) & 3;
    float _2605 = (*spvDescriptorSet0.vp_c9)._m0[int(_2601)][_2603];
    int _2607 = int(_2599) + 1;
    uint _2609 = uint(int(uint(_2607) >> uint(2)));
    int _2611 = _2607 & 3;
    float _2613 = (*spvDescriptorSet0.vp_c9)._m0[int(_2609)][_2611];
    bool _2615 = _571 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2617 = isnan(_571);
    bool _2619 = _2615 || _2617;
    bool _2621 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2623 = _2619 || _2621;
    float _2625 = float(_2623);
    int _2627 = ~_2531;
    int _2629 = _2627 + _2597;
    int _2631 = _2629 + 1;
    float _2633 = _2565 * _2261;
    float _2635 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2579);
    float _2637 = -_2625;
    float _2639 = _2637 + 1.0;
    int _2641 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2643 = _2641 != 0;
    uint _2645 = uint(int(uint(_2591) >> uint(2)));
    uint _2647 = uint(int(uint(int(_2645)) >> uint(2)));
    int _2649 = int(_2645) & 3;
    float _2651 = (*spvDescriptorSet0.vp_c9)._m0[int(_2647)][_2649];
    int _2653 = int(_2645) + 1;
    uint _2655 = uint(int(uint(_2653) >> uint(2)));
    int _2657 = _2653 & 3;
    float _2659 = (*spvDescriptorSet0.vp_c9)._m0[int(_2655)][_2657];
    int _2661 = _1832 * _2631;
    int _2663 = _2661 + _2183;
    float _2665 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2667 = _571 + _2665;
    float _2669 = 1.0 / _2593;
    bool _2671 = _571 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2673 = isnan(_571);
    bool _2675 = _2671 || _2673;
    bool _2677 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2679 = _2675 || _2677;
    float _2681 = float(_2679);
    float _2683 = _2635 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2685 = fma(_2633, _2667, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2687 = !_2093;
    int _2689 = _2687 ? _2663 : (-1);
    int _2691 = _2591 + 8;
    uint _2693 = uint(int(uint(_2691) >> uint(2)));
    uint _2695 = uint(int(uint(int(_2693)) >> uint(2)));
    int _2697 = int(_2693) & 3;
    float _2699 = (*spvDescriptorSet0.vp_c9)._m0[int(_2695)][_2697];
    int _2701 = int(_2693) + 1;
    uint _2703 = uint(int(uint(_2701) >> uint(2)));
    int _2705 = _2701 & 3;
    float _2707 = (*spvDescriptorSet0.vp_c9)._m0[int(_2703)][_2705];
    float _2709 = _2681 * _2639;
    float _2711 = _2683 + _2593;
    bool _2713 = _575 > 0.5;
    float _2715 = -_2681;
    float _2717 = _2715 + 1.0;
    float _2719 = _2685 * _2709;
    int _2721 = abs(_2475);
    int _2723 = _2587 + 8;
    uint _2725 = uint(int(uint(_2723) >> uint(2)));
    uint _2727 = uint(int(uint(int(_2725)) >> uint(2)));
    int _2729 = int(_2725) & 3;
    float _2731 = (*spvDescriptorSet0.vp_c9)._m0[int(_2727)][_2729];
    int _2733 = int(_2725) + 1;
    uint _2735 = uint(int(uint(_2733) >> uint(2)));
    int _2737 = _2733 & 3;
    float _2739 = (*spvDescriptorSet0.vp_c9)._m0[int(_2735)][_2737];
    float _2741 = -_189;
    int _2743 = _2553 ? as_type<int>(_2741) : as_type<int>(_189);
    float _2745 = fma(_2717, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2719);
    bool _2747 = _577 > 0.5;
    float _2749 = _2711 * _2669;
    float _2751 = _2749 * 0.5;
    int _2753 = abs(_2519);
    float _2755 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2757 = int(_2755);
    int _2759 = ~_2721;
    int _2761 = _2759 + 1;
    int _2763 = _2761 + 1;
    int _2765 = abs(_2453);
    int _2767 = abs(_2501);
    int _2769 = abs(_2573);
    float _2771 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2773 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2771);
    int _2775 = ~_2753;
    int _2777 = _2775 + 1;
    int _2779 = _2777 + 1;
    int _2781 = ~_2765;
    int _2783 = _2781 + 1;
    int _2785 = _2783 + 1;
    int _2787 = ~_2767;
    int _2789 = _2787 + 1;
    int _2791 = _2789 + 1;
    float _2793 = 1.0 / _2773;
    int _2795 = _2779 * as_type<int>(_2613);
    float _2797 = fma(_2625, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2745);
    int _2799 = abs(_2431);
    int _2801 = abs(_2525);
    int _2803 = _2763 * as_type<int>(_2659);
    int _2805 = _2791 * as_type<int>(_2605);
    int _2807 = _2805 + _2795;
    int _2809 = ~_2799;
    int _2811 = _2809 + 1;
    int _2813 = _2811 + 1;
    int _2815 = _2785 * as_type<int>(_2651);
    int _2817 = _2815 + _2803;
    int _2819 = ~_2769;
    int _2821 = _2819 + 1;
    int _2823 = _2821 + 1;
    float _2825 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2827 = int(_2825);
    int _2829 = abs(_2551);
    int _2831 = _2813 * as_type<int>(_2699);
    int _2833 = _2831 + _2817;
    float _2835 = float(uint(_2757));
    float _2837 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2839 = _2793 * _2837;
    int _2841 = ~_2801;
    int _2843 = _2841 + 1;
    int _2845 = _2843 + 1;
    int _2847 = abs(_2447);
    float _2849 = 1.0 / _2835;
    int _2851 = _2823 * as_type<int>(_2731);
    int _2853 = _2851 + _2807;
    int _2855 = ~_2829;
    int _2857 = _2855 + 1;
    int _2859 = _2857 + 1;
    int _2861 = _2845 * as_type<int>(_2707);
    int _2863 = _2861 + _2833;
    int _2865 = _2859 * as_type<int>(_2739);
    int _2867 = _2865 + _2853;
    float _2869 = abs(_2839);
    float _2871 = log2(_2869);
    int _2873 = abs(_2757);
    float _2875 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2877 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2879 = float(uint(_2873));
    float _2881 = _2875 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2883 = float(uint(_2827));
    float _2885 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2887 = abs(_2481);
    float _2889 = _2877 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2891 = ~_2847;
    int _2893 = _2891 + 1;
    int _2895 = _2893 + 1;
    float _2897 = 1.0 / _2879;
    int _2899 = ~_2887;
    int _2901 = _2899 + 1;
    int _2903 = _2901 + 1;
    float _2905 = _2885 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2907 = abs(_2827);
    float _2909 = _2871 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2911 = _2863 * _2895;
    float _2913 = _2797 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2915 = _2867 * _2903;
    float _2917 = 1.0 / _2883;
    int _2919 = _2439 * _2847;
    int _2921 = _2919 + _2911;
    out.m_68.x = _2881;
    out.m_68.y = _2889;
    out.m_68.z = _2905;
    out.m_68.w = _2913;
    int _2923 = _2689 * _2887;
    int _2925 = _2923 + _2915;
    int _2927 = as_type<int>(_2849) + (-2);
    float _2929 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2931 = float(uint(_2907));
    float _2933 = exp2(_2909);
    int _2935 = abs(_2921);
    float _2937 = -_1069;
    float _2939 = fma(_2937, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2929);
    int _2941 = as_type<int>(_2897) + (-2);
    float _2943 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2945 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2947 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2949 = 1.0 / _2931;
    float _2951 = float(uint(_2921));
    float _2953 = -_1069;
    float _2955 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2943);
    float _2957 = float(uint(_2935));
    float _2959 = -_1069;
    float _2961 = fma(_2959, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2945);
    int _2963 = as_type<int>(_2917) + (-2);
    float _2965 = as_type<float>(_2927) * _2951;
    float _2967 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2939);
    float _2969 = as_type<float>(_2941) * _2957;
    float _2971 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2973 = trunc(_2965);
    float _2975 = precise::max(_2973, 0.0);
    uint _2977 = uint(_2975);
    float _2979 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2981 = fma(_2933, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2983 = precise::clamp(_2981, 0.0, 1.0);
    float _2985 = float(uint(_2925));
    float _2987 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2971);
    int _2989 = ~_2757;
    int _2991 = _2989 + 1;
    float _2993 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2995 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2955);
    float _2997 = trunc(_2969);
    float _2999 = precise::max(_2997, 0.0);
    uint _3001 = uint(_2999);
    float _3003 = as_type<float>(_2963) * _2985;
    float _3005 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2979);
    float _3007 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2947);
    float _3009 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2961);
    int _3011 = as_type<int>(_2949) + (-2);
    float _3013 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3015 = trunc(_3003);
    float _3017 = precise::max(_3015, 0.0);
    uint _3019 = uint(_3017);
    int _3021 = abs(_2925);
    float _3023 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3025 = ~_2873;
    int _3027 = _3025 + 1;
    float _3029 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3013);
    int _3031 = ~_2827;
    int _3033 = _3031 + 1;
    float _3035 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3005);
    bool _3037 = !_2643;
    float _3039 = _3037 ? _189 : as_type<float>(_2743);
    float _3041 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3043 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2993);
    int _3045 = _2991 * int(_2977);
    int _3047 = _3045 + _2921;
    int _3049 = _3027 * int(_3001);
    int _3051 = _3049 + _2935;
    float _3053 = float(uint(_3047));
    float _3055 = float(uint(_3021));
    int _3057 = _3033 * int(_3019);
    int _3059 = _3057 + _2925;
    float _3061 = float(uint(_3051));
    float _3063 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3023);
    float _3065 = -_189;
    int _3067 = _2747 ? as_type<int>(_3065) : as_type<int>(_189);
    float _3069 = as_type<float>(_3011) * _3055;
    float _3071 = float(uint(_3059));
    float _3073 = as_type<float>(_2941) * _3061;
    float _3075 = as_type<float>(_2927) * _3053;
    float _3077 = trunc(_3069);
    float _3079 = precise::max(_3077, 0.0);
    uint _3081 = uint(_3079);
    float _3083 = -_199;
    int _3085 = _2387 ? as_type<int>(_3083) : as_type<int>(_199);
    float _3087 = as_type<float>(_2963) * _3071;
    float _3089 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2987);
    float _3091 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3007);
    bool _3093 = !_2495;
    float _3095 = _3093 ? _189 : as_type<float>(_3067);
    float _3097 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3099 = trunc(_3087);
    float _3101 = precise::max(_3099, 0.0);
    uint _3103 = uint(_3101);
    int _3105 = ~_2907;
    int _3107 = _3105 + 1;
    out.m_70.x = _3089;
    out.m_70.y = _3035;
    out.m_70.z = _3091;
    bool _3109 = !_2487;
    float _3111 = _3109 ? _199 : as_type<float>(_3085);
    float _3113 = fma(_2983, -2.0, 3.0);
    float _3115 = _2983 * _2983;
    float _3117 = -_199;
    int _3119 = _2713 ? as_type<int>(_3117) : as_type<int>(_199);
    int _3121 = _3107 * int(_3081);
    int _3123 = _3121 + _3021;
    float _3125 = trunc(_3073);
    float _3127 = precise::max(_3125, 0.0);
    uint _3129 = uint(_3127);
    float _3131 = _3115 * _3113;
    bool _3133 = !_2491;
    float _3135 = _3133 ? _199 : as_type<float>(_3119);
    float _3137 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3043);
    float _3139 = float(uint(_3123));
    float _3141 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3029);
    float _3143 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3063);
    float _3145 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3147 = trunc(_3075);
    float _3149 = precise::max(_3147, 0.0);
    uint _3151 = uint(_3149);
    float _3153 = as_type<float>(_3011) * _3139;
    float _3155 = _3041 * _3009;
    int _3157 = int(_3019) + int(_3103);
    float _3159 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3145);
    int _3161 = ~_2873;
    int _3163 = _3161 + 1;
    float _3165 = fma(_3097, _3091, _3155);
    int _3167 = ~_2827;
    int _3169 = _3167 + 1;
    float _3171 = trunc(_3153);
    float _3173 = precise::max(_3171, 0.0);
    uint _3175 = uint(_3173);
    int _3177 = int(_3001) + int(_3129);
    float _3179 = _3041 * _2967;
    int _3181 = ~_2907;
    int _3183 = _3181 + 1;
    int _3185 = _3169 * _3157;
    int _3187 = _3185 + _2925;
    float _3189 = _3041 * _2995;
    int _3191 = _3163 * _3177;
    int _3193 = _3191 + _2935;
    float _3195 = fma(_3097, _3089, _3179);
    int _3197 = int(_2977) + int(_3151);
    float _3199 = fma(_3097, _3035, _3189);
    bool _3201 = uint(_3187) >= uint(_2827);
    float _3203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3205 = ~_2757;
    int _3207 = _3205 + 1;
    float _3209 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3159);
    bool _3211 = uint(_3193) >= uint(_2873);
    float _3213 = -_3131;
    float _3215 = _3213 + 1.0;
    int _3217 = int(_3081) + int(_3175);
    int _3219 = _3207 * _3197;
    int _3221 = _3219 + _2921;
    bool _3223 = !_3201;
    int _3225 = _3223 ? 0 : (-1);
    float _3227 = fma(_3215, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3131);
    bool _3229 = _2827 == 0;
    int _3231 = _3183 * _3217;
    int _3233 = _3231 + _3021;
    int _3235 = ~_3157;
    int _3237 = _3235 + _3225;
    int _3239 = _3237 + 1;
    float _3241 = _3137 + _3195;
    int _3243 = _2921 ^ _2757;
    bool _3245 = uint(_3221) >= uint(_2757);
    int _3247 = _2827 * _3239;
    int _3249 = _3247 + _2925;
    bool _3251 = uint(_3233) >= uint(_2907);
    float _3253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3255 = !_3211;
    int _3257 = _3255 ? 0 : (-1);
    uint _3259 = uint(int(uint(_3243) >> uint(31)));
    bool _3261 = !_3245;
    int _3263 = _3261 ? 0 : (-1);
    int _3265 = ~_3257;
    int _3267 = _3177 + _3265;
    int _3269 = _3267 + 1;
    int _3271 = ~int(_3259);
    int _3273 = _3271 + 1;
    float _3275 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3277 = ~_3197;
    int _3279 = _3277 + _3263;
    int _3281 = _3279 + 1;
    int _3283 = _2925 ^ _2827;
    float _3285 = _3143 + _3165;
    int _3287 = _3269 ^ _3273;
    int _3289 = _2757 * _3281;
    int _3291 = _3289 + _2921;
    bool _3293 = _2827 == 0;
    float _3295 = _3203 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3297 = !_3251;
    int _3299 = _3297 ? 0 : (-1);
    float _3301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3303 = uint(int(uint(_3283) >> uint(31)));
    int _3305 = ~_3273;
    int _3307 = _3305 + _3287;
    int _3309 = _3307 + 1;
    float _3311 = fma(_3041, _3041, 1.0);
    bool _3313 = _2757 == 0;
    int _3315 = ~_3299;
    int _3317 = _3217 + _3315;
    int _3319 = _3317 + 1;
    float _3321 = _3141 + _3199;
    int _3323 = ~int(_3303);
    int _3325 = _3323 + 1;
    float _3327 = rsqrt(_3311);
    bool _3329 = _2757 == 0;
    bool _3331 = !_3313;
    int _3333 = _3331 ? _3291 : (-1);
    out.m_72.x = _3241;
    out.m_72.y = _3321;
    out.m_72.z = _3285;
    int _3335 = _3319 ^ _3325;
    float _3337 = _3301 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3339 = !_3229;
    int _3341 = _3339 ? _3249 : (-1);
    float _3343 = float(_3333);
    bool _3345 = !_3329;
    int _3347 = _3345 ? _3309 : (-1);
    int _3349 = ~_3325;
    int _3351 = _3349 + _3335;
    int _3353 = _3351 + 1;
    float _3355 = fma(_3295, _3343, _659);
    float _3357 = float(_3341);
    float _3359 = _3039 + 0.5;
    float _3361 = float(_3347);
    float _3363 = _3253 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3365 = !_3293;
    int _3367 = _3365 ? _3353 : (-1);
    float _3369 = fma(_3295, _3359, _3355);
    float _3371 = _3275 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3373 = fma(_3337, _3357, _959);
    float _3375 = float(_3367);
    float _3377 = -_625;
    float _3379 = fma(_3363, _3361, _3377);
    float _3381 = _3095 + 0.5;
    float _3383 = _3135 + (-0.5);
    float _3385 = _3041 * _3327;
    float _3387 = -_961;
    float _3389 = fma(_3371, _3375, _3387);
    float _3391 = fma(_3337, _3381, _3373);
    float _3393 = -_3363;
    float _3395 = fma(_3393, _3383, _3379);
    float _3397 = _3111 + (-0.5);
    float _3399 = -_951;
    float _3401 = _3399 + 1.0;
    float _3403 = -_3141;
    float _3405 = _3385 * _3403;
    float _3407 = -_3137;
    float _3409 = _3385 * _3407;
    float _3411 = -_3371;
    float _3413 = fma(_3411, _3397, _3389);
    float _3415 = -_3401;
    float _3417 = fma(_3095, _3415, _3391);
    float _3419 = fma(_3327, _2995, _3405);
    float _3421 = in.m_74.x;
    float _3423 = -_939;
    float _3425 = _3423 + 1.0;
    float _3427 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3209);
    bool _3429 = _2839 <= 8000.0;
    bool _3431 = isnan(_2839);
    bool _3433 = _3429 || _3431;
    bool _3435 = isnan(8000.0);
    bool _3437 = _3433 || _3435;
    float _3439 = float(_3437);
    float _3441 = -_3143;
    float _3443 = _3385 * _3441;
    float _3445 = fma(_3327, _2967, _3409);
    float _3447 = fma(_3111, _1820, _3413);
    float _3449 = -_3425;
    float _3451 = fma(_3039, _3449, _3369);
    float _3453 = _3439 * _3227;
    float _3455 = fma(_3327, _3009, _3443);
    float _3457 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3459 = fma(_3135, _1826, _3395);
    float _3461 = _3453 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3463 = _3427 + _1701;
    out.m_76.x = _3445;
    out.m_76.y = _3419;
    out.m_76.z = _3455;
    float _3465 = _2377 * _3461;
    float _3467 = precise::clamp(_3465, 0.0, 1.0);
    float _3469 = _3457 * _1781;
    float _3471 = _3463 * 0.5;
    out.gl_Position.x = _1747;
    out.gl_Position.y = _1761;
    out.gl_Position.z = _3427;
    out.gl_Position.w = _1701;
    bool _3473 = _1473 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3475 = isnan(_1473);
    bool _3477 = _3473 || _3475;
    bool _3479 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3481 = _3477 || _3479;
    out.m_78.x = _3451;
    out.m_78.y = _3459;
    out.m_78.z = _3417;
    out.m_78.w = _3447;
    float _3483 = _1802 * _3469;
    out.m_80.z = _3471;
    out.m_80.w = _1701;
    float _3485 = -_3467;
    float _3487 = fma(_3485, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3489 = _1792 * _3469;
    float _3491 = _3487 * _3421;
    float _3493 = -_3457;
    float _3495 = _3493 + 1.0;
    float _3497 = _3445;
    float _3499 = _3427;
    float _3501 = _3489;
    float _3503 = _3495;
    float _3505 = _3457;
    if (!_3481)
    {
        _3497 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3507 = _3497;
    float _3509 = fma(_1798, _3489, _1786);
    float _3511 = fma(_1800, _3489, _1788);
    float _3513 = _3491 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3515 = _1792 * _3495;
    float _3517 = fma(_1792, _3483, _1790);
    float _3519 = _3507;
    float _3521 = _3507;
    if (!_3481)
    {
        _1836 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3523 = _1836;
    out.m_82.x = _3513;
    float _3525 = _3523;
    float _3527 = _3523;
    if (!_3481)
    {
        _3499 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3529 = _3499;
    float _3531 = _3529;
    float _3533 = _3529;
    if (!_3481)
    {
        _3501 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3535 = _3501;
    out.m_84.x = _3509;
    out.m_84.y = _3511;
    out.m_84.z = _3517;
    out.m_84.w = _3515;
    float _3537 = _3535;
    float _3539 = _3535;
    if (!_3481)
    {
        _3503 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3541 = _3503;
    float _3543 = _3541;
    float _3545 = _3541;
    if (!_3481)
    {
        _3505 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3547 = _3505;
    bool _3549 = !_3481;
    float _3551 = _3547;
    float _3553 = _3547;
    if (!_3549)
    {
        bool _3555 = _1473 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3557 = isnan(_1473);
        bool _3559 = _3555 || _3557;
        bool _3561 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3563 = _3559 || _3561;
        if (!_3563)
        {
            float _3565 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3567 = _1473 + _3565;
            float _3569 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3571 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3569;
            float _3573 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3575 = _3573 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3577 = 1.0 / _3571;
            float _3579 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3581 = _3579 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3583 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3585 = _3583 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3587 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3589 = _3587 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3591 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3593 = _3591 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3595 = _3567 * _3577;
            float _3597 = precise::clamp(_3595, 0.0, 1.0);
            float _3599 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3601 = _3599 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3603 = fma(_3597, _3575, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3605 = fma(_3597, _3601, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3607 = fma(_3597, _3581, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3609 = fma(_3597, _3585, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3611 = fma(_3597, _3589, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3613 = fma(_3597, _3593, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3527 = _3607;
            _3545 = _3611;
            _3521 = _3603;
            _3539 = _3609;
            _3533 = _3605;
            _3553 = _3613;
            _3615 = true;
        }
        else
        {
            bool _3617 = _1473 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3619 = isnan(_1473);
            bool _3621 = _3617 || _3619;
            bool _3623 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3625 = _3621 || _3623;
            if (!_3625)
            {
                _3519 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3627 = _3519;
            _3521 = _3627;
            if (!_3625)
            {
                _3525 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3629 = _3525;
            _3527 = _3629;
            if (!_3625)
            {
                _3531 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3631 = _3531;
            _3533 = _3631;
            if (!_3625)
            {
                _3537 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3633 = _3537;
            _3539 = _3633;
            if (!_3625)
            {
                _3543 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3635 = _3543;
            _3545 = _3635;
            if (!_3625)
            {
                _3551 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3637 = _3551;
            bool _3639 = !_3625;
            _3553 = _3637;
            if (!_3639)
            {
                bool _3641 = _1473 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3643 = isnan(_1473);
                bool _3645 = _3641 || _3643;
                bool _3647 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3649 = _3645 || _3647;
                if (!_3649)
                {
                    float _3651 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3653 = _1473 + _3651;
                    float _3655 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3657 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3655;
                    float _3659 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3661 = _3659 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3663 = 1.0 / _3657;
                    float _3665 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3667 = _3665 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3669 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3671 = _3669 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3673 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3675 = _3673 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3677 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3679 = _3677 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3681 = _3653 * _3663;
                    float _3683 = precise::clamp(_3681, 0.0, 1.0);
                    float _3685 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3687 = _3685 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3689 = fma(_3683, _3661, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3691 = fma(_3683, _3687, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3693 = fma(_3683, _3667, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3695 = fma(_3683, _3671, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3697 = fma(_3683, _3675, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3699 = fma(_3683, _3679, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3527 = _3693;
                    _3545 = _3697;
                    _3521 = _3689;
                    _3539 = _3695;
                    _3533 = _3691;
                    _3553 = _3699;
                    _3615 = true;
                }
                else
                {
                    _3527 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3545 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3521 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3539 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3533 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3553 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3615 = false;
    float _3701 = _3527;
    float _3703 = _3545;
    float _3705 = _3521;
    float _3707 = _3539;
    float _3709 = _3533;
    float _3711 = _3553;
    float _3713 = fma(_3321, -0.5, 0.5);
    float _3715 = precise::clamp(_3713, 0.0, 1.0);
    float _3717 = -_3701;
    float _3719 = _3717 + _3703;
    float _3721 = -_3705;
    float _3723 = _3721 + _3707;
    float _3725 = -_3709;
    float _3727 = _3725 + _3711;
    bool _3729 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3731 = fma(_3715, _3719, _3701);
    float _3733 = fma(_3715, _3723, _3705);
    float _3735 = fma(_3715, _3727, _3709);
    float _3737 = _3731 * 0.586610972881317138671875;
    out.m_86.x = 0.0;
    float _3739 = fma(_3733, 0.298911988735198974609375, _3737);
    float _3741 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3743 = fma(_3735, 0.114477999508380889892578125, _3739);
    out.m_49.x = _3741;
    float _3745 = -_3743;
    float _3747 = _3733 + _3745;
    float _3749 = -_3743;
    float _3751 = _3731 + _3749;
    float _3753 = -_3743;
    float _3755 = _3735 + _3753;
    float _3757 = fma(_3747, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3743);
    float _3759 = fma(_3751, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3743);
    float _3761 = fma(_3755, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3743);
    out.m_88.x = _3757;
    out.m_88.y = _3759;
    out.m_88.z = _3761;
    if (!_3729)
    {
        return out;
    }
    float _3763 = -_1445;
    float _3765 = _3763 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3767 = -_1447;
    float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3771 = -_1449;
    float _3773 = _3771 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3775 = _3765 * _3765;
    float _3777 = fma(_3769, _3769, _3775);
    float _3779 = fma(_3773, _3773, _3777);
    float _3781 = sqrt(_3779);
    float _3783 = rsqrt(_3779);
    float _3785 = -_3781;
    float _3787 = _3785 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3789 = _3787 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3791 = precise::clamp(_3789, 0.0, 1.0);
    float _3793 = _3769 * _3783;
    float _3795 = _3765 * _3783;
    float _3797 = abs(_3791);
    float _3799 = log2(_3797);
    float _3801 = _3773 * _3783;
    float _3803 = _3793 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3805 = _3321 * _3795;
    float _3807 = -_3795;
    float _3809 = -_3803;
    float _3811 = fma(_3807, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3809);
    float _3813 = fma(_3241, _3793, _3805);
    float _3815 = -_3801;
    float _3817 = fma(_3815, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3811);
    float _3819 = fma(_3285, _3801, _3813);
    float _3821 = precise::clamp(_3819, 0.0, 1.0);
    float _3823 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3825 = _3817 + _3823;
    float _3827 = _3799 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3829 = _3825 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3831 = precise::clamp(_3829, 0.0, 1.0);
    float _3833 = exp2(_3827);
    float _3835 = _3833 * _3831;
    float _3837 = _3821 * _3835;
    float _3839 = _3837 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3841 = _3837 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3843 = _3837 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3839;
    out.m_86.y = _3841;
    out.m_86.z = _3843;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3615 = false;
    bool _563 = false;
    bool _375 = false;
    bool _227 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3900 = as_type<float>(_123);
        out.gl_Position.z = _3900;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_51.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = _141;
    if (_137)
    {
        float _147 = float(_107);
        _143 = _147;
    }
    float _149 = _143;
    bool _151 = _141 >= _149;
    bool _153 = !_137;
    bool _155 = _151 || _153;
    if (_155)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _117;
    if (_155)
    {
        out.m_49.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3969 = as_type<float>(_161);
        out.gl_Position.z = _3969;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = in.m_56.x;
    float _167 = in.m_56.y;
    float _169 = in.m_56.z;
    int _171 = as_type<int>(_163) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_163) & 2;
    bool _177 = _175 != 0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = _167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _183 = _167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = _167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _187 = !_173;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _193 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    bool _197 = !_177;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _203 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _205 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    bool _207 = !_179;
    float _225;
    if (!_207)
    {
        float _209 = in.m_58.x;
        float _211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _217 = _215 * _211;
        float _219 = floor(_217);
        float _221 = -_219;
        float _223 = _217 + _221;
        _225 = _223;
        _227 = true;
    }
    else
    {
        float _229 = float(_107);
        float _231 = 1.0 / _229;
        float _233 = _141 * _231;
        _225 = _233;
    }
    _227 = false;
    float _235 = _225;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    bool _241 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _243 = isnan(_235);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    bool _253 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _255 = isnan(_235);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = -_251;
    float _275 = _273 + 1.0;
    float _277 = 1.0 / _267;
    bool _279 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _281 = isnan(_235);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = _263 * _275;
    float _293 = -_263;
    float _295 = _293 + 1.0;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _299 = _289 * _295;
    float _301 = 1.0 / _271;
    float _303 = -_289;
    float _305 = _303 + 1.0;
    float _307 = _239 * _277;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _235 + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _317;
    float _321 = fma(_315, _307, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = fma(_319, _307, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = _311 * _301;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _331 = _321 * _299;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _337 = _323 * _299;
    float _339 = fma(_329, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _341 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].x, _331);
    float _343 = fma(_335, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _345 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].y, _337);
    float _347 = fma(_339, _291, _341);
    float _349 = fma(_343, _291, _345);
    float _351 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[145].x, _347);
    float _353 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[145].y, _349);
    bool _355 = !_297;
    float _373;
    if (!_355)
    {
        float _357 = in.m_58.x;
        float _359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _361 = _357 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _363 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _365 = _363 * _359;
        float _367 = floor(_365);
        float _369 = -_367;
        float _371 = _365 + _369;
        _373 = _371;
        _375 = true;
    }
    else
    {
        float _377 = float(_107);
        float _379 = 1.0 / _377;
        float _381 = _141 * _379;
        _373 = _381;
    }
    _375 = false;
    float _383 = _373;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _387 = _383 + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _397 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _399 = isnan(_383);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _413 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _415 = isnan(_383);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = 1.0 / _391;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _427;
    float _431 = -_407;
    float _433 = _431 + 1.0;
    bool _435 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _437 = isnan(_383);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _449 = 1.0 / _395;
    float _451 = 1.0 / _411;
    float _453 = _429 * _425;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _459 = _423 * _433;
    float _461 = -_423;
    float _463 = _461 + 1.0;
    float _465 = fma(_453, _387, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _467 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _469 = isnan(_383);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = _445 * _463;
    float _481 = _457 * _449;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _489 = _383 + _487;
    float _491 = _465 * _479;
    float _493 = -_445;
    float _495 = _493 + 1.0;
    float _497 = -_477;
    float _499 = _497 + 1.0;
    float _501 = fma(_481, _489, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _503 = _485 * _451;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _507 = _383 + _505;
    float _509 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[115].x, _491);
    float _511 = _407 * _499;
    float _513 = fma(_503, _507, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _515 = fma(_501, _459, _509);
    float _517 = in.m_60.x;
    float _519 = in.m_60.y;
    float _521 = fma(_513, _511, _515);
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _527 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[118].x, _521);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _531 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _533 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _535 = _527 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _537 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _531;
    out.m_62.y = _533;
    out.m_62.z = _537;
    out.m_62.w = _535;
    float _539 = _353 * _519;
    float _541 = _351 * _517;
    bool _543 = !_447;
    float _561;
    if (!_543)
    {
        float _545 = in.m_58.x;
        float _547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _549 = _545 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _551 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _553 = _551 * _547;
        float _555 = floor(_553);
        float _557 = -_555;
        float _559 = _553 + _557;
        _561 = _559;
        _563 = true;
    }
    else
    {
        float _565 = float(_107);
        float _567 = 1.0 / _565;
        float _569 = _141 * _567;
        _561 = _569;
    }
    _563 = false;
    float _571 = _561;
    float _573 = in.m_58.x;
    float _575 = in.m_58.y;
    float _577 = in.m_58.z;
    float _579 = in.m_58.w;
    float _581 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _583 = log2(_581);
    float _585 = _539 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _589 = _587 != 0;
    float _591 = _541 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _599 = _583 * _141;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _603 = _577 * 2.0;
    float _605 = _573 * 2.0;
    float _607 = _575 * 2.0;
    float _609 = _573 + _575;
    float _611 = _575 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _613 = floor(_605);
    float _615 = _573 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _617 = _609 + (-1.0);
    float _619 = fma(_611, -2.0, _593);
    float _621 = -_595;
    float _623 = fma(_615, 2.0, _621);
    float _625 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _619);
    float _627 = floor(_603);
    int _629 = int(_589);
    int _631 = _177 ? 2 : 0;
    int _633 = _629 | _631;
    int _635 = _179 ? 4 : 0;
    int _637 = _633 | _635;
    int _639 = false ? 8 : 0;
    int _641 = _637 | _639;
    int _643 = false ? 16 : 0;
    int _645 = _641 | _643;
    int _647 = false ? 32 : 0;
    int _649 = _645 | _647;
    int _651 = false ? 64 : 0;
    int _653 = _649 | _651;
    int _655 = _653 & 1;
    float _657 = -_141;
    float _659 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[76].x, _623);
    int _661 = _655;
    if (_589)
    {
        _661 = 0;
    }
    int _663 = _661;
    int _665 = _663;
    if (!_589)
    {
        _665 = 1;
    }
    int _667 = _665;
    float _669 = floor(_607);
    bool _671 = _613 >= 0.0;
    bool _673 = isnan(_613);
    bool _675 = _671 || _673;
    bool _677 = isnan(0.0);
    bool _679 = _675 || _677;
    bool _681 = _667 != 1;
    bool _683 = _613 > 0.0;
    bool _685 = _627 > 0.0;
    float _687 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _689 = _679 ? 0 : 1;
    float _691 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _693 = int(_691);
    bool _695 = _627 >= 0.0;
    bool _697 = isnan(_627);
    bool _699 = _695 || _697;
    bool _701 = isnan(0.0);
    bool _703 = _699 || _701;
    int _705 = ~_689;
    int _707 = _705 + 1;
    int _709 = _707 + 1;
    bool _711 = _669 > 0.0;
    int _713 = _703 ? 0 : 1;
    float _715 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _717 = int(_715);
    bool _719 = _669 >= 0.0;
    bool _721 = isnan(_669);
    bool _723 = _719 || _721;
    bool _725 = isnan(0.0);
    bool _727 = _723 || _725;
    int _729 = ~_713;
    int _731 = _729 + 1;
    int _733 = _731 + 1;
    int _735 = _727 ? 0 : 1;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _739 = _733;
    float _741 = as_type<float>(_667);
    float _743 = as_type<float>(_693);
    int _745 = _709;
    if (!_685)
    {
        int _747 = ~_713;
        int _749 = _747 + 1;
        _739 = _749;
    }
    int _751 = _739;
    float _753 = exp2(_599);
    if (!_681)
    {
        _741 = _575;
    }
    float _755 = _741;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _767 = _765 != 0;
    float _769 = _755;
    if (_681)
    {
        _769 = _573;
    }
    float _771 = _769;
    int _773 = ~_735;
    int _775 = _773 + 1;
    int _777 = _775 + 1;
    int _779 = _777;
    if (!_711)
    {
        int _781 = ~_735;
        int _783 = _781 + 1;
        _779 = _783;
    }
    int _785 = _779;
    float _787 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[83].z, _737);
    bool _789 = !_763;
    int _791 = _789 ? 0 : 1;
    bool _793 = !_759;
    int _795 = _793 ? 0 : 1;
    bool _797 = !_767;
    int _799 = _797 ? 0 : 1;
    float _801 = -_753;
    float _803 = _801 + 1.0;
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _807 = _805 != 0;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _811 = _809 != 0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _815 = _813 != 0;
    float _817 = float(_107);
    float _819 = float(_693);
    float _821 = 1.0 / _817;
    bool _823 = !_807;
    float _825 = _823 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _827 = _817;
    float _829 = _825;
    if (!_681)
    {
        _743 = _575;
    }
    float _831 = _743;
    float _833 = _831;
    if (!_683)
    {
        int _835 = ~_689;
        int _837 = _835 + 1;
        _745 = _837;
    }
    int _839 = _745;
    if (_681)
    {
        _833 = _573;
    }
    float _841 = _833;
    float _843 = 1.0 / _819;
    if (!_681)
    {
        _827 = _577;
    }
    float _845 = _827;
    float _847 = _845;
    if (_681)
    {
        _847 = _575;
    }
    float _849 = _847;
    float _851 = _841 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _853 = abs(as_type<int>(_825));
    float _855 = _849 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_681)
    {
        _829 = _577;
    }
    float _857 = _829;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _861 = _857;
    if (_681)
    {
        _861 = _575;
    }
    float _863 = _861;
    float _865 = fma(_855, -2.0, _601);
    float _867 = float(_853);
    float _869 = -_859;
    float _871 = fma(_851, 2.0, _869);
    float _873 = float(_751);
    float _875 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[83].w, _597);
    float _877 = _573 + (-0.5);
    float _879 = float(_717);
    float _881 = _867 * _873;
    bool _883 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _885 = isnan(1.0);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _891 = _887 || _889;
    float _893 = in.m_64.x;
    float _895 = in.m_64.y;
    float _897 = in.m_64.z;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _901 = 1.0 + _899;
    float _903 = 1.0 / _879;
    float _905 = _881 * (-2.0);
    float _907 = _843 * _141;
    bool _909 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _911 = isnan(0.0);
    bool _913 = _909 || _911;
    bool _915 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _917 = _913 || _915;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _921 = float(_839);
    float _923 = 1.0 / _901;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _927 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[78].z, _919);
    bool _929 = !_811;
    int _931 = _929 ? 0 : 1;
    float _933 = _821 * _141;
    float _935 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[78].w, _925);
    float _937 = _917 ? _803 : 0.0;
    float _939 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _927);
    int _941 = abs(_931);
    float _943 = _903 * _141;
    bool _945 = !_815;
    int _947 = _945 ? 0 : 1;
    float _949 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _935);
    float _951 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _787);
    float _953 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _875);
    float _955 = fma(_905, _893, _893);
    float _957 = -_141;
    float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[81].x, _871);
    float _961 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _865);
    float _963 = _881;
    if (_891)
    {
        float _965 = _937 * _923;
        _145 = _965;
    }
    float _967 = _145;
    float _969 = fma(_687, _905, _687);
    float _971 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[196].x, _955);
    int _973 = abs(_947);
    float _975 = _577 + _575;
    float _977 = float(_941);
    float _979 = fma(_969, _967, _971);
    float _981 = _975 + (-1.0);
    float _983 = _977 * _921;
    float _985 = float(_785);
    float _987 = _979 * 0.15915493667125701904296875;
    float _989 = float(_973);
    float _991 = _983 * (-2.0);
    float _993 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _995 = _577 + _573;
    float _997 = _987 * 6.283185482025146484375;
    float _999 = cos(_997);
    float _1001 = _989 * _985;
    float _1003 = _575 + (-0.5);
    float _1005 = fma(_991, _895, _895);
    float _1007 = fma(_993, _991, _993);
    float _1009 = _995 + (-1.0);
    float _1011 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1005);
    float _1013 = _1001 * (-2.0);
    float _1015 = _987 * 6.283185482025146484375;
    float _1017 = sin(_1015);
    float _1019 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1021 = fma(_1007, _967, _1011);
    float _1023 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1025 = fma(_1013, _897, _897);
    float _1027 = _577 + (-0.5);
    float _1029 = _1021 * 0.15915493667125701904296875;
    float _1031 = fma(_1023, _1013, _1023);
    float _1033 = _591 * _1019;
    float _1035 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1025);
    float _1037 = _1029 * 6.283185482025146484375;
    float _1039 = sin(_1037);
    float _1041 = fma(_1031, _967, _1035);
    float _1043 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1045 = _1041 * 0.15915493667125701904296875;
    float _1047 = _1029 * 6.283185482025146484375;
    float _1049 = cos(_1047);
    float _1051 = in.m_46.x;
    float _1053 = in.m_46.y;
    float _1055 = in.m_46.z;
    float _1057 = _585 * _1043;
    float _1059 = _1045 * 6.283185482025146484375;
    float _1061 = cos(_1059);
    float _1063 = _999 * _1039;
    float _1065 = _1017 * _1039;
    float _1067 = _1045 * 6.283185482025146484375;
    float _1069 = sin(_1067);
    float _1071 = _999 * _1049;
    float _1073 = _1017 * _1049;
    float _1075 = _999 * _1061;
    float _1077 = _1017 * _1061;
    float _1079 = _1049 * _1061;
    float _1081 = _1039 * _1061;
    float _1083 = _1075 * _1057;
    float _1085 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1087 = fma(_1069, _1071, _1065);
    float _1089 = -_1063;
    float _1091 = fma(_1069, _1073, _1089);
    float _1093 = -_1057;
    float _1095 = _1069 * _1093;
    float _1097 = -_1073;
    float _1099 = fma(_1069, _1063, _1097);
    float _1101 = _1077 * _1057;
    float _1103 = fma(_1087, _1033, _1083);
    float _1105 = fma(_1079, _1033, _1095);
    float _1107 = fma(_1069, _1065, _1071);
    float _1109 = fma(_1091, _1033, _1101);
    float _1111 = fma(_1099, _1085, _1103);
    float _1113 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1115 = fma(_1081, _1085, _1105);
    float _1117 = fma(_1107, _1085, _1109);
    float _1119 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1121 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1123 = fma(_1051, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1113);
    float _1125 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1127 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1119);
    float _1129 = fma(_1051, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1121);
    float _1131 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1123);
    float _1133 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1125);
    float _1135 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1127);
    float _1137 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1129);
    float _1139 = _1131 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1141 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1133);
    float _1143 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1145 = _1137 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1147 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1149 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1151 = _1139 + _1143;
    float _1153 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1155 = fma(_1051, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1147);
    float _1157 = _1145 + _1149;
    float _1159 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1161 = _1151 + _1159;
    float _1163 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1153);
    float _1165 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1155);
    float _1167 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1169 = _1157 + _1167;
    float _1171 = _1161 * _1161;
    float _1173 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1163);
    float _1175 = _1165 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1177 = fma(_1169, _1169, _1171);
    float _1179 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1181 = sqrt(_1177);
    float _1183 = _1175 + _1179;
    bool _1185 = _1181 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1189 = _1187 != 0;
    int _1191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1193 = _1191 != 0;
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1197 = _1195 != 0;
    int _1199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1201 = _1199 != 0;
    bool _1203 = !_1193;
    int _1205 = _1203 ? 0 : 1;
    bool _1207 = !_1189;
    int _1209 = _1207 ? 0 : 1;
    bool _1211 = !_1197;
    int _1213 = _1211 ? 0 : 1;
    bool _1215 = !_1201;
    int _1217 = _1215 ? 0 : 1;
    float _1219 = _1051;
    float _1221 = _1055;
    float _1223 = _1165;
    float _1225 = _1117;
    if (!_1185)
    {
        _1219 = _1157;
    }
    float _1227 = _1219;
    float _1229 = _1227;
    if (!_1185)
    {
        _1221 = _1151;
    }
    float _1231 = _1221;
    float _1233 = _1231;
    if (!_1185)
    {
        _1223 = _1183;
    }
    float _1235 = _1223;
    bool _1237 = !_1185;
    float _1239 = _1235;
    if (!_1237)
    {
        float _1241 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1243 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1245 = _1181 + _1243;
        float _1247 = _1183 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1249 = rsqrt(_1177);
        float _1251 = _1245 * _1241;
        float _1253 = _1251 * 0.15915493667125701904296875;
        float _1255 = _1253 * 6.283185482025146484375;
        float _1257 = cos(_1255);
        float _1259 = _1253 * 6.283185482025146484375;
        float _1261 = sin(_1259);
        float _1263 = _1257 + (-1.0);
        float _1265 = _1263 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1267 = fma(_1261, _1247, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1269 = fma(_1183, _1257, _1265);
        float _1271 = _1249 * _1267;
        float _1273 = fma(_1169, _1271, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1275 = fma(_1161, _1271, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1239 = _1269;
        _1229 = _1273;
        _1233 = _1275;
        _1225 = _1253;
    }
    float _1277 = _1239;
    float _1279 = _1229;
    float _1281 = _1233;
    float _1283 = _1225;
    float _1285 = -_1175;
    float _1287 = _1285 + _1277;
    float _1289 = -_1145;
    float _1291 = _1289 + _1279;
    float _1293 = -_1139;
    float _1295 = _1293 + _1281;
    float _1297 = _1287 * _1287;
    bool _1299 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1301 = isnan(0.5);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1307 = _1303 || _1305;
    float _1309 = fma(_1291, _1291, _1297);
    float _1311 = fma(_1295, _1295, _1309);
    float _1313 = sqrt(_1311);
    bool _1315 = _1313 > 0.0;
    bool _1317 = !_1315;
    float _1319 = _1281;
    float _1321 = _1279;
    float _1323 = _1277;
    float _1325 = _1283;
    float _1327 = _1291;
    if (!_1317)
    {
        float _1329 = _203 * _203;
        float _1331 = fma(_201, _201, _1329);
        float _1333 = fma(_205, _205, _1331);
        float _1335 = rsqrt(_1311);
        float _1337 = sqrt(_1333);
        float _1339 = _1291 * _1335;
        float _1341 = _1287 * _1335;
        float _1343 = _1295 * _1335;
        bool _1345 = _1337 > 0.0;
        bool _1347 = !_1345;
        _1325 = _1337;
        _1327 = _1341;
        if (!_1347)
        {
            float _1349 = rsqrt(_1333);
            float _1351 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1353 = _203 * _1349;
            float _1355 = _201 * _1349;
            float _1357 = _1341 * _1353;
            float _1359 = _205 * _1349;
            float _1361 = fma(_1339, _1355, _1357);
            float _1363 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1365 = fma(_1343, _1359, _1361);
            float _1367 = _1365 * _1363;
            float _1369 = fma(_201, _1367, _1279);
            float _1371 = fma(_203, _1367, _1277);
            float _1373 = fma(_205, _1367, _1281);
            _1319 = _1373;
            _1321 = _1369;
            _1323 = _1371;
            _1325 = _1351;
            _1327 = _1361;
        }
    }
    float _1375 = _1319;
    float _1377 = _1321;
    float _1379 = _1323;
    float _1381 = _1325;
    float _1383 = _1327;
    float _1385 = _1379;
    float _1387 = _1377;
    float _1389 = _1375;
    float _1391 = _1383;
    float _1393 = _1381;
    if (!_1307)
    {
        float _1395 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1397 = _1175 + _1395;
        float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1401 = _1145 + _1399;
        float _1403 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1405 = -_1139;
        float _1407 = _1405 + _1375;
        float _1409 = _1397 * _1397;
        float _1411 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1413 = _1139 + _1411;
        float _1415 = fma(_1401, _1401, _1409);
        float _1417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1419 = fma(_1413, _1413, _1415);
        float _1421 = sqrt(_1419);
        float _1423 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1425 = precise::min(_1421, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1427 = _1425 * _1417;
        float _1429 = -_1145;
        float _1431 = _1429 + _1377;
        float _1433 = _1423 * _1427;
        float _1435 = -_1175;
        float _1437 = _1435 + _1379;
        float _1439 = fma(_1431, _1433, _1145);
        float _1441 = fma(_1437, _1433, _1175);
        float _1443 = fma(_1407, _1433, _1139);
        _1385 = _1441;
        _1387 = _1439;
        _1389 = _1443;
    }
    float _1445 = _1385;
    float _1447 = _1387;
    float _1449 = _1389;
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1453 = _1445 + _1451;
    float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1457 = _1447 + _1455;
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1461 = _1449 + _1459;
    float _1463 = _1453 * _1453;
    float _1465 = fma(_1457, _1457, _1463);
    float _1467 = fma(_1145, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1469 = fma(_1461, _1461, _1465);
    float _1471 = rsqrt(_1469);
    float _1473 = sqrt(_1469);
    float _1475 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1477 = _1457 * _1475;
    float _1479 = _1461 * _1475;
    float _1481 = _1477 * _1477;
    float _1483 = _1479 * _1479;
    float _1485 = _1481 + _1483;
    float _1487 = sqrt(_1485);
    bool _1489 = _1487 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1491 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1493 = _1487 + _1491;
    float _1495 = _1461;
    float _1497 = _1493;
    float _1499 = _1453;
    if (_1489)
    {
        float _1501 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1495 = _1501;
    }
    float _1503 = _1495;
    if (_1489)
    {
        float _1505 = rsqrt(_1485);
        _1391 = _1505;
    }
    float _1507 = _1391;
    float _1509 = _1507;
    if (_1489)
    {
        float _1511 = _1493 * _1503;
        _1497 = _1511;
    }
    float _1513 = _1497;
    float _1515 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1489)
    {
        float _1517 = _1513 * 0.15915493667125701904296875;
        _1393 = _1517;
    }
    float _1519 = _1393;
    float _1521 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1515);
    float _1523 = _1471;
    float _1525 = _1519;
    if (_1489)
    {
        float _1527 = _1519 * 6.283185482025146484375;
        float _1529 = sin(_1527);
        _1523 = _1529;
    }
    float _1531 = _1523;
    float _1533 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1535 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1521);
    float _1537 = precise::max(0.0, _1533);
    float _1539 = _1463;
    float _1541 = _1537;
    float _1543 = _1533;
    if (_1489)
    {
        float _1545 = _1519 * 6.283185482025146484375;
        float _1547 = cos(_1545);
        _1539 = _1547;
    }
    float _1549 = _1539;
    float _1551 = -_1475;
    float _1553 = -_1537;
    float _1555 = fma(_1453, _1551, _1553);
    if (!_1489)
    {
        _1499 = _1477;
    }
    float _1557 = _1499;
    float _1559 = _1557;
    if (_1489)
    {
        float _1561 = _1555 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1541 = _1561;
    }
    float _1563 = _1541;
    float _1565 = _1531;
    if (_1489)
    {
        float _1567 = fma(_1531, _1563, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1565 = _1567;
    }
    float _1569 = _1565;
    float _1571 = floor(_1467);
    float _1573 = _1569;
    float _1575 = _1549;
    if (_1489)
    {
        float _1577 = _1549 + (-1.0);
        _1543 = _1577;
    }
    float _1579 = _1543;
    float _1581 = _1579;
    if (_1489)
    {
        float _1583 = _1507 * _1569;
        _963 = _1583;
    }
    float _1585 = _963;
    if (!_1489)
    {
        _1509 = _1555;
    }
    float _1587 = _1509;
    float _1589 = _1587;
    if (_1489)
    {
        float _1591 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1525 = _1591;
    }
    float _1593 = _1525;
    if (_1489)
    {
        float _1595 = _1477 * _1585;
        _1559 = _1595;
    }
    float _1597 = _1559;
    if (!_1489)
    {
        _1573 = _1479;
    }
    float _1599 = _1573;
    float _1601 = _1599;
    if (_1489)
    {
        float _1603 = _1479 * _1585;
        _1601 = _1603;
    }
    float _1605 = _1601;
    if (!_1489)
    {
        _1581 = _1481;
    }
    float _1607 = _1581;
    float _1609 = _1607;
    if (_1489)
    {
        float _1611 = fma(_1555, _1549, _1593);
        _1589 = _1611;
    }
    float _1613 = _1589;
    if (_1489)
    {
        float _1615 = _1597 * _1597;
        _1609 = _1615;
    }
    float _1617 = _1609;
    if (!_1489)
    {
        _1575 = _1483;
    }
    float _1619 = _1575;
    float _1621 = _1619;
    if (_1489)
    {
        float _1623 = _1605 * _1605;
        _1621 = _1623;
    }
    float _1625 = _1621;
    float _1627 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1629 = fma(_1613, _1613, _1617);
    float _1631 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1633 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1627);
    float _1635 = _1629 + _1625;
    float _1637 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1639 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1631);
    float _1641 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1633);
    float _1643 = fma(_1139, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1645 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1637);
    float _1647 = rsqrt(_1635);
    float _1649 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1651 = fma(_1473, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1649);
    float _1653 = precise::clamp(_1651, 0.0, 1.0);
    float _1655 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1639);
    float _1657 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1645);
    float _1659 = _1641 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1661 = -_1653;
    float _1663 = _1661 + 1.0;
    float _1665 = _1657 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1667 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1669 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1671 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1673 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1675 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1677 = abs(_1663);
    float _1679 = log2(_1677);
    float _1681 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1669);
    float _1683 = -_1571;
    float _1685 = _1467 + _1683;
    float _1687 = -_1675;
    float _1689 = fma(_1687, _1673, 1.0);
    float _1691 = _1647 * _1597;
    float _1693 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1681);
    float _1695 = _1647 * _1605;
    float _1697 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1699 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1701 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1693);
    float _1703 = _1647 * _1613;
    float _1705 = floor(_1643);
    float _1707 = -_1699;
    float _1709 = fma(_1703, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1707);
    float _1711 = _1679 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1713 = -_1695;
    float _1715 = fma(_1713, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1709);
    float _1717 = log2(_1689);
    float _1719 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1721 = fma(_1715, -0.5, 0.5);
    float _1723 = fma(_1715, 0.5, 0.5);
    float _1725 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1719);
    float _1727 = exp2(_1711);
    float _1729 = -_1705;
    float _1731 = _1643 + _1729;
    float _1733 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1697);
    float _1735 = fma(_1723, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1737 = _1703 + 1.0;
    float _1739 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1725);
    float _1741 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1733);
    float _1743 = fma(_1723, _1735, -0.212114393711090087890625);
    float _1745 = 1.0 / _1701;
    float _1747 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1739);
    float _1749 = _1717 * 0.693147182464599609375;
    float _1751 = fma(_1723, _1743, 1.570728778839111328125);
    float _1753 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1755 = sqrt(_1721);
    float _1757 = -_1703;
    float _1759 = fma(_1727, _1737, _1757);
    float _1761 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1741);
    float _1763 = fma(_1759, 0.5, 0.5);
    float _1765 = _1747 * _1745;
    float _1767 = _1761 * _1745;
    float _1769 = fma(_1765, 0.5, 0.5);
    float _1771 = fma(_1767, -0.5, 0.5);
    float _1773 = _1755 * 0.636619746685028076171875;
    float2 _6502 = float2(_1685, _1731);
    float _1775 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6502, float2(0.0), isnan(_6502)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6502, float2(0.0), isnan(_6502)), level(0.0)).x;
    float _1777 = -_1751;
    float _1779 = fma(_1773, _1777, 1.0);
    float3 _6518 = float3(_1769, _1771, _1753);
    float _1781 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6518, float3(0.0), isnan(_6518)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6518, float3(0.0), isnan(_6518)), level(0.0)).x;
    float3 _6529 = float3(_1769, _1771, _1753);
    float4 _1784 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6529, float3(0.0), isnan(_6529)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6529, float3(0.0), isnan(_6529)), level(0.0)).xyzw;
    float _1786 = _1784.x;
    float _1788 = _1784.y;
    float _1790 = _1784.z;
    float _1792 = _1784.w;
    float2 _6545 = float2(_1779, _1763);
    float3 _1796 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6545, float2(0.0), isnan(_6545)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6545, float2(0.0), isnan(_6545)), level(0.0)).xyz;
    float _1798 = _1796.x;
    float _1800 = _1796.y;
    float _1802 = _1796.z;
    float _1804 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1806 = int(_1804);
    int _1808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1810 = _1808 != 0;
    float _1812 = _1679 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1816 = _1814 != 0;
    float _1818 = -_953;
    float _1820 = _1818 + 1.0;
    int _1822 = abs(_791);
    float _1824 = -_949;
    float _1826 = _1824 + 1.0;
    int _1828 = abs(_1205);
    float _1830 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1832 = int(_1830);
    out.m_66.x = _1447;
    out.m_66.y = _1445;
    out.m_66.z = _1449;
    float _1834 = 0.0;
    float _1836 = _1701;
    if (_1810)
    {
        float _1838 = in.m_58.x;
        _1834 = _1838;
    }
    float _1840 = _1834;
    float _1842 = float(uint(_1806));
    float _1844 = trunc(_907);
    int _1846 = int(_1844);
    float _1848 = _1840;
    if (!_1810)
    {
        float _1850 = in.m_58.y;
        _1848 = _1850;
    }
    float _1852 = _1848;
    bool _1854 = _1806 == 0;
    float _1856 = float(uint(_1832));
    float _1858 = 1.0 / _1842;
    float _1860 = float(uint(_1846));
    float _1862 = 1.0 / _1856;
    int _1864 = as_type<int>(_1858) + (-2);
    float _1866 = trunc(_943);
    int _1868 = int(_1866);
    int _1870 = ~_1806;
    int _1872 = _1870 + 1;
    float _1874 = as_type<float>(_1864) * _1860;
    float _1876 = trunc(_1874);
    float _1878 = precise::max(_1876, 0.0);
    uint _1881 = uint(_1878);
    int _1883 = as_type<int>(_1862) + (-2);
    float _1885 = float(uint(_1868));
    float _1887 = exp2(_1812);
    float _1889 = _1874;
    if (_1810)
    {
        _1889 = 1.0;
    }
    float _1891 = _1889;
    float _1893 = _1891;
    if (!_1810)
    {
        _1893 = 1.2345600128173828125;
    }
    float _1895 = _1893;
    float _1897 = as_type<float>(_1883) * _1885;
    int _1899 = ~_1832;
    int _1901 = _1899 + 1;
    int _1903 = _1872 * int(_1881);
    int _1905 = _1903 + _1846;
    float _1907 = _1895 * _1852;
    int _1909 = ~_1806;
    int _1911 = _1909 + 1;
    float _1913 = trunc(_1897);
    float _1915 = precise::max(_1913, 0.0);
    uint _1917 = uint(_1915);
    float _1919 = float(uint(_1905));
    float _1921 = as_type<float>(_1905);
    if (_1810)
    {
        _1921 = 1.0;
    }
    float _1923 = _1921;
    float _1925 = _1923;
    if (!_1810)
    {
        _1925 = 7.345489978790283203125;
    }
    float _1927 = _1925;
    float _1929 = as_type<float>(_1864) * _1919;
    float _1931 = -_1887;
    float _1933 = _1931 + 1.0;
    float _1935 = _1927 * _573;
    float _1937 = trunc(_1929);
    float _1939 = precise::max(_1937, 0.0);
    uint _1941 = uint(_1939);
    int _1943 = _1901 * int(_1917);
    int _1945 = _1943 + _1868;
    float _1947 = float(uint(_1945));
    float _1949 = floor(_1935);
    float _1951 = as_type<float>(_1883) * _1947;
    float _1953 = float(_1846);
    int _1955 = int(_1881) + int(_1941);
    float _1957 = floor(_1907);
    float _1959 = float(_1806);
    int _1961 = _1911 * _1955;
    int _1963 = _1961 + _1846;
    bool _1965 = _1953 >= _1959;
    bool _1967 = isnan(_1953);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan(_1959);
    bool _1973 = _1969 || _1971;
    float _1975 = float(_1973);
    float _1977 = trunc(_1951);
    float _1979 = precise::max(_1977, 0.0);
    uint _1981 = uint(_1979);
    float _1983 = -_1949;
    float _1985 = _1935 + _1983;
    float _1987 = float(_1832);
    float _1989 = _1959 * _933;
    bool _1991 = uint(_1963) >= uint(_1806);
    float _1993 = _1987 * _933;
    float _1995 = trunc(_1975);
    int _1997 = int(_1995);
    bool _1999 = !_1991;
    int _2001 = _1999 ? 0 : (-1);
    float _2003 = -_1957;
    float _2005 = _1907 + _2003;
    int _2007 = ~_1955;
    int _2009 = _2007 + _2001;
    int _2011 = _2009 + 1;
    float _2013 = _1985 * _1959;
    int _2015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2017 = _2015 != 0;
    float _2019 = trunc(_1989);
    int _2021 = int(_2019);
    int _2023 = int(_1917) + int(_1981);
    int _2025 = _1806 * _2011;
    int _2027 = _2025 + _1846;
    int _2029 = ~_1832;
    int _2031 = _2029 + 1;
    float _2033 = _2005 * _1987;
    float _2035 = float(_1868);
    bool _2037 = !_1854;
    int _2039 = _2037 ? _2027 : (-1);
    int _2041 = _2031 * _2023;
    int _2043 = _2041 + _1868;
    int _2045 = ~_1997;
    int _2047 = _2045 + 1;
    int _2049 = _2047 + 1;
    float _2051 = trunc(_2013);
    int _2053 = int(_2051);
    bool _2055 = _2035 >= _1987;
    bool _2057 = isnan(_2035);
    bool _2059 = _2055 || _2057;
    bool _2061 = isnan(_1987);
    bool _2063 = _2059 || _2061;
    float _2065 = float(_2063);
    bool _2067 = uint(_2043) >= uint(_1832);
    int _2069 = _2039 * _2049;
    bool _2071 = !_2017;
    int _2073 = _2071 ? 0 : 1;
    int _2075 = _1806 + (-1);
    float _2077 = trunc(_2065);
    int _2079 = int(_2077);
    int _2081 = abs(_2073);
    int _2083 = _1997 * _2075;
    int _2085 = _2083 + _2069;
    bool _2087 = !_2067;
    int _2089 = _2087 ? 0 : (-1);
    int _2091 = _2085 * _1822;
    bool _2093 = _1832 == 0;
    int _2095 = _2053 * _2081;
    int _2097 = _2095 + _1846;
    int _2099 = ~_2023;
    int _2101 = _2099 + _2089;
    int _2103 = _2101 + 1;
    float _2105 = trunc(_1993);
    int _2107 = int(_2105);
    int _2109 = abs(_795);
    bool _2111 = !_1816;
    int _2113 = _2111 ? 0 : 1;
    int _2115 = _1832 * _2103;
    int _2117 = _2115 + _1868;
    int _2119 = abs(_799);
    int _2121 = _2021 * _2109;
    int _2123 = _2121 + _2091;
    int _2125 = ~_2079;
    int _2127 = _2125 + 1;
    int _2129 = _2127 + 1;
    float _2131 = trunc(_2033);
    int _2133 = int(_2131);
    bool _2135 = !_2093;
    int _2137 = _2135 ? _2117 : (-1);
    int _2139 = _2097 * _2119;
    int _2141 = _2139 + _2123;
    int _2143 = abs(_2113);
    float _2145 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2149 = _2147 != 0;
    int _2151 = _2137 * _2129;
    bool _2153 = !_2149;
    int _2155 = _2153 ? 0 : 1;
    int _2157 = _1832 + (-1);
    int _2159 = _2053 * _2143;
    int _2161 = _2159 + _2141;
    int _2163 = abs(_2155);
    float _2165 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2167 = abs(_1209);
    int _2169 = _2079 * _2157;
    int _2171 = _2169 + _2151;
    float _2173 = float(uint(_2161));
    int _2175 = _2171 * _1828;
    float _2177 = as_type<float>(_1864) * _2173;
    int _2179 = abs(_1213);
    int _2181 = _2133 * _2163;
    int _2183 = _2181 + _1868;
    int _2185 = ~_1806;
    int _2187 = _2185 + 1;
    int _2189 = _2107 * _2167;
    int _2191 = _2189 + _2175;
    int _2193 = abs(_1217);
    float _2195 = trunc(_2177);
    float _2197 = precise::max(_2195, 0.0);
    uint _2199 = uint(_2197);
    int _2201 = _2183 * _2179;
    int _2203 = _2201 + _2191;
    float _2205 = float(uint(_2097));
    int _2207 = ~_1832;
    int _2209 = _2207 + 1;
    int _2211 = _2133 * _2193;
    int _2213 = _2211 + _2203;
    float _2215 = as_type<float>(_1864) * _2205;
    float _2217 = float(uint(_2213));
    float _2219 = trunc(_2215);
    float _2221 = precise::max(_2219, 0.0);
    uint _2223 = uint(_2221);
    int _2225 = _2187 * int(_2199);
    int _2227 = _2225 + _2161;
    float _2229 = as_type<float>(_1883) * _2217;
    float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2233 = _2231 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2235 = float(uint(_2227));
    float _2237 = trunc(_2229);
    float _2239 = precise::max(_2237, 0.0);
    uint _2241 = uint(_2239);
    float _2243 = as_type<float>(_1864) * _2235;
    int _2245 = _2187 * int(_2223);
    int _2247 = _2245 + _2097;
    float _2249 = trunc(_2243);
    float _2251 = precise::max(_2249, 0.0);
    uint _2253 = uint(_2251);
    float _2255 = float(uint(_2247));
    int _2257 = _2209 * int(_2241);
    int _2259 = _2257 + _2213;
    float _2261 = 1.0 / _2233;
    float _2263 = as_type<float>(_1864) * _2255;
    int _2265 = ~_1806;
    int _2267 = _2265 + 1;
    float _2269 = float(uint(_2259));
    float _2271 = float(uint(_2183));
    int _2273 = int(_2199) + int(_2253);
    float _2275 = as_type<float>(_1883) * _2269;
    float _2277 = trunc(_2263);
    float _2279 = precise::max(_2277, 0.0);
    uint _2281 = uint(_2279);
    float _2283 = as_type<float>(_1883) * _2271;
    int _2285 = ~_1832;
    int _2287 = _2285 + 1;
    int _2289 = _2267 * _2273;
    int _2291 = _2289 + _2161;
    float _2293 = trunc(_2275);
    float _2295 = precise::max(_2293, 0.0);
    uint _2297 = uint(_2295);
    bool _2299 = uint(_2291) >= uint(_1806);
    int _2301 = ~_1832;
    int _2303 = _2301 + 1;
    bool _2305 = !_2299;
    int _2307 = _2305 ? 0 : (-1);
    float _2309 = trunc(_2283);
    float _2311 = precise::max(_2309, 0.0);
    uint _2313 = uint(_2311);
    int _2315 = int(_2223) + int(_2281);
    int _2317 = ~_2273;
    int _2319 = _2317 + _2307;
    int _2321 = _2319 + 1;
    int _2323 = ~_1806;
    int _2325 = _2323 + 1;
    int _2327 = int(_2241) + int(_2297);
    int _2329 = _1806 * _2321;
    int _2331 = _2329 + _2161;
    int _2333 = _2325 * _2315;
    int _2335 = _2333 + _2097;
    int _2337 = _2287 * _2327;
    int _2339 = _2337 + _2213;
    bool _2341 = !_1854;
    int _2343 = _2341 ? _2331 : (-1);
    bool _2345 = uint(_2335) >= uint(_1806);
    bool _2347 = uint(_2339) >= uint(_1832);
    int _2349 = _2303 * int(_2313);
    int _2351 = _2349 + _2183;
    int _2353 = _2343 & 3;
    bool _2355 = _2353 != 0;
    int _2357 = _2343 & 3;
    bool _2359 = _2357 != 0;
    float _2361 = float(uint(_2351));
    bool _2363 = !_2347;
    int _2365 = _2363 ? 0 : (-1);
    int _2367 = _2355 ? 0 : 1;
    bool _2369 = !_2345;
    int _2371 = _2369 ? 0 : (-1);
    bool _2373 = _2357 != 3;
    float _2375 = -_1775;
    float _2377 = _2375 + 1.0;
    int _2379 = ~_2327;
    int _2381 = _2379 + _2365;
    int _2383 = _2381 + 1;
    bool _2385 = uint(_2357) >= 2u;
    bool _2387 = _579 > 0.5;
    float _2389 = as_type<float>(_1883) * _2361;
    int _2391 = ~_2315;
    int _2393 = _2391 + _2371;
    int _2395 = _2393 + 1;
    int _2397 = _1832 * _2383;
    int _2399 = _2397 + _2213;
    int _2401 = _2385 ? 0 : 1;
    bool _2403 = uint(_2357) > 1u;
    int _2405 = _1806 * _2395;
    int _2407 = _2405 + _2097;
    bool _2409 = !_2093;
    int _2411 = _2409 ? _2399 : (-1);
    float _2413 = trunc(_2389);
    float _2415 = precise::max(_2413, 0.0);
    uint _2417 = uint(_2415);
    int _2419 = ~_2401;
    int _2421 = _2419 + 1;
    int _2423 = _2421 + 1;
    int _2425 = _2423;
    if (_2373)
    {
        int _2427 = ~_2401;
        int _2429 = _2427 + 1;
        _2425 = _2429;
    }
    int _2431 = _2425;
    int _2433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2435 = _2433 != 0;
    bool _2437 = !_1854;
    int _2439 = _2437 ? _2407 : (-1);
    int _2441 = _2411 & 3;
    bool _2443 = _2441 != 0;
    bool _2445 = !_2435;
    int _2447 = _2445 ? 0 : 1;
    bool _2449 = uint(_2441) > 1u;
    bool _2451 = !_2359;
    int _2453 = _2451 ? 0 : 1;
    int _2455 = ~_2367;
    int _2457 = _2455 + 1;
    int _2459 = _2457 + 1;
    int _2461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2463 = _2461 != 0;
    int _2465 = _2411 & 3;
    bool _2467 = _2465 != 0;
    int _2469 = _2459;
    if (!_2403)
    {
        int _2471 = ~_2367;
        int _2473 = _2471 + 1;
        _2469 = _2473;
    }
    int _2475 = _2469;
    int _2477 = _2343 >> 31;
    bool _2479 = !_2463;
    int _2481 = _2479 ? 0 : 1;
    int _2483 = _2467 ? 0 : 1;
    int _2485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2487 = _2485 != 0;
    int _2489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2491 = _2489 != 0;
    int _2493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2495 = _2493 != 0;
    int _2497 = _2477 & 3;
    bool _2499 = !_2443;
    int _2501 = _2499 ? 0 : 1;
    bool _2503 = _2357 != 3;
    int _2505 = ~_2483;
    int _2507 = _2505 + 1;
    int _2509 = _2507 + 1;
    int _2511 = _2343 + _2497;
    int _2513 = _2509;
    if (!_2449)
    {
        int _2515 = ~_2483;
        int _2517 = _2515 + 1;
        _2513 = _2517;
    }
    int _2519 = _2513;
    int _2521 = _2411 >> 31;
    bool _2523 = !_2503;
    int _2525 = _2523 ? 0 : (-1);
    bool _2527 = uint(_2441) >= 2u;
    bool _2529 = _2441 != 3;
    int _2531 = int(_2313) + int(_2417);
    int _2533 = _2521 & 3;
    int _2535 = _2527 ? 0 : 1;
    int _2537 = ~_1832;
    int _2539 = _2537 + 1;
    bool _2541 = _2441 != 3;
    int _2543 = _2411 + _2533;
    int _2545 = _2539 * _2531;
    int _2547 = _2545 + _2183;
    bool _2549 = !_2541;
    int _2551 = _2549 ? 0 : (-1);
    bool _2553 = _573 > 0.5;
    int _2555 = _2543 >> 2;
    int _2557 = ~_2535;
    int _2559 = _2557 + 1;
    int _2561 = _2559 + 1;
    float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2565 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2563;
    int _2567 = _2561;
    if (_2529)
    {
        int _2569 = ~_2535;
        int _2571 = _2569 + 1;
        _2567 = _2571;
    }
    int _2573 = _2567;
    float _2575 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2145);
    int _2577 = _2511 >> 2;
    float _2579 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2165);
    bool _2581 = uint(_2547) >= uint(_1832);
    float _2583 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2575);
    int _2585 = _2555 << 4;
    int _2587 = _2585 + 512;
    int _2589 = _2577 << 4;
    int _2591 = _2589 + 368;
    float _2593 = _2583 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _2595 = !_2581;
    int _2597 = _2595 ? 0 : (-1);
    uint _2599 = uint(int(uint(_2587) >> uint(2)));
    uint _2601 = uint(int(uint(int(_2599)) >> uint(2)));
    int _2603 = int(_2599) & 3;
    float _2605 = (*spvDescriptorSet0.vp_c9)._m0[int(_2601)][_2603];
    int _2607 = int(_2599) + 1;
    uint _2609 = uint(int(uint(_2607) >> uint(2)));
    int _2611 = _2607 & 3;
    float _2613 = (*spvDescriptorSet0.vp_c9)._m0[int(_2609)][_2611];
    bool _2615 = _571 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2617 = isnan(_571);
    bool _2619 = _2615 || _2617;
    bool _2621 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2623 = _2619 || _2621;
    float _2625 = float(_2623);
    int _2627 = ~_2531;
    int _2629 = _2627 + _2597;
    int _2631 = _2629 + 1;
    float _2633 = _2565 * _2261;
    float _2635 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2579);
    float _2637 = -_2625;
    float _2639 = _2637 + 1.0;
    int _2641 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2643 = _2641 != 0;
    uint _2645 = uint(int(uint(_2591) >> uint(2)));
    uint _2647 = uint(int(uint(int(_2645)) >> uint(2)));
    int _2649 = int(_2645) & 3;
    float _2651 = (*spvDescriptorSet0.vp_c9)._m0[int(_2647)][_2649];
    int _2653 = int(_2645) + 1;
    uint _2655 = uint(int(uint(_2653) >> uint(2)));
    int _2657 = _2653 & 3;
    float _2659 = (*spvDescriptorSet0.vp_c9)._m0[int(_2655)][_2657];
    int _2661 = _1832 * _2631;
    int _2663 = _2661 + _2183;
    float _2665 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2667 = _571 + _2665;
    float _2669 = 1.0 / _2593;
    bool _2671 = _571 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2673 = isnan(_571);
    bool _2675 = _2671 || _2673;
    bool _2677 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2679 = _2675 || _2677;
    float _2681 = float(_2679);
    float _2683 = _2635 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2685 = fma(_2633, _2667, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2687 = !_2093;
    int _2689 = _2687 ? _2663 : (-1);
    int _2691 = _2591 + 8;
    uint _2693 = uint(int(uint(_2691) >> uint(2)));
    uint _2695 = uint(int(uint(int(_2693)) >> uint(2)));
    int _2697 = int(_2693) & 3;
    float _2699 = (*spvDescriptorSet0.vp_c9)._m0[int(_2695)][_2697];
    int _2701 = int(_2693) + 1;
    uint _2703 = uint(int(uint(_2701) >> uint(2)));
    int _2705 = _2701 & 3;
    float _2707 = (*spvDescriptorSet0.vp_c9)._m0[int(_2703)][_2705];
    float _2709 = _2681 * _2639;
    float _2711 = _2683 + _2593;
    bool _2713 = _575 > 0.5;
    float _2715 = -_2681;
    float _2717 = _2715 + 1.0;
    float _2719 = _2685 * _2709;
    int _2721 = abs(_2475);
    int _2723 = _2587 + 8;
    uint _2725 = uint(int(uint(_2723) >> uint(2)));
    uint _2727 = uint(int(uint(int(_2725)) >> uint(2)));
    int _2729 = int(_2725) & 3;
    float _2731 = (*spvDescriptorSet0.vp_c9)._m0[int(_2727)][_2729];
    int _2733 = int(_2725) + 1;
    uint _2735 = uint(int(uint(_2733) >> uint(2)));
    int _2737 = _2733 & 3;
    float _2739 = (*spvDescriptorSet0.vp_c9)._m0[int(_2735)][_2737];
    float _2741 = -_189;
    int _2743 = _2553 ? as_type<int>(_2741) : as_type<int>(_189);
    float _2745 = fma(_2717, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2719);
    bool _2747 = _577 > 0.5;
    float _2749 = _2711 * _2669;
    float _2751 = _2749 * 0.5;
    int _2753 = abs(_2519);
    float _2755 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2757 = int(_2755);
    int _2759 = ~_2721;
    int _2761 = _2759 + 1;
    int _2763 = _2761 + 1;
    int _2765 = abs(_2453);
    int _2767 = abs(_2501);
    int _2769 = abs(_2573);
    float _2771 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2773 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2771);
    int _2775 = ~_2753;
    int _2777 = _2775 + 1;
    int _2779 = _2777 + 1;
    int _2781 = ~_2765;
    int _2783 = _2781 + 1;
    int _2785 = _2783 + 1;
    int _2787 = ~_2767;
    int _2789 = _2787 + 1;
    int _2791 = _2789 + 1;
    float _2793 = 1.0 / _2773;
    int _2795 = _2779 * as_type<int>(_2613);
    float _2797 = fma(_2625, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2745);
    int _2799 = abs(_2431);
    int _2801 = abs(_2525);
    int _2803 = _2763 * as_type<int>(_2659);
    int _2805 = _2791 * as_type<int>(_2605);
    int _2807 = _2805 + _2795;
    int _2809 = ~_2799;
    int _2811 = _2809 + 1;
    int _2813 = _2811 + 1;
    int _2815 = _2785 * as_type<int>(_2651);
    int _2817 = _2815 + _2803;
    int _2819 = ~_2769;
    int _2821 = _2819 + 1;
    int _2823 = _2821 + 1;
    float _2825 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2827 = int(_2825);
    int _2829 = abs(_2551);
    int _2831 = _2813 * as_type<int>(_2699);
    int _2833 = _2831 + _2817;
    float _2835 = float(uint(_2757));
    float _2837 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2839 = _2793 * _2837;
    int _2841 = ~_2801;
    int _2843 = _2841 + 1;
    int _2845 = _2843 + 1;
    int _2847 = abs(_2447);
    float _2849 = 1.0 / _2835;
    int _2851 = _2823 * as_type<int>(_2731);
    int _2853 = _2851 + _2807;
    int _2855 = ~_2829;
    int _2857 = _2855 + 1;
    int _2859 = _2857 + 1;
    int _2861 = _2845 * as_type<int>(_2707);
    int _2863 = _2861 + _2833;
    int _2865 = _2859 * as_type<int>(_2739);
    int _2867 = _2865 + _2853;
    float _2869 = abs(_2839);
    float _2871 = log2(_2869);
    int _2873 = abs(_2757);
    float _2875 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2877 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2879 = float(uint(_2873));
    float _2881 = _2875 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2883 = float(uint(_2827));
    float _2885 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2887 = abs(_2481);
    float _2889 = _2877 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2891 = ~_2847;
    int _2893 = _2891 + 1;
    int _2895 = _2893 + 1;
    float _2897 = 1.0 / _2879;
    int _2899 = ~_2887;
    int _2901 = _2899 + 1;
    int _2903 = _2901 + 1;
    float _2905 = _2885 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2907 = abs(_2827);
    float _2909 = _2871 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2911 = _2863 * _2895;
    float _2913 = _2797 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2915 = _2867 * _2903;
    float _2917 = 1.0 / _2883;
    int _2919 = _2439 * _2847;
    int _2921 = _2919 + _2911;
    out.m_68.x = _2881;
    out.m_68.y = _2889;
    out.m_68.z = _2905;
    out.m_68.w = _2913;
    int _2923 = _2689 * _2887;
    int _2925 = _2923 + _2915;
    int _2927 = as_type<int>(_2849) + (-2);
    float _2929 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2931 = float(uint(_2907));
    float _2933 = exp2(_2909);
    int _2935 = abs(_2921);
    float _2937 = -_1069;
    float _2939 = fma(_2937, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2929);
    int _2941 = as_type<int>(_2897) + (-2);
    float _2943 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2945 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2947 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2949 = 1.0 / _2931;
    float _2951 = float(uint(_2921));
    float _2953 = -_1069;
    float _2955 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2943);
    float _2957 = float(uint(_2935));
    float _2959 = -_1069;
    float _2961 = fma(_2959, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2945);
    int _2963 = as_type<int>(_2917) + (-2);
    float _2965 = as_type<float>(_2927) * _2951;
    float _2967 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2939);
    float _2969 = as_type<float>(_2941) * _2957;
    float _2971 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2973 = trunc(_2965);
    float _2975 = precise::max(_2973, 0.0);
    uint _2977 = uint(_2975);
    float _2979 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2981 = fma(_2933, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2983 = precise::clamp(_2981, 0.0, 1.0);
    float _2985 = float(uint(_2925));
    float _2987 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2971);
    int _2989 = ~_2757;
    int _2991 = _2989 + 1;
    float _2993 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2995 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2955);
    float _2997 = trunc(_2969);
    float _2999 = precise::max(_2997, 0.0);
    uint _3001 = uint(_2999);
    float _3003 = as_type<float>(_2963) * _2985;
    float _3005 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2979);
    float _3007 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2947);
    float _3009 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2961);
    int _3011 = as_type<int>(_2949) + (-2);
    float _3013 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3015 = trunc(_3003);
    float _3017 = precise::max(_3015, 0.0);
    uint _3019 = uint(_3017);
    int _3021 = abs(_2925);
    float _3023 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3025 = ~_2873;
    int _3027 = _3025 + 1;
    float _3029 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3013);
    int _3031 = ~_2827;
    int _3033 = _3031 + 1;
    float _3035 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3005);
    bool _3037 = !_2643;
    float _3039 = _3037 ? _189 : as_type<float>(_2743);
    float _3041 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3043 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2993);
    int _3045 = _2991 * int(_2977);
    int _3047 = _3045 + _2921;
    int _3049 = _3027 * int(_3001);
    int _3051 = _3049 + _2935;
    float _3053 = float(uint(_3047));
    float _3055 = float(uint(_3021));
    int _3057 = _3033 * int(_3019);
    int _3059 = _3057 + _2925;
    float _3061 = float(uint(_3051));
    float _3063 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3023);
    float _3065 = -_189;
    int _3067 = _2747 ? as_type<int>(_3065) : as_type<int>(_189);
    float _3069 = as_type<float>(_3011) * _3055;
    float _3071 = float(uint(_3059));
    float _3073 = as_type<float>(_2941) * _3061;
    float _3075 = as_type<float>(_2927) * _3053;
    float _3077 = trunc(_3069);
    float _3079 = precise::max(_3077, 0.0);
    uint _3081 = uint(_3079);
    float _3083 = -_199;
    int _3085 = _2387 ? as_type<int>(_3083) : as_type<int>(_199);
    float _3087 = as_type<float>(_2963) * _3071;
    float _3089 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2987);
    float _3091 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3007);
    bool _3093 = !_2495;
    float _3095 = _3093 ? _189 : as_type<float>(_3067);
    float _3097 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3099 = trunc(_3087);
    float _3101 = precise::max(_3099, 0.0);
    uint _3103 = uint(_3101);
    int _3105 = ~_2907;
    int _3107 = _3105 + 1;
    out.m_70.x = _3089;
    out.m_70.y = _3035;
    out.m_70.z = _3091;
    bool _3109 = !_2487;
    float _3111 = _3109 ? _199 : as_type<float>(_3085);
    float _3113 = fma(_2983, -2.0, 3.0);
    float _3115 = _2983 * _2983;
    float _3117 = -_199;
    int _3119 = _2713 ? as_type<int>(_3117) : as_type<int>(_199);
    int _3121 = _3107 * int(_3081);
    int _3123 = _3121 + _3021;
    float _3125 = trunc(_3073);
    float _3127 = precise::max(_3125, 0.0);
    uint _3129 = uint(_3127);
    float _3131 = _3115 * _3113;
    bool _3133 = !_2491;
    float _3135 = _3133 ? _199 : as_type<float>(_3119);
    float _3137 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3043);
    float _3139 = float(uint(_3123));
    float _3141 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3029);
    float _3143 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3063);
    float _3145 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3147 = trunc(_3075);
    float _3149 = precise::max(_3147, 0.0);
    uint _3151 = uint(_3149);
    float _3153 = as_type<float>(_3011) * _3139;
    float _3155 = _3041 * _3009;
    int _3157 = int(_3019) + int(_3103);
    float _3159 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3145);
    int _3161 = ~_2873;
    int _3163 = _3161 + 1;
    float _3165 = fma(_3097, _3091, _3155);
    int _3167 = ~_2827;
    int _3169 = _3167 + 1;
    float _3171 = trunc(_3153);
    float _3173 = precise::max(_3171, 0.0);
    uint _3175 = uint(_3173);
    int _3177 = int(_3001) + int(_3129);
    float _3179 = _3041 * _2967;
    int _3181 = ~_2907;
    int _3183 = _3181 + 1;
    int _3185 = _3169 * _3157;
    int _3187 = _3185 + _2925;
    float _3189 = _3041 * _2995;
    int _3191 = _3163 * _3177;
    int _3193 = _3191 + _2935;
    float _3195 = fma(_3097, _3089, _3179);
    int _3197 = int(_2977) + int(_3151);
    float _3199 = fma(_3097, _3035, _3189);
    bool _3201 = uint(_3187) >= uint(_2827);
    float _3203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3205 = ~_2757;
    int _3207 = _3205 + 1;
    float _3209 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3159);
    bool _3211 = uint(_3193) >= uint(_2873);
    float _3213 = -_3131;
    float _3215 = _3213 + 1.0;
    int _3217 = int(_3081) + int(_3175);
    int _3219 = _3207 * _3197;
    int _3221 = _3219 + _2921;
    bool _3223 = !_3201;
    int _3225 = _3223 ? 0 : (-1);
    float _3227 = fma(_3215, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3131);
    bool _3229 = _2827 == 0;
    int _3231 = _3183 * _3217;
    int _3233 = _3231 + _3021;
    int _3235 = ~_3157;
    int _3237 = _3235 + _3225;
    int _3239 = _3237 + 1;
    float _3241 = _3137 + _3195;
    int _3243 = _2921 ^ _2757;
    bool _3245 = uint(_3221) >= uint(_2757);
    int _3247 = _2827 * _3239;
    int _3249 = _3247 + _2925;
    bool _3251 = uint(_3233) >= uint(_2907);
    float _3253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3255 = !_3211;
    int _3257 = _3255 ? 0 : (-1);
    uint _3259 = uint(int(uint(_3243) >> uint(31)));
    bool _3261 = !_3245;
    int _3263 = _3261 ? 0 : (-1);
    int _3265 = ~_3257;
    int _3267 = _3177 + _3265;
    int _3269 = _3267 + 1;
    int _3271 = ~int(_3259);
    int _3273 = _3271 + 1;
    float _3275 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3277 = ~_3197;
    int _3279 = _3277 + _3263;
    int _3281 = _3279 + 1;
    int _3283 = _2925 ^ _2827;
    float _3285 = _3143 + _3165;
    int _3287 = _3269 ^ _3273;
    int _3289 = _2757 * _3281;
    int _3291 = _3289 + _2921;
    bool _3293 = _2827 == 0;
    float _3295 = _3203 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3297 = !_3251;
    int _3299 = _3297 ? 0 : (-1);
    float _3301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3303 = uint(int(uint(_3283) >> uint(31)));
    int _3305 = ~_3273;
    int _3307 = _3305 + _3287;
    int _3309 = _3307 + 1;
    float _3311 = fma(_3041, _3041, 1.0);
    bool _3313 = _2757 == 0;
    int _3315 = ~_3299;
    int _3317 = _3217 + _3315;
    int _3319 = _3317 + 1;
    float _3321 = _3141 + _3199;
    int _3323 = ~int(_3303);
    int _3325 = _3323 + 1;
    float _3327 = rsqrt(_3311);
    bool _3329 = _2757 == 0;
    bool _3331 = !_3313;
    int _3333 = _3331 ? _3291 : (-1);
    out.m_72.x = _3241;
    out.m_72.y = _3321;
    out.m_72.z = _3285;
    int _3335 = _3319 ^ _3325;
    float _3337 = _3301 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3339 = !_3229;
    int _3341 = _3339 ? _3249 : (-1);
    float _3343 = float(_3333);
    bool _3345 = !_3329;
    int _3347 = _3345 ? _3309 : (-1);
    int _3349 = ~_3325;
    int _3351 = _3349 + _3335;
    int _3353 = _3351 + 1;
    float _3355 = fma(_3295, _3343, _659);
    float _3357 = float(_3341);
    float _3359 = _3039 + 0.5;
    float _3361 = float(_3347);
    float _3363 = _3253 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3365 = !_3293;
    int _3367 = _3365 ? _3353 : (-1);
    float _3369 = fma(_3295, _3359, _3355);
    float _3371 = _3275 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3373 = fma(_3337, _3357, _959);
    float _3375 = float(_3367);
    float _3377 = -_625;
    float _3379 = fma(_3363, _3361, _3377);
    float _3381 = _3095 + 0.5;
    float _3383 = _3135 + (-0.5);
    float _3385 = _3041 * _3327;
    float _3387 = -_961;
    float _3389 = fma(_3371, _3375, _3387);
    float _3391 = fma(_3337, _3381, _3373);
    float _3393 = -_3363;
    float _3395 = fma(_3393, _3383, _3379);
    float _3397 = _3111 + (-0.5);
    float _3399 = -_951;
    float _3401 = _3399 + 1.0;
    float _3403 = -_3141;
    float _3405 = _3385 * _3403;
    float _3407 = -_3137;
    float _3409 = _3385 * _3407;
    float _3411 = -_3371;
    float _3413 = fma(_3411, _3397, _3389);
    float _3415 = -_3401;
    float _3417 = fma(_3095, _3415, _3391);
    float _3419 = fma(_3327, _2995, _3405);
    float _3421 = in.m_74.x;
    float _3423 = -_939;
    float _3425 = _3423 + 1.0;
    float _3427 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3209);
    bool _3429 = _2839 <= 8000.0;
    bool _3431 = isnan(_2839);
    bool _3433 = _3429 || _3431;
    bool _3435 = isnan(8000.0);
    bool _3437 = _3433 || _3435;
    float _3439 = float(_3437);
    float _3441 = -_3143;
    float _3443 = _3385 * _3441;
    float _3445 = fma(_3327, _2967, _3409);
    float _3447 = fma(_3111, _1820, _3413);
    float _3449 = -_3425;
    float _3451 = fma(_3039, _3449, _3369);
    float _3453 = _3439 * _3227;
    float _3455 = fma(_3327, _3009, _3443);
    float _3457 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3459 = fma(_3135, _1826, _3395);
    float _3461 = _3453 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3463 = _3427 + _1701;
    out.m_76.x = _3445;
    out.m_76.y = _3419;
    out.m_76.z = _3455;
    float _3465 = _2377 * _3461;
    float _3467 = precise::clamp(_3465, 0.0, 1.0);
    float _3469 = _3457 * _1781;
    float _3471 = _3463 * 0.5;
    out.gl_Position.x = _1747;
    out.gl_Position.y = _1761;
    out.gl_Position.z = _3427;
    out.gl_Position.w = _1701;
    bool _3473 = _1473 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3475 = isnan(_1473);
    bool _3477 = _3473 || _3475;
    bool _3479 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3481 = _3477 || _3479;
    out.m_78.x = _3451;
    out.m_78.y = _3459;
    out.m_78.z = _3417;
    out.m_78.w = _3447;
    float _3483 = _1802 * _3469;
    out.m_80.z = _3471;
    out.m_80.w = _1701;
    float _3485 = -_3467;
    float _3487 = fma(_3485, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3489 = _1792 * _3469;
    float _3491 = _3487 * _3421;
    float _3493 = -_3457;
    float _3495 = _3493 + 1.0;
    float _3497 = _3445;
    float _3499 = _3427;
    float _3501 = _3489;
    float _3503 = _3495;
    float _3505 = _3457;
    if (!_3481)
    {
        _3497 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3507 = _3497;
    float _3509 = fma(_1798, _3489, _1786);
    float _3511 = fma(_1800, _3489, _1788);
    float _3513 = _3491 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3515 = _1792 * _3495;
    float _3517 = fma(_1792, _3483, _1790);
    float _3519 = _3507;
    float _3521 = _3507;
    if (!_3481)
    {
        _1836 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3523 = _1836;
    out.m_82.x = _3513;
    float _3525 = _3523;
    float _3527 = _3523;
    if (!_3481)
    {
        _3499 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3529 = _3499;
    float _3531 = _3529;
    float _3533 = _3529;
    if (!_3481)
    {
        _3501 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3535 = _3501;
    out.m_84.x = _3509;
    out.m_84.y = _3511;
    out.m_84.z = _3517;
    out.m_84.w = _3515;
    float _3537 = _3535;
    float _3539 = _3535;
    if (!_3481)
    {
        _3503 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3541 = _3503;
    float _3543 = _3541;
    float _3545 = _3541;
    if (!_3481)
    {
        _3505 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3547 = _3505;
    bool _3549 = !_3481;
    float _3551 = _3547;
    float _3553 = _3547;
    if (!_3549)
    {
        bool _3555 = _1473 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3557 = isnan(_1473);
        bool _3559 = _3555 || _3557;
        bool _3561 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3563 = _3559 || _3561;
        if (!_3563)
        {
            float _3565 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3567 = _1473 + _3565;
            float _3569 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3571 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3569;
            float _3573 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3575 = _3573 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3577 = 1.0 / _3571;
            float _3579 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3581 = _3579 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3583 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3585 = _3583 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3587 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3589 = _3587 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3591 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3593 = _3591 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3595 = _3567 * _3577;
            float _3597 = precise::clamp(_3595, 0.0, 1.0);
            float _3599 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3601 = _3599 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3603 = fma(_3597, _3575, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3605 = fma(_3597, _3601, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3607 = fma(_3597, _3581, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3609 = fma(_3597, _3585, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3611 = fma(_3597, _3589, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3613 = fma(_3597, _3593, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3527 = _3607;
            _3545 = _3611;
            _3521 = _3603;
            _3539 = _3609;
            _3533 = _3605;
            _3553 = _3613;
            _3615 = true;
        }
        else
        {
            bool _3617 = _1473 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3619 = isnan(_1473);
            bool _3621 = _3617 || _3619;
            bool _3623 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3625 = _3621 || _3623;
            if (!_3625)
            {
                _3519 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3627 = _3519;
            _3521 = _3627;
            if (!_3625)
            {
                _3525 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3629 = _3525;
            _3527 = _3629;
            if (!_3625)
            {
                _3531 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3631 = _3531;
            _3533 = _3631;
            if (!_3625)
            {
                _3537 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3633 = _3537;
            _3539 = _3633;
            if (!_3625)
            {
                _3543 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3635 = _3543;
            _3545 = _3635;
            if (!_3625)
            {
                _3551 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3637 = _3551;
            bool _3639 = !_3625;
            _3553 = _3637;
            if (!_3639)
            {
                bool _3641 = _1473 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3643 = isnan(_1473);
                bool _3645 = _3641 || _3643;
                bool _3647 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3649 = _3645 || _3647;
                if (!_3649)
                {
                    float _3651 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3653 = _1473 + _3651;
                    float _3655 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3657 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3655;
                    float _3659 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3661 = _3659 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3663 = 1.0 / _3657;
                    float _3665 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3667 = _3665 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3669 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3671 = _3669 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3673 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3675 = _3673 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3677 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3679 = _3677 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3681 = _3653 * _3663;
                    float _3683 = precise::clamp(_3681, 0.0, 1.0);
                    float _3685 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3687 = _3685 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3689 = fma(_3683, _3661, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3691 = fma(_3683, _3687, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3693 = fma(_3683, _3667, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3695 = fma(_3683, _3671, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3697 = fma(_3683, _3675, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3699 = fma(_3683, _3679, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3527 = _3693;
                    _3545 = _3697;
                    _3521 = _3689;
                    _3539 = _3695;
                    _3533 = _3691;
                    _3553 = _3699;
                    _3615 = true;
                }
                else
                {
                    _3527 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3545 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3521 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3539 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3533 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3553 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3615 = false;
    float _3701 = _3527;
    float _3703 = _3545;
    float _3705 = _3521;
    float _3707 = _3539;
    float _3709 = _3533;
    float _3711 = _3553;
    float _3713 = fma(_3321, -0.5, 0.5);
    float _3715 = precise::clamp(_3713, 0.0, 1.0);
    float _3717 = -_3701;
    float _3719 = _3717 + _3703;
    float _3721 = -_3705;
    float _3723 = _3721 + _3707;
    float _3725 = -_3709;
    float _3727 = _3725 + _3711;
    bool _3729 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3731 = fma(_3715, _3719, _3701);
    float _3733 = fma(_3715, _3723, _3705);
    float _3735 = fma(_3715, _3727, _3709);
    float _3737 = _3731 * 0.586610972881317138671875;
    out.m_86.x = 0.0;
    float _3739 = fma(_3733, 0.298911988735198974609375, _3737);
    float _3741 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3743 = fma(_3735, 0.114477999508380889892578125, _3739);
    out.m_49.x = _3741;
    float _3745 = -_3743;
    float _3747 = _3733 + _3745;
    float _3749 = -_3743;
    float _3751 = _3731 + _3749;
    float _3753 = -_3743;
    float _3755 = _3735 + _3753;
    float _3757 = fma(_3747, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3743);
    float _3759 = fma(_3751, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3743);
    float _3761 = fma(_3755, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3743);
    out.m_88.x = _3757;
    out.m_88.y = _3759;
    out.m_88.z = _3761;
    if (!_3729)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3763 = -_1445;
    float _3765 = _3763 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3767 = -_1447;
    float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3771 = -_1449;
    float _3773 = _3771 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3775 = _3765 * _3765;
    float _3777 = fma(_3769, _3769, _3775);
    float _3779 = fma(_3773, _3773, _3777);
    float _3781 = sqrt(_3779);
    float _3783 = rsqrt(_3779);
    float _3785 = -_3781;
    float _3787 = _3785 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3789 = _3787 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3791 = precise::clamp(_3789, 0.0, 1.0);
    float _3793 = _3769 * _3783;
    float _3795 = _3765 * _3783;
    float _3797 = abs(_3791);
    float _3799 = log2(_3797);
    float _3801 = _3773 * _3783;
    float _3803 = _3793 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3805 = _3321 * _3795;
    float _3807 = -_3795;
    float _3809 = -_3803;
    float _3811 = fma(_3807, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3809);
    float _3813 = fma(_3241, _3793, _3805);
    float _3815 = -_3801;
    float _3817 = fma(_3815, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3811);
    float _3819 = fma(_3285, _3801, _3813);
    float _3821 = precise::clamp(_3819, 0.0, 1.0);
    float _3823 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3825 = _3817 + _3823;
    float _3827 = _3799 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3829 = _3825 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3831 = precise::clamp(_3829, 0.0, 1.0);
    float _3833 = exp2(_3827);
    float _3835 = _3833 * _3831;
    float _3837 = _3821 * _3835;
    float _3839 = _3837 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3841 = _3837 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3843 = _3837 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3839;
    out.m_86.y = _3841;
    out.m_86.z = _3843;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

