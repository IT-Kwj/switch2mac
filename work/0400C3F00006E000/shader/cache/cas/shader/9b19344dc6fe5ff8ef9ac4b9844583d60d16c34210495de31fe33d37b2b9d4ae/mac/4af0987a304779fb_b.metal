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
    constant _16* vp_c13 [[id(7)]];
    texture2d<float> vp_t_tcb_C [[id(8)]];
    sampler vp_t_tcb_CSmplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_89 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 m_87 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_83 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_57 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _102(thread const int& _6050, thread const int& _6051, constant _10& support_buffer)
{
    float _6054 = as_type<float>(support_buffer._m4);
    int _6056 = _6051 + as_type<int>(_6054);
    int _6058 = 1 + _6056;
    float _6060 = support_buffer._m5[_6058].x;
    float _6062 = abs(_6060);
    bool _6064 = _6062 == 1.0;
    if (_6064)
    {
        return _6050;
    }
    float _6066 = float(_6050);
    float _6068 = _6066 / _6062;
    int _6070 = int(_6068);
    return _6070;
}

static inline __attribute__((always_inline))
int _103(thread const int& _6100, thread const int& _6101, constant _10& support_buffer)
{
    float _6104 = as_type<float>(support_buffer._m4);
    int _6106 = _6101 + as_type<int>(_6104);
    int _6108 = 1 + _6106;
    float _6110 = support_buffer._m5[_6108].x;
    bool _6112 = _6110 == 1.0;
    if (_6112)
    {
        return _6100;
    }
    float _6114 = float(_6100);
    float _6116 = _6114 * _6110;
    int _6118 = int(_6116);
    return _6118;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2106 = false;
    bool _1471 = false;
    bool _309 = false;
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
        float _2391 = as_type<float>(_127);
        out.gl_Position.z = _2391;
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
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_111);
        _121 = _149;
    }
    float _151 = _121;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2461 = as_type<float>(_165);
        out.gl_Position.z = _2461;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = in.m_55.w;
    float _169 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _171 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _173 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _175 = _171 || _173;
    bool _177 = isnan(1.0);
    bool _179 = _175 || _177;
    float _181 = in.m_53.x;
    float _183 = in.m_53.y;
    float _185 = in.m_53.z;
    float _187 = in.m_48.x;
    float _189 = in.m_48.y;
    float _191 = in.m_48.z;
    float _193 = 0.0;
    float _195 = _169;
    if (!_179)
    {
        float _197 = _169 * _169;
        float _199 = _197 * 0.5;
        _193 = _199;
    }
    float _201 = _193;
    float _203 = _201;
    if (!_179)
    {
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _205;
    }
    float _207 = _203;
    bool _209 = !_179;
    float _211 = _207;
    if (!_209)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _169 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _169);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _241;
    }
    float _243 = _211;
    bool _245 = !_179;
    if (!_245)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _169 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _195 = _265;
    }
    float _267 = _195;
    bool _269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _271 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _273 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _275 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _277 = fma(_267, _181, _271);
    float _279 = fma(_267, _183, _273);
    float _281 = fma(_267, _185, _275);
    float _283 = fma(_277, _167, _187);
    float _285 = fma(_279, _167, _189);
    float _287 = fma(_281, _167, _191);
    bool _289 = !_269;
    float _307;
    if (!_289)
    {
        float _291 = in.m_57.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        float _311 = float(_111);
        float _313 = 1.0 / _311;
        float _315 = _145 * _313;
        _307 = _315;
    }
    _309 = false;
    float _317 = _307;
    int _319 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _321 = _319;
    int _323 = 0;
    int _325 = _102(_321, _323, (*spvDescriptorSet0.support_buffer));
    float _327 = in.m_57.x;
    float _329 = in.m_59.z;
    float _331 = _327 * 8.0;
    float _333 = rint(_331);
    float _335 = _333 * 0.125;
    float _337 = precise::clamp(_335, 0.0, 1.0);
    int _339 = _325 + (-1);
    float _341 = float(_339);
    float _343 = _337 * _341;
    float _345 = trunc(_329);
    int _347 = int(_345);
    float _349 = trunc(_343);
    int _351 = int(_349);
    int _353 = _351 + 1;
    int _355 = min(_339, _353);
    int _357 = _351;
    int _359 = 0;
    int _361 = _103(_357, _359, (*spvDescriptorSet0.support_buffer));
    int _363 = _347;
    int _365 = 0;
    int _367 = _103(_363, _365, (*spvDescriptorSet0.support_buffer));
    float3 _371 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_361, _367)), 0).xyz;
    float _373 = _371.x;
    float _375 = _371.y;
    float _377 = _371.z;
    int _379 = _355;
    int _381 = 0;
    int _383 = _103(_379, _381, (*spvDescriptorSet0.support_buffer));
    int _385 = _347;
    int _387 = 0;
    int _389 = _103(_385, _387, (*spvDescriptorSet0.support_buffer));
    float3 _391 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_383, _389)), 0).xyz;
    float _393 = _391.x;
    float _395 = _391.y;
    float _397 = _391.z;
    float _399 = in.m_57.w;
    float _401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _403 = in.m_59.y;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _407 = _405 != 0;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _411 = _409 != 0;
    float _413 = in.m_57.y;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _417 = _415 != 0;
    float _419 = in.m_57.z;
    float _421 = _285 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _425 = _423 != 0;
    float _427 = _285 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _431 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[5].x, _421);
    float _433 = _327 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _437 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[5].z, _431);
    float _439 = -_429;
    float _441 = fma(_433, 2.0, _439);
    float _443 = in.m_59.x;
    bool _445 = _399 > 0.5;
    float _447 = _285 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _449 = -_403;
    float _451 = _449 + 1.0;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _453;
    float _457 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[4].x, _447);
    float _459 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[6].x, _427);
    int _461 = _445 ? as_type<int>(_451) : as_type<int>(_403);
    float _463 = _413 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _475 = _473 != 0;
    float _477 = _419 * 2.0;
    float _479 = fma(_463, -2.0, _435);
    float _481 = 1.0 / _455;
    float _483 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[4].z, _457);
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _491 = _417 ? as_type<float>(_461) : _403;
    float _493 = _485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _495 = _487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _499 = floor(_477);
    bool _501 = _413 > 0.5;
    float _503 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[6].z, _459);
    float _505 = _413 + _419;
    out.m_61.x = _497;
    out.m_61.y = _493;
    out.m_61.z = _495;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _509 = _317 + _507;
    float _511 = _403;
    int _513 = as_type<int>(_479);
    float _515 = _343;
    if (_425)
    {
        float _517 = _501 ? _451 : _403;
        _511 = _517;
    }
    float _519 = _511;
    float _521 = _327 * 2.0;
    float _523 = _505 + (-1.0);
    float _525 = _509 * _481;
    float _527 = _413 * 2.0;
    float _529 = floor(_521);
    float _531 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _533 = -_145;
    float _535 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[76].x, _441);
    float _537 = _327 + _419;
    bool _539 = _499 > 0.0;
    float _541 = _327 + _413;
    float _543 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _545 = log2(_543);
    bool _547 = _499 >= 0.0;
    bool _549 = isnan(_499);
    bool _551 = _547 || _549;
    bool _553 = isnan(0.0);
    bool _555 = _551 || _553;
    float _557 = _537 + (-1.0);
    float _559 = _541 + (-1.0);
    bool _561 = !_467;
    int _563 = _561 ? 0 : 1;
    float _565 = _483 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _567 = _555 ? 0 : 1;
    float _569 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _571 = floor(_527);
    float _573 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _575 = ~_567;
    int _577 = _575 + 1;
    int _579 = _577 + 1;
    float _581 = _503 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _583 = _579;
    float _585 = _519;
    float _587 = _581;
    if (!_539)
    {
        int _589 = ~_567;
        int _591 = _589 + 1;
        _583 = _591;
    }
    int _593 = _583;
    float _595 = _437 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _597 = _545 * _145;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _599;
    bool _603 = _529 >= 0.0;
    bool _605 = isnan(_529);
    bool _607 = _603 || _605;
    bool _609 = isnan(0.0);
    bool _611 = _607 || _609;
    float _613 = exp2(_597);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _619;
    float _623 = fma(_601, _525, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _625 = _611 ? 0 : 1;
    float _627 = fma(_617, _525, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _629 = fma(_621, _525, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _631 = _571 > 0.0;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _635 = 1.0 + _633;
    bool _637 = _571 >= 0.0;
    bool _639 = isnan(_571);
    bool _641 = _637 || _639;
    bool _643 = isnan(0.0);
    bool _645 = _641 || _643;
    float _647 = 1.0 / _635;
    bool _649 = !_471;
    int _651 = _649 ? 0 : 1;
    float _653 = -_613;
    float _655 = _653 + 1.0;
    bool _657 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _659 = isnan(0.0);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _665 = _661 || _663;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _669 = _529 > 0.0;
    float _671 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[78].z, _667);
    float _673 = _665 ? _655 : 0.0;
    bool _675 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _677 = isnan(_317);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _689 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _691 = isnan(1.0);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _697 = _693 || _695;
    float _699 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _671);
    bool _701 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _703 = isnan(_317);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[78].w, _687);
    float _715 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _479);
    float _717 = _667;
    bool _719 = _697;
    bool _721 = _669;
    if (_407)
    {
        float _723 = -_443;
        float _725 = _723 + 1.0;
        _513 = as_type<int>(_725);
    }
    int _727 = _513;
    int _729 = abs(_651);
    float _731 = -_711;
    float _733 = _731 + 1.0;
    float _735 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _713);
    int _737 = abs(_563);
    float _739 = _401 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _741 = _685 * _733;
    int _743 = _729;
    if (!_407)
    {
        _717 = _443;
    }
    float _745 = _717;
    float _747 = _745;
    if (_697)
    {
        float _749 = _673 * _647;
        _147 = _749;
    }
    float _751 = _147;
    if (_407)
    {
        bool _753 = _327 > 0.5;
        _719 = _753;
    }
    bool _755 = _719;
    float _757 = _627 * _741;
    float _759 = _629 * _741;
    float _761 = _623 * _741;
    float _763 = float(_737);
    float _765 = in.m_63.x;
    float _767 = in.m_63.y;
    float _769 = in.m_63.z;
    float _771 = float(_593);
    float _773 = fma(_739, _519, -0.5);
    if (_407)
    {
        float _775 = _755 ? as_type<float>(_727) : _443;
        _747 = _775;
    }
    float _777 = _747;
    float _779 = _327 + (-0.5);
    int _781 = ~_625;
    int _783 = _781 + 1;
    int _785 = _783 + 1;
    float _787 = _763 * _771;
    int _789 = _785;
    if (_411)
    {
        float _791 = -_443;
        float _793 = _791 + 1.0;
        _743 = as_type<int>(_793);
    }
    int _795 = _743;
    if (!_669)
    {
        int _797 = ~_625;
        int _799 = _797 + 1;
        _789 = _799;
    }
    int _801 = _789;
    float _803 = -_715;
    float _805 = fma(_735, _773, _803);
    if (_411)
    {
        bool _807 = _419 > 0.5;
        _721 = _807;
    }
    bool _809 = _721;
    float _811 = _413 + (-0.5);
    if (!_411)
    {
        _585 = _443;
    }
    float _813 = _585;
    float _815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _817 = _813;
    if (_411)
    {
        float _819 = _809 ? as_type<float>(_795) : _443;
        _817 = _819;
    }
    float _821 = _817;
    float _823 = _787 * (-2.0);
    float _825 = float(_729);
    float _827 = _419 + (-0.5);
    float _829 = float(_801);
    float _831 = fma(_573, _823, _573);
    int _833 = _645 ? 0 : 1;
    float _835 = fma(_823, _765, _765);
    float _837 = _825 * _829;
    int _839 = ~_833;
    int _841 = _839 + 1;
    int _843 = _841 + 1;
    float _845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _847 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[196].x, _835);
    bool _849 = !_475;
    int _851 = _849 ? 0 : 1;
    int _853 = _843;
    if (!_631)
    {
        int _855 = ~_833;
        int _857 = _855 + 1;
        _853 = _857;
    }
    int _859 = _853;
    float _861 = _837 * (-2.0);
    int _863 = abs(_851);
    float _865 = fma(_831, _751, _847);
    float _867 = float(_859);
    float _869 = fma(_531, _861, _531);
    float _871 = fma(_861, _767, _767);
    float _873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _875 = -_685;
    float _877 = _875 + 1.0;
    float _879 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[196].y, _871);
    float _881 = float(_863);
    float _883 = _865 * 0.15915493667125701904296875;
    float _885 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[143].x, _757);
    float _887 = fma(_869, _751, _879);
    float _889 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[143].y, _759);
    float _891 = _881 * _867;
    float _893 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[143].z, _761);
    float _895 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[144].x, _885);
    float _897 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[144].y, _889);
    float _899 = _891 * (-2.0);
    float _901 = _815 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _903 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[144].z, _893);
    float _905 = _491 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _907 = fma(_899, _769, _769);
    float _909 = fma(_569, _899, _569);
    float _911 = fma(_901, _777, -0.5);
    float _913 = _883 * 6.283185482025146484375;
    float _915 = sin(_913);
    float _917 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[196].z, _907);
    float _919 = _887 * 0.15915493667125701904296875;
    float _921 = in.m_55.x;
    float _923 = in.m_55.y;
    float _925 = in.m_55.z;
    float _927 = fma(_699, _911, _535);
    float _929 = fma(_909, _751, _917);
    float _931 = _905 * _873;
    float _933 = _883 * 6.283185482025146484375;
    float _935 = cos(_933);
    float _937 = _821 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _943 = _937 * _845;
    float _945 = _919 * 6.283185482025146484375;
    float _947 = sin(_945);
    float _949 = _929 * 0.15915493667125701904296875;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _953 = in.m_65.x;
    float _955 = in.m_65.y;
    float _957 = in.m_65.z;
    float _959 = in.m_65.w;
    float _961 = _939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _963 = _941 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _965 = _951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _967 = _927 + 0.5;
    float _969 = _919 * 6.283185482025146484375;
    float _971 = cos(_969);
    float _973 = _805 + 0.5;
    float _975 = _897 * _923;
    float _977 = _895 * _921;
    out.m_67.x = _963;
    out.m_67.y = _965;
    out.m_67.z = _961;
    float _979 = _903 * _925;
    float _981 = _949 * 6.283185482025146484375;
    float _983 = cos(_981);
    float _985 = _935 * _947;
    out.m_69.x = _967;
    out.m_69.y = _973;
    out.m_69.z = _943;
    out.m_69.w = _931;
    float _987 = _979 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _989 = _949 * 6.283185482025146484375;
    float _991 = sin(_989);
    float _993 = _935 * _971;
    float _995 = _915 * _971;
    float _997 = floor(_343);
    float _999 = _935 * _983;
    float _1001 = _915 * _947;
    float _1003 = _971 * _983;
    float _1005 = _915 * _983;
    float _1007 = _999 * _955;
    float _1009 = _947 * _983;
    float _1011 = fma(_991, _993, _1001);
    float _1013 = -_955;
    float _1015 = _991 * _1013;
    float _1017 = -_995;
    float _1019 = fma(_991, _985, _1017);
    float _1021 = fma(_991, _1001, _993);
    float _1023 = fma(_1011, _953, _1007);
    float _1025 = fma(_1003, _953, _1015);
    float _1027 = -_985;
    float _1029 = fma(_991, _995, _1027);
    float _1031 = _1005 * _955;
    float _1033 = fma(_1019, _957, _1023);
    float _1035 = -_997;
    float _1037 = _343 + _1035;
    float _1039 = fma(_1009, _957, _1025);
    float _1041 = _1033 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1043 = _1033 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1045 = _1033 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1047 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1041);
    float _1049 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1043);
    float _1051 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1045);
    float _1053 = fma(_1029, _953, _1031);
    float _1055 = -_375;
    float _1057 = _1055 + _395;
    float _1059 = -_373;
    float _1061 = _1059 + _393;
    float _1063 = fma(_1037, _1057, _375);
    float _1065 = -_377;
    float _1067 = _1065 + _397;
    float _1069 = fma(_1037, _1061, _373);
    float _1071 = in.m_71.x;
    float _1073 = in.m_71.y;
    float _1075 = in.m_71.z;
    float _1077 = fma(_1021, _957, _1053);
    float _1079 = fma(_1037, _1067, _377);
    bool _1081 = _1063 != 0.0;
    bool _1083 = isnan(_1063);
    bool _1085 = _1081 || _1083;
    bool _1087 = isnan(0.0);
    bool _1089 = _1085 || _1087;
    float _1091 = fma(_1077, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1049);
    float _1093 = _975 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1095 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1063);
    bool _1097 = _1069 == 0.0;
    bool _1099 = !_1089;
    bool _1101 = _1097 && _1099;
    float _1103 = fma(_1077, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1047);
    float _1105 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1079);
    float _1107 = _977 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1109 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1069);
    float _1111 = _1095 * _1093;
    bool _1113 = _1079 == 0.0;
    bool _1115 = _1113 && _1101;
    float _1117 = _1105 * _987;
    float _1119 = _1109 * _1107;
    float _1121 = _999 * _1111;
    float _1123 = -_1111;
    float _1125 = _991 * _1123;
    float _1127 = fma(_1077, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1051);
    float _1129 = _1005 * _1111;
    float _1131 = fma(_1011, _1119, _1121);
    float _1133 = fma(_1003, _1119, _1125);
    out.m_73.x = _1103;
    out.m_73.y = _1091;
    out.m_73.z = _1127;
    float _1135 = fma(_1019, _1117, _1131);
    float _1137 = fma(_1029, _1119, _1129);
    float _1139 = _983;
    float _1141 = _1125;
    float _1143 = _1133;
    float _1145 = _1117;
    if (_1115)
    {
        _515 = _1071;
    }
    float _1147 = _515;
    float _1149 = _1135 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1151 = _1147;
    if (_1115)
    {
        _1139 = _1073;
    }
    float _1153 = _1139;
    float _1155 = _1153;
    if (_1115)
    {
        _1141 = _1147;
    }
    float _1157 = _1141;
    float _1159 = _1157;
    if (!_1115)
    {
        _1151 = _1071;
    }
    float _1161 = _1151;
    float _1163 = fma(_1021, _1117, _1137);
    float _1165 = fma(_1009, _1117, _1133);
    float _1167 = _1135 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1169 = _1165;
    if (_1115)
    {
        _1143 = _1075;
    }
    float _1171 = _1143;
    float _1173 = _1171;
    if (!_1115)
    {
        float _1175 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1161);
        _1159 = _1175;
    }
    float _1177 = _1159;
    float _1179 = fma(_1165, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1149);
    float _1181 = fma(_1165, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1167);
    float _1183 = _1179;
    if (_1115)
    {
        _1145 = _1171;
    }
    float _1185 = _1145;
    float _1187 = _957 * _1161;
    float _1189 = fma(_1163, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1179);
    float _1191 = fma(_1163, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1181);
    float _1193 = _1185;
    if (_1115)
    {
        _1183 = _1153;
    }
    float _1195 = _1183;
    float _1197 = _581 + _1189;
    float _1199 = _565 + _1191;
    float _1201 = _1195;
    float _1203 = _1197;
    float _1205 = _1199;
    if (!_1115)
    {
        _1155 = _1073;
    }
    float _1207 = _1155;
    if (!_1115)
    {
        _1173 = _1075;
    }
    float _1209 = _1173;
    float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1213 = _1199 + _1211;
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1217 = _1197 + _1215;
    if (!_1115)
    {
        float _1219 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1207);
        _1201 = _1219;
    }
    float _1221 = _1201;
    float _1223 = _1213 * _1213;
    float _1225 = _1217 * _1217;
    float _1227 = _1223;
    float _1229 = _1225;
    if (!_1115)
    {
        float _1231 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1209);
        _1193 = _1231;
    }
    float _1233 = _1193;
    float _1235 = _955 * _1209;
    float _1237 = -_1187;
    float _1239 = fma(_953, _1209, _1237);
    float _1241 = _1223 + _1225;
    float _1243 = _953 * _1207;
    float _1245 = -_1235;
    float _1247 = fma(_957, _1207, _1245);
    float _1249 = _1135 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1251 = sqrt(_1241);
    float _1253 = -_1221;
    float _1255 = _991 * _1253;
    float _1257 = _999 * _1221;
    float _1259 = _1005 * _1221;
    float _1261 = -_1243;
    float _1263 = fma(_955, _1161, _1261);
    float _1265 = _1239 * _959;
    float _1267 = fma(_1165, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1249);
    float _1269 = fma(_1003, _1177, _1255);
    float _1271 = fma(_1011, _1177, _1257);
    float _1273 = fma(_1029, _1177, _1259);
    float _1275 = _1247 * _959;
    float _1277 = -_1265;
    float _1279 = _991 * _1277;
    float _1281 = _999 * _1265;
    float _1283 = _1005 * _1265;
    float _1285 = fma(_1163, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1267);
    float _1287 = fma(_1003, _1275, _1279);
    bool _1289 = _1251 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1291 = fma(_1011, _1275, _1281);
    float _1293 = fma(_1029, _1275, _1283);
    float _1295 = _595 + _1285;
    float _1297 = _1263 * _959;
    float _1299 = fma(_1009, _1233, _1269);
    float _1301 = fma(_1019, _1233, _1271);
    float _1303 = fma(_1021, _1233, _1273);
    float _1305 = fma(_1009, _1297, _1287);
    float _1307 = fma(_1019, _1297, _1291);
    float _1309 = fma(_1021, _1297, _1293);
    if (!_1289)
    {
        _1169 = _1295;
    }
    float _1311 = _1169;
    bool _1313 = !_1289;
    float _1315 = _1311;
    if (!_1313)
    {
        float _1317 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1319 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1321 = _1251 + _1319;
        float _1323 = rsqrt(_1241);
        float _1325 = _1321 * _1317;
        float _1327 = _1295 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1329 = _1325 * 0.15915493667125701904296875;
        float _1331 = _1329 * 6.283185482025146484375;
        float _1333 = sin(_1331);
        float _1335 = _1329 * 6.283185482025146484375;
        float _1337 = cos(_1335);
        float _1339 = fma(_1333, _1327, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1341 = _1323 * _1339;
        float _1343 = fma(_1213, _1341, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1345 = _1337 + (-1.0);
        float _1347 = fma(_1217, _1341, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1349 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1351 = _1343 + _1349;
        float _1353 = _1345 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1357 = _1347 + _1355;
        float _1359 = _1351 * _1351;
        float _1361 = fma(_1295, _1337, _1353);
        float _1363 = _1357 * _1357;
        _1315 = _1361;
        _1227 = _1359;
        _1229 = _1363;
        _1203 = _1347;
        _1205 = _1343;
    }
    float _1365 = _1315;
    float _1367 = _1227;
    float _1369 = _1229;
    float _1371 = _1203;
    float _1373 = _1205;
    float _1375 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1377 = _1365 + _1375;
    float _1379 = _1307 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1381 = _1307 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1383 = _1307 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1385 = fma(_1377, _1377, _1367);
    float _1387 = _1301 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1389 = _1301 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1391 = _1301 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1393 = _1385 + _1369;
    float _1395 = fma(_1305, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1379);
    float _1397 = fma(_1305, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1381);
    float _1399 = fma(_1305, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1383);
    float _1401 = fma(_1299, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1387);
    float _1403 = fma(_1299, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1389);
    float _1405 = sqrt(_1393);
    float _1407 = fma(_1299, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1391);
    float _1409 = fma(_1309, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1397);
    float _1411 = fma(_1303, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1401);
    float _1413 = fma(_1303, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1403);
    float _1415 = fma(_1309, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1395);
    float _1417 = fma(_1309, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1399);
    float _1419 = fma(_1303, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1407);
    out.m_75.x = _1409;
    out.m_75.y = _1415;
    out.m_75.z = _1417;
    out.m_77.x = _1411;
    out.m_77.y = _1413;
    out.m_77.z = _1419;
    bool _1421 = _1405 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1423 = isnan(_1405);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1429 = _1425 || _1427;
    float _1431 = _1401;
    float _1433 = _1417;
    float _1435 = _1415;
    if (!_1429)
    {
        _1431 = 1.0;
    }
    float _1437 = _1431;
    bool _1439 = !_1429;
    float _1441 = _1437;
    if (!_1439)
    {
        bool _1443 = _1405 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1445 = isnan(_1405);
        bool _1447 = _1443 || _1445;
        bool _1449 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1451 = _1447 || _1449;
        if (!_1451)
        {
            float _1453 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1455 = _1405 + _1453;
            float _1457 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1459 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1457;
            float _1461 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1463 = _1461 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1465 = 1.0 / _1459;
            float _1467 = _1455 * _1465;
            float _1469 = fma(_1467, _1463, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1441 = _1469;
            _1433 = _1463;
            _1471 = true;
        }
        else
        {
            bool _1473 = _1405 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1475 = isnan(_1405);
            bool _1477 = _1473 || _1475;
            bool _1479 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1481 = _1477 || _1479;
            if (!_1481)
            {
                float _1483 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1485 = _1405 + _1483;
                float _1487 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1489 = _1487 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1491 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1493 = _1491 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1495 = 1.0 / _1489;
                float _1497 = _1485 * _1495;
                float _1499 = fma(_1497, _1493, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1441 = _1499;
                _1433 = _1493;
                _1471 = true;
            }
            else
            {
                _1441 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1471 = false;
    float _1501 = _1441;
    float _1503 = _1433;
    float _1505 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1507 = _1365 + _1505;
    float _1509 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1511 = _1371 + _1509;
    bool _1513 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1517 = _1513 || _1515;
    bool _1519 = isnan(0.5);
    bool _1521 = _1517 || _1519;
    float _1523 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1525 = _1373 + _1523;
    float _1527 = fma(_1507, _1501, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1529 = fma(_1511, _1501, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1531 = fma(_1525, _1501, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1533 = _1525;
    float _1535 = _1503;
    if (_1521)
    {
        _1533 = _1531;
    }
    float _1537 = _1533;
    float _1539 = _1537;
    if (_1521)
    {
        _1435 = _1527;
    }
    float _1541 = _1435;
    float _1543 = _1541;
    if (_1521)
    {
        _1535 = _1529;
    }
    float _1545 = _1535;
    float _1547 = _1545;
    if (!_1521)
    {
        float _1549 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1551 = _595 + _1549;
        float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1555 = _565 + _1553;
        float _1557 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1559 = _1551 * _1551;
        float _1561 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1563 = _581 + _1561;
        float _1565 = fma(_1555, _1555, _1559);
        float _1567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1569 = fma(_1563, _1563, _1565);
        float _1571 = sqrt(_1569);
        float _1573 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1575 = -_581;
        float _1577 = _1575 + _1529;
        float _1579 = precise::min(_1571, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1581 = _1579 * _1567;
        float _1583 = -_565;
        float _1585 = _1583 + _1531;
        float _1587 = -_595;
        float _1589 = _1587 + _1527;
        float _1591 = _1573 * _1581;
        float _1593 = fma(_1585, _1591, _565);
        float _1595 = fma(_1589, _1591, _595);
        float _1597 = fma(_1577, _1591, _581);
        _1543 = _1595;
        _1539 = _1593;
        _1547 = _1597;
    }
    float _1599 = _1543;
    float _1601 = _1539;
    float _1603 = _1547;
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1607 = _1599 + _1605;
    float _1609 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1611 = _1601 + _1609;
    float _1613 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1615 = _1603 + _1613;
    float _1617 = _1607 * _1607;
    float _1619 = fma(_1611, _1611, _1617);
    float _1621 = fma(_1615, _1615, _1619);
    float _1623 = rsqrt(_1621);
    float _1625 = _1623 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1627 = _1611 * _1625;
    float _1629 = _1615 * _1625;
    float _1631 = _1627 * _1627;
    float _1633 = _1629 * _1629;
    float _1635 = _1631 + _1633;
    float _1637 = sqrt(_1635);
    bool _1639 = _1637 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1641 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1643 = _1637 + _1641;
    float _1645 = _1405;
    float _1647 = _1635;
    float _1649 = _1643;
    float _1651 = _1607;
    float _1653 = _1625;
    float _1655 = _1627;
    if (_1639)
    {
        float _1657 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1645 = _1657;
    }
    float _1659 = _1645;
    if (_1639)
    {
        float _1661 = rsqrt(_1635);
        _1647 = _1661;
    }
    float _1663 = _1647;
    float _1665 = _1659;
    float _1667 = _1663;
    if (_1639)
    {
        float _1669 = _1643 * _1659;
        _1649 = _1669;
    }
    float _1671 = _1649;
    if (_1639)
    {
        float _1673 = _1671 * 0.15915493667125701904296875;
        _587 = _1673;
    }
    float _1675 = _587;
    float _1677 = _1615;
    if (_1639)
    {
        float _1679 = _1675 * 6.283185482025146484375;
        float _1681 = sin(_1679);
        _1677 = _1681;
    }
    float _1683 = _1677;
    float _1685 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1687 = precise::max(0.0, _1685);
    float _1689 = _1407;
    float _1691 = _1687;
    if (_1639)
    {
        float _1693 = _1675 * 6.283185482025146484375;
        float _1695 = cos(_1693);
        _1689 = _1695;
    }
    float _1697 = _1689;
    float _1699 = -_1625;
    float _1701 = -_1687;
    float _1703 = fma(_1607, _1699, _1701);
    if (_1639)
    {
        float _1705 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1651 = _1705;
    }
    float _1707 = _1651;
    float _1709 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1711 = _1683;
    float _1713 = _1707;
    if (_1639)
    {
        float _1715 = fma(_1683, _1707, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1711 = _1715;
    }
    float _1717 = _1711;
    float _1719 = _1717;
    if (!_1639)
    {
        _1713 = _1629;
    }
    float _1721 = _1713;
    float _1723 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1709);
    float _1725 = _1721;
    float _1727 = _1697;
    if (_1639)
    {
        float _1729 = _1697 + (-1.0);
        _1691 = _1729;
    }
    float _1731 = _1691;
    if (_1639)
    {
        float _1733 = _1663 * _1717;
        _1653 = _1733;
    }
    float _1735 = _1653;
    if (!_1639)
    {
        _1719 = _1703;
    }
    float _1737 = _1719;
    float _1739 = _1737;
    if (_1639)
    {
        float _1741 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1665 = _1741;
    }
    float _1743 = _1665;
    if (_1639)
    {
        float _1745 = _1627 * _1735;
        _1655 = _1745;
    }
    float _1747 = _1655;
    float _1749 = sqrt(_1621);
    if (!_1639)
    {
        _1667 = _1631;
    }
    float _1751 = _1667;
    float _1753 = _1751;
    if (_1639)
    {
        float _1755 = fma(_1703, _1697, _1743);
        _1739 = _1755;
    }
    float _1757 = _1739;
    if (_1639)
    {
        float _1759 = _1629 * _1735;
        _1725 = _1759;
    }
    float _1761 = _1725;
    if (_1639)
    {
        float _1763 = _1747 * _1747;
        _1753 = _1763;
    }
    float _1765 = _1753;
    if (!_1639)
    {
        _1727 = _1633;
    }
    float _1767 = _1727;
    float _1769 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1771 = _1767;
    if (_1639)
    {
        float _1773 = _1761 * _1761;
        _1771 = _1773;
    }
    float _1775 = _1771;
    float _1777 = fma(_1757, _1757, _1765);
    float _1779 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1769);
    float _1781 = _1777 + _1775;
    float _1783 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1785 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1723);
    float _1787 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1789 = rsqrt(_1781);
    float _1791 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1793 = fma(_1749, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1791);
    float _1795 = precise::clamp(_1793, 0.0, 1.0);
    float _1797 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1783);
    float _1799 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1787);
    float _1801 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1803 = -_1795;
    float _1805 = _1803 + 1.0;
    float _1807 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1797);
    float _1809 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1799);
    float _1811 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1813 = abs(_1805);
    float _1815 = log2(_1813);
    float _1817 = _1807 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1819 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1821 = _1809 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1823 = -_1819;
    float _1825 = fma(_1823, _1811, 1.0);
    float _1827 = _1789 * _1747;
    float _1829 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1779);
    float _1831 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1833 = _1789 * _1757;
    float _1835 = _1789 * _1761;
    float _1837 = _1829 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1839 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1831);
    float _1841 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1843 = log2(_1825);
    float _1845 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1847 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1839);
    float _1849 = -_1841;
    float _1851 = fma(_1833, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1849);
    float _1853 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1855 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1847);
    float _1857 = -_1835;
    float _1859 = fma(_1857, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1851);
    float _1861 = exp2(_1845);
    float _1863 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1865 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1853);
    float _1867 = fma(_1859, -0.5, 0.5);
    float _1869 = fma(_1859, 0.5, 0.5);
    float _1871 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1863);
    float _1873 = _1833 + 1.0;
    float _1875 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1865);
    float _1877 = 1.0 / _1855;
    float _1879 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1871);
    float _1881 = fma(_1869, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1883 = _1843 * 0.693147182464599609375;
    float _1885 = fma(_1869, _1881, -0.212114393711090087890625);
    float _1887 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1889 = sqrt(_1867);
    float _1891 = -_1833;
    float _1893 = fma(_1861, _1873, _1891);
    float _1895 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1879);
    float _1897 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1875);
    float _1899 = fma(_1869, _1885, 1.570728778839111328125);
    float _1901 = _1895 * _1877;
    float _1903 = _1897 * _1877;
    float _1905 = fma(_1901, 0.5, 0.5);
    float _1907 = fma(_1903, -0.5, 0.5);
    float _1909 = _1889 * 0.636619746685028076171875;
    float3 _5254 = float3(_1905, _1907, _1887);
    float _1911 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5254, float3(0.0), isnan(_5254)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5254, float3(0.0), isnan(_5254)), level(0.0)).x;
    float _1913 = -_1899;
    float _1915 = fma(_1909, _1913, 1.0);
    float _1917 = fma(_1893, 0.5, 0.5);
    float3 _5272 = float3(_1905, _1907, _1887);
    float4 _1920 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5272, float3(0.0), isnan(_5272)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5272, float3(0.0), isnan(_5272)), level(0.0)).xyzw;
    float _1922 = _1920.x;
    float _1924 = _1920.y;
    float _1926 = _1920.z;
    float _1928 = _1920.w;
    float2 _5289 = float2(_1915, _1917);
    float3 _1930 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5289, float2(0.0), isnan(_5289)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5289, float2(0.0), isnan(_5289)), level(0.0)).xyz;
    float _1932 = _1930.x;
    float _1934 = _1930.y;
    float _1936 = _1930.z;
    float _1938 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1940 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_79.x = _1601;
    out.m_79.y = _1599;
    out.m_79.z = _1603;
    bool _1942 = _1749 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1944 = isnan(_1749);
    bool _1946 = _1942 || _1944;
    bool _1948 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1950 = _1946 || _1948;
    float _1952 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1940);
    float _1954 = exp2(_1938);
    float _1956 = _1855 * 0.5;
    float _1958 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1952);
    float _1960 = fma(_1897, -0.5, _1956);
    float _1962 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1958);
    float _1964 = _1895 + _1855;
    float _1966 = _1962 + _1855;
    float _1968 = _1964 * 0.5;
    out.gl_Position.x = _1895;
    out.gl_Position.y = _1897;
    out.gl_Position.z = _1962;
    out.gl_Position.w = _1855;
    float _1970 = _1966 * 0.5;
    float _1972 = -_1954;
    float _1974 = _1972 + 1.0;
    float _1976 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _1968;
    out.m_81.y = _1960;
    out.m_81.z = _1970;
    out.m_81.w = _1855;
    float _1978 = -_1976;
    float _1980 = _1978 + 1.0;
    float _1982 = _1855;
    float _1984 = _1962;
    float _1986 = _1897;
    float _1988 = _1895;
    float _1990 = _1980;
    if (!_1950)
    {
        _1982 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1992 = _1982;
    float _1994 = _1992;
    float _1996 = _1992;
    if (!_1950)
    {
        _1984 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1998 = _1984;
    float _2000 = _1998;
    float _2002 = _1998;
    if (!_1950)
    {
        _1986 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2004 = _1986;
    float _2006 = _2004;
    float _2008 = _2004;
    if (!_1950)
    {
        _1988 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2010 = _1988;
    float _2012 = _1976 * _1911;
    float _2014 = _1928 * _2012;
    float _2016 = _1928 * _1980;
    float _2018 = _2014;
    float _2020 = _2010;
    float _2022 = _2010;
    if (!_1950)
    {
        _1990 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2024 = _1990;
    float _2026 = _1936 * _2012;
    float _2028 = fma(_1932, _2014, _1922);
    float _2030 = fma(_1934, _2014, _1924);
    float _2032 = _2024;
    float _2034 = _2024;
    if (!_1950)
    {
        _2018 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2036 = _2018;
    float _2038 = fma(_1928, _2026, _1926);
    out.m_83.x = _2028;
    out.m_83.y = _2030;
    out.m_83.z = _2038;
    out.m_83.w = _2016;
    bool _2040 = !_1950;
    float _2042 = _2036;
    float _2044 = _2036;
    if (!_2040)
    {
        bool _2046 = _1749 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2048 = isnan(_1749);
        bool _2050 = _2046 || _2048;
        bool _2052 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2054 = _2050 || _2052;
        if (!_2054)
        {
            float _2056 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2058 = _1749 + _2056;
            float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2062 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2060;
            float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2066 = _2064 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2068 = 1.0 / _2062;
            float _2070 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2072 = _2070 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2074 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2076 = _2074 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2078 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2080 = _2078 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2084 = _2082 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2086 = _2058 * _2068;
            float _2088 = precise::clamp(_2086, 0.0, 1.0);
            float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2092 = _2090 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2094 = fma(_2088, _2066, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2096 = fma(_2088, _2092, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2098 = fma(_2088, _2072, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2100 = fma(_2088, _2076, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2102 = fma(_2088, _2080, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2104 = fma(_2088, _2084, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2034 = _2098;
            _2008 = _2102;
            _2044 = _2094;
            _2002 = _2100;
            _1996 = _2096;
            _2022 = _2104;
            _2106 = true;
        }
        else
        {
            bool _2108 = _1749 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2110 = isnan(_1749);
            bool _2112 = _2108 || _2110;
            bool _2114 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2116 = _2112 || _2114;
            if (!_2116)
            {
                _2042 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2118 = _2042;
            _2044 = _2118;
            if (!_2116)
            {
                _2032 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2120 = _2032;
            _2034 = _2120;
            if (!_2116)
            {
                _1994 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2122 = _1994;
            _1996 = _2122;
            if (!_2116)
            {
                _2000 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2124 = _2000;
            _2002 = _2124;
            if (!_2116)
            {
                _2006 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2126 = _2006;
            _2008 = _2126;
            if (!_2116)
            {
                _2020 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2128 = _2020;
            bool _2130 = !_2116;
            _2022 = _2128;
            if (!_2130)
            {
                bool _2132 = _1749 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2134 = isnan(_1749);
                bool _2136 = _2132 || _2134;
                bool _2138 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2140 = _2136 || _2138;
                if (!_2140)
                {
                    float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2144 = _1749 + _2142;
                    float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2148 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2146;
                    float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2152 = _2150 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2154 = 1.0 / _2148;
                    float _2156 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2158 = _2156 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2162 = _2160 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2164 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2166 = _2164 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2168 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2170 = _2168 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2172 = _2144 * _2154;
                    float _2174 = precise::clamp(_2172, 0.0, 1.0);
                    float _2176 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2178 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2180 = fma(_2174, _2152, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2182 = fma(_2174, _2178, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2184 = fma(_2174, _2158, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2186 = fma(_2174, _2162, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2188 = fma(_2174, _2166, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2190 = fma(_2174, _2170, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2034 = _2184;
                    _2008 = _2188;
                    _2044 = _2180;
                    _2002 = _2186;
                    _1996 = _2182;
                    _2022 = _2190;
                    _2106 = true;
                }
                else
                {
                    _2034 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2008 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2044 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2002 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1996 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2022 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2106 = false;
    float _2192 = _2034;
    float _2194 = _2008;
    float _2196 = _2044;
    float _2198 = _2002;
    float _2200 = _1996;
    float _2202 = _2022;
    float _2204 = fma(_1413, -0.5, 0.5);
    float _2206 = precise::clamp(_2204, 0.0, 1.0);
    float _2208 = -_2192;
    float _2210 = _2208 + _2194;
    float _2212 = -_2196;
    float _2214 = _2212 + _2198;
    float _2216 = -_2200;
    float _2218 = _2216 + _2202;
    bool _2220 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2222 = fma(_2206, _2210, _2192);
    float _2224 = fma(_2206, _2214, _2196);
    float _2226 = fma(_2206, _2218, _2200);
    float _2228 = _2222 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2230 = fma(_2224, 0.298911988735198974609375, _2228);
    float _2232 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2234 = fma(_2226, 0.114477999508380889892578125, _2230);
    out.m_85.w = _2232;
    float _2236 = -_2234;
    float _2238 = _2224 + _2236;
    float _2240 = -_2234;
    float _2242 = _2222 + _2240;
    float _2244 = -_2234;
    float _2246 = _2226 + _2244;
    out.m_87.x = 0.0;
    float _2248 = fma(_2238, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2234);
    float _2250 = fma(_2242, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2234);
    float _2252 = fma(_2246, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2234);
    out.m_89.x = _2248;
    out.m_89.y = _2250;
    out.m_89.z = _2252;
    if (!_2220)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2254 = -_1599;
    float _2256 = _2254 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2258 = -_1601;
    float _2260 = _2258 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2262 = -_1603;
    float _2264 = _2262 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2266 = _2256 * _2256;
    float _2268 = fma(_2260, _2260, _2266);
    float _2270 = fma(_2264, _2264, _2268);
    float _2272 = sqrt(_2270);
    float _2274 = rsqrt(_2270);
    float _2276 = -_2272;
    float _2278 = _2276 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2280 = _2278 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2282 = precise::clamp(_2280, 0.0, 1.0);
    float _2284 = _2260 * _2274;
    float _2286 = _2256 * _2274;
    float _2288 = abs(_2282);
    float _2290 = log2(_2288);
    float _2292 = _2264 * _2274;
    float _2294 = _2284 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2296 = _1413 * _2286;
    float _2298 = -_2286;
    float _2300 = -_2294;
    float _2302 = fma(_2298, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2300);
    float _2304 = fma(_1411, _2284, _2296);
    float _2306 = -_2292;
    float _2308 = fma(_2306, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2302);
    float _2310 = fma(_1419, _2292, _2304);
    float _2312 = precise::clamp(_2310, 0.0, 1.0);
    float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2316 = _2308 + _2314;
    float _2318 = _2290 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2320 = _2316 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2322 = precise::clamp(_2320, 0.0, 1.0);
    float _2324 = exp2(_2318);
    float _2326 = _2324 * _2322;
    float _2328 = _2312 * _2326;
    float _2330 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2332 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2334 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2330;
    out.m_87.y = _2332;
    out.m_87.z = _2334;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2106 = false;
    bool _1471 = false;
    bool _309 = false;
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
        float _2391 = as_type<float>(_127);
        out.gl_Position.z = _2391;
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
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_111);
        _121 = _149;
    }
    float _151 = _121;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2461 = as_type<float>(_165);
        out.gl_Position.z = _2461;
    }
    if (_157)
    {
        return out;
    }
    float _167 = in.m_55.w;
    float _169 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _171 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _173 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _175 = _171 || _173;
    bool _177 = isnan(1.0);
    bool _179 = _175 || _177;
    float _181 = in.m_53.x;
    float _183 = in.m_53.y;
    float _185 = in.m_53.z;
    float _187 = in.m_48.x;
    float _189 = in.m_48.y;
    float _191 = in.m_48.z;
    float _193 = 0.0;
    float _195 = _169;
    if (!_179)
    {
        float _197 = _169 * _169;
        float _199 = _197 * 0.5;
        _193 = _199;
    }
    float _201 = _193;
    float _203 = _201;
    if (!_179)
    {
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _205;
    }
    float _207 = _203;
    bool _209 = !_179;
    float _211 = _207;
    if (!_209)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _169 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _169);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _241;
    }
    float _243 = _211;
    bool _245 = !_179;
    if (!_245)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _169 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _195 = _265;
    }
    float _267 = _195;
    bool _269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _271 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _273 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _275 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _277 = fma(_267, _181, _271);
    float _279 = fma(_267, _183, _273);
    float _281 = fma(_267, _185, _275);
    float _283 = fma(_277, _167, _187);
    float _285 = fma(_279, _167, _189);
    float _287 = fma(_281, _167, _191);
    bool _289 = !_269;
    float _307;
    if (!_289)
    {
        float _291 = in.m_57.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        float _311 = float(_111);
        float _313 = 1.0 / _311;
        float _315 = _145 * _313;
        _307 = _315;
    }
    _309 = false;
    float _317 = _307;
    int _319 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _321 = _319;
    int _323 = 0;
    int _325 = _102(_321, _323, (*spvDescriptorSet0.support_buffer));
    float _327 = in.m_57.x;
    float _329 = in.m_59.z;
    float _331 = _327 * 8.0;
    float _333 = rint(_331);
    float _335 = _333 * 0.125;
    float _337 = precise::clamp(_335, 0.0, 1.0);
    int _339 = _325 + (-1);
    float _341 = float(_339);
    float _343 = _337 * _341;
    float _345 = trunc(_329);
    int _347 = int(_345);
    float _349 = trunc(_343);
    int _351 = int(_349);
    int _353 = _351 + 1;
    int _355 = min(_339, _353);
    int _357 = _351;
    int _359 = 0;
    int _361 = _103(_357, _359, (*spvDescriptorSet0.support_buffer));
    int _363 = _347;
    int _365 = 0;
    int _367 = _103(_363, _365, (*spvDescriptorSet0.support_buffer));
    float3 _371 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_361, _367)), 0).xyz;
    float _373 = _371.x;
    float _375 = _371.y;
    float _377 = _371.z;
    int _379 = _355;
    int _381 = 0;
    int _383 = _103(_379, _381, (*spvDescriptorSet0.support_buffer));
    int _385 = _347;
    int _387 = 0;
    int _389 = _103(_385, _387, (*spvDescriptorSet0.support_buffer));
    float3 _391 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_383, _389)), 0).xyz;
    float _393 = _391.x;
    float _395 = _391.y;
    float _397 = _391.z;
    float _399 = in.m_57.w;
    float _401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _403 = in.m_59.y;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _407 = _405 != 0;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _411 = _409 != 0;
    float _413 = in.m_57.y;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _417 = _415 != 0;
    float _419 = in.m_57.z;
    float _421 = _285 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _425 = _423 != 0;
    float _427 = _285 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _431 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[5].x, _421);
    float _433 = _327 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _437 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[5].z, _431);
    float _439 = -_429;
    float _441 = fma(_433, 2.0, _439);
    float _443 = in.m_59.x;
    bool _445 = _399 > 0.5;
    float _447 = _285 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _449 = -_403;
    float _451 = _449 + 1.0;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _453;
    float _457 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[4].x, _447);
    float _459 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[6].x, _427);
    int _461 = _445 ? as_type<int>(_451) : as_type<int>(_403);
    float _463 = _413 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _475 = _473 != 0;
    float _477 = _419 * 2.0;
    float _479 = fma(_463, -2.0, _435);
    float _481 = 1.0 / _455;
    float _483 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[4].z, _457);
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _491 = _417 ? as_type<float>(_461) : _403;
    float _493 = _485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _495 = _487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _499 = floor(_477);
    bool _501 = _413 > 0.5;
    float _503 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[6].z, _459);
    float _505 = _413 + _419;
    out.m_61.x = _497;
    out.m_61.y = _493;
    out.m_61.z = _495;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _509 = _317 + _507;
    float _511 = _403;
    int _513 = as_type<int>(_479);
    float _515 = _343;
    if (_425)
    {
        float _517 = _501 ? _451 : _403;
        _511 = _517;
    }
    float _519 = _511;
    float _521 = _327 * 2.0;
    float _523 = _505 + (-1.0);
    float _525 = _509 * _481;
    float _527 = _413 * 2.0;
    float _529 = floor(_521);
    float _531 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _533 = -_145;
    float _535 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[76].x, _441);
    float _537 = _327 + _419;
    bool _539 = _499 > 0.0;
    float _541 = _327 + _413;
    float _543 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _545 = log2(_543);
    bool _547 = _499 >= 0.0;
    bool _549 = isnan(_499);
    bool _551 = _547 || _549;
    bool _553 = isnan(0.0);
    bool _555 = _551 || _553;
    float _557 = _537 + (-1.0);
    float _559 = _541 + (-1.0);
    bool _561 = !_467;
    int _563 = _561 ? 0 : 1;
    float _565 = _483 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _567 = _555 ? 0 : 1;
    float _569 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _571 = floor(_527);
    float _573 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _575 = ~_567;
    int _577 = _575 + 1;
    int _579 = _577 + 1;
    float _581 = _503 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _583 = _579;
    float _585 = _519;
    float _587 = _581;
    if (!_539)
    {
        int _589 = ~_567;
        int _591 = _589 + 1;
        _583 = _591;
    }
    int _593 = _583;
    float _595 = _437 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _597 = _545 * _145;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _599;
    bool _603 = _529 >= 0.0;
    bool _605 = isnan(_529);
    bool _607 = _603 || _605;
    bool _609 = isnan(0.0);
    bool _611 = _607 || _609;
    float _613 = exp2(_597);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _619;
    float _623 = fma(_601, _525, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _625 = _611 ? 0 : 1;
    float _627 = fma(_617, _525, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _629 = fma(_621, _525, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _631 = _571 > 0.0;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _635 = 1.0 + _633;
    bool _637 = _571 >= 0.0;
    bool _639 = isnan(_571);
    bool _641 = _637 || _639;
    bool _643 = isnan(0.0);
    bool _645 = _641 || _643;
    float _647 = 1.0 / _635;
    bool _649 = !_471;
    int _651 = _649 ? 0 : 1;
    float _653 = -_613;
    float _655 = _653 + 1.0;
    bool _657 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _659 = isnan(0.0);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _665 = _661 || _663;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _669 = _529 > 0.0;
    float _671 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[78].z, _667);
    float _673 = _665 ? _655 : 0.0;
    bool _675 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _677 = isnan(_317);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _689 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _691 = isnan(1.0);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _697 = _693 || _695;
    float _699 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _671);
    bool _701 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _703 = isnan(_317);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[78].w, _687);
    float _715 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _479);
    float _717 = _667;
    bool _719 = _697;
    bool _721 = _669;
    if (_407)
    {
        float _723 = -_443;
        float _725 = _723 + 1.0;
        _513 = as_type<int>(_725);
    }
    int _727 = _513;
    int _729 = abs(_651);
    float _731 = -_711;
    float _733 = _731 + 1.0;
    float _735 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _713);
    int _737 = abs(_563);
    float _739 = _401 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _741 = _685 * _733;
    int _743 = _729;
    if (!_407)
    {
        _717 = _443;
    }
    float _745 = _717;
    float _747 = _745;
    if (_697)
    {
        float _749 = _673 * _647;
        _147 = _749;
    }
    float _751 = _147;
    if (_407)
    {
        bool _753 = _327 > 0.5;
        _719 = _753;
    }
    bool _755 = _719;
    float _757 = _627 * _741;
    float _759 = _629 * _741;
    float _761 = _623 * _741;
    float _763 = float(_737);
    float _765 = in.m_63.x;
    float _767 = in.m_63.y;
    float _769 = in.m_63.z;
    float _771 = float(_593);
    float _773 = fma(_739, _519, -0.5);
    if (_407)
    {
        float _775 = _755 ? as_type<float>(_727) : _443;
        _747 = _775;
    }
    float _777 = _747;
    float _779 = _327 + (-0.5);
    int _781 = ~_625;
    int _783 = _781 + 1;
    int _785 = _783 + 1;
    float _787 = _763 * _771;
    int _789 = _785;
    if (_411)
    {
        float _791 = -_443;
        float _793 = _791 + 1.0;
        _743 = as_type<int>(_793);
    }
    int _795 = _743;
    if (!_669)
    {
        int _797 = ~_625;
        int _799 = _797 + 1;
        _789 = _799;
    }
    int _801 = _789;
    float _803 = -_715;
    float _805 = fma(_735, _773, _803);
    if (_411)
    {
        bool _807 = _419 > 0.5;
        _721 = _807;
    }
    bool _809 = _721;
    float _811 = _413 + (-0.5);
    if (!_411)
    {
        _585 = _443;
    }
    float _813 = _585;
    float _815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _817 = _813;
    if (_411)
    {
        float _819 = _809 ? as_type<float>(_795) : _443;
        _817 = _819;
    }
    float _821 = _817;
    float _823 = _787 * (-2.0);
    float _825 = float(_729);
    float _827 = _419 + (-0.5);
    float _829 = float(_801);
    float _831 = fma(_573, _823, _573);
    int _833 = _645 ? 0 : 1;
    float _835 = fma(_823, _765, _765);
    float _837 = _825 * _829;
    int _839 = ~_833;
    int _841 = _839 + 1;
    int _843 = _841 + 1;
    float _845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _847 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[196].x, _835);
    bool _849 = !_475;
    int _851 = _849 ? 0 : 1;
    int _853 = _843;
    if (!_631)
    {
        int _855 = ~_833;
        int _857 = _855 + 1;
        _853 = _857;
    }
    int _859 = _853;
    float _861 = _837 * (-2.0);
    int _863 = abs(_851);
    float _865 = fma(_831, _751, _847);
    float _867 = float(_859);
    float _869 = fma(_531, _861, _531);
    float _871 = fma(_861, _767, _767);
    float _873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _875 = -_685;
    float _877 = _875 + 1.0;
    float _879 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[196].y, _871);
    float _881 = float(_863);
    float _883 = _865 * 0.15915493667125701904296875;
    float _885 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[143].x, _757);
    float _887 = fma(_869, _751, _879);
    float _889 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[143].y, _759);
    float _891 = _881 * _867;
    float _893 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[143].z, _761);
    float _895 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[144].x, _885);
    float _897 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[144].y, _889);
    float _899 = _891 * (-2.0);
    float _901 = _815 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _903 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[144].z, _893);
    float _905 = _491 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _907 = fma(_899, _769, _769);
    float _909 = fma(_569, _899, _569);
    float _911 = fma(_901, _777, -0.5);
    float _913 = _883 * 6.283185482025146484375;
    float _915 = sin(_913);
    float _917 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[196].z, _907);
    float _919 = _887 * 0.15915493667125701904296875;
    float _921 = in.m_55.x;
    float _923 = in.m_55.y;
    float _925 = in.m_55.z;
    float _927 = fma(_699, _911, _535);
    float _929 = fma(_909, _751, _917);
    float _931 = _905 * _873;
    float _933 = _883 * 6.283185482025146484375;
    float _935 = cos(_933);
    float _937 = _821 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _943 = _937 * _845;
    float _945 = _919 * 6.283185482025146484375;
    float _947 = sin(_945);
    float _949 = _929 * 0.15915493667125701904296875;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _953 = in.m_65.x;
    float _955 = in.m_65.y;
    float _957 = in.m_65.z;
    float _959 = in.m_65.w;
    float _961 = _939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _963 = _941 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _965 = _951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _967 = _927 + 0.5;
    float _969 = _919 * 6.283185482025146484375;
    float _971 = cos(_969);
    float _973 = _805 + 0.5;
    float _975 = _897 * _923;
    float _977 = _895 * _921;
    out.m_67.x = _963;
    out.m_67.y = _965;
    out.m_67.z = _961;
    float _979 = _903 * _925;
    float _981 = _949 * 6.283185482025146484375;
    float _983 = cos(_981);
    float _985 = _935 * _947;
    out.m_69.x = _967;
    out.m_69.y = _973;
    out.m_69.z = _943;
    out.m_69.w = _931;
    float _987 = _979 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _989 = _949 * 6.283185482025146484375;
    float _991 = sin(_989);
    float _993 = _935 * _971;
    float _995 = _915 * _971;
    float _997 = floor(_343);
    float _999 = _935 * _983;
    float _1001 = _915 * _947;
    float _1003 = _971 * _983;
    float _1005 = _915 * _983;
    float _1007 = _999 * _955;
    float _1009 = _947 * _983;
    float _1011 = fma(_991, _993, _1001);
    float _1013 = -_955;
    float _1015 = _991 * _1013;
    float _1017 = -_995;
    float _1019 = fma(_991, _985, _1017);
    float _1021 = fma(_991, _1001, _993);
    float _1023 = fma(_1011, _953, _1007);
    float _1025 = fma(_1003, _953, _1015);
    float _1027 = -_985;
    float _1029 = fma(_991, _995, _1027);
    float _1031 = _1005 * _955;
    float _1033 = fma(_1019, _957, _1023);
    float _1035 = -_997;
    float _1037 = _343 + _1035;
    float _1039 = fma(_1009, _957, _1025);
    float _1041 = _1033 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1043 = _1033 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1045 = _1033 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1047 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1041);
    float _1049 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1043);
    float _1051 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1045);
    float _1053 = fma(_1029, _953, _1031);
    float _1055 = -_375;
    float _1057 = _1055 + _395;
    float _1059 = -_373;
    float _1061 = _1059 + _393;
    float _1063 = fma(_1037, _1057, _375);
    float _1065 = -_377;
    float _1067 = _1065 + _397;
    float _1069 = fma(_1037, _1061, _373);
    float _1071 = in.m_71.x;
    float _1073 = in.m_71.y;
    float _1075 = in.m_71.z;
    float _1077 = fma(_1021, _957, _1053);
    float _1079 = fma(_1037, _1067, _377);
    bool _1081 = _1063 != 0.0;
    bool _1083 = isnan(_1063);
    bool _1085 = _1081 || _1083;
    bool _1087 = isnan(0.0);
    bool _1089 = _1085 || _1087;
    float _1091 = fma(_1077, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1049);
    float _1093 = _975 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1095 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1063);
    bool _1097 = _1069 == 0.0;
    bool _1099 = !_1089;
    bool _1101 = _1097 && _1099;
    float _1103 = fma(_1077, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1047);
    float _1105 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1079);
    float _1107 = _977 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1109 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1069);
    float _1111 = _1095 * _1093;
    bool _1113 = _1079 == 0.0;
    bool _1115 = _1113 && _1101;
    float _1117 = _1105 * _987;
    float _1119 = _1109 * _1107;
    float _1121 = _999 * _1111;
    float _1123 = -_1111;
    float _1125 = _991 * _1123;
    float _1127 = fma(_1077, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1051);
    float _1129 = _1005 * _1111;
    float _1131 = fma(_1011, _1119, _1121);
    float _1133 = fma(_1003, _1119, _1125);
    out.m_73.x = _1103;
    out.m_73.y = _1091;
    out.m_73.z = _1127;
    float _1135 = fma(_1019, _1117, _1131);
    float _1137 = fma(_1029, _1119, _1129);
    float _1139 = _983;
    float _1141 = _1125;
    float _1143 = _1133;
    float _1145 = _1117;
    if (_1115)
    {
        _515 = _1071;
    }
    float _1147 = _515;
    float _1149 = _1135 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1151 = _1147;
    if (_1115)
    {
        _1139 = _1073;
    }
    float _1153 = _1139;
    float _1155 = _1153;
    if (_1115)
    {
        _1141 = _1147;
    }
    float _1157 = _1141;
    float _1159 = _1157;
    if (!_1115)
    {
        _1151 = _1071;
    }
    float _1161 = _1151;
    float _1163 = fma(_1021, _1117, _1137);
    float _1165 = fma(_1009, _1117, _1133);
    float _1167 = _1135 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1169 = _1165;
    if (_1115)
    {
        _1143 = _1075;
    }
    float _1171 = _1143;
    float _1173 = _1171;
    if (!_1115)
    {
        float _1175 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1161);
        _1159 = _1175;
    }
    float _1177 = _1159;
    float _1179 = fma(_1165, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1149);
    float _1181 = fma(_1165, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1167);
    float _1183 = _1179;
    if (_1115)
    {
        _1145 = _1171;
    }
    float _1185 = _1145;
    float _1187 = _957 * _1161;
    float _1189 = fma(_1163, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1179);
    float _1191 = fma(_1163, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1181);
    float _1193 = _1185;
    if (_1115)
    {
        _1183 = _1153;
    }
    float _1195 = _1183;
    float _1197 = _581 + _1189;
    float _1199 = _565 + _1191;
    float _1201 = _1195;
    float _1203 = _1197;
    float _1205 = _1199;
    if (!_1115)
    {
        _1155 = _1073;
    }
    float _1207 = _1155;
    if (!_1115)
    {
        _1173 = _1075;
    }
    float _1209 = _1173;
    float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1213 = _1199 + _1211;
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1217 = _1197 + _1215;
    if (!_1115)
    {
        float _1219 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1207);
        _1201 = _1219;
    }
    float _1221 = _1201;
    float _1223 = _1213 * _1213;
    float _1225 = _1217 * _1217;
    float _1227 = _1223;
    float _1229 = _1225;
    if (!_1115)
    {
        float _1231 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1209);
        _1193 = _1231;
    }
    float _1233 = _1193;
    float _1235 = _955 * _1209;
    float _1237 = -_1187;
    float _1239 = fma(_953, _1209, _1237);
    float _1241 = _1223 + _1225;
    float _1243 = _953 * _1207;
    float _1245 = -_1235;
    float _1247 = fma(_957, _1207, _1245);
    float _1249 = _1135 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1251 = sqrt(_1241);
    float _1253 = -_1221;
    float _1255 = _991 * _1253;
    float _1257 = _999 * _1221;
    float _1259 = _1005 * _1221;
    float _1261 = -_1243;
    float _1263 = fma(_955, _1161, _1261);
    float _1265 = _1239 * _959;
    float _1267 = fma(_1165, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1249);
    float _1269 = fma(_1003, _1177, _1255);
    float _1271 = fma(_1011, _1177, _1257);
    float _1273 = fma(_1029, _1177, _1259);
    float _1275 = _1247 * _959;
    float _1277 = -_1265;
    float _1279 = _991 * _1277;
    float _1281 = _999 * _1265;
    float _1283 = _1005 * _1265;
    float _1285 = fma(_1163, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1267);
    float _1287 = fma(_1003, _1275, _1279);
    bool _1289 = _1251 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1291 = fma(_1011, _1275, _1281);
    float _1293 = fma(_1029, _1275, _1283);
    float _1295 = _595 + _1285;
    float _1297 = _1263 * _959;
    float _1299 = fma(_1009, _1233, _1269);
    float _1301 = fma(_1019, _1233, _1271);
    float _1303 = fma(_1021, _1233, _1273);
    float _1305 = fma(_1009, _1297, _1287);
    float _1307 = fma(_1019, _1297, _1291);
    float _1309 = fma(_1021, _1297, _1293);
    if (!_1289)
    {
        _1169 = _1295;
    }
    float _1311 = _1169;
    bool _1313 = !_1289;
    float _1315 = _1311;
    if (!_1313)
    {
        float _1317 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1319 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1321 = _1251 + _1319;
        float _1323 = rsqrt(_1241);
        float _1325 = _1321 * _1317;
        float _1327 = _1295 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1329 = _1325 * 0.15915493667125701904296875;
        float _1331 = _1329 * 6.283185482025146484375;
        float _1333 = sin(_1331);
        float _1335 = _1329 * 6.283185482025146484375;
        float _1337 = cos(_1335);
        float _1339 = fma(_1333, _1327, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1341 = _1323 * _1339;
        float _1343 = fma(_1213, _1341, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1345 = _1337 + (-1.0);
        float _1347 = fma(_1217, _1341, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1349 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1351 = _1343 + _1349;
        float _1353 = _1345 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1357 = _1347 + _1355;
        float _1359 = _1351 * _1351;
        float _1361 = fma(_1295, _1337, _1353);
        float _1363 = _1357 * _1357;
        _1315 = _1361;
        _1227 = _1359;
        _1229 = _1363;
        _1203 = _1347;
        _1205 = _1343;
    }
    float _1365 = _1315;
    float _1367 = _1227;
    float _1369 = _1229;
    float _1371 = _1203;
    float _1373 = _1205;
    float _1375 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1377 = _1365 + _1375;
    float _1379 = _1307 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1381 = _1307 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1383 = _1307 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1385 = fma(_1377, _1377, _1367);
    float _1387 = _1301 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1389 = _1301 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1391 = _1301 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1393 = _1385 + _1369;
    float _1395 = fma(_1305, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1379);
    float _1397 = fma(_1305, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1381);
    float _1399 = fma(_1305, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1383);
    float _1401 = fma(_1299, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1387);
    float _1403 = fma(_1299, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1389);
    float _1405 = sqrt(_1393);
    float _1407 = fma(_1299, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1391);
    float _1409 = fma(_1309, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1397);
    float _1411 = fma(_1303, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1401);
    float _1413 = fma(_1303, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1403);
    float _1415 = fma(_1309, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1395);
    float _1417 = fma(_1309, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1399);
    float _1419 = fma(_1303, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1407);
    out.m_75.x = _1409;
    out.m_75.y = _1415;
    out.m_75.z = _1417;
    out.m_77.x = _1411;
    out.m_77.y = _1413;
    out.m_77.z = _1419;
    bool _1421 = _1405 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1423 = isnan(_1405);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1429 = _1425 || _1427;
    float _1431 = _1401;
    float _1433 = _1417;
    float _1435 = _1415;
    if (!_1429)
    {
        _1431 = 1.0;
    }
    float _1437 = _1431;
    bool _1439 = !_1429;
    float _1441 = _1437;
    if (!_1439)
    {
        bool _1443 = _1405 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1445 = isnan(_1405);
        bool _1447 = _1443 || _1445;
        bool _1449 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1451 = _1447 || _1449;
        if (!_1451)
        {
            float _1453 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1455 = _1405 + _1453;
            float _1457 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1459 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1457;
            float _1461 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1463 = _1461 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1465 = 1.0 / _1459;
            float _1467 = _1455 * _1465;
            float _1469 = fma(_1467, _1463, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1441 = _1469;
            _1433 = _1463;
            _1471 = true;
        }
        else
        {
            bool _1473 = _1405 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1475 = isnan(_1405);
            bool _1477 = _1473 || _1475;
            bool _1479 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1481 = _1477 || _1479;
            if (!_1481)
            {
                float _1483 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1485 = _1405 + _1483;
                float _1487 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1489 = _1487 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1491 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1493 = _1491 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1495 = 1.0 / _1489;
                float _1497 = _1485 * _1495;
                float _1499 = fma(_1497, _1493, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1441 = _1499;
                _1433 = _1493;
                _1471 = true;
            }
            else
            {
                _1441 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1471 = false;
    float _1501 = _1441;
    float _1503 = _1433;
    float _1505 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1507 = _1365 + _1505;
    float _1509 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1511 = _1371 + _1509;
    bool _1513 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1517 = _1513 || _1515;
    bool _1519 = isnan(0.5);
    bool _1521 = _1517 || _1519;
    float _1523 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1525 = _1373 + _1523;
    float _1527 = fma(_1507, _1501, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1529 = fma(_1511, _1501, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1531 = fma(_1525, _1501, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1533 = _1525;
    float _1535 = _1503;
    if (_1521)
    {
        _1533 = _1531;
    }
    float _1537 = _1533;
    float _1539 = _1537;
    if (_1521)
    {
        _1435 = _1527;
    }
    float _1541 = _1435;
    float _1543 = _1541;
    if (_1521)
    {
        _1535 = _1529;
    }
    float _1545 = _1535;
    float _1547 = _1545;
    if (!_1521)
    {
        float _1549 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1551 = _595 + _1549;
        float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1555 = _565 + _1553;
        float _1557 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1559 = _1551 * _1551;
        float _1561 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1563 = _581 + _1561;
        float _1565 = fma(_1555, _1555, _1559);
        float _1567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1569 = fma(_1563, _1563, _1565);
        float _1571 = sqrt(_1569);
        float _1573 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1575 = -_581;
        float _1577 = _1575 + _1529;
        float _1579 = precise::min(_1571, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1581 = _1579 * _1567;
        float _1583 = -_565;
        float _1585 = _1583 + _1531;
        float _1587 = -_595;
        float _1589 = _1587 + _1527;
        float _1591 = _1573 * _1581;
        float _1593 = fma(_1585, _1591, _565);
        float _1595 = fma(_1589, _1591, _595);
        float _1597 = fma(_1577, _1591, _581);
        _1543 = _1595;
        _1539 = _1593;
        _1547 = _1597;
    }
    float _1599 = _1543;
    float _1601 = _1539;
    float _1603 = _1547;
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1607 = _1599 + _1605;
    float _1609 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1611 = _1601 + _1609;
    float _1613 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1615 = _1603 + _1613;
    float _1617 = _1607 * _1607;
    float _1619 = fma(_1611, _1611, _1617);
    float _1621 = fma(_1615, _1615, _1619);
    float _1623 = rsqrt(_1621);
    float _1625 = _1623 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1627 = _1611 * _1625;
    float _1629 = _1615 * _1625;
    float _1631 = _1627 * _1627;
    float _1633 = _1629 * _1629;
    float _1635 = _1631 + _1633;
    float _1637 = sqrt(_1635);
    bool _1639 = _1637 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1641 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1643 = _1637 + _1641;
    float _1645 = _1405;
    float _1647 = _1635;
    float _1649 = _1643;
    float _1651 = _1607;
    float _1653 = _1625;
    float _1655 = _1627;
    if (_1639)
    {
        float _1657 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1645 = _1657;
    }
    float _1659 = _1645;
    if (_1639)
    {
        float _1661 = rsqrt(_1635);
        _1647 = _1661;
    }
    float _1663 = _1647;
    float _1665 = _1659;
    float _1667 = _1663;
    if (_1639)
    {
        float _1669 = _1643 * _1659;
        _1649 = _1669;
    }
    float _1671 = _1649;
    if (_1639)
    {
        float _1673 = _1671 * 0.15915493667125701904296875;
        _587 = _1673;
    }
    float _1675 = _587;
    float _1677 = _1615;
    if (_1639)
    {
        float _1679 = _1675 * 6.283185482025146484375;
        float _1681 = sin(_1679);
        _1677 = _1681;
    }
    float _1683 = _1677;
    float _1685 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1687 = precise::max(0.0, _1685);
    float _1689 = _1407;
    float _1691 = _1687;
    if (_1639)
    {
        float _1693 = _1675 * 6.283185482025146484375;
        float _1695 = cos(_1693);
        _1689 = _1695;
    }
    float _1697 = _1689;
    float _1699 = -_1625;
    float _1701 = -_1687;
    float _1703 = fma(_1607, _1699, _1701);
    if (_1639)
    {
        float _1705 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1651 = _1705;
    }
    float _1707 = _1651;
    float _1709 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1711 = _1683;
    float _1713 = _1707;
    if (_1639)
    {
        float _1715 = fma(_1683, _1707, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1711 = _1715;
    }
    float _1717 = _1711;
    float _1719 = _1717;
    if (!_1639)
    {
        _1713 = _1629;
    }
    float _1721 = _1713;
    float _1723 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1709);
    float _1725 = _1721;
    float _1727 = _1697;
    if (_1639)
    {
        float _1729 = _1697 + (-1.0);
        _1691 = _1729;
    }
    float _1731 = _1691;
    if (_1639)
    {
        float _1733 = _1663 * _1717;
        _1653 = _1733;
    }
    float _1735 = _1653;
    if (!_1639)
    {
        _1719 = _1703;
    }
    float _1737 = _1719;
    float _1739 = _1737;
    if (_1639)
    {
        float _1741 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1665 = _1741;
    }
    float _1743 = _1665;
    if (_1639)
    {
        float _1745 = _1627 * _1735;
        _1655 = _1745;
    }
    float _1747 = _1655;
    float _1749 = sqrt(_1621);
    if (!_1639)
    {
        _1667 = _1631;
    }
    float _1751 = _1667;
    float _1753 = _1751;
    if (_1639)
    {
        float _1755 = fma(_1703, _1697, _1743);
        _1739 = _1755;
    }
    float _1757 = _1739;
    if (_1639)
    {
        float _1759 = _1629 * _1735;
        _1725 = _1759;
    }
    float _1761 = _1725;
    if (_1639)
    {
        float _1763 = _1747 * _1747;
        _1753 = _1763;
    }
    float _1765 = _1753;
    if (!_1639)
    {
        _1727 = _1633;
    }
    float _1767 = _1727;
    float _1769 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1771 = _1767;
    if (_1639)
    {
        float _1773 = _1761 * _1761;
        _1771 = _1773;
    }
    float _1775 = _1771;
    float _1777 = fma(_1757, _1757, _1765);
    float _1779 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1769);
    float _1781 = _1777 + _1775;
    float _1783 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1785 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1723);
    float _1787 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1789 = rsqrt(_1781);
    float _1791 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1793 = fma(_1749, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1791);
    float _1795 = precise::clamp(_1793, 0.0, 1.0);
    float _1797 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1783);
    float _1799 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1787);
    float _1801 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1803 = -_1795;
    float _1805 = _1803 + 1.0;
    float _1807 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1797);
    float _1809 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1799);
    float _1811 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1813 = abs(_1805);
    float _1815 = log2(_1813);
    float _1817 = _1807 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1819 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1821 = _1809 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1823 = -_1819;
    float _1825 = fma(_1823, _1811, 1.0);
    float _1827 = _1789 * _1747;
    float _1829 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1779);
    float _1831 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1833 = _1789 * _1757;
    float _1835 = _1789 * _1761;
    float _1837 = _1829 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1839 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1831);
    float _1841 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1843 = log2(_1825);
    float _1845 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1847 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1839);
    float _1849 = -_1841;
    float _1851 = fma(_1833, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1849);
    float _1853 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1855 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1847);
    float _1857 = -_1835;
    float _1859 = fma(_1857, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1851);
    float _1861 = exp2(_1845);
    float _1863 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1865 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1853);
    float _1867 = fma(_1859, -0.5, 0.5);
    float _1869 = fma(_1859, 0.5, 0.5);
    float _1871 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1863);
    float _1873 = _1833 + 1.0;
    float _1875 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1865);
    float _1877 = 1.0 / _1855;
    float _1879 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1871);
    float _1881 = fma(_1869, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1883 = _1843 * 0.693147182464599609375;
    float _1885 = fma(_1869, _1881, -0.212114393711090087890625);
    float _1887 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1889 = sqrt(_1867);
    float _1891 = -_1833;
    float _1893 = fma(_1861, _1873, _1891);
    float _1895 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1879);
    float _1897 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1875);
    float _1899 = fma(_1869, _1885, 1.570728778839111328125);
    float _1901 = _1895 * _1877;
    float _1903 = _1897 * _1877;
    float _1905 = fma(_1901, 0.5, 0.5);
    float _1907 = fma(_1903, -0.5, 0.5);
    float _1909 = _1889 * 0.636619746685028076171875;
    float3 _5254 = float3(_1905, _1907, _1887);
    float _1911 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5254, float3(0.0), isnan(_5254)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5254, float3(0.0), isnan(_5254)), level(0.0)).x;
    float _1913 = -_1899;
    float _1915 = fma(_1909, _1913, 1.0);
    float _1917 = fma(_1893, 0.5, 0.5);
    float3 _5272 = float3(_1905, _1907, _1887);
    float4 _1920 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5272, float3(0.0), isnan(_5272)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5272, float3(0.0), isnan(_5272)), level(0.0)).xyzw;
    float _1922 = _1920.x;
    float _1924 = _1920.y;
    float _1926 = _1920.z;
    float _1928 = _1920.w;
    float2 _5289 = float2(_1915, _1917);
    float3 _1930 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5289, float2(0.0), isnan(_5289)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5289, float2(0.0), isnan(_5289)), level(0.0)).xyz;
    float _1932 = _1930.x;
    float _1934 = _1930.y;
    float _1936 = _1930.z;
    float _1938 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1940 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_79.x = _1601;
    out.m_79.y = _1599;
    out.m_79.z = _1603;
    bool _1942 = _1749 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1944 = isnan(_1749);
    bool _1946 = _1942 || _1944;
    bool _1948 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1950 = _1946 || _1948;
    float _1952 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1940);
    float _1954 = exp2(_1938);
    float _1956 = _1855 * 0.5;
    float _1958 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1952);
    float _1960 = fma(_1897, -0.5, _1956);
    float _1962 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1958);
    float _1964 = _1895 + _1855;
    float _1966 = _1962 + _1855;
    float _1968 = _1964 * 0.5;
    out.gl_Position.x = _1895;
    out.gl_Position.y = _1897;
    out.gl_Position.z = _1962;
    out.gl_Position.w = _1855;
    float _1970 = _1966 * 0.5;
    float _1972 = -_1954;
    float _1974 = _1972 + 1.0;
    float _1976 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _1968;
    out.m_81.y = _1960;
    out.m_81.z = _1970;
    out.m_81.w = _1855;
    float _1978 = -_1976;
    float _1980 = _1978 + 1.0;
    float _1982 = _1855;
    float _1984 = _1962;
    float _1986 = _1897;
    float _1988 = _1895;
    float _1990 = _1980;
    if (!_1950)
    {
        _1982 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1992 = _1982;
    float _1994 = _1992;
    float _1996 = _1992;
    if (!_1950)
    {
        _1984 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1998 = _1984;
    float _2000 = _1998;
    float _2002 = _1998;
    if (!_1950)
    {
        _1986 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2004 = _1986;
    float _2006 = _2004;
    float _2008 = _2004;
    if (!_1950)
    {
        _1988 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2010 = _1988;
    float _2012 = _1976 * _1911;
    float _2014 = _1928 * _2012;
    float _2016 = _1928 * _1980;
    float _2018 = _2014;
    float _2020 = _2010;
    float _2022 = _2010;
    if (!_1950)
    {
        _1990 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2024 = _1990;
    float _2026 = _1936 * _2012;
    float _2028 = fma(_1932, _2014, _1922);
    float _2030 = fma(_1934, _2014, _1924);
    float _2032 = _2024;
    float _2034 = _2024;
    if (!_1950)
    {
        _2018 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2036 = _2018;
    float _2038 = fma(_1928, _2026, _1926);
    out.m_83.x = _2028;
    out.m_83.y = _2030;
    out.m_83.z = _2038;
    out.m_83.w = _2016;
    bool _2040 = !_1950;
    float _2042 = _2036;
    float _2044 = _2036;
    if (!_2040)
    {
        bool _2046 = _1749 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2048 = isnan(_1749);
        bool _2050 = _2046 || _2048;
        bool _2052 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2054 = _2050 || _2052;
        if (!_2054)
        {
            float _2056 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2058 = _1749 + _2056;
            float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2062 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2060;
            float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2066 = _2064 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2068 = 1.0 / _2062;
            float _2070 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2072 = _2070 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2074 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2076 = _2074 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2078 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2080 = _2078 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2084 = _2082 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2086 = _2058 * _2068;
            float _2088 = precise::clamp(_2086, 0.0, 1.0);
            float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2092 = _2090 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2094 = fma(_2088, _2066, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2096 = fma(_2088, _2092, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2098 = fma(_2088, _2072, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2100 = fma(_2088, _2076, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2102 = fma(_2088, _2080, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2104 = fma(_2088, _2084, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2034 = _2098;
            _2008 = _2102;
            _2044 = _2094;
            _2002 = _2100;
            _1996 = _2096;
            _2022 = _2104;
            _2106 = true;
        }
        else
        {
            bool _2108 = _1749 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2110 = isnan(_1749);
            bool _2112 = _2108 || _2110;
            bool _2114 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2116 = _2112 || _2114;
            if (!_2116)
            {
                _2042 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2118 = _2042;
            _2044 = _2118;
            if (!_2116)
            {
                _2032 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2120 = _2032;
            _2034 = _2120;
            if (!_2116)
            {
                _1994 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2122 = _1994;
            _1996 = _2122;
            if (!_2116)
            {
                _2000 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2124 = _2000;
            _2002 = _2124;
            if (!_2116)
            {
                _2006 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2126 = _2006;
            _2008 = _2126;
            if (!_2116)
            {
                _2020 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2128 = _2020;
            bool _2130 = !_2116;
            _2022 = _2128;
            if (!_2130)
            {
                bool _2132 = _1749 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2134 = isnan(_1749);
                bool _2136 = _2132 || _2134;
                bool _2138 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2140 = _2136 || _2138;
                if (!_2140)
                {
                    float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2144 = _1749 + _2142;
                    float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2148 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2146;
                    float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2152 = _2150 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2154 = 1.0 / _2148;
                    float _2156 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2158 = _2156 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2162 = _2160 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2164 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2166 = _2164 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2168 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2170 = _2168 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2172 = _2144 * _2154;
                    float _2174 = precise::clamp(_2172, 0.0, 1.0);
                    float _2176 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2178 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2180 = fma(_2174, _2152, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2182 = fma(_2174, _2178, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2184 = fma(_2174, _2158, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2186 = fma(_2174, _2162, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2188 = fma(_2174, _2166, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2190 = fma(_2174, _2170, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2034 = _2184;
                    _2008 = _2188;
                    _2044 = _2180;
                    _2002 = _2186;
                    _1996 = _2182;
                    _2022 = _2190;
                    _2106 = true;
                }
                else
                {
                    _2034 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2008 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2044 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2002 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1996 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2022 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2106 = false;
    float _2192 = _2034;
    float _2194 = _2008;
    float _2196 = _2044;
    float _2198 = _2002;
    float _2200 = _1996;
    float _2202 = _2022;
    float _2204 = fma(_1413, -0.5, 0.5);
    float _2206 = precise::clamp(_2204, 0.0, 1.0);
    float _2208 = -_2192;
    float _2210 = _2208 + _2194;
    float _2212 = -_2196;
    float _2214 = _2212 + _2198;
    float _2216 = -_2200;
    float _2218 = _2216 + _2202;
    bool _2220 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2222 = fma(_2206, _2210, _2192);
    float _2224 = fma(_2206, _2214, _2196);
    float _2226 = fma(_2206, _2218, _2200);
    float _2228 = _2222 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2230 = fma(_2224, 0.298911988735198974609375, _2228);
    float _2232 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2234 = fma(_2226, 0.114477999508380889892578125, _2230);
    out.m_85.w = _2232;
    float _2236 = -_2234;
    float _2238 = _2224 + _2236;
    float _2240 = -_2234;
    float _2242 = _2222 + _2240;
    float _2244 = -_2234;
    float _2246 = _2226 + _2244;
    out.m_87.x = 0.0;
    float _2248 = fma(_2238, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2234);
    float _2250 = fma(_2242, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2234);
    float _2252 = fma(_2246, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2234);
    out.m_89.x = _2248;
    out.m_89.y = _2250;
    out.m_89.z = _2252;
    if (!_2220)
    {
        return out;
    }
    float _2254 = -_1599;
    float _2256 = _2254 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2258 = -_1601;
    float _2260 = _2258 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2262 = -_1603;
    float _2264 = _2262 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2266 = _2256 * _2256;
    float _2268 = fma(_2260, _2260, _2266);
    float _2270 = fma(_2264, _2264, _2268);
    float _2272 = sqrt(_2270);
    float _2274 = rsqrt(_2270);
    float _2276 = -_2272;
    float _2278 = _2276 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2280 = _2278 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2282 = precise::clamp(_2280, 0.0, 1.0);
    float _2284 = _2260 * _2274;
    float _2286 = _2256 * _2274;
    float _2288 = abs(_2282);
    float _2290 = log2(_2288);
    float _2292 = _2264 * _2274;
    float _2294 = _2284 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2296 = _1413 * _2286;
    float _2298 = -_2286;
    float _2300 = -_2294;
    float _2302 = fma(_2298, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2300);
    float _2304 = fma(_1411, _2284, _2296);
    float _2306 = -_2292;
    float _2308 = fma(_2306, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2302);
    float _2310 = fma(_1419, _2292, _2304);
    float _2312 = precise::clamp(_2310, 0.0, 1.0);
    float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2316 = _2308 + _2314;
    float _2318 = _2290 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2320 = _2316 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2322 = precise::clamp(_2320, 0.0, 1.0);
    float _2324 = exp2(_2318);
    float _2326 = _2324 * _2322;
    float _2328 = _2312 * _2326;
    float _2330 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2332 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2334 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2330;
    out.m_87.y = _2332;
    out.m_87.z = _2334;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2106 = false;
    bool _1471 = false;
    bool _309 = false;
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
        float _2391 = as_type<float>(_127);
        out.gl_Position.z = _2391;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_53.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_111);
        _121 = _149;
    }
    float _151 = _121;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2461 = as_type<float>(_165);
        out.gl_Position.z = _2461;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = in.m_55.w;
    float _169 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _171 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _173 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _175 = _171 || _173;
    bool _177 = isnan(1.0);
    bool _179 = _175 || _177;
    float _181 = in.m_53.x;
    float _183 = in.m_53.y;
    float _185 = in.m_53.z;
    float _187 = in.m_48.x;
    float _189 = in.m_48.y;
    float _191 = in.m_48.z;
    float _193 = 0.0;
    float _195 = _169;
    if (!_179)
    {
        float _197 = _169 * _169;
        float _199 = _197 * 0.5;
        _193 = _199;
    }
    float _201 = _193;
    float _203 = _201;
    if (!_179)
    {
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _205;
    }
    float _207 = _203;
    bool _209 = !_179;
    float _211 = _207;
    if (!_209)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _169 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _169);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _241;
    }
    float _243 = _211;
    bool _245 = !_179;
    if (!_245)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _169 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _195 = _265;
    }
    float _267 = _195;
    bool _269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _271 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _273 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _275 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _277 = fma(_267, _181, _271);
    float _279 = fma(_267, _183, _273);
    float _281 = fma(_267, _185, _275);
    float _283 = fma(_277, _167, _187);
    float _285 = fma(_279, _167, _189);
    float _287 = fma(_281, _167, _191);
    bool _289 = !_269;
    float _307;
    if (!_289)
    {
        float _291 = in.m_57.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        float _311 = float(_111);
        float _313 = 1.0 / _311;
        float _315 = _145 * _313;
        _307 = _315;
    }
    _309 = false;
    float _317 = _307;
    int _319 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _321 = _319;
    int _323 = 0;
    int _325 = _102(_321, _323, (*spvDescriptorSet0.support_buffer));
    float _327 = in.m_57.x;
    float _329 = in.m_59.z;
    float _331 = _327 * 8.0;
    float _333 = rint(_331);
    float _335 = _333 * 0.125;
    float _337 = precise::clamp(_335, 0.0, 1.0);
    int _339 = _325 + (-1);
    float _341 = float(_339);
    float _343 = _337 * _341;
    float _345 = trunc(_329);
    int _347 = int(_345);
    float _349 = trunc(_343);
    int _351 = int(_349);
    int _353 = _351 + 1;
    int _355 = min(_339, _353);
    int _357 = _351;
    int _359 = 0;
    int _361 = _103(_357, _359, (*spvDescriptorSet0.support_buffer));
    int _363 = _347;
    int _365 = 0;
    int _367 = _103(_363, _365, (*spvDescriptorSet0.support_buffer));
    float3 _371 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_361, _367)), 0).xyz;
    float _373 = _371.x;
    float _375 = _371.y;
    float _377 = _371.z;
    int _379 = _355;
    int _381 = 0;
    int _383 = _103(_379, _381, (*spvDescriptorSet0.support_buffer));
    int _385 = _347;
    int _387 = 0;
    int _389 = _103(_385, _387, (*spvDescriptorSet0.support_buffer));
    float3 _391 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_383, _389)), 0).xyz;
    float _393 = _391.x;
    float _395 = _391.y;
    float _397 = _391.z;
    float _399 = in.m_57.w;
    float _401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _403 = in.m_59.y;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _407 = _405 != 0;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _411 = _409 != 0;
    float _413 = in.m_57.y;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _417 = _415 != 0;
    float _419 = in.m_57.z;
    float _421 = _285 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _425 = _423 != 0;
    float _427 = _285 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _431 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[5].x, _421);
    float _433 = _327 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _437 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[5].z, _431);
    float _439 = -_429;
    float _441 = fma(_433, 2.0, _439);
    float _443 = in.m_59.x;
    bool _445 = _399 > 0.5;
    float _447 = _285 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _449 = -_403;
    float _451 = _449 + 1.0;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _453;
    float _457 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[4].x, _447);
    float _459 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[6].x, _427);
    int _461 = _445 ? as_type<int>(_451) : as_type<int>(_403);
    float _463 = _413 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _475 = _473 != 0;
    float _477 = _419 * 2.0;
    float _479 = fma(_463, -2.0, _435);
    float _481 = 1.0 / _455;
    float _483 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[4].z, _457);
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _491 = _417 ? as_type<float>(_461) : _403;
    float _493 = _485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _495 = _487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _499 = floor(_477);
    bool _501 = _413 > 0.5;
    float _503 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[6].z, _459);
    float _505 = _413 + _419;
    out.m_61.x = _497;
    out.m_61.y = _493;
    out.m_61.z = _495;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _509 = _317 + _507;
    float _511 = _403;
    int _513 = as_type<int>(_479);
    float _515 = _343;
    if (_425)
    {
        float _517 = _501 ? _451 : _403;
        _511 = _517;
    }
    float _519 = _511;
    float _521 = _327 * 2.0;
    float _523 = _505 + (-1.0);
    float _525 = _509 * _481;
    float _527 = _413 * 2.0;
    float _529 = floor(_521);
    float _531 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _533 = -_145;
    float _535 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[76].x, _441);
    float _537 = _327 + _419;
    bool _539 = _499 > 0.0;
    float _541 = _327 + _413;
    float _543 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _545 = log2(_543);
    bool _547 = _499 >= 0.0;
    bool _549 = isnan(_499);
    bool _551 = _547 || _549;
    bool _553 = isnan(0.0);
    bool _555 = _551 || _553;
    float _557 = _537 + (-1.0);
    float _559 = _541 + (-1.0);
    bool _561 = !_467;
    int _563 = _561 ? 0 : 1;
    float _565 = _483 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _567 = _555 ? 0 : 1;
    float _569 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _571 = floor(_527);
    float _573 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _575 = ~_567;
    int _577 = _575 + 1;
    int _579 = _577 + 1;
    float _581 = _503 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _583 = _579;
    float _585 = _519;
    float _587 = _581;
    if (!_539)
    {
        int _589 = ~_567;
        int _591 = _589 + 1;
        _583 = _591;
    }
    int _593 = _583;
    float _595 = _437 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _597 = _545 * _145;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _599;
    bool _603 = _529 >= 0.0;
    bool _605 = isnan(_529);
    bool _607 = _603 || _605;
    bool _609 = isnan(0.0);
    bool _611 = _607 || _609;
    float _613 = exp2(_597);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _619;
    float _623 = fma(_601, _525, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _625 = _611 ? 0 : 1;
    float _627 = fma(_617, _525, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _629 = fma(_621, _525, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _631 = _571 > 0.0;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _635 = 1.0 + _633;
    bool _637 = _571 >= 0.0;
    bool _639 = isnan(_571);
    bool _641 = _637 || _639;
    bool _643 = isnan(0.0);
    bool _645 = _641 || _643;
    float _647 = 1.0 / _635;
    bool _649 = !_471;
    int _651 = _649 ? 0 : 1;
    float _653 = -_613;
    float _655 = _653 + 1.0;
    bool _657 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _659 = isnan(0.0);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _665 = _661 || _663;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _669 = _529 > 0.0;
    float _671 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[78].z, _667);
    float _673 = _665 ? _655 : 0.0;
    bool _675 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _677 = isnan(_317);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _689 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _691 = isnan(1.0);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _697 = _693 || _695;
    float _699 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _671);
    bool _701 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _703 = isnan(_317);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[78].w, _687);
    float _715 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _479);
    float _717 = _667;
    bool _719 = _697;
    bool _721 = _669;
    if (_407)
    {
        float _723 = -_443;
        float _725 = _723 + 1.0;
        _513 = as_type<int>(_725);
    }
    int _727 = _513;
    int _729 = abs(_651);
    float _731 = -_711;
    float _733 = _731 + 1.0;
    float _735 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _713);
    int _737 = abs(_563);
    float _739 = _401 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _741 = _685 * _733;
    int _743 = _729;
    if (!_407)
    {
        _717 = _443;
    }
    float _745 = _717;
    float _747 = _745;
    if (_697)
    {
        float _749 = _673 * _647;
        _147 = _749;
    }
    float _751 = _147;
    if (_407)
    {
        bool _753 = _327 > 0.5;
        _719 = _753;
    }
    bool _755 = _719;
    float _757 = _627 * _741;
    float _759 = _629 * _741;
    float _761 = _623 * _741;
    float _763 = float(_737);
    float _765 = in.m_63.x;
    float _767 = in.m_63.y;
    float _769 = in.m_63.z;
    float _771 = float(_593);
    float _773 = fma(_739, _519, -0.5);
    if (_407)
    {
        float _775 = _755 ? as_type<float>(_727) : _443;
        _747 = _775;
    }
    float _777 = _747;
    float _779 = _327 + (-0.5);
    int _781 = ~_625;
    int _783 = _781 + 1;
    int _785 = _783 + 1;
    float _787 = _763 * _771;
    int _789 = _785;
    if (_411)
    {
        float _791 = -_443;
        float _793 = _791 + 1.0;
        _743 = as_type<int>(_793);
    }
    int _795 = _743;
    if (!_669)
    {
        int _797 = ~_625;
        int _799 = _797 + 1;
        _789 = _799;
    }
    int _801 = _789;
    float _803 = -_715;
    float _805 = fma(_735, _773, _803);
    if (_411)
    {
        bool _807 = _419 > 0.5;
        _721 = _807;
    }
    bool _809 = _721;
    float _811 = _413 + (-0.5);
    if (!_411)
    {
        _585 = _443;
    }
    float _813 = _585;
    float _815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _817 = _813;
    if (_411)
    {
        float _819 = _809 ? as_type<float>(_795) : _443;
        _817 = _819;
    }
    float _821 = _817;
    float _823 = _787 * (-2.0);
    float _825 = float(_729);
    float _827 = _419 + (-0.5);
    float _829 = float(_801);
    float _831 = fma(_573, _823, _573);
    int _833 = _645 ? 0 : 1;
    float _835 = fma(_823, _765, _765);
    float _837 = _825 * _829;
    int _839 = ~_833;
    int _841 = _839 + 1;
    int _843 = _841 + 1;
    float _845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _847 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[196].x, _835);
    bool _849 = !_475;
    int _851 = _849 ? 0 : 1;
    int _853 = _843;
    if (!_631)
    {
        int _855 = ~_833;
        int _857 = _855 + 1;
        _853 = _857;
    }
    int _859 = _853;
    float _861 = _837 * (-2.0);
    int _863 = abs(_851);
    float _865 = fma(_831, _751, _847);
    float _867 = float(_859);
    float _869 = fma(_531, _861, _531);
    float _871 = fma(_861, _767, _767);
    float _873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _875 = -_685;
    float _877 = _875 + 1.0;
    float _879 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[196].y, _871);
    float _881 = float(_863);
    float _883 = _865 * 0.15915493667125701904296875;
    float _885 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[143].x, _757);
    float _887 = fma(_869, _751, _879);
    float _889 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[143].y, _759);
    float _891 = _881 * _867;
    float _893 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[143].z, _761);
    float _895 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[144].x, _885);
    float _897 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[144].y, _889);
    float _899 = _891 * (-2.0);
    float _901 = _815 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _903 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[144].z, _893);
    float _905 = _491 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _907 = fma(_899, _769, _769);
    float _909 = fma(_569, _899, _569);
    float _911 = fma(_901, _777, -0.5);
    float _913 = _883 * 6.283185482025146484375;
    float _915 = sin(_913);
    float _917 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[196].z, _907);
    float _919 = _887 * 0.15915493667125701904296875;
    float _921 = in.m_55.x;
    float _923 = in.m_55.y;
    float _925 = in.m_55.z;
    float _927 = fma(_699, _911, _535);
    float _929 = fma(_909, _751, _917);
    float _931 = _905 * _873;
    float _933 = _883 * 6.283185482025146484375;
    float _935 = cos(_933);
    float _937 = _821 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _943 = _937 * _845;
    float _945 = _919 * 6.283185482025146484375;
    float _947 = sin(_945);
    float _949 = _929 * 0.15915493667125701904296875;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _953 = in.m_65.x;
    float _955 = in.m_65.y;
    float _957 = in.m_65.z;
    float _959 = in.m_65.w;
    float _961 = _939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _963 = _941 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _965 = _951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _967 = _927 + 0.5;
    float _969 = _919 * 6.283185482025146484375;
    float _971 = cos(_969);
    float _973 = _805 + 0.5;
    float _975 = _897 * _923;
    float _977 = _895 * _921;
    out.m_67.x = _963;
    out.m_67.y = _965;
    out.m_67.z = _961;
    float _979 = _903 * _925;
    float _981 = _949 * 6.283185482025146484375;
    float _983 = cos(_981);
    float _985 = _935 * _947;
    out.m_69.x = _967;
    out.m_69.y = _973;
    out.m_69.z = _943;
    out.m_69.w = _931;
    float _987 = _979 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _989 = _949 * 6.283185482025146484375;
    float _991 = sin(_989);
    float _993 = _935 * _971;
    float _995 = _915 * _971;
    float _997 = floor(_343);
    float _999 = _935 * _983;
    float _1001 = _915 * _947;
    float _1003 = _971 * _983;
    float _1005 = _915 * _983;
    float _1007 = _999 * _955;
    float _1009 = _947 * _983;
    float _1011 = fma(_991, _993, _1001);
    float _1013 = -_955;
    float _1015 = _991 * _1013;
    float _1017 = -_995;
    float _1019 = fma(_991, _985, _1017);
    float _1021 = fma(_991, _1001, _993);
    float _1023 = fma(_1011, _953, _1007);
    float _1025 = fma(_1003, _953, _1015);
    float _1027 = -_985;
    float _1029 = fma(_991, _995, _1027);
    float _1031 = _1005 * _955;
    float _1033 = fma(_1019, _957, _1023);
    float _1035 = -_997;
    float _1037 = _343 + _1035;
    float _1039 = fma(_1009, _957, _1025);
    float _1041 = _1033 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1043 = _1033 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1045 = _1033 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1047 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1041);
    float _1049 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1043);
    float _1051 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1045);
    float _1053 = fma(_1029, _953, _1031);
    float _1055 = -_375;
    float _1057 = _1055 + _395;
    float _1059 = -_373;
    float _1061 = _1059 + _393;
    float _1063 = fma(_1037, _1057, _375);
    float _1065 = -_377;
    float _1067 = _1065 + _397;
    float _1069 = fma(_1037, _1061, _373);
    float _1071 = in.m_71.x;
    float _1073 = in.m_71.y;
    float _1075 = in.m_71.z;
    float _1077 = fma(_1021, _957, _1053);
    float _1079 = fma(_1037, _1067, _377);
    bool _1081 = _1063 != 0.0;
    bool _1083 = isnan(_1063);
    bool _1085 = _1081 || _1083;
    bool _1087 = isnan(0.0);
    bool _1089 = _1085 || _1087;
    float _1091 = fma(_1077, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1049);
    float _1093 = _975 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1095 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1063);
    bool _1097 = _1069 == 0.0;
    bool _1099 = !_1089;
    bool _1101 = _1097 && _1099;
    float _1103 = fma(_1077, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1047);
    float _1105 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1079);
    float _1107 = _977 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1109 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1069);
    float _1111 = _1095 * _1093;
    bool _1113 = _1079 == 0.0;
    bool _1115 = _1113 && _1101;
    float _1117 = _1105 * _987;
    float _1119 = _1109 * _1107;
    float _1121 = _999 * _1111;
    float _1123 = -_1111;
    float _1125 = _991 * _1123;
    float _1127 = fma(_1077, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1051);
    float _1129 = _1005 * _1111;
    float _1131 = fma(_1011, _1119, _1121);
    float _1133 = fma(_1003, _1119, _1125);
    out.m_73.x = _1103;
    out.m_73.y = _1091;
    out.m_73.z = _1127;
    float _1135 = fma(_1019, _1117, _1131);
    float _1137 = fma(_1029, _1119, _1129);
    float _1139 = _983;
    float _1141 = _1125;
    float _1143 = _1133;
    float _1145 = _1117;
    if (_1115)
    {
        _515 = _1071;
    }
    float _1147 = _515;
    float _1149 = _1135 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1151 = _1147;
    if (_1115)
    {
        _1139 = _1073;
    }
    float _1153 = _1139;
    float _1155 = _1153;
    if (_1115)
    {
        _1141 = _1147;
    }
    float _1157 = _1141;
    float _1159 = _1157;
    if (!_1115)
    {
        _1151 = _1071;
    }
    float _1161 = _1151;
    float _1163 = fma(_1021, _1117, _1137);
    float _1165 = fma(_1009, _1117, _1133);
    float _1167 = _1135 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1169 = _1165;
    if (_1115)
    {
        _1143 = _1075;
    }
    float _1171 = _1143;
    float _1173 = _1171;
    if (!_1115)
    {
        float _1175 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1161);
        _1159 = _1175;
    }
    float _1177 = _1159;
    float _1179 = fma(_1165, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1149);
    float _1181 = fma(_1165, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1167);
    float _1183 = _1179;
    if (_1115)
    {
        _1145 = _1171;
    }
    float _1185 = _1145;
    float _1187 = _957 * _1161;
    float _1189 = fma(_1163, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1179);
    float _1191 = fma(_1163, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1181);
    float _1193 = _1185;
    if (_1115)
    {
        _1183 = _1153;
    }
    float _1195 = _1183;
    float _1197 = _581 + _1189;
    float _1199 = _565 + _1191;
    float _1201 = _1195;
    float _1203 = _1197;
    float _1205 = _1199;
    if (!_1115)
    {
        _1155 = _1073;
    }
    float _1207 = _1155;
    if (!_1115)
    {
        _1173 = _1075;
    }
    float _1209 = _1173;
    float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1213 = _1199 + _1211;
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1217 = _1197 + _1215;
    if (!_1115)
    {
        float _1219 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1207);
        _1201 = _1219;
    }
    float _1221 = _1201;
    float _1223 = _1213 * _1213;
    float _1225 = _1217 * _1217;
    float _1227 = _1223;
    float _1229 = _1225;
    if (!_1115)
    {
        float _1231 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1209);
        _1193 = _1231;
    }
    float _1233 = _1193;
    float _1235 = _955 * _1209;
    float _1237 = -_1187;
    float _1239 = fma(_953, _1209, _1237);
    float _1241 = _1223 + _1225;
    float _1243 = _953 * _1207;
    float _1245 = -_1235;
    float _1247 = fma(_957, _1207, _1245);
    float _1249 = _1135 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1251 = sqrt(_1241);
    float _1253 = -_1221;
    float _1255 = _991 * _1253;
    float _1257 = _999 * _1221;
    float _1259 = _1005 * _1221;
    float _1261 = -_1243;
    float _1263 = fma(_955, _1161, _1261);
    float _1265 = _1239 * _959;
    float _1267 = fma(_1165, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1249);
    float _1269 = fma(_1003, _1177, _1255);
    float _1271 = fma(_1011, _1177, _1257);
    float _1273 = fma(_1029, _1177, _1259);
    float _1275 = _1247 * _959;
    float _1277 = -_1265;
    float _1279 = _991 * _1277;
    float _1281 = _999 * _1265;
    float _1283 = _1005 * _1265;
    float _1285 = fma(_1163, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1267);
    float _1287 = fma(_1003, _1275, _1279);
    bool _1289 = _1251 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1291 = fma(_1011, _1275, _1281);
    float _1293 = fma(_1029, _1275, _1283);
    float _1295 = _595 + _1285;
    float _1297 = _1263 * _959;
    float _1299 = fma(_1009, _1233, _1269);
    float _1301 = fma(_1019, _1233, _1271);
    float _1303 = fma(_1021, _1233, _1273);
    float _1305 = fma(_1009, _1297, _1287);
    float _1307 = fma(_1019, _1297, _1291);
    float _1309 = fma(_1021, _1297, _1293);
    if (!_1289)
    {
        _1169 = _1295;
    }
    float _1311 = _1169;
    bool _1313 = !_1289;
    float _1315 = _1311;
    if (!_1313)
    {
        float _1317 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1319 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1321 = _1251 + _1319;
        float _1323 = rsqrt(_1241);
        float _1325 = _1321 * _1317;
        float _1327 = _1295 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1329 = _1325 * 0.15915493667125701904296875;
        float _1331 = _1329 * 6.283185482025146484375;
        float _1333 = sin(_1331);
        float _1335 = _1329 * 6.283185482025146484375;
        float _1337 = cos(_1335);
        float _1339 = fma(_1333, _1327, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1341 = _1323 * _1339;
        float _1343 = fma(_1213, _1341, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1345 = _1337 + (-1.0);
        float _1347 = fma(_1217, _1341, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1349 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1351 = _1343 + _1349;
        float _1353 = _1345 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1357 = _1347 + _1355;
        float _1359 = _1351 * _1351;
        float _1361 = fma(_1295, _1337, _1353);
        float _1363 = _1357 * _1357;
        _1315 = _1361;
        _1227 = _1359;
        _1229 = _1363;
        _1203 = _1347;
        _1205 = _1343;
    }
    float _1365 = _1315;
    float _1367 = _1227;
    float _1369 = _1229;
    float _1371 = _1203;
    float _1373 = _1205;
    float _1375 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1377 = _1365 + _1375;
    float _1379 = _1307 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1381 = _1307 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1383 = _1307 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1385 = fma(_1377, _1377, _1367);
    float _1387 = _1301 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1389 = _1301 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1391 = _1301 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1393 = _1385 + _1369;
    float _1395 = fma(_1305, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1379);
    float _1397 = fma(_1305, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1381);
    float _1399 = fma(_1305, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1383);
    float _1401 = fma(_1299, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1387);
    float _1403 = fma(_1299, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1389);
    float _1405 = sqrt(_1393);
    float _1407 = fma(_1299, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1391);
    float _1409 = fma(_1309, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1397);
    float _1411 = fma(_1303, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1401);
    float _1413 = fma(_1303, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1403);
    float _1415 = fma(_1309, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1395);
    float _1417 = fma(_1309, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1399);
    float _1419 = fma(_1303, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1407);
    out.m_75.x = _1409;
    out.m_75.y = _1415;
    out.m_75.z = _1417;
    out.m_77.x = _1411;
    out.m_77.y = _1413;
    out.m_77.z = _1419;
    bool _1421 = _1405 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1423 = isnan(_1405);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1429 = _1425 || _1427;
    float _1431 = _1401;
    float _1433 = _1417;
    float _1435 = _1415;
    if (!_1429)
    {
        _1431 = 1.0;
    }
    float _1437 = _1431;
    bool _1439 = !_1429;
    float _1441 = _1437;
    if (!_1439)
    {
        bool _1443 = _1405 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1445 = isnan(_1405);
        bool _1447 = _1443 || _1445;
        bool _1449 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1451 = _1447 || _1449;
        if (!_1451)
        {
            float _1453 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1455 = _1405 + _1453;
            float _1457 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1459 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1457;
            float _1461 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1463 = _1461 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1465 = 1.0 / _1459;
            float _1467 = _1455 * _1465;
            float _1469 = fma(_1467, _1463, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1441 = _1469;
            _1433 = _1463;
            _1471 = true;
        }
        else
        {
            bool _1473 = _1405 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1475 = isnan(_1405);
            bool _1477 = _1473 || _1475;
            bool _1479 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1481 = _1477 || _1479;
            if (!_1481)
            {
                float _1483 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1485 = _1405 + _1483;
                float _1487 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1489 = _1487 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1491 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1493 = _1491 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1495 = 1.0 / _1489;
                float _1497 = _1485 * _1495;
                float _1499 = fma(_1497, _1493, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1441 = _1499;
                _1433 = _1493;
                _1471 = true;
            }
            else
            {
                _1441 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1471 = false;
    float _1501 = _1441;
    float _1503 = _1433;
    float _1505 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1507 = _1365 + _1505;
    float _1509 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1511 = _1371 + _1509;
    bool _1513 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1517 = _1513 || _1515;
    bool _1519 = isnan(0.5);
    bool _1521 = _1517 || _1519;
    float _1523 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1525 = _1373 + _1523;
    float _1527 = fma(_1507, _1501, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1529 = fma(_1511, _1501, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1531 = fma(_1525, _1501, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1533 = _1525;
    float _1535 = _1503;
    if (_1521)
    {
        _1533 = _1531;
    }
    float _1537 = _1533;
    float _1539 = _1537;
    if (_1521)
    {
        _1435 = _1527;
    }
    float _1541 = _1435;
    float _1543 = _1541;
    if (_1521)
    {
        _1535 = _1529;
    }
    float _1545 = _1535;
    float _1547 = _1545;
    if (!_1521)
    {
        float _1549 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1551 = _595 + _1549;
        float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1555 = _565 + _1553;
        float _1557 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1559 = _1551 * _1551;
        float _1561 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1563 = _581 + _1561;
        float _1565 = fma(_1555, _1555, _1559);
        float _1567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1569 = fma(_1563, _1563, _1565);
        float _1571 = sqrt(_1569);
        float _1573 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1575 = -_581;
        float _1577 = _1575 + _1529;
        float _1579 = precise::min(_1571, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1581 = _1579 * _1567;
        float _1583 = -_565;
        float _1585 = _1583 + _1531;
        float _1587 = -_595;
        float _1589 = _1587 + _1527;
        float _1591 = _1573 * _1581;
        float _1593 = fma(_1585, _1591, _565);
        float _1595 = fma(_1589, _1591, _595);
        float _1597 = fma(_1577, _1591, _581);
        _1543 = _1595;
        _1539 = _1593;
        _1547 = _1597;
    }
    float _1599 = _1543;
    float _1601 = _1539;
    float _1603 = _1547;
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1607 = _1599 + _1605;
    float _1609 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1611 = _1601 + _1609;
    float _1613 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1615 = _1603 + _1613;
    float _1617 = _1607 * _1607;
    float _1619 = fma(_1611, _1611, _1617);
    float _1621 = fma(_1615, _1615, _1619);
    float _1623 = rsqrt(_1621);
    float _1625 = _1623 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1627 = _1611 * _1625;
    float _1629 = _1615 * _1625;
    float _1631 = _1627 * _1627;
    float _1633 = _1629 * _1629;
    float _1635 = _1631 + _1633;
    float _1637 = sqrt(_1635);
    bool _1639 = _1637 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1641 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1643 = _1637 + _1641;
    float _1645 = _1405;
    float _1647 = _1635;
    float _1649 = _1643;
    float _1651 = _1607;
    float _1653 = _1625;
    float _1655 = _1627;
    if (_1639)
    {
        float _1657 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1645 = _1657;
    }
    float _1659 = _1645;
    if (_1639)
    {
        float _1661 = rsqrt(_1635);
        _1647 = _1661;
    }
    float _1663 = _1647;
    float _1665 = _1659;
    float _1667 = _1663;
    if (_1639)
    {
        float _1669 = _1643 * _1659;
        _1649 = _1669;
    }
    float _1671 = _1649;
    if (_1639)
    {
        float _1673 = _1671 * 0.15915493667125701904296875;
        _587 = _1673;
    }
    float _1675 = _587;
    float _1677 = _1615;
    if (_1639)
    {
        float _1679 = _1675 * 6.283185482025146484375;
        float _1681 = sin(_1679);
        _1677 = _1681;
    }
    float _1683 = _1677;
    float _1685 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1687 = precise::max(0.0, _1685);
    float _1689 = _1407;
    float _1691 = _1687;
    if (_1639)
    {
        float _1693 = _1675 * 6.283185482025146484375;
        float _1695 = cos(_1693);
        _1689 = _1695;
    }
    float _1697 = _1689;
    float _1699 = -_1625;
    float _1701 = -_1687;
    float _1703 = fma(_1607, _1699, _1701);
    if (_1639)
    {
        float _1705 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1651 = _1705;
    }
    float _1707 = _1651;
    float _1709 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1711 = _1683;
    float _1713 = _1707;
    if (_1639)
    {
        float _1715 = fma(_1683, _1707, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1711 = _1715;
    }
    float _1717 = _1711;
    float _1719 = _1717;
    if (!_1639)
    {
        _1713 = _1629;
    }
    float _1721 = _1713;
    float _1723 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1709);
    float _1725 = _1721;
    float _1727 = _1697;
    if (_1639)
    {
        float _1729 = _1697 + (-1.0);
        _1691 = _1729;
    }
    float _1731 = _1691;
    if (_1639)
    {
        float _1733 = _1663 * _1717;
        _1653 = _1733;
    }
    float _1735 = _1653;
    if (!_1639)
    {
        _1719 = _1703;
    }
    float _1737 = _1719;
    float _1739 = _1737;
    if (_1639)
    {
        float _1741 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1665 = _1741;
    }
    float _1743 = _1665;
    if (_1639)
    {
        float _1745 = _1627 * _1735;
        _1655 = _1745;
    }
    float _1747 = _1655;
    float _1749 = sqrt(_1621);
    if (!_1639)
    {
        _1667 = _1631;
    }
    float _1751 = _1667;
    float _1753 = _1751;
    if (_1639)
    {
        float _1755 = fma(_1703, _1697, _1743);
        _1739 = _1755;
    }
    float _1757 = _1739;
    if (_1639)
    {
        float _1759 = _1629 * _1735;
        _1725 = _1759;
    }
    float _1761 = _1725;
    if (_1639)
    {
        float _1763 = _1747 * _1747;
        _1753 = _1763;
    }
    float _1765 = _1753;
    if (!_1639)
    {
        _1727 = _1633;
    }
    float _1767 = _1727;
    float _1769 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1771 = _1767;
    if (_1639)
    {
        float _1773 = _1761 * _1761;
        _1771 = _1773;
    }
    float _1775 = _1771;
    float _1777 = fma(_1757, _1757, _1765);
    float _1779 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1769);
    float _1781 = _1777 + _1775;
    float _1783 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1785 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1723);
    float _1787 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1789 = rsqrt(_1781);
    float _1791 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1793 = fma(_1749, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1791);
    float _1795 = precise::clamp(_1793, 0.0, 1.0);
    float _1797 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1783);
    float _1799 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1787);
    float _1801 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1803 = -_1795;
    float _1805 = _1803 + 1.0;
    float _1807 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1797);
    float _1809 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1799);
    float _1811 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1813 = abs(_1805);
    float _1815 = log2(_1813);
    float _1817 = _1807 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1819 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1821 = _1809 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1823 = -_1819;
    float _1825 = fma(_1823, _1811, 1.0);
    float _1827 = _1789 * _1747;
    float _1829 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1779);
    float _1831 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1833 = _1789 * _1757;
    float _1835 = _1789 * _1761;
    float _1837 = _1829 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1839 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1831);
    float _1841 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1843 = log2(_1825);
    float _1845 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1847 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1839);
    float _1849 = -_1841;
    float _1851 = fma(_1833, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1849);
    float _1853 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1855 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1847);
    float _1857 = -_1835;
    float _1859 = fma(_1857, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1851);
    float _1861 = exp2(_1845);
    float _1863 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1865 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1853);
    float _1867 = fma(_1859, -0.5, 0.5);
    float _1869 = fma(_1859, 0.5, 0.5);
    float _1871 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1863);
    float _1873 = _1833 + 1.0;
    float _1875 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1865);
    float _1877 = 1.0 / _1855;
    float _1879 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1871);
    float _1881 = fma(_1869, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1883 = _1843 * 0.693147182464599609375;
    float _1885 = fma(_1869, _1881, -0.212114393711090087890625);
    float _1887 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1889 = sqrt(_1867);
    float _1891 = -_1833;
    float _1893 = fma(_1861, _1873, _1891);
    float _1895 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1879);
    float _1897 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1875);
    float _1899 = fma(_1869, _1885, 1.570728778839111328125);
    float _1901 = _1895 * _1877;
    float _1903 = _1897 * _1877;
    float _1905 = fma(_1901, 0.5, 0.5);
    float _1907 = fma(_1903, -0.5, 0.5);
    float _1909 = _1889 * 0.636619746685028076171875;
    float3 _5254 = float3(_1905, _1907, _1887);
    float _1911 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5254, float3(0.0), isnan(_5254)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5254, float3(0.0), isnan(_5254)), level(0.0)).x;
    float _1913 = -_1899;
    float _1915 = fma(_1909, _1913, 1.0);
    float _1917 = fma(_1893, 0.5, 0.5);
    float3 _5272 = float3(_1905, _1907, _1887);
    float4 _1920 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5272, float3(0.0), isnan(_5272)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5272, float3(0.0), isnan(_5272)), level(0.0)).xyzw;
    float _1922 = _1920.x;
    float _1924 = _1920.y;
    float _1926 = _1920.z;
    float _1928 = _1920.w;
    float2 _5289 = float2(_1915, _1917);
    float3 _1930 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5289, float2(0.0), isnan(_5289)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5289, float2(0.0), isnan(_5289)), level(0.0)).xyz;
    float _1932 = _1930.x;
    float _1934 = _1930.y;
    float _1936 = _1930.z;
    float _1938 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1940 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_79.x = _1601;
    out.m_79.y = _1599;
    out.m_79.z = _1603;
    bool _1942 = _1749 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1944 = isnan(_1749);
    bool _1946 = _1942 || _1944;
    bool _1948 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1950 = _1946 || _1948;
    float _1952 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1940);
    float _1954 = exp2(_1938);
    float _1956 = _1855 * 0.5;
    float _1958 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1952);
    float _1960 = fma(_1897, -0.5, _1956);
    float _1962 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1958);
    float _1964 = _1895 + _1855;
    float _1966 = _1962 + _1855;
    float _1968 = _1964 * 0.5;
    out.gl_Position.x = _1895;
    out.gl_Position.y = _1897;
    out.gl_Position.z = _1962;
    out.gl_Position.w = _1855;
    float _1970 = _1966 * 0.5;
    float _1972 = -_1954;
    float _1974 = _1972 + 1.0;
    float _1976 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _1968;
    out.m_81.y = _1960;
    out.m_81.z = _1970;
    out.m_81.w = _1855;
    float _1978 = -_1976;
    float _1980 = _1978 + 1.0;
    float _1982 = _1855;
    float _1984 = _1962;
    float _1986 = _1897;
    float _1988 = _1895;
    float _1990 = _1980;
    if (!_1950)
    {
        _1982 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1992 = _1982;
    float _1994 = _1992;
    float _1996 = _1992;
    if (!_1950)
    {
        _1984 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1998 = _1984;
    float _2000 = _1998;
    float _2002 = _1998;
    if (!_1950)
    {
        _1986 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2004 = _1986;
    float _2006 = _2004;
    float _2008 = _2004;
    if (!_1950)
    {
        _1988 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2010 = _1988;
    float _2012 = _1976 * _1911;
    float _2014 = _1928 * _2012;
    float _2016 = _1928 * _1980;
    float _2018 = _2014;
    float _2020 = _2010;
    float _2022 = _2010;
    if (!_1950)
    {
        _1990 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2024 = _1990;
    float _2026 = _1936 * _2012;
    float _2028 = fma(_1932, _2014, _1922);
    float _2030 = fma(_1934, _2014, _1924);
    float _2032 = _2024;
    float _2034 = _2024;
    if (!_1950)
    {
        _2018 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2036 = _2018;
    float _2038 = fma(_1928, _2026, _1926);
    out.m_83.x = _2028;
    out.m_83.y = _2030;
    out.m_83.z = _2038;
    out.m_83.w = _2016;
    bool _2040 = !_1950;
    float _2042 = _2036;
    float _2044 = _2036;
    if (!_2040)
    {
        bool _2046 = _1749 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2048 = isnan(_1749);
        bool _2050 = _2046 || _2048;
        bool _2052 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2054 = _2050 || _2052;
        if (!_2054)
        {
            float _2056 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2058 = _1749 + _2056;
            float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2062 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2060;
            float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2066 = _2064 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2068 = 1.0 / _2062;
            float _2070 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2072 = _2070 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2074 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2076 = _2074 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2078 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2080 = _2078 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2084 = _2082 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2086 = _2058 * _2068;
            float _2088 = precise::clamp(_2086, 0.0, 1.0);
            float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2092 = _2090 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2094 = fma(_2088, _2066, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2096 = fma(_2088, _2092, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2098 = fma(_2088, _2072, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2100 = fma(_2088, _2076, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2102 = fma(_2088, _2080, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2104 = fma(_2088, _2084, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2034 = _2098;
            _2008 = _2102;
            _2044 = _2094;
            _2002 = _2100;
            _1996 = _2096;
            _2022 = _2104;
            _2106 = true;
        }
        else
        {
            bool _2108 = _1749 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2110 = isnan(_1749);
            bool _2112 = _2108 || _2110;
            bool _2114 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2116 = _2112 || _2114;
            if (!_2116)
            {
                _2042 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2118 = _2042;
            _2044 = _2118;
            if (!_2116)
            {
                _2032 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2120 = _2032;
            _2034 = _2120;
            if (!_2116)
            {
                _1994 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2122 = _1994;
            _1996 = _2122;
            if (!_2116)
            {
                _2000 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2124 = _2000;
            _2002 = _2124;
            if (!_2116)
            {
                _2006 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2126 = _2006;
            _2008 = _2126;
            if (!_2116)
            {
                _2020 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2128 = _2020;
            bool _2130 = !_2116;
            _2022 = _2128;
            if (!_2130)
            {
                bool _2132 = _1749 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2134 = isnan(_1749);
                bool _2136 = _2132 || _2134;
                bool _2138 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2140 = _2136 || _2138;
                if (!_2140)
                {
                    float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2144 = _1749 + _2142;
                    float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2148 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2146;
                    float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2152 = _2150 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2154 = 1.0 / _2148;
                    float _2156 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2158 = _2156 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2162 = _2160 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2164 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2166 = _2164 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2168 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2170 = _2168 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2172 = _2144 * _2154;
                    float _2174 = precise::clamp(_2172, 0.0, 1.0);
                    float _2176 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2178 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2180 = fma(_2174, _2152, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2182 = fma(_2174, _2178, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2184 = fma(_2174, _2158, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2186 = fma(_2174, _2162, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2188 = fma(_2174, _2166, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2190 = fma(_2174, _2170, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2034 = _2184;
                    _2008 = _2188;
                    _2044 = _2180;
                    _2002 = _2186;
                    _1996 = _2182;
                    _2022 = _2190;
                    _2106 = true;
                }
                else
                {
                    _2034 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2008 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2044 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2002 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1996 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2022 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2106 = false;
    float _2192 = _2034;
    float _2194 = _2008;
    float _2196 = _2044;
    float _2198 = _2002;
    float _2200 = _1996;
    float _2202 = _2022;
    float _2204 = fma(_1413, -0.5, 0.5);
    float _2206 = precise::clamp(_2204, 0.0, 1.0);
    float _2208 = -_2192;
    float _2210 = _2208 + _2194;
    float _2212 = -_2196;
    float _2214 = _2212 + _2198;
    float _2216 = -_2200;
    float _2218 = _2216 + _2202;
    bool _2220 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2222 = fma(_2206, _2210, _2192);
    float _2224 = fma(_2206, _2214, _2196);
    float _2226 = fma(_2206, _2218, _2200);
    float _2228 = _2222 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2230 = fma(_2224, 0.298911988735198974609375, _2228);
    float _2232 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2234 = fma(_2226, 0.114477999508380889892578125, _2230);
    out.m_85.w = _2232;
    float _2236 = -_2234;
    float _2238 = _2224 + _2236;
    float _2240 = -_2234;
    float _2242 = _2222 + _2240;
    float _2244 = -_2234;
    float _2246 = _2226 + _2244;
    out.m_87.x = 0.0;
    float _2248 = fma(_2238, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2234);
    float _2250 = fma(_2242, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2234);
    float _2252 = fma(_2246, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2234);
    out.m_89.x = _2248;
    out.m_89.y = _2250;
    out.m_89.z = _2252;
    if (!_2220)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2254 = -_1599;
    float _2256 = _2254 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2258 = -_1601;
    float _2260 = _2258 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2262 = -_1603;
    float _2264 = _2262 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2266 = _2256 * _2256;
    float _2268 = fma(_2260, _2260, _2266);
    float _2270 = fma(_2264, _2264, _2268);
    float _2272 = sqrt(_2270);
    float _2274 = rsqrt(_2270);
    float _2276 = -_2272;
    float _2278 = _2276 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2280 = _2278 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2282 = precise::clamp(_2280, 0.0, 1.0);
    float _2284 = _2260 * _2274;
    float _2286 = _2256 * _2274;
    float _2288 = abs(_2282);
    float _2290 = log2(_2288);
    float _2292 = _2264 * _2274;
    float _2294 = _2284 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2296 = _1413 * _2286;
    float _2298 = -_2286;
    float _2300 = -_2294;
    float _2302 = fma(_2298, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2300);
    float _2304 = fma(_1411, _2284, _2296);
    float _2306 = -_2292;
    float _2308 = fma(_2306, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2302);
    float _2310 = fma(_1419, _2292, _2304);
    float _2312 = precise::clamp(_2310, 0.0, 1.0);
    float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2316 = _2308 + _2314;
    float _2318 = _2290 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2320 = _2316 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2322 = precise::clamp(_2320, 0.0, 1.0);
    float _2324 = exp2(_2318);
    float _2326 = _2324 * _2322;
    float _2328 = _2312 * _2326;
    float _2330 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2332 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2334 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2330;
    out.m_87.y = _2332;
    out.m_87.z = _2334;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

