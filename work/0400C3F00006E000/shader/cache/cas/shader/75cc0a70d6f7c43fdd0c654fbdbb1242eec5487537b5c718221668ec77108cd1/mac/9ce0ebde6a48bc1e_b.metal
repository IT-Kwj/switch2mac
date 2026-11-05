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
    float4 m_59 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
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
    float4 m_55 [[attribute(6)]];
    float4 m_69 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _102(thread const int& _6507, thread const int& _6508, constant _10& support_buffer)
{
    float _6511 = as_type<float>(support_buffer._m4);
    int _6513 = _6508 + as_type<int>(_6511);
    int _6515 = 1 + _6513;
    float _6517 = support_buffer._m5[_6515].x;
    float _6519 = abs(_6517);
    bool _6521 = _6519 == 1.0;
    if (_6521)
    {
        return _6507;
    }
    float _6523 = float(_6507);
    float _6525 = _6523 / _6519;
    int _6527 = int(_6525);
    return _6527;
}

static inline __attribute__((always_inline))
int _103(thread const int& _6557, thread const int& _6558, constant _10& support_buffer)
{
    float _6561 = as_type<float>(support_buffer._m4);
    int _6563 = _6558 + as_type<int>(_6561);
    int _6565 = 1 + _6563;
    float _6567 = support_buffer._m5[_6565].x;
    bool _6569 = _6567 == 1.0;
    if (_6569)
    {
        return _6557;
    }
    float _6571 = float(_6557);
    float _6573 = _6571 * _6567;
    int _6575 = int(_6573);
    return _6575;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
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
    bool _2266 = false;
    bool _1631 = false;
    bool _189 = false;
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
        float _2551 = as_type<float>(_127);
        out.gl_Position.z = _2551;
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
        float _2620 = as_type<float>(_165);
        out.gl_Position.z = _2620;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _169 = !_167;
    float _187;
    if (!_169)
    {
        float _171 = in.m_55.x;
        float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _179 = _177 * _173;
        float _181 = floor(_179);
        float _183 = -_181;
        float _185 = _179 + _183;
        _187 = _185;
        _189 = true;
    }
    else
    {
        float _191 = float(_111);
        float _193 = 1.0 / _191;
        float _195 = _145 * _193;
        _187 = _195;
    }
    _189 = false;
    float _197 = _187;
    int _199 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _201 = _199;
    int _203 = 0;
    int _205 = _102(_201, _203, (*spvDescriptorSet0.support_buffer));
    float _207 = in.m_55.x;
    float _209 = in.m_57.z;
    float _211 = in.m_55.w;
    float _213 = in.m_57.y;
    float _215 = _207 * 8.0;
    float _217 = rint(_215);
    float _219 = _217 * 0.125;
    float _221 = precise::clamp(_219, 0.0, 1.0);
    int _223 = _205 + (-1);
    float _225 = trunc(_209);
    int _227 = int(_225);
    float _229 = float(_223);
    float _231 = _221 * _229;
    float _233 = trunc(_231);
    int _235 = int(_233);
    int _237 = _235 + 1;
    int _239 = min(_223, _237);
    int _241 = _235;
    int _243 = 0;
    int _245 = _103(_241, _243, (*spvDescriptorSet0.support_buffer));
    int _247 = _227;
    int _249 = 0;
    int _251 = _103(_247, _249, (*spvDescriptorSet0.support_buffer));
    float3 _255 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_245, _251)), 0).xyz;
    float _257 = _255.x;
    float _259 = _255.y;
    float _261 = _255.z;
    int _263 = _239;
    int _265 = 0;
    int _267 = _103(_263, _265, (*spvDescriptorSet0.support_buffer));
    int _269 = _227;
    int _271 = 0;
    int _273 = _103(_269, _271, (*spvDescriptorSet0.support_buffer));
    float3 _275 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_267, _273)), 0).xyz;
    float _277 = _275.x;
    float _279 = _275.y;
    float _281 = _275.z;
    float _283 = in.m_55.z;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _197 + _285;
    float _289 = in.m_57.x;
    float _291 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _293 = log2(_291);
    bool _295 = _211 > 0.5;
    float _297 = -_213;
    float _299 = _297 + 1.0;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _305 = _303 != 0;
    float _307 = _207 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _311 = _309 != 0;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = _197 + _313;
    int _317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _319 = _317 != 0;
    float _321 = -_301;
    float _323 = fma(_307, 2.0, _321);
    int _325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _327 = _325 != 0;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = 1.0 / _331;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _197 + _339;
    int _343 = _295 ? as_type<int>(_299) : as_type<int>(_213);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _355 = _353 != 0;
    int _357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _359 = _357 != 0;
    int _361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _363 = _361 != 0;
    float _365 = 1.0 / _335;
    float _367 = in.m_55.y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _375 = _369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _377 = 1.0 / _347;
    float _379 = _371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _387 = _319 ? as_type<float>(_343) : _213;
    float _389 = _373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _391;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _397 = _383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _399 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _375;
    out.m_59.y = _379;
    out.m_59.z = _389;
    float _401 = _395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _403 = 1.0 / _351;
    bool _405 = _367 > 0.5;
    float _407 = _367 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_61.x = _399;
    out.m_61.y = _397;
    out.m_61.z = _401;
    float _409 = _213;
    bool _411 = _405;
    float _413 = _393;
    int _415 = as_type<int>(_399);
    bool _417 = _305;
    float _419 = _395;
    if (_327)
    {
        float _421 = _405 ? _299 : _213;
        _409 = _421;
    }
    float _423 = _409;
    float _425 = fma(_407, -2.0, _385);
    if (_305)
    {
        bool _427 = _207 > 0.5;
        _411 = _427;
    }
    bool _429 = _411;
    float _431 = 1.0 / _393;
    float _433 = _367 * 2.0;
    float _435 = _283 * 2.0;
    float _437 = _367 + _283;
    float _439 = _207 * 2.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _445 = _437 + (-1.0);
    float _447 = floor(_435);
    int _449 = as_type<int>(_437);
    if (_305)
    {
        float _451 = -_289;
        float _453 = _451 + 1.0;
        _449 = as_type<int>(_453);
    }
    int _455 = _449;
    if (!_305)
    {
        _413 = _289;
    }
    float _457 = _413;
    float _459 = _457;
    if (_311)
    {
        float _461 = -_289;
        float _463 = _461 + 1.0;
        _415 = as_type<int>(_463);
    }
    int _465 = _415;
    float _467 = _287 * _337;
    if (_305)
    {
        float _469 = _429 ? as_type<float>(_455) : _289;
        _459 = _469;
    }
    float _471 = _459;
    float _473 = _207 + _367;
    float _475 = floor(_439);
    if (_311)
    {
        bool _477 = _283 > 0.5;
        _417 = _477;
    }
    bool _479 = _417;
    float _481 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _483 = _473 + (-1.0);
    if (!_311)
    {
        _419 = _289;
    }
    float _485 = _419;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _489 = _197 + _487;
    float _491 = _485;
    if (_311)
    {
        float _493 = _479 ? as_type<float>(_465) : _289;
        _491 = _493;
    }
    float _495 = _491;
    float _497 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _499 = _447 > 0.0;
    float _501 = floor(_433);
    bool _503 = _447 >= 0.0;
    bool _505 = isnan(_447);
    bool _507 = _503 || _505;
    bool _509 = isnan(0.0);
    bool _511 = _507 || _509;
    float _513 = _207 + _283;
    float _515 = _489 * _403;
    int _517 = _511 ? 0 : 1;
    float _519 = _513 + (-1.0);
    float _521 = 1.0 / _443;
    int _523 = ~_517;
    int _525 = _523 + 1;
    int _527 = _525 + 1;
    float _529 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _531 = _315 * _377;
    int _533 = _527;
    if (!_499)
    {
        int _535 = ~_517;
        int _537 = _535 + 1;
        _533 = _537;
    }
    int _539 = _533;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _541;
    bool _545 = _475 > 0.0;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _547;
    bool _551 = _475 >= 0.0;
    bool _553 = isnan(_475);
    bool _555 = _551 || _553;
    bool _557 = isnan(0.0);
    bool _559 = _555 || _557;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _561;
    float _565 = fma(_549, _467, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _567 = fma(_543, _467, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _569 = fma(_563, _467, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _571 = _341 * _365;
    bool _573 = _501 > 0.0;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _579 = _501 >= 0.0;
    bool _581 = isnan(_501);
    bool _583 = _579 || _581;
    bool _585 = isnan(0.0);
    bool _587 = _583 || _585;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _611 = _197 + _609;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _617 = fma(_591, _571, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _619 = fma(_603, _515, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _621 = fma(_607, _515, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _625 = _197 + _623;
    float _627 = _611 * _431;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _629;
    float _633 = fma(_615, _515, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _635;
    float _639 = _293 * _145;
    float _641 = _625 * _521;
    float _643 = fma(_631, _531, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _645 = fma(_595, _531, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _651 = fma(_637, _531, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _653 = fma(_577, _571, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _655;
    float _659 = fma(_599, _571, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _669 = fma(_649, _641, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    bool _671 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _673 = isnan(_197);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = exp2(_639);
    float _685 = fma(_663, _627, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _687 = fma(_667, _641, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    bool _689 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _691 = isnan(_197);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -_681;
    float _703 = _701 + 1.0;
    bool _705 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _707 = isnan(_197);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    float _717 = fma(_657, _627, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    bool _719 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _721 = isnan(_197);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _733 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _735 = isnan(_197);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = _283 + (-0.5);
    bool _747 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _749 = isnan(_197);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = _495 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _761 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _763 = isnan(_197);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = -_743;
    float _775 = _773 + 1.0;
    float _777 = -_757;
    float _779 = _777 + 1.0;
    float _781 = _771 * _703;
    float _783 = -_771;
    float _785 = _783 + 1.0;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _787;
    bool _791 = !_355;
    int _793 = _791 ? 0 : 1;
    float _795 = -_683;
    float _797 = _795 + 1.0;
    bool _799 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _801 = isnan(0.0);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _807 = _803 || _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _811 = 1.0 + _809;
    float _813 = fma(_789, _627, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _821 = -_715;
    float _823 = _821 + 1.0;
    float _825 = 1.0 / _811;
    float _827 = _743 * _779;
    float _829 = _729 * _775;
    float _831 = _807 ? _797 : 0.0;
    float _833 = fma(_819, _641, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    bool _835 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _837 = isnan(1.0);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _843 = _839 || _841;
    float _845 = -_729;
    float _847 = _845 + 1.0;
    float _849 = _681 * _823;
    float _851 = _757 * _785;
    float _853 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[78].z, _815);
    float _855 = in.m_63.x;
    float _857 = in.m_63.y;
    float _859 = in.m_63.z;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _863 = _731 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _865 = _699 * _847;
    int _867 = abs(_793);
    float _869 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[78].w, _861);
    float _871 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _425);
    float _873 = -_145;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[76].x, _323);
    float _877 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _853);
    float _879 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _869);
    if (_843)
    {
        float _881 = _831 * _825;
        _149 = _881;
    }
    float _883 = _149;
    float _885 = float(_867);
    float _887 = _567 * _865;
    float _889 = float(_539);
    float _891 = fma(_863, _423, -0.5);
    float _893 = _565 * _865;
    float _895 = -_699;
    float _897 = _895 + 1.0;
    int _899 = _559 ? 0 : 1;
    float _901 = _885 * _889;
    float _903 = _569 * _865;
    float _905 = -_871;
    float _907 = fma(_879, _891, _905);
    float _909 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[143].x, _893);
    float _911 = _901 * (-2.0);
    int _913 = ~_899;
    int _915 = _913 + 1;
    int _917 = _915 + 1;
    float _919 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[143].y, _887);
    bool _921 = !_359;
    int _923 = _921 ? 0 : 1;
    float _925 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[143].z, _903);
    int _927 = _917;
    if (!_545)
    {
        int _929 = ~_899;
        int _931 = _929 + 1;
        _927 = _931;
    }
    int _933 = _927;
    float _935 = fma(_497, _911, _497);
    float _937 = fma(_911, _855, _855);
    int _939 = _587 ? 0 : 1;
    float _941 = _207 + (-0.5);
    bool _943 = !_363;
    int _945 = _943 ? 0 : 1;
    float _947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _949 = abs(_923);
    float _951 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[196].x, _937);
    int _953 = ~_939;
    int _955 = _953 + 1;
    int _957 = _955 + 1;
    float _959 = _367 + (-0.5);
    int _961 = abs(_945);
    float _963 = fma(_653, _829, _909);
    int _965 = _957;
    if (!_573)
    {
        int _967 = ~_939;
        int _969 = _967 + 1;
        _965 = _969;
    }
    int _971 = _965;
    float _973 = fma(_935, _883, _951);
    float _975 = float(_949);
    float _977 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _979 = float(_933);
    float _981 = fma(_617, _829, _919);
    float _983 = float(_961);
    float _985 = _973 * 0.15915493667125701904296875;
    float _987 = float(_971);
    float _989 = _975 * _979;
    float _991 = _947 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _993 = fma(_659, _829, _925);
    float _995 = fma(_645, _827, _981);
    float _997 = _983 * _987;
    float _999 = _989 * (-2.0);
    float _1001 = fma(_991, _471, -0.5);
    float _1003 = _985 * 6.283185482025146484375;
    float _1005 = sin(_1003);
    float _1007 = _997 * (-2.0);
    float _1009 = fma(_999, _857, _857);
    float _1011 = fma(_481, _999, _481);
    float _1013 = fma(_621, _851, _995);
    float _1015 = fma(_1007, _859, _859);
    float _1017 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1009);
    float _1019 = fma(_529, _1007, _529);
    float _1021 = fma(_877, _1001, _875);
    float _1023 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1015);
    float _1025 = fma(_1011, _883, _1017);
    float _1027 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1029 = fma(_643, _827, _963);
    float _1031 = fma(_1019, _883, _1023);
    float _1033 = _1025 * 0.15915493667125701904296875;
    float _1035 = fma(_717, _781, _1013);
    float _1037 = fma(_619, _851, _1029);
    float _1039 = _1031 * 0.15915493667125701904296875;
    float _1041 = _387 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1043 = _985 * 6.283185482025146484375;
    float _1045 = cos(_1043);
    float _1047 = fma(_685, _781, _1037);
    float _1049 = fma(_687, _849, _1035);
    float _1051 = _1041 * _977;
    float _1053 = _1021 + 0.5;
    float _1055 = fma(_669, _849, _1047);
    float _1057 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[149].y, _1049);
    float _1059 = _907 + 0.5;
    float _1061 = _1033 * 6.283185482025146484375;
    float _1063 = sin(_1061);
    float _1065 = fma(_651, _827, _993);
    float _1067 = _759 * _1027;
    float _1069 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[149].x, _1055);
    float _1071 = fma(_633, _851, _1065);
    float _1073 = in.m_65.x;
    float _1075 = in.m_65.y;
    float _1077 = in.m_65.z;
    float _1079 = in.m_65.w;
    float _1081 = _1033 * 6.283185482025146484375;
    float _1083 = cos(_1081);
    float _1085 = fma(_813, _781, _1071);
    out.m_67.x = _1053;
    out.m_67.y = _1059;
    out.m_67.z = _1067;
    out.m_67.w = _1051;
    float _1087 = fma(_833, _849, _1085);
    float _1089 = _1039 * 6.283185482025146484375;
    float _1091 = cos(_1089);
    float _1093 = _1005 * _1063;
    float _1095 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[149].z, _1087);
    float _1097 = _1045 * _1063;
    float _1099 = _1039 * 6.283185482025146484375;
    float _1101 = sin(_1099);
    float _1103 = _1045 * _1083;
    float _1105 = _1005 * _1083;
    float _1107 = -_257;
    float _1109 = _1107 + _277;
    float _1111 = _1045 * _1091;
    float _1113 = _1005 * _1091;
    float _1115 = _1083 * _1091;
    float _1117 = _1063 * _1091;
    float _1119 = _1111 * _1075;
    float _1121 = floor(_231);
    float _1123 = fma(_1101, _1103, _1093);
    float _1125 = fma(_1101, _1093, _1103);
    float _1127 = -_1097;
    float _1129 = fma(_1101, _1105, _1127);
    float _1131 = in.m_69.x;
    float _1133 = in.m_69.y;
    float _1135 = in.m_69.z;
    float _1137 = -_1075;
    float _1139 = _1101 * _1137;
    float _1141 = -_1105;
    float _1143 = fma(_1101, _1097, _1141);
    float _1145 = fma(_1123, _1073, _1119);
    float _1147 = _1113 * _1075;
    float _1149 = fma(_1115, _1073, _1139);
    float _1151 = in.m_48.x;
    float _1153 = in.m_48.y;
    float _1155 = in.m_48.z;
    float _1157 = fma(_1143, _1077, _1145);
    float _1159 = fma(_1129, _1073, _1147);
    float _1161 = fma(_1117, _1077, _1149);
    float _1163 = -_1121;
    float _1165 = _231 + _1163;
    float _1167 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1169 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1171 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1173 = fma(_1125, _1077, _1159);
    float _1175 = fma(_1161, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1167);
    float _1177 = fma(_1161, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1169);
    float _1179 = fma(_1161, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1171);
    float _1181 = fma(_1173, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1175);
    float _1183 = fma(_1173, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1177);
    float _1185 = fma(_1173, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1179);
    float _1187 = -_261;
    float _1189 = _1187 + _281;
    float _1191 = fma(_1165, _1109, _257);
    float _1193 = _1069 * _1131;
    float _1195 = -_259;
    float _1197 = _1195 + _279;
    float _1199 = _1057 * _1133;
    float _1201 = fma(_1165, _1189, _261);
    float _1203 = fma(_1165, _1197, _259);
    float _1205 = in.m_71.x;
    float _1207 = in.m_71.y;
    float _1209 = in.m_71.z;
    float _1211 = _1153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1213 = _1153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1215 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1203);
    bool _1217 = _1203 != 0.0;
    bool _1219 = isnan(_1203);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan(0.0);
    bool _1225 = _1221 || _1223;
    out.m_73.x = _1181;
    out.m_73.y = _1183;
    out.m_73.z = _1185;
    float _1227 = _1095 * _1135;
    float _1229 = _1153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1231 = _1191 == 0.0;
    bool _1233 = !_1225;
    bool _1235 = _1231 && _1233;
    float _1237 = fma(_1151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1213);
    float _1239 = fma(_1151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1211);
    float _1241 = fma(_1151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1229);
    bool _1243 = _1201 == 0.0;
    bool _1245 = _1243 && _1235;
    float _1247 = _1227 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1249 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1201);
    float _1251 = fma(_1155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1237);
    float _1253 = fma(_1155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1239);
    float _1255 = _1199 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1257 = fma(_1155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1241);
    float _1259 = _1249 * _1247;
    float _1261 = _1253 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1263 = _1215 * _1255;
    float _1265 = _1193 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1267 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1191);
    float _1269 = _1257 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1271 = _1111 * _1263;
    float _1273 = -_1263;
    float _1275 = _1101 * _1273;
    float _1277 = _1267 * _1265;
    float _1279 = _1113 * _1263;
    float _1281 = _1121;
    float _1283 = _1279;
    float _1285 = _1019;
    float _1287 = _1199;
    float _1289 = _1193;
    float _1291 = _1251;
    if (_1245)
    {
        _1281 = _1205;
    }
    float _1293 = _1281;
    float _1295 = fma(_1123, _1277, _1271);
    float _1297 = fma(_1115, _1277, _1275);
    float _1299 = fma(_1129, _1277, _1279);
    float _1301 = _1293;
    if (_1245)
    {
        _1283 = _1293;
    }
    float _1303 = _1283;
    float _1305 = fma(_1143, _1259, _1295);
    float _1307 = fma(_1117, _1259, _1297);
    float _1309 = _1303;
    if (!_1245)
    {
        _1301 = _1205;
    }
    float _1311 = _1301;
    float _1313 = fma(_1125, _1259, _1299);
    float _1315 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1317 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (_1245)
    {
        _1285 = _1207;
    }
    float _1319 = _1285;
    float _1321 = _1319;
    if (!_1245)
    {
        float _1323 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1311);
        _1309 = _1323;
    }
    float _1325 = _1309;
    float _1327 = fma(_1307, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1315);
    float _1329 = fma(_1307, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1317);
    float _1331 = _1327;
    if (_1245)
    {
        _1287 = _1209;
    }
    float _1333 = _1287;
    float _1335 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1337 = fma(_1313, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1327);
    float _1339 = fma(_1313, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1329);
    float _1341 = _1333;
    if (_1245)
    {
        _1331 = _1319;
    }
    float _1343 = _1331;
    float _1345 = _1077 * _1311;
    float _1347 = _1261 + _1337;
    float _1349 = _1269 + _1339;
    float _1351 = _1343;
    float _1353 = _1347;
    float _1355 = _1349;
    if (!_1245)
    {
        _1321 = _1207;
    }
    float _1357 = _1321;
    float _1359 = fma(_1307, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1335);
    if (_1245)
    {
        _1289 = _1333;
    }
    float _1361 = _1289;
    float _1363 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1365 = _1347 + _1363;
    float _1367 = _1361;
    if (!_1245)
    {
        _1341 = _1209;
    }
    float _1369 = _1341;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1373 = _1349 + _1371;
    if (!_1245)
    {
        float _1375 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1357);
        _1351 = _1375;
    }
    float _1377 = _1351;
    float _1379 = _1365 * _1365;
    float _1381 = fma(_1313, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1359);
    float _1383 = _1373 * _1373;
    float _1385 = _1379;
    float _1387 = _1383;
    if (!_1245)
    {
        float _1389 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1369);
        _1367 = _1389;
    }
    float _1391 = _1367;
    float _1393 = _1075 * _1369;
    float _1395 = -_1345;
    float _1397 = fma(_1073, _1369, _1395);
    float _1399 = _1379 + _1383;
    float _1401 = _1073 * _1357;
    float _1403 = -_1393;
    float _1405 = fma(_1077, _1357, _1403);
    float _1407 = -_1377;
    float _1409 = _1101 * _1407;
    float _1411 = sqrt(_1399);
    float _1413 = _1111 * _1377;
    float _1415 = _1113 * _1377;
    float _1417 = _1397 * _1079;
    float _1419 = fma(_1115, _1325, _1409);
    float _1421 = fma(_1123, _1325, _1413);
    float _1423 = fma(_1129, _1325, _1415);
    float _1425 = _1405 * _1079;
    float _1427 = _1111 * _1417;
    float _1429 = -_1417;
    float _1431 = _1101 * _1429;
    float _1433 = -_1401;
    float _1435 = fma(_1075, _1311, _1433);
    float _1437 = _1113 * _1417;
    float _1439 = fma(_1123, _1425, _1427);
    float _1441 = _1251 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1443 = fma(_1115, _1425, _1431);
    float _1445 = _1435 * _1079;
    bool _1447 = _1411 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1449 = _1441 + _1381;
    float _1451 = fma(_1129, _1425, _1437);
    float _1453 = fma(_1117, _1391, _1419);
    float _1455 = fma(_1143, _1391, _1421);
    float _1457 = fma(_1125, _1391, _1423);
    float _1459 = fma(_1117, _1445, _1443);
    float _1461 = fma(_1143, _1445, _1439);
    float _1463 = fma(_1125, _1445, _1451);
    float _1465 = _1425;
    if (!_1447)
    {
        _1291 = _1379;
    }
    float _1467 = _1291;
    float _1469 = _1467;
    if (!_1447)
    {
        _1385 = _1449;
    }
    float _1471 = _1385;
    bool _1473 = !_1447;
    float _1475 = _1471;
    if (!_1473)
    {
        float _1477 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1481 = _1411 + _1479;
        float _1483 = rsqrt(_1399);
        float _1485 = _1481 * _1477;
        float _1487 = _1449 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1489 = _1485 * 0.15915493667125701904296875;
        float _1491 = _1489 * 6.283185482025146484375;
        float _1493 = sin(_1491);
        float _1495 = _1489 * 6.283185482025146484375;
        float _1497 = cos(_1495);
        float _1499 = fma(_1493, _1487, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1501 = _1483 * _1499;
        float _1503 = _1497 + (-1.0);
        float _1505 = fma(_1365, _1501, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1507 = fma(_1373, _1501, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1509 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1511 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1513 = _1505 + _1511;
        float _1515 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1517 = _1507 + _1515;
        float _1519 = fma(_1449, _1497, _1509);
        float _1521 = _1513 * _1513;
        float _1523 = _1517 * _1517;
        _1475 = _1519;
        _1469 = _1521;
        _1387 = _1523;
        _1353 = _1505;
        _1355 = _1507;
    }
    float _1525 = _1475;
    float _1527 = _1469;
    float _1529 = _1387;
    float _1531 = _1353;
    float _1533 = _1355;
    float _1535 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1537 = _1525 + _1535;
    float _1539 = _1461 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1541 = _1461 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1543 = _1461 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1545 = fma(_1537, _1537, _1527);
    float _1547 = fma(_1459, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1539);
    float _1549 = fma(_1459, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1541);
    float _1551 = _1455 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1553 = _1545 + _1529;
    float _1555 = _1455 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1557 = _1455 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1559 = fma(_1453, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1551);
    float _1561 = fma(_1459, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1543);
    float _1563 = fma(_1453, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1555);
    float _1565 = sqrt(_1553);
    float _1567 = fma(_1453, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1557);
    float _1569 = fma(_1463, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1547);
    float _1571 = fma(_1457, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1563);
    float _1573 = fma(_1463, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1549);
    float _1575 = fma(_1463, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1561);
    float _1577 = fma(_1457, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1559);
    float _1579 = fma(_1457, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1567);
    out.m_75.x = _1569;
    out.m_75.y = _1573;
    out.m_75.z = _1575;
    out.m_77.x = _1577;
    out.m_77.y = _1571;
    out.m_77.z = _1579;
    bool _1581 = _1565 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1583 = isnan(_1565);
    bool _1585 = _1581 || _1583;
    bool _1587 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1589 = _1585 || _1587;
    float _1591 = _1547;
    float _1593 = _1573;
    float _1595 = _1575;
    if (!_1589)
    {
        _1591 = 1.0;
    }
    float _1597 = _1591;
    bool _1599 = !_1589;
    float _1601 = _1597;
    if (!_1599)
    {
        bool _1603 = _1565 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1605 = isnan(_1565);
        bool _1607 = _1603 || _1605;
        bool _1609 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1611 = _1607 || _1609;
        if (!_1611)
        {
            float _1613 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1615 = _1565 + _1613;
            float _1617 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1619 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1617;
            float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1623 = _1621 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1625 = 1.0 / _1619;
            float _1627 = _1615 * _1625;
            float _1629 = fma(_1627, _1623, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1601 = _1629;
            _1593 = _1625;
            _1631 = true;
        }
        else
        {
            bool _1633 = _1565 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1635 = isnan(_1565);
            bool _1637 = _1633 || _1635;
            bool _1639 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1641 = _1637 || _1639;
            if (!_1641)
            {
                float _1643 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1645 = _1565 + _1643;
                float _1647 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1649 = _1647 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1651 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1653 = _1651 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1655 = 1.0 / _1649;
                float _1657 = _1645 * _1655;
                float _1659 = fma(_1657, _1653, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1601 = _1659;
                _1593 = _1655;
                _1631 = true;
            }
            else
            {
                _1601 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1631 = false;
    float _1661 = _1601;
    float _1663 = _1593;
    float _1665 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1667 = _1531 + _1665;
    float _1669 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1671 = _1533 + _1669;
    bool _1673 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1675 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1677 = _1673 || _1675;
    bool _1679 = isnan(0.5);
    bool _1681 = _1677 || _1679;
    float _1683 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1685 = _1525 + _1683;
    float _1687 = fma(_1667, _1661, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1689 = fma(_1671, _1661, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1691 = fma(_1685, _1661, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1693 = _1685;
    float _1695 = _1663;
    float _1697 = _1691;
    float _1699 = _1687;
    if (_1681)
    {
        _1693 = _1687;
    }
    float _1701 = _1693;
    float _1703 = _1701;
    if (_1681)
    {
        _1695 = _1691;
    }
    float _1705 = _1695;
    float _1707 = _1705;
    if (_1681)
    {
        _1595 = _1689;
    }
    float _1709 = _1595;
    float _1711 = _1709;
    if (!_1681)
    {
        float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1715 = _1441 + _1713;
        float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1719 = _1261 + _1717;
        float _1721 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1723 = _1715 * _1715;
        float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1727 = _1269 + _1725;
        float _1729 = fma(_1719, _1719, _1723);
        float _1731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1733 = fma(_1727, _1727, _1729);
        float _1735 = sqrt(_1733);
        float _1737 = _1721 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1739 = precise::min(_1735, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1741 = _1739 * _1731;
        float _1743 = -_1261;
        float _1745 = _1743 + _1687;
        float _1747 = _1737 * _1741;
        float _1749 = -_1441;
        float _1751 = _1749 + _1691;
        float _1753 = -_1269;
        float _1755 = _1753 + _1689;
        float _1757 = fma(_1745, _1747, _1261);
        float _1759 = fma(_1751, _1747, _1441);
        float _1761 = fma(_1755, _1747, _1269);
        _1707 = _1759;
        _1703 = _1757;
        _1711 = _1761;
    }
    float _1763 = _1707;
    float _1765 = _1703;
    float _1767 = _1711;
    float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1771 = _1763 + _1769;
    float _1773 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1775 = _1765 + _1773;
    float _1777 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1779 = _1767 + _1777;
    float _1781 = _1771 * _1771;
    float _1783 = fma(_1775, _1775, _1781);
    float _1785 = fma(_1779, _1779, _1783);
    float _1787 = rsqrt(_1785);
    float _1789 = _1787 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1791 = _1775 * _1789;
    float _1793 = _1779 * _1789;
    float _1795 = _1791 * _1791;
    float _1797 = _1793 * _1793;
    float _1799 = _1795 + _1797;
    float _1801 = sqrt(_1799);
    bool _1803 = _1801 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1807 = _1801 + _1805;
    float _1809 = _1779;
    float _1811 = _1807;
    float _1813 = _1791;
    if (_1803)
    {
        float _1815 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1809 = _1815;
    }
    float _1817 = _1809;
    if (_1803)
    {
        float _1819 = rsqrt(_1799);
        _1697 = _1819;
    }
    float _1821 = _1697;
    float _1823 = _1821;
    if (_1803)
    {
        float _1825 = _1807 * _1817;
        _1811 = _1825;
    }
    float _1827 = _1811;
    if (_1803)
    {
        float _1829 = _1827 * 0.15915493667125701904296875;
        _1699 = _1829;
    }
    float _1831 = _1699;
    float _1833 = _1781;
    float _1835 = _1831;
    if (_1803)
    {
        float _1837 = _1831 * 6.283185482025146484375;
        float _1839 = sin(_1837);
        _1833 = _1839;
    }
    float _1841 = _1833;
    float _1843 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1845 = precise::max(0.0, _1843);
    float _1847 = _1787;
    float _1849 = _1845;
    float _1851 = _1843;
    if (_1803)
    {
        float _1853 = _1831 * 6.283185482025146484375;
        float _1855 = cos(_1853);
        _1847 = _1855;
    }
    float _1857 = _1847;
    float _1859 = -_1789;
    float _1861 = -_1845;
    float _1863 = fma(_1771, _1859, _1861);
    float _1865 = _1863;
    if (!_1803)
    {
        _1849 = _1795;
    }
    float _1867 = _1849;
    float _1869 = _1867;
    if (_1803)
    {
        float _1871 = _1863 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1851 = _1871;
    }
    float _1873 = _1851;
    float _1875 = _1841;
    float _1877 = _1873;
    if (_1803)
    {
        float _1879 = fma(_1841, _1873, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1875 = _1879;
    }
    float _1881 = _1875;
    float _1883 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1885 = _1881;
    if (_1803)
    {
        float _1887 = _1857 + (-1.0);
        _1877 = _1887;
    }
    float _1889 = _1877;
    if (_1803)
    {
        float _1891 = _1821 * _1881;
        _1465 = _1891;
    }
    float _1893 = _1465;
    if (!_1803)
    {
        _1823 = _1863;
    }
    float _1895 = _1823;
    float _1897 = _1895;
    if (_1803)
    {
        float _1899 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1835 = _1899;
    }
    float _1901 = _1835;
    if (_1803)
    {
        float _1903 = _1791 * _1893;
        _1813 = _1903;
    }
    float _1905 = _1813;
    if (!_1803)
    {
        _1885 = _1793;
    }
    float _1907 = _1885;
    float _1909 = _1907;
    if (_1803)
    {
        float _1911 = _1793 * _1893;
        _1909 = _1911;
    }
    float _1913 = _1909;
    if (_1803)
    {
        float _1915 = fma(_1863, _1857, _1901);
        _1897 = _1915;
    }
    float _1917 = _1897;
    if (_1803)
    {
        float _1919 = _1905 * _1905;
        _1869 = _1919;
    }
    float _1921 = _1869;
    float _1923 = sqrt(_1785);
    if (!_1803)
    {
        _1865 = _1797;
    }
    float _1925 = _1865;
    float _1927 = _1925;
    if (_1803)
    {
        float _1929 = _1913 * _1913;
        _1927 = _1929;
    }
    float _1931 = _1927;
    float _1933 = fma(_1917, _1917, _1921);
    float _1935 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1937 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1939 = _1933 + _1931;
    float _1941 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1935);
    float _1943 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1945 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1937);
    float _1947 = rsqrt(_1939);
    float _1949 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1941);
    float _1951 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1953 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1943);
    float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1957 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1955);
    float _1959 = precise::clamp(_1957, 0.0, 1.0);
    float _1961 = _1949 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1963 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1951);
    float _1965 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1953);
    float _1967 = -_1959;
    float _1969 = _1967 + 1.0;
    float _1971 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1973 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1963);
    float _1975 = _1965 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1977 = abs(_1969);
    float _1979 = log2(_1977);
    float _1981 = -_1971;
    float _1983 = fma(_1981, _1883, 1.0);
    float _1985 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1945);
    float _1987 = _1947 * _1905;
    float _1989 = _1973 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1991 = _1975 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1993 = _1947 * _1917;
    float _1995 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1997 = _1947 * _1913;
    float _1999 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1991);
    float _2001 = _1985 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2003 = -_1995;
    float _2005 = fma(_1993, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2003);
    float _2007 = log2(_1983);
    float _2009 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1999);
    float _2011 = _1975 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2013 = -_1997;
    float _2015 = fma(_2013, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2005);
    float _2017 = _1979 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2019 = fma(_2001, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2009);
    float _2021 = _1975 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2023 = fma(_2015, -0.5, 0.5);
    float _2025 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2011);
    float _2027 = 1.0 / _2019;
    float _2029 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2021);
    float _2031 = fma(_2015, 0.5, 0.5);
    float _2033 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2025);
    float _2035 = _1993 + 1.0;
    float _2037 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2029);
    float _2039 = fma(_2031, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2041 = _2007 * 0.693147182464599609375;
    float _2043 = exp2(_2017);
    float _2045 = fma(_2001, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2037);
    float _2047 = fma(_2001, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2033);
    float _2049 = fma(_2031, _2039, -0.212114393711090087890625);
    float _2051 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2053 = fma(_2031, _2049, 1.570728778839111328125);
    float _2055 = sqrt(_2023);
    float _2057 = _2045 * _2027;
    float _2059 = fma(_2057, 0.5, 0.5);
    float _2061 = -_1993;
    float _2063 = fma(_2043, _2035, _2061);
    float _2065 = _2047 * _2027;
    float _2067 = fma(_2063, 0.5, 0.5);
    float _2069 = fma(_2065, -0.5, 0.5);
    float _2071 = _2055 * 0.636619746685028076171875;
    float3 _5713 = float3(_2059, _2069, _2051);
    float _2073 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5713, float3(0.0), isnan(_5713)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5713, float3(0.0), isnan(_5713)), level(0.0)).x;
    float _2075 = -_2053;
    float _2077 = fma(_2071, _2075, 1.0);
    float3 _5729 = float3(_2059, _2069, _2051);
    float4 _2080 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5729, float3(0.0), isnan(_5729)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5729, float3(0.0), isnan(_5729)), level(0.0)).xyzw;
    float _2082 = _2080.x;
    float _2084 = _2080.y;
    float _2086 = _2080.z;
    float _2088 = _2080.w;
    float2 _5746 = float2(_2077, _2067);
    float3 _2090 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5746, float2(0.0), isnan(_5746)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5746, float2(0.0), isnan(_5746)), level(0.0)).xyz;
    float _2092 = _2090.x;
    float _2094 = _2090.y;
    float _2096 = _2090.z;
    float _2098 = _1979 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2100 = _1975 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2102 = _2019 * 0.5;
    out.m_79.x = _1765;
    out.m_79.y = _1763;
    out.m_79.z = _1767;
    float _2104 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2100);
    float _2106 = exp2(_2098);
    float _2108 = fma(_2047, -0.5, _2102);
    bool _2110 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2112 = isnan(_1923);
    bool _2114 = _2110 || _2112;
    bool _2116 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2118 = _2114 || _2116;
    float _2120 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2104);
    float _2122 = fma(_2001, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2120);
    float _2124 = _2045 + _2019;
    float _2126 = _2122 + _2019;
    float _2128 = _2124 * 0.5;
    out.gl_Position.x = _2045;
    out.gl_Position.y = _2047;
    out.gl_Position.z = _2122;
    out.gl_Position.w = _2019;
    float _2130 = _2126 * 0.5;
    float _2132 = -_2106;
    float _2134 = _2132 + 1.0;
    float _2136 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _2128;
    out.m_81.y = _2108;
    out.m_81.z = _2130;
    out.m_81.w = _2019;
    float _2138 = -_2136;
    float _2140 = _2138 + 1.0;
    float _2142 = _2122;
    float _2144 = _2047;
    float _2146 = _2045;
    float _2148 = _2136;
    float _2150 = _2140;
    if (!_2118)
    {
        _2142 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2152 = _2142;
    float _2154 = _2152;
    float _2156 = _2152;
    if (!_2118)
    {
        _2144 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2158 = _2144;
    float _2160 = _2158;
    float _2162 = _2158;
    if (!_2118)
    {
        _2146 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2164 = _2146;
    float _2166 = _2136 * _2073;
    float _2168 = _2164;
    float _2170 = _2164;
    if (!_2118)
    {
        _2148 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2172 = _2148;
    float _2174 = _2088 * _2166;
    float _2176 = _2088 * _2140;
    float _2178 = _2174;
    float _2180 = _2172;
    float _2182 = _2172;
    if (!_2118)
    {
        _2150 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2184 = _2150;
    float _2186 = _2096 * _2166;
    float _2188 = fma(_2092, _2174, _2082);
    float _2190 = fma(_2094, _2174, _2084);
    float _2192 = _2184;
    float _2194 = _2184;
    if (!_2118)
    {
        _2178 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2196 = _2178;
    float _2198 = fma(_2088, _2186, _2086);
    out.m_83.x = _2188;
    out.m_83.y = _2190;
    out.m_83.z = _2198;
    out.m_83.w = _2176;
    bool _2200 = !_2118;
    float _2202 = _2196;
    float _2204 = _2196;
    if (!_2200)
    {
        bool _2206 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2208 = isnan(_1923);
        bool _2210 = _2206 || _2208;
        bool _2212 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2214 = _2210 || _2212;
        if (!_2214)
        {
            float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2218 = _1923 + _2216;
            float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2222 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2220;
            float _2224 = 1.0 / _2222;
            float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2228 = _2226 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2232 = _2230 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2236 = _2234 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2238 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2240 = _2238 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2242 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2244 = _2242 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2246 = _2218 * _2224;
            float _2248 = precise::clamp(_2246, 0.0, 1.0);
            float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2252 = _2250 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2254 = fma(_2248, _2228, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2256 = fma(_2248, _2252, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2258 = fma(_2248, _2232, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2260 = fma(_2248, _2236, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2262 = fma(_2248, _2240, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2264 = fma(_2248, _2244, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2162 = _2256;
            _2194 = _2262;
            _2156 = _2254;
            _2204 = _2260;
            _2170 = _2258;
            _2182 = _2264;
            _2266 = true;
        }
        else
        {
            bool _2268 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2270 = isnan(_1923);
            bool _2272 = _2268 || _2270;
            bool _2274 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2276 = _2272 || _2274;
            if (!_2276)
            {
                _2154 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2278 = _2154;
            _2156 = _2278;
            if (!_2276)
            {
                _2160 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2280 = _2160;
            _2162 = _2280;
            if (!_2276)
            {
                _2168 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2282 = _2168;
            _2170 = _2282;
            if (!_2276)
            {
                _2202 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2284 = _2202;
            _2204 = _2284;
            if (!_2276)
            {
                _2192 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2286 = _2192;
            _2194 = _2286;
            if (!_2276)
            {
                _2180 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2288 = _2180;
            bool _2290 = !_2276;
            _2182 = _2288;
            if (!_2290)
            {
                bool _2292 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2294 = isnan(_1923);
                bool _2296 = _2292 || _2294;
                bool _2298 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2300 = _2296 || _2298;
                if (!_2300)
                {
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2304 = _1923 + _2302;
                    float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2308 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2306;
                    float _2310 = 1.0 / _2308;
                    float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2314 = _2312 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2318 = _2316 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2322 = _2320 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2324 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2326 = _2324 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2330 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2332 = _2304 * _2310;
                    float _2334 = precise::clamp(_2332, 0.0, 1.0);
                    float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2338 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2340 = fma(_2334, _2314, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2342 = fma(_2334, _2338, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2344 = fma(_2334, _2318, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2346 = fma(_2334, _2322, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2348 = fma(_2334, _2326, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2350 = fma(_2334, _2330, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2162 = _2342;
                    _2194 = _2348;
                    _2156 = _2340;
                    _2204 = _2346;
                    _2170 = _2344;
                    _2182 = _2350;
                    _2266 = true;
                }
                else
                {
                    _2162 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2194 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2156 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2204 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2170 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2182 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2266 = false;
    float _2352 = _2162;
    float _2354 = _2194;
    float _2356 = _2156;
    float _2358 = _2204;
    float _2360 = _2170;
    float _2362 = _2182;
    float _2364 = fma(_1571, -0.5, 0.5);
    float _2366 = precise::clamp(_2364, 0.0, 1.0);
    float _2368 = -_2352;
    float _2370 = _2368 + _2354;
    float _2372 = -_2356;
    float _2374 = _2372 + _2358;
    float _2376 = -_2360;
    float _2378 = _2376 + _2362;
    bool _2380 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2382 = fma(_2366, _2370, _2352);
    float _2384 = fma(_2366, _2374, _2356);
    float _2386 = fma(_2366, _2378, _2360);
    float _2388 = _2382 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2390 = fma(_2384, 0.298911988735198974609375, _2388);
    float _2392 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2394 = fma(_2386, 0.114477999508380889892578125, _2390);
    out.m_85.w = _2392;
    float _2396 = -_2394;
    float _2398 = _2384 + _2396;
    float _2400 = -_2394;
    float _2402 = _2382 + _2400;
    float _2404 = -_2394;
    float _2406 = _2386 + _2404;
    out.m_87.x = 0.0;
    float _2408 = fma(_2398, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2394);
    float _2410 = fma(_2402, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2394);
    float _2412 = fma(_2406, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2394);
    out.m_89.x = _2408;
    out.m_89.y = _2410;
    out.m_89.z = _2412;
    if (!_2380)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2414 = -_1763;
    float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2418 = -_1765;
    float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2422 = -_1767;
    float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2426 = _2416 * _2416;
    float _2428 = fma(_2420, _2420, _2426);
    float _2430 = fma(_2424, _2424, _2428);
    float _2432 = sqrt(_2430);
    float _2434 = rsqrt(_2430);
    float _2436 = -_2432;
    float _2438 = _2436 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2440 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2442 = precise::clamp(_2440, 0.0, 1.0);
    float _2444 = _2420 * _2434;
    float _2446 = _2416 * _2434;
    float _2448 = abs(_2442);
    float _2450 = log2(_2448);
    float _2452 = _2424 * _2434;
    float _2454 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2456 = _1571 * _2446;
    float _2458 = -_2446;
    float _2460 = -_2454;
    float _2462 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2460);
    float _2464 = fma(_1577, _2444, _2456);
    float _2466 = -_2452;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2462);
    float _2470 = fma(_1579, _2452, _2464);
    float _2472 = precise::clamp(_2470, 0.0, 1.0);
    float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2476 = _2468 + _2474;
    float _2478 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2480 = _2476 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2482 = precise::clamp(_2480, 0.0, 1.0);
    float _2484 = exp2(_2478);
    float _2486 = _2484 * _2482;
    float _2488 = _2472 * _2486;
    float _2490 = _2488 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2492 = _2488 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2494 = _2488 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2490;
    out.m_87.y = _2492;
    out.m_87.z = _2494;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
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
    bool _2266 = false;
    bool _1631 = false;
    bool _189 = false;
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
        float _2551 = as_type<float>(_127);
        out.gl_Position.z = _2551;
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
        float _2620 = as_type<float>(_165);
        out.gl_Position.z = _2620;
    }
    if (_159)
    {
        return out;
    }
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _169 = !_167;
    float _187;
    if (!_169)
    {
        float _171 = in.m_55.x;
        float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _179 = _177 * _173;
        float _181 = floor(_179);
        float _183 = -_181;
        float _185 = _179 + _183;
        _187 = _185;
        _189 = true;
    }
    else
    {
        float _191 = float(_111);
        float _193 = 1.0 / _191;
        float _195 = _145 * _193;
        _187 = _195;
    }
    _189 = false;
    float _197 = _187;
    int _199 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _201 = _199;
    int _203 = 0;
    int _205 = _102(_201, _203, (*spvDescriptorSet0.support_buffer));
    float _207 = in.m_55.x;
    float _209 = in.m_57.z;
    float _211 = in.m_55.w;
    float _213 = in.m_57.y;
    float _215 = _207 * 8.0;
    float _217 = rint(_215);
    float _219 = _217 * 0.125;
    float _221 = precise::clamp(_219, 0.0, 1.0);
    int _223 = _205 + (-1);
    float _225 = trunc(_209);
    int _227 = int(_225);
    float _229 = float(_223);
    float _231 = _221 * _229;
    float _233 = trunc(_231);
    int _235 = int(_233);
    int _237 = _235 + 1;
    int _239 = min(_223, _237);
    int _241 = _235;
    int _243 = 0;
    int _245 = _103(_241, _243, (*spvDescriptorSet0.support_buffer));
    int _247 = _227;
    int _249 = 0;
    int _251 = _103(_247, _249, (*spvDescriptorSet0.support_buffer));
    float3 _255 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_245, _251)), 0).xyz;
    float _257 = _255.x;
    float _259 = _255.y;
    float _261 = _255.z;
    int _263 = _239;
    int _265 = 0;
    int _267 = _103(_263, _265, (*spvDescriptorSet0.support_buffer));
    int _269 = _227;
    int _271 = 0;
    int _273 = _103(_269, _271, (*spvDescriptorSet0.support_buffer));
    float3 _275 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_267, _273)), 0).xyz;
    float _277 = _275.x;
    float _279 = _275.y;
    float _281 = _275.z;
    float _283 = in.m_55.z;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _197 + _285;
    float _289 = in.m_57.x;
    float _291 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _293 = log2(_291);
    bool _295 = _211 > 0.5;
    float _297 = -_213;
    float _299 = _297 + 1.0;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _305 = _303 != 0;
    float _307 = _207 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _311 = _309 != 0;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = _197 + _313;
    int _317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _319 = _317 != 0;
    float _321 = -_301;
    float _323 = fma(_307, 2.0, _321);
    int _325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _327 = _325 != 0;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = 1.0 / _331;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _197 + _339;
    int _343 = _295 ? as_type<int>(_299) : as_type<int>(_213);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _355 = _353 != 0;
    int _357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _359 = _357 != 0;
    int _361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _363 = _361 != 0;
    float _365 = 1.0 / _335;
    float _367 = in.m_55.y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _375 = _369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _377 = 1.0 / _347;
    float _379 = _371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _387 = _319 ? as_type<float>(_343) : _213;
    float _389 = _373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _391;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _397 = _383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _399 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _375;
    out.m_59.y = _379;
    out.m_59.z = _389;
    float _401 = _395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _403 = 1.0 / _351;
    bool _405 = _367 > 0.5;
    float _407 = _367 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_61.x = _399;
    out.m_61.y = _397;
    out.m_61.z = _401;
    float _409 = _213;
    bool _411 = _405;
    float _413 = _393;
    int _415 = as_type<int>(_399);
    bool _417 = _305;
    float _419 = _395;
    if (_327)
    {
        float _421 = _405 ? _299 : _213;
        _409 = _421;
    }
    float _423 = _409;
    float _425 = fma(_407, -2.0, _385);
    if (_305)
    {
        bool _427 = _207 > 0.5;
        _411 = _427;
    }
    bool _429 = _411;
    float _431 = 1.0 / _393;
    float _433 = _367 * 2.0;
    float _435 = _283 * 2.0;
    float _437 = _367 + _283;
    float _439 = _207 * 2.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _445 = _437 + (-1.0);
    float _447 = floor(_435);
    int _449 = as_type<int>(_437);
    if (_305)
    {
        float _451 = -_289;
        float _453 = _451 + 1.0;
        _449 = as_type<int>(_453);
    }
    int _455 = _449;
    if (!_305)
    {
        _413 = _289;
    }
    float _457 = _413;
    float _459 = _457;
    if (_311)
    {
        float _461 = -_289;
        float _463 = _461 + 1.0;
        _415 = as_type<int>(_463);
    }
    int _465 = _415;
    float _467 = _287 * _337;
    if (_305)
    {
        float _469 = _429 ? as_type<float>(_455) : _289;
        _459 = _469;
    }
    float _471 = _459;
    float _473 = _207 + _367;
    float _475 = floor(_439);
    if (_311)
    {
        bool _477 = _283 > 0.5;
        _417 = _477;
    }
    bool _479 = _417;
    float _481 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _483 = _473 + (-1.0);
    if (!_311)
    {
        _419 = _289;
    }
    float _485 = _419;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _489 = _197 + _487;
    float _491 = _485;
    if (_311)
    {
        float _493 = _479 ? as_type<float>(_465) : _289;
        _491 = _493;
    }
    float _495 = _491;
    float _497 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _499 = _447 > 0.0;
    float _501 = floor(_433);
    bool _503 = _447 >= 0.0;
    bool _505 = isnan(_447);
    bool _507 = _503 || _505;
    bool _509 = isnan(0.0);
    bool _511 = _507 || _509;
    float _513 = _207 + _283;
    float _515 = _489 * _403;
    int _517 = _511 ? 0 : 1;
    float _519 = _513 + (-1.0);
    float _521 = 1.0 / _443;
    int _523 = ~_517;
    int _525 = _523 + 1;
    int _527 = _525 + 1;
    float _529 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _531 = _315 * _377;
    int _533 = _527;
    if (!_499)
    {
        int _535 = ~_517;
        int _537 = _535 + 1;
        _533 = _537;
    }
    int _539 = _533;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _541;
    bool _545 = _475 > 0.0;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _547;
    bool _551 = _475 >= 0.0;
    bool _553 = isnan(_475);
    bool _555 = _551 || _553;
    bool _557 = isnan(0.0);
    bool _559 = _555 || _557;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _561;
    float _565 = fma(_549, _467, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _567 = fma(_543, _467, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _569 = fma(_563, _467, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _571 = _341 * _365;
    bool _573 = _501 > 0.0;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _579 = _501 >= 0.0;
    bool _581 = isnan(_501);
    bool _583 = _579 || _581;
    bool _585 = isnan(0.0);
    bool _587 = _583 || _585;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _611 = _197 + _609;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _617 = fma(_591, _571, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _619 = fma(_603, _515, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _621 = fma(_607, _515, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _625 = _197 + _623;
    float _627 = _611 * _431;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _629;
    float _633 = fma(_615, _515, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _635;
    float _639 = _293 * _145;
    float _641 = _625 * _521;
    float _643 = fma(_631, _531, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _645 = fma(_595, _531, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _651 = fma(_637, _531, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _653 = fma(_577, _571, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _655;
    float _659 = fma(_599, _571, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _669 = fma(_649, _641, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    bool _671 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _673 = isnan(_197);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = exp2(_639);
    float _685 = fma(_663, _627, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _687 = fma(_667, _641, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    bool _689 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _691 = isnan(_197);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -_681;
    float _703 = _701 + 1.0;
    bool _705 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _707 = isnan(_197);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    float _717 = fma(_657, _627, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    bool _719 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _721 = isnan(_197);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _733 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _735 = isnan(_197);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = _283 + (-0.5);
    bool _747 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _749 = isnan(_197);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = _495 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _761 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _763 = isnan(_197);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = -_743;
    float _775 = _773 + 1.0;
    float _777 = -_757;
    float _779 = _777 + 1.0;
    float _781 = _771 * _703;
    float _783 = -_771;
    float _785 = _783 + 1.0;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _787;
    bool _791 = !_355;
    int _793 = _791 ? 0 : 1;
    float _795 = -_683;
    float _797 = _795 + 1.0;
    bool _799 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _801 = isnan(0.0);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _807 = _803 || _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _811 = 1.0 + _809;
    float _813 = fma(_789, _627, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _821 = -_715;
    float _823 = _821 + 1.0;
    float _825 = 1.0 / _811;
    float _827 = _743 * _779;
    float _829 = _729 * _775;
    float _831 = _807 ? _797 : 0.0;
    float _833 = fma(_819, _641, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    bool _835 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _837 = isnan(1.0);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _843 = _839 || _841;
    float _845 = -_729;
    float _847 = _845 + 1.0;
    float _849 = _681 * _823;
    float _851 = _757 * _785;
    float _853 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[78].z, _815);
    float _855 = in.m_63.x;
    float _857 = in.m_63.y;
    float _859 = in.m_63.z;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _863 = _731 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _865 = _699 * _847;
    int _867 = abs(_793);
    float _869 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[78].w, _861);
    float _871 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _425);
    float _873 = -_145;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[76].x, _323);
    float _877 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _853);
    float _879 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _869);
    if (_843)
    {
        float _881 = _831 * _825;
        _149 = _881;
    }
    float _883 = _149;
    float _885 = float(_867);
    float _887 = _567 * _865;
    float _889 = float(_539);
    float _891 = fma(_863, _423, -0.5);
    float _893 = _565 * _865;
    float _895 = -_699;
    float _897 = _895 + 1.0;
    int _899 = _559 ? 0 : 1;
    float _901 = _885 * _889;
    float _903 = _569 * _865;
    float _905 = -_871;
    float _907 = fma(_879, _891, _905);
    float _909 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[143].x, _893);
    float _911 = _901 * (-2.0);
    int _913 = ~_899;
    int _915 = _913 + 1;
    int _917 = _915 + 1;
    float _919 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[143].y, _887);
    bool _921 = !_359;
    int _923 = _921 ? 0 : 1;
    float _925 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[143].z, _903);
    int _927 = _917;
    if (!_545)
    {
        int _929 = ~_899;
        int _931 = _929 + 1;
        _927 = _931;
    }
    int _933 = _927;
    float _935 = fma(_497, _911, _497);
    float _937 = fma(_911, _855, _855);
    int _939 = _587 ? 0 : 1;
    float _941 = _207 + (-0.5);
    bool _943 = !_363;
    int _945 = _943 ? 0 : 1;
    float _947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _949 = abs(_923);
    float _951 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[196].x, _937);
    int _953 = ~_939;
    int _955 = _953 + 1;
    int _957 = _955 + 1;
    float _959 = _367 + (-0.5);
    int _961 = abs(_945);
    float _963 = fma(_653, _829, _909);
    int _965 = _957;
    if (!_573)
    {
        int _967 = ~_939;
        int _969 = _967 + 1;
        _965 = _969;
    }
    int _971 = _965;
    float _973 = fma(_935, _883, _951);
    float _975 = float(_949);
    float _977 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _979 = float(_933);
    float _981 = fma(_617, _829, _919);
    float _983 = float(_961);
    float _985 = _973 * 0.15915493667125701904296875;
    float _987 = float(_971);
    float _989 = _975 * _979;
    float _991 = _947 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _993 = fma(_659, _829, _925);
    float _995 = fma(_645, _827, _981);
    float _997 = _983 * _987;
    float _999 = _989 * (-2.0);
    float _1001 = fma(_991, _471, -0.5);
    float _1003 = _985 * 6.283185482025146484375;
    float _1005 = sin(_1003);
    float _1007 = _997 * (-2.0);
    float _1009 = fma(_999, _857, _857);
    float _1011 = fma(_481, _999, _481);
    float _1013 = fma(_621, _851, _995);
    float _1015 = fma(_1007, _859, _859);
    float _1017 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1009);
    float _1019 = fma(_529, _1007, _529);
    float _1021 = fma(_877, _1001, _875);
    float _1023 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1015);
    float _1025 = fma(_1011, _883, _1017);
    float _1027 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1029 = fma(_643, _827, _963);
    float _1031 = fma(_1019, _883, _1023);
    float _1033 = _1025 * 0.15915493667125701904296875;
    float _1035 = fma(_717, _781, _1013);
    float _1037 = fma(_619, _851, _1029);
    float _1039 = _1031 * 0.15915493667125701904296875;
    float _1041 = _387 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1043 = _985 * 6.283185482025146484375;
    float _1045 = cos(_1043);
    float _1047 = fma(_685, _781, _1037);
    float _1049 = fma(_687, _849, _1035);
    float _1051 = _1041 * _977;
    float _1053 = _1021 + 0.5;
    float _1055 = fma(_669, _849, _1047);
    float _1057 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[149].y, _1049);
    float _1059 = _907 + 0.5;
    float _1061 = _1033 * 6.283185482025146484375;
    float _1063 = sin(_1061);
    float _1065 = fma(_651, _827, _993);
    float _1067 = _759 * _1027;
    float _1069 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[149].x, _1055);
    float _1071 = fma(_633, _851, _1065);
    float _1073 = in.m_65.x;
    float _1075 = in.m_65.y;
    float _1077 = in.m_65.z;
    float _1079 = in.m_65.w;
    float _1081 = _1033 * 6.283185482025146484375;
    float _1083 = cos(_1081);
    float _1085 = fma(_813, _781, _1071);
    out.m_67.x = _1053;
    out.m_67.y = _1059;
    out.m_67.z = _1067;
    out.m_67.w = _1051;
    float _1087 = fma(_833, _849, _1085);
    float _1089 = _1039 * 6.283185482025146484375;
    float _1091 = cos(_1089);
    float _1093 = _1005 * _1063;
    float _1095 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[149].z, _1087);
    float _1097 = _1045 * _1063;
    float _1099 = _1039 * 6.283185482025146484375;
    float _1101 = sin(_1099);
    float _1103 = _1045 * _1083;
    float _1105 = _1005 * _1083;
    float _1107 = -_257;
    float _1109 = _1107 + _277;
    float _1111 = _1045 * _1091;
    float _1113 = _1005 * _1091;
    float _1115 = _1083 * _1091;
    float _1117 = _1063 * _1091;
    float _1119 = _1111 * _1075;
    float _1121 = floor(_231);
    float _1123 = fma(_1101, _1103, _1093);
    float _1125 = fma(_1101, _1093, _1103);
    float _1127 = -_1097;
    float _1129 = fma(_1101, _1105, _1127);
    float _1131 = in.m_69.x;
    float _1133 = in.m_69.y;
    float _1135 = in.m_69.z;
    float _1137 = -_1075;
    float _1139 = _1101 * _1137;
    float _1141 = -_1105;
    float _1143 = fma(_1101, _1097, _1141);
    float _1145 = fma(_1123, _1073, _1119);
    float _1147 = _1113 * _1075;
    float _1149 = fma(_1115, _1073, _1139);
    float _1151 = in.m_48.x;
    float _1153 = in.m_48.y;
    float _1155 = in.m_48.z;
    float _1157 = fma(_1143, _1077, _1145);
    float _1159 = fma(_1129, _1073, _1147);
    float _1161 = fma(_1117, _1077, _1149);
    float _1163 = -_1121;
    float _1165 = _231 + _1163;
    float _1167 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1169 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1171 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1173 = fma(_1125, _1077, _1159);
    float _1175 = fma(_1161, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1167);
    float _1177 = fma(_1161, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1169);
    float _1179 = fma(_1161, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1171);
    float _1181 = fma(_1173, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1175);
    float _1183 = fma(_1173, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1177);
    float _1185 = fma(_1173, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1179);
    float _1187 = -_261;
    float _1189 = _1187 + _281;
    float _1191 = fma(_1165, _1109, _257);
    float _1193 = _1069 * _1131;
    float _1195 = -_259;
    float _1197 = _1195 + _279;
    float _1199 = _1057 * _1133;
    float _1201 = fma(_1165, _1189, _261);
    float _1203 = fma(_1165, _1197, _259);
    float _1205 = in.m_71.x;
    float _1207 = in.m_71.y;
    float _1209 = in.m_71.z;
    float _1211 = _1153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1213 = _1153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1215 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1203);
    bool _1217 = _1203 != 0.0;
    bool _1219 = isnan(_1203);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan(0.0);
    bool _1225 = _1221 || _1223;
    out.m_73.x = _1181;
    out.m_73.y = _1183;
    out.m_73.z = _1185;
    float _1227 = _1095 * _1135;
    float _1229 = _1153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1231 = _1191 == 0.0;
    bool _1233 = !_1225;
    bool _1235 = _1231 && _1233;
    float _1237 = fma(_1151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1213);
    float _1239 = fma(_1151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1211);
    float _1241 = fma(_1151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1229);
    bool _1243 = _1201 == 0.0;
    bool _1245 = _1243 && _1235;
    float _1247 = _1227 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1249 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1201);
    float _1251 = fma(_1155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1237);
    float _1253 = fma(_1155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1239);
    float _1255 = _1199 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1257 = fma(_1155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1241);
    float _1259 = _1249 * _1247;
    float _1261 = _1253 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1263 = _1215 * _1255;
    float _1265 = _1193 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1267 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1191);
    float _1269 = _1257 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1271 = _1111 * _1263;
    float _1273 = -_1263;
    float _1275 = _1101 * _1273;
    float _1277 = _1267 * _1265;
    float _1279 = _1113 * _1263;
    float _1281 = _1121;
    float _1283 = _1279;
    float _1285 = _1019;
    float _1287 = _1199;
    float _1289 = _1193;
    float _1291 = _1251;
    if (_1245)
    {
        _1281 = _1205;
    }
    float _1293 = _1281;
    float _1295 = fma(_1123, _1277, _1271);
    float _1297 = fma(_1115, _1277, _1275);
    float _1299 = fma(_1129, _1277, _1279);
    float _1301 = _1293;
    if (_1245)
    {
        _1283 = _1293;
    }
    float _1303 = _1283;
    float _1305 = fma(_1143, _1259, _1295);
    float _1307 = fma(_1117, _1259, _1297);
    float _1309 = _1303;
    if (!_1245)
    {
        _1301 = _1205;
    }
    float _1311 = _1301;
    float _1313 = fma(_1125, _1259, _1299);
    float _1315 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1317 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (_1245)
    {
        _1285 = _1207;
    }
    float _1319 = _1285;
    float _1321 = _1319;
    if (!_1245)
    {
        float _1323 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1311);
        _1309 = _1323;
    }
    float _1325 = _1309;
    float _1327 = fma(_1307, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1315);
    float _1329 = fma(_1307, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1317);
    float _1331 = _1327;
    if (_1245)
    {
        _1287 = _1209;
    }
    float _1333 = _1287;
    float _1335 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1337 = fma(_1313, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1327);
    float _1339 = fma(_1313, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1329);
    float _1341 = _1333;
    if (_1245)
    {
        _1331 = _1319;
    }
    float _1343 = _1331;
    float _1345 = _1077 * _1311;
    float _1347 = _1261 + _1337;
    float _1349 = _1269 + _1339;
    float _1351 = _1343;
    float _1353 = _1347;
    float _1355 = _1349;
    if (!_1245)
    {
        _1321 = _1207;
    }
    float _1357 = _1321;
    float _1359 = fma(_1307, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1335);
    if (_1245)
    {
        _1289 = _1333;
    }
    float _1361 = _1289;
    float _1363 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1365 = _1347 + _1363;
    float _1367 = _1361;
    if (!_1245)
    {
        _1341 = _1209;
    }
    float _1369 = _1341;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1373 = _1349 + _1371;
    if (!_1245)
    {
        float _1375 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1357);
        _1351 = _1375;
    }
    float _1377 = _1351;
    float _1379 = _1365 * _1365;
    float _1381 = fma(_1313, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1359);
    float _1383 = _1373 * _1373;
    float _1385 = _1379;
    float _1387 = _1383;
    if (!_1245)
    {
        float _1389 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1369);
        _1367 = _1389;
    }
    float _1391 = _1367;
    float _1393 = _1075 * _1369;
    float _1395 = -_1345;
    float _1397 = fma(_1073, _1369, _1395);
    float _1399 = _1379 + _1383;
    float _1401 = _1073 * _1357;
    float _1403 = -_1393;
    float _1405 = fma(_1077, _1357, _1403);
    float _1407 = -_1377;
    float _1409 = _1101 * _1407;
    float _1411 = sqrt(_1399);
    float _1413 = _1111 * _1377;
    float _1415 = _1113 * _1377;
    float _1417 = _1397 * _1079;
    float _1419 = fma(_1115, _1325, _1409);
    float _1421 = fma(_1123, _1325, _1413);
    float _1423 = fma(_1129, _1325, _1415);
    float _1425 = _1405 * _1079;
    float _1427 = _1111 * _1417;
    float _1429 = -_1417;
    float _1431 = _1101 * _1429;
    float _1433 = -_1401;
    float _1435 = fma(_1075, _1311, _1433);
    float _1437 = _1113 * _1417;
    float _1439 = fma(_1123, _1425, _1427);
    float _1441 = _1251 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1443 = fma(_1115, _1425, _1431);
    float _1445 = _1435 * _1079;
    bool _1447 = _1411 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1449 = _1441 + _1381;
    float _1451 = fma(_1129, _1425, _1437);
    float _1453 = fma(_1117, _1391, _1419);
    float _1455 = fma(_1143, _1391, _1421);
    float _1457 = fma(_1125, _1391, _1423);
    float _1459 = fma(_1117, _1445, _1443);
    float _1461 = fma(_1143, _1445, _1439);
    float _1463 = fma(_1125, _1445, _1451);
    float _1465 = _1425;
    if (!_1447)
    {
        _1291 = _1379;
    }
    float _1467 = _1291;
    float _1469 = _1467;
    if (!_1447)
    {
        _1385 = _1449;
    }
    float _1471 = _1385;
    bool _1473 = !_1447;
    float _1475 = _1471;
    if (!_1473)
    {
        float _1477 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1481 = _1411 + _1479;
        float _1483 = rsqrt(_1399);
        float _1485 = _1481 * _1477;
        float _1487 = _1449 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1489 = _1485 * 0.15915493667125701904296875;
        float _1491 = _1489 * 6.283185482025146484375;
        float _1493 = sin(_1491);
        float _1495 = _1489 * 6.283185482025146484375;
        float _1497 = cos(_1495);
        float _1499 = fma(_1493, _1487, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1501 = _1483 * _1499;
        float _1503 = _1497 + (-1.0);
        float _1505 = fma(_1365, _1501, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1507 = fma(_1373, _1501, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1509 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1511 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1513 = _1505 + _1511;
        float _1515 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1517 = _1507 + _1515;
        float _1519 = fma(_1449, _1497, _1509);
        float _1521 = _1513 * _1513;
        float _1523 = _1517 * _1517;
        _1475 = _1519;
        _1469 = _1521;
        _1387 = _1523;
        _1353 = _1505;
        _1355 = _1507;
    }
    float _1525 = _1475;
    float _1527 = _1469;
    float _1529 = _1387;
    float _1531 = _1353;
    float _1533 = _1355;
    float _1535 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1537 = _1525 + _1535;
    float _1539 = _1461 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1541 = _1461 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1543 = _1461 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1545 = fma(_1537, _1537, _1527);
    float _1547 = fma(_1459, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1539);
    float _1549 = fma(_1459, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1541);
    float _1551 = _1455 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1553 = _1545 + _1529;
    float _1555 = _1455 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1557 = _1455 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1559 = fma(_1453, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1551);
    float _1561 = fma(_1459, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1543);
    float _1563 = fma(_1453, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1555);
    float _1565 = sqrt(_1553);
    float _1567 = fma(_1453, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1557);
    float _1569 = fma(_1463, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1547);
    float _1571 = fma(_1457, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1563);
    float _1573 = fma(_1463, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1549);
    float _1575 = fma(_1463, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1561);
    float _1577 = fma(_1457, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1559);
    float _1579 = fma(_1457, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1567);
    out.m_75.x = _1569;
    out.m_75.y = _1573;
    out.m_75.z = _1575;
    out.m_77.x = _1577;
    out.m_77.y = _1571;
    out.m_77.z = _1579;
    bool _1581 = _1565 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1583 = isnan(_1565);
    bool _1585 = _1581 || _1583;
    bool _1587 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1589 = _1585 || _1587;
    float _1591 = _1547;
    float _1593 = _1573;
    float _1595 = _1575;
    if (!_1589)
    {
        _1591 = 1.0;
    }
    float _1597 = _1591;
    bool _1599 = !_1589;
    float _1601 = _1597;
    if (!_1599)
    {
        bool _1603 = _1565 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1605 = isnan(_1565);
        bool _1607 = _1603 || _1605;
        bool _1609 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1611 = _1607 || _1609;
        if (!_1611)
        {
            float _1613 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1615 = _1565 + _1613;
            float _1617 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1619 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1617;
            float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1623 = _1621 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1625 = 1.0 / _1619;
            float _1627 = _1615 * _1625;
            float _1629 = fma(_1627, _1623, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1601 = _1629;
            _1593 = _1625;
            _1631 = true;
        }
        else
        {
            bool _1633 = _1565 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1635 = isnan(_1565);
            bool _1637 = _1633 || _1635;
            bool _1639 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1641 = _1637 || _1639;
            if (!_1641)
            {
                float _1643 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1645 = _1565 + _1643;
                float _1647 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1649 = _1647 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1651 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1653 = _1651 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1655 = 1.0 / _1649;
                float _1657 = _1645 * _1655;
                float _1659 = fma(_1657, _1653, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1601 = _1659;
                _1593 = _1655;
                _1631 = true;
            }
            else
            {
                _1601 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1631 = false;
    float _1661 = _1601;
    float _1663 = _1593;
    float _1665 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1667 = _1531 + _1665;
    float _1669 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1671 = _1533 + _1669;
    bool _1673 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1675 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1677 = _1673 || _1675;
    bool _1679 = isnan(0.5);
    bool _1681 = _1677 || _1679;
    float _1683 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1685 = _1525 + _1683;
    float _1687 = fma(_1667, _1661, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1689 = fma(_1671, _1661, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1691 = fma(_1685, _1661, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1693 = _1685;
    float _1695 = _1663;
    float _1697 = _1691;
    float _1699 = _1687;
    if (_1681)
    {
        _1693 = _1687;
    }
    float _1701 = _1693;
    float _1703 = _1701;
    if (_1681)
    {
        _1695 = _1691;
    }
    float _1705 = _1695;
    float _1707 = _1705;
    if (_1681)
    {
        _1595 = _1689;
    }
    float _1709 = _1595;
    float _1711 = _1709;
    if (!_1681)
    {
        float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1715 = _1441 + _1713;
        float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1719 = _1261 + _1717;
        float _1721 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1723 = _1715 * _1715;
        float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1727 = _1269 + _1725;
        float _1729 = fma(_1719, _1719, _1723);
        float _1731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1733 = fma(_1727, _1727, _1729);
        float _1735 = sqrt(_1733);
        float _1737 = _1721 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1739 = precise::min(_1735, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1741 = _1739 * _1731;
        float _1743 = -_1261;
        float _1745 = _1743 + _1687;
        float _1747 = _1737 * _1741;
        float _1749 = -_1441;
        float _1751 = _1749 + _1691;
        float _1753 = -_1269;
        float _1755 = _1753 + _1689;
        float _1757 = fma(_1745, _1747, _1261);
        float _1759 = fma(_1751, _1747, _1441);
        float _1761 = fma(_1755, _1747, _1269);
        _1707 = _1759;
        _1703 = _1757;
        _1711 = _1761;
    }
    float _1763 = _1707;
    float _1765 = _1703;
    float _1767 = _1711;
    float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1771 = _1763 + _1769;
    float _1773 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1775 = _1765 + _1773;
    float _1777 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1779 = _1767 + _1777;
    float _1781 = _1771 * _1771;
    float _1783 = fma(_1775, _1775, _1781);
    float _1785 = fma(_1779, _1779, _1783);
    float _1787 = rsqrt(_1785);
    float _1789 = _1787 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1791 = _1775 * _1789;
    float _1793 = _1779 * _1789;
    float _1795 = _1791 * _1791;
    float _1797 = _1793 * _1793;
    float _1799 = _1795 + _1797;
    float _1801 = sqrt(_1799);
    bool _1803 = _1801 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1807 = _1801 + _1805;
    float _1809 = _1779;
    float _1811 = _1807;
    float _1813 = _1791;
    if (_1803)
    {
        float _1815 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1809 = _1815;
    }
    float _1817 = _1809;
    if (_1803)
    {
        float _1819 = rsqrt(_1799);
        _1697 = _1819;
    }
    float _1821 = _1697;
    float _1823 = _1821;
    if (_1803)
    {
        float _1825 = _1807 * _1817;
        _1811 = _1825;
    }
    float _1827 = _1811;
    if (_1803)
    {
        float _1829 = _1827 * 0.15915493667125701904296875;
        _1699 = _1829;
    }
    float _1831 = _1699;
    float _1833 = _1781;
    float _1835 = _1831;
    if (_1803)
    {
        float _1837 = _1831 * 6.283185482025146484375;
        float _1839 = sin(_1837);
        _1833 = _1839;
    }
    float _1841 = _1833;
    float _1843 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1845 = precise::max(0.0, _1843);
    float _1847 = _1787;
    float _1849 = _1845;
    float _1851 = _1843;
    if (_1803)
    {
        float _1853 = _1831 * 6.283185482025146484375;
        float _1855 = cos(_1853);
        _1847 = _1855;
    }
    float _1857 = _1847;
    float _1859 = -_1789;
    float _1861 = -_1845;
    float _1863 = fma(_1771, _1859, _1861);
    float _1865 = _1863;
    if (!_1803)
    {
        _1849 = _1795;
    }
    float _1867 = _1849;
    float _1869 = _1867;
    if (_1803)
    {
        float _1871 = _1863 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1851 = _1871;
    }
    float _1873 = _1851;
    float _1875 = _1841;
    float _1877 = _1873;
    if (_1803)
    {
        float _1879 = fma(_1841, _1873, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1875 = _1879;
    }
    float _1881 = _1875;
    float _1883 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1885 = _1881;
    if (_1803)
    {
        float _1887 = _1857 + (-1.0);
        _1877 = _1887;
    }
    float _1889 = _1877;
    if (_1803)
    {
        float _1891 = _1821 * _1881;
        _1465 = _1891;
    }
    float _1893 = _1465;
    if (!_1803)
    {
        _1823 = _1863;
    }
    float _1895 = _1823;
    float _1897 = _1895;
    if (_1803)
    {
        float _1899 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1835 = _1899;
    }
    float _1901 = _1835;
    if (_1803)
    {
        float _1903 = _1791 * _1893;
        _1813 = _1903;
    }
    float _1905 = _1813;
    if (!_1803)
    {
        _1885 = _1793;
    }
    float _1907 = _1885;
    float _1909 = _1907;
    if (_1803)
    {
        float _1911 = _1793 * _1893;
        _1909 = _1911;
    }
    float _1913 = _1909;
    if (_1803)
    {
        float _1915 = fma(_1863, _1857, _1901);
        _1897 = _1915;
    }
    float _1917 = _1897;
    if (_1803)
    {
        float _1919 = _1905 * _1905;
        _1869 = _1919;
    }
    float _1921 = _1869;
    float _1923 = sqrt(_1785);
    if (!_1803)
    {
        _1865 = _1797;
    }
    float _1925 = _1865;
    float _1927 = _1925;
    if (_1803)
    {
        float _1929 = _1913 * _1913;
        _1927 = _1929;
    }
    float _1931 = _1927;
    float _1933 = fma(_1917, _1917, _1921);
    float _1935 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1937 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1939 = _1933 + _1931;
    float _1941 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1935);
    float _1943 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1945 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1937);
    float _1947 = rsqrt(_1939);
    float _1949 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1941);
    float _1951 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1953 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1943);
    float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1957 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1955);
    float _1959 = precise::clamp(_1957, 0.0, 1.0);
    float _1961 = _1949 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1963 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1951);
    float _1965 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1953);
    float _1967 = -_1959;
    float _1969 = _1967 + 1.0;
    float _1971 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1973 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1963);
    float _1975 = _1965 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1977 = abs(_1969);
    float _1979 = log2(_1977);
    float _1981 = -_1971;
    float _1983 = fma(_1981, _1883, 1.0);
    float _1985 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1945);
    float _1987 = _1947 * _1905;
    float _1989 = _1973 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1991 = _1975 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1993 = _1947 * _1917;
    float _1995 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1997 = _1947 * _1913;
    float _1999 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1991);
    float _2001 = _1985 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2003 = -_1995;
    float _2005 = fma(_1993, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2003);
    float _2007 = log2(_1983);
    float _2009 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1999);
    float _2011 = _1975 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2013 = -_1997;
    float _2015 = fma(_2013, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2005);
    float _2017 = _1979 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2019 = fma(_2001, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2009);
    float _2021 = _1975 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2023 = fma(_2015, -0.5, 0.5);
    float _2025 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2011);
    float _2027 = 1.0 / _2019;
    float _2029 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2021);
    float _2031 = fma(_2015, 0.5, 0.5);
    float _2033 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2025);
    float _2035 = _1993 + 1.0;
    float _2037 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2029);
    float _2039 = fma(_2031, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2041 = _2007 * 0.693147182464599609375;
    float _2043 = exp2(_2017);
    float _2045 = fma(_2001, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2037);
    float _2047 = fma(_2001, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2033);
    float _2049 = fma(_2031, _2039, -0.212114393711090087890625);
    float _2051 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2053 = fma(_2031, _2049, 1.570728778839111328125);
    float _2055 = sqrt(_2023);
    float _2057 = _2045 * _2027;
    float _2059 = fma(_2057, 0.5, 0.5);
    float _2061 = -_1993;
    float _2063 = fma(_2043, _2035, _2061);
    float _2065 = _2047 * _2027;
    float _2067 = fma(_2063, 0.5, 0.5);
    float _2069 = fma(_2065, -0.5, 0.5);
    float _2071 = _2055 * 0.636619746685028076171875;
    float3 _5713 = float3(_2059, _2069, _2051);
    float _2073 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5713, float3(0.0), isnan(_5713)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5713, float3(0.0), isnan(_5713)), level(0.0)).x;
    float _2075 = -_2053;
    float _2077 = fma(_2071, _2075, 1.0);
    float3 _5729 = float3(_2059, _2069, _2051);
    float4 _2080 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5729, float3(0.0), isnan(_5729)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5729, float3(0.0), isnan(_5729)), level(0.0)).xyzw;
    float _2082 = _2080.x;
    float _2084 = _2080.y;
    float _2086 = _2080.z;
    float _2088 = _2080.w;
    float2 _5746 = float2(_2077, _2067);
    float3 _2090 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5746, float2(0.0), isnan(_5746)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5746, float2(0.0), isnan(_5746)), level(0.0)).xyz;
    float _2092 = _2090.x;
    float _2094 = _2090.y;
    float _2096 = _2090.z;
    float _2098 = _1979 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2100 = _1975 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2102 = _2019 * 0.5;
    out.m_79.x = _1765;
    out.m_79.y = _1763;
    out.m_79.z = _1767;
    float _2104 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2100);
    float _2106 = exp2(_2098);
    float _2108 = fma(_2047, -0.5, _2102);
    bool _2110 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2112 = isnan(_1923);
    bool _2114 = _2110 || _2112;
    bool _2116 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2118 = _2114 || _2116;
    float _2120 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2104);
    float _2122 = fma(_2001, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2120);
    float _2124 = _2045 + _2019;
    float _2126 = _2122 + _2019;
    float _2128 = _2124 * 0.5;
    out.gl_Position.x = _2045;
    out.gl_Position.y = _2047;
    out.gl_Position.z = _2122;
    out.gl_Position.w = _2019;
    float _2130 = _2126 * 0.5;
    float _2132 = -_2106;
    float _2134 = _2132 + 1.0;
    float _2136 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _2128;
    out.m_81.y = _2108;
    out.m_81.z = _2130;
    out.m_81.w = _2019;
    float _2138 = -_2136;
    float _2140 = _2138 + 1.0;
    float _2142 = _2122;
    float _2144 = _2047;
    float _2146 = _2045;
    float _2148 = _2136;
    float _2150 = _2140;
    if (!_2118)
    {
        _2142 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2152 = _2142;
    float _2154 = _2152;
    float _2156 = _2152;
    if (!_2118)
    {
        _2144 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2158 = _2144;
    float _2160 = _2158;
    float _2162 = _2158;
    if (!_2118)
    {
        _2146 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2164 = _2146;
    float _2166 = _2136 * _2073;
    float _2168 = _2164;
    float _2170 = _2164;
    if (!_2118)
    {
        _2148 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2172 = _2148;
    float _2174 = _2088 * _2166;
    float _2176 = _2088 * _2140;
    float _2178 = _2174;
    float _2180 = _2172;
    float _2182 = _2172;
    if (!_2118)
    {
        _2150 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2184 = _2150;
    float _2186 = _2096 * _2166;
    float _2188 = fma(_2092, _2174, _2082);
    float _2190 = fma(_2094, _2174, _2084);
    float _2192 = _2184;
    float _2194 = _2184;
    if (!_2118)
    {
        _2178 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2196 = _2178;
    float _2198 = fma(_2088, _2186, _2086);
    out.m_83.x = _2188;
    out.m_83.y = _2190;
    out.m_83.z = _2198;
    out.m_83.w = _2176;
    bool _2200 = !_2118;
    float _2202 = _2196;
    float _2204 = _2196;
    if (!_2200)
    {
        bool _2206 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2208 = isnan(_1923);
        bool _2210 = _2206 || _2208;
        bool _2212 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2214 = _2210 || _2212;
        if (!_2214)
        {
            float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2218 = _1923 + _2216;
            float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2222 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2220;
            float _2224 = 1.0 / _2222;
            float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2228 = _2226 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2232 = _2230 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2236 = _2234 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2238 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2240 = _2238 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2242 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2244 = _2242 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2246 = _2218 * _2224;
            float _2248 = precise::clamp(_2246, 0.0, 1.0);
            float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2252 = _2250 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2254 = fma(_2248, _2228, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2256 = fma(_2248, _2252, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2258 = fma(_2248, _2232, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2260 = fma(_2248, _2236, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2262 = fma(_2248, _2240, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2264 = fma(_2248, _2244, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2162 = _2256;
            _2194 = _2262;
            _2156 = _2254;
            _2204 = _2260;
            _2170 = _2258;
            _2182 = _2264;
            _2266 = true;
        }
        else
        {
            bool _2268 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2270 = isnan(_1923);
            bool _2272 = _2268 || _2270;
            bool _2274 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2276 = _2272 || _2274;
            if (!_2276)
            {
                _2154 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2278 = _2154;
            _2156 = _2278;
            if (!_2276)
            {
                _2160 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2280 = _2160;
            _2162 = _2280;
            if (!_2276)
            {
                _2168 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2282 = _2168;
            _2170 = _2282;
            if (!_2276)
            {
                _2202 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2284 = _2202;
            _2204 = _2284;
            if (!_2276)
            {
                _2192 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2286 = _2192;
            _2194 = _2286;
            if (!_2276)
            {
                _2180 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2288 = _2180;
            bool _2290 = !_2276;
            _2182 = _2288;
            if (!_2290)
            {
                bool _2292 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2294 = isnan(_1923);
                bool _2296 = _2292 || _2294;
                bool _2298 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2300 = _2296 || _2298;
                if (!_2300)
                {
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2304 = _1923 + _2302;
                    float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2308 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2306;
                    float _2310 = 1.0 / _2308;
                    float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2314 = _2312 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2318 = _2316 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2322 = _2320 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2324 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2326 = _2324 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2330 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2332 = _2304 * _2310;
                    float _2334 = precise::clamp(_2332, 0.0, 1.0);
                    float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2338 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2340 = fma(_2334, _2314, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2342 = fma(_2334, _2338, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2344 = fma(_2334, _2318, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2346 = fma(_2334, _2322, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2348 = fma(_2334, _2326, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2350 = fma(_2334, _2330, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2162 = _2342;
                    _2194 = _2348;
                    _2156 = _2340;
                    _2204 = _2346;
                    _2170 = _2344;
                    _2182 = _2350;
                    _2266 = true;
                }
                else
                {
                    _2162 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2194 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2156 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2204 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2170 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2182 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2266 = false;
    float _2352 = _2162;
    float _2354 = _2194;
    float _2356 = _2156;
    float _2358 = _2204;
    float _2360 = _2170;
    float _2362 = _2182;
    float _2364 = fma(_1571, -0.5, 0.5);
    float _2366 = precise::clamp(_2364, 0.0, 1.0);
    float _2368 = -_2352;
    float _2370 = _2368 + _2354;
    float _2372 = -_2356;
    float _2374 = _2372 + _2358;
    float _2376 = -_2360;
    float _2378 = _2376 + _2362;
    bool _2380 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2382 = fma(_2366, _2370, _2352);
    float _2384 = fma(_2366, _2374, _2356);
    float _2386 = fma(_2366, _2378, _2360);
    float _2388 = _2382 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2390 = fma(_2384, 0.298911988735198974609375, _2388);
    float _2392 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2394 = fma(_2386, 0.114477999508380889892578125, _2390);
    out.m_85.w = _2392;
    float _2396 = -_2394;
    float _2398 = _2384 + _2396;
    float _2400 = -_2394;
    float _2402 = _2382 + _2400;
    float _2404 = -_2394;
    float _2406 = _2386 + _2404;
    out.m_87.x = 0.0;
    float _2408 = fma(_2398, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2394);
    float _2410 = fma(_2402, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2394);
    float _2412 = fma(_2406, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2394);
    out.m_89.x = _2408;
    out.m_89.y = _2410;
    out.m_89.z = _2412;
    if (!_2380)
    {
        return out;
    }
    float _2414 = -_1763;
    float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2418 = -_1765;
    float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2422 = -_1767;
    float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2426 = _2416 * _2416;
    float _2428 = fma(_2420, _2420, _2426);
    float _2430 = fma(_2424, _2424, _2428);
    float _2432 = sqrt(_2430);
    float _2434 = rsqrt(_2430);
    float _2436 = -_2432;
    float _2438 = _2436 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2440 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2442 = precise::clamp(_2440, 0.0, 1.0);
    float _2444 = _2420 * _2434;
    float _2446 = _2416 * _2434;
    float _2448 = abs(_2442);
    float _2450 = log2(_2448);
    float _2452 = _2424 * _2434;
    float _2454 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2456 = _1571 * _2446;
    float _2458 = -_2446;
    float _2460 = -_2454;
    float _2462 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2460);
    float _2464 = fma(_1577, _2444, _2456);
    float _2466 = -_2452;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2462);
    float _2470 = fma(_1579, _2452, _2464);
    float _2472 = precise::clamp(_2470, 0.0, 1.0);
    float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2476 = _2468 + _2474;
    float _2478 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2480 = _2476 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2482 = precise::clamp(_2480, 0.0, 1.0);
    float _2484 = exp2(_2478);
    float _2486 = _2484 * _2482;
    float _2488 = _2472 * _2486;
    float _2490 = _2488 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2492 = _2488 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2494 = _2488 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2490;
    out.m_87.y = _2492;
    out.m_87.z = _2494;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
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
    bool _2266 = false;
    bool _1631 = false;
    bool _189 = false;
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
        float _2551 = as_type<float>(_127);
        out.gl_Position.z = _2551;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2620 = as_type<float>(_165);
        out.gl_Position.z = _2620;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _169 = !_167;
    float _187;
    if (!_169)
    {
        float _171 = in.m_55.x;
        float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _179 = _177 * _173;
        float _181 = floor(_179);
        float _183 = -_181;
        float _185 = _179 + _183;
        _187 = _185;
        _189 = true;
    }
    else
    {
        float _191 = float(_111);
        float _193 = 1.0 / _191;
        float _195 = _145 * _193;
        _187 = _195;
    }
    _189 = false;
    float _197 = _187;
    int _199 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _201 = _199;
    int _203 = 0;
    int _205 = _102(_201, _203, (*spvDescriptorSet0.support_buffer));
    float _207 = in.m_55.x;
    float _209 = in.m_57.z;
    float _211 = in.m_55.w;
    float _213 = in.m_57.y;
    float _215 = _207 * 8.0;
    float _217 = rint(_215);
    float _219 = _217 * 0.125;
    float _221 = precise::clamp(_219, 0.0, 1.0);
    int _223 = _205 + (-1);
    float _225 = trunc(_209);
    int _227 = int(_225);
    float _229 = float(_223);
    float _231 = _221 * _229;
    float _233 = trunc(_231);
    int _235 = int(_233);
    int _237 = _235 + 1;
    int _239 = min(_223, _237);
    int _241 = _235;
    int _243 = 0;
    int _245 = _103(_241, _243, (*spvDescriptorSet0.support_buffer));
    int _247 = _227;
    int _249 = 0;
    int _251 = _103(_247, _249, (*spvDescriptorSet0.support_buffer));
    float3 _255 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_245, _251)), 0).xyz;
    float _257 = _255.x;
    float _259 = _255.y;
    float _261 = _255.z;
    int _263 = _239;
    int _265 = 0;
    int _267 = _103(_263, _265, (*spvDescriptorSet0.support_buffer));
    int _269 = _227;
    int _271 = 0;
    int _273 = _103(_269, _271, (*spvDescriptorSet0.support_buffer));
    float3 _275 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_267, _273)), 0).xyz;
    float _277 = _275.x;
    float _279 = _275.y;
    float _281 = _275.z;
    float _283 = in.m_55.z;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _197 + _285;
    float _289 = in.m_57.x;
    float _291 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _293 = log2(_291);
    bool _295 = _211 > 0.5;
    float _297 = -_213;
    float _299 = _297 + 1.0;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _305 = _303 != 0;
    float _307 = _207 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _311 = _309 != 0;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = _197 + _313;
    int _317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _319 = _317 != 0;
    float _321 = -_301;
    float _323 = fma(_307, 2.0, _321);
    int _325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _327 = _325 != 0;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = 1.0 / _331;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _197 + _339;
    int _343 = _295 ? as_type<int>(_299) : as_type<int>(_213);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _355 = _353 != 0;
    int _357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _359 = _357 != 0;
    int _361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _363 = _361 != 0;
    float _365 = 1.0 / _335;
    float _367 = in.m_55.y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _375 = _369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _377 = 1.0 / _347;
    float _379 = _371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _387 = _319 ? as_type<float>(_343) : _213;
    float _389 = _373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _391;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _397 = _383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _399 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _375;
    out.m_59.y = _379;
    out.m_59.z = _389;
    float _401 = _395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _403 = 1.0 / _351;
    bool _405 = _367 > 0.5;
    float _407 = _367 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_61.x = _399;
    out.m_61.y = _397;
    out.m_61.z = _401;
    float _409 = _213;
    bool _411 = _405;
    float _413 = _393;
    int _415 = as_type<int>(_399);
    bool _417 = _305;
    float _419 = _395;
    if (_327)
    {
        float _421 = _405 ? _299 : _213;
        _409 = _421;
    }
    float _423 = _409;
    float _425 = fma(_407, -2.0, _385);
    if (_305)
    {
        bool _427 = _207 > 0.5;
        _411 = _427;
    }
    bool _429 = _411;
    float _431 = 1.0 / _393;
    float _433 = _367 * 2.0;
    float _435 = _283 * 2.0;
    float _437 = _367 + _283;
    float _439 = _207 * 2.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _445 = _437 + (-1.0);
    float _447 = floor(_435);
    int _449 = as_type<int>(_437);
    if (_305)
    {
        float _451 = -_289;
        float _453 = _451 + 1.0;
        _449 = as_type<int>(_453);
    }
    int _455 = _449;
    if (!_305)
    {
        _413 = _289;
    }
    float _457 = _413;
    float _459 = _457;
    if (_311)
    {
        float _461 = -_289;
        float _463 = _461 + 1.0;
        _415 = as_type<int>(_463);
    }
    int _465 = _415;
    float _467 = _287 * _337;
    if (_305)
    {
        float _469 = _429 ? as_type<float>(_455) : _289;
        _459 = _469;
    }
    float _471 = _459;
    float _473 = _207 + _367;
    float _475 = floor(_439);
    if (_311)
    {
        bool _477 = _283 > 0.5;
        _417 = _477;
    }
    bool _479 = _417;
    float _481 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _483 = _473 + (-1.0);
    if (!_311)
    {
        _419 = _289;
    }
    float _485 = _419;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _489 = _197 + _487;
    float _491 = _485;
    if (_311)
    {
        float _493 = _479 ? as_type<float>(_465) : _289;
        _491 = _493;
    }
    float _495 = _491;
    float _497 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _499 = _447 > 0.0;
    float _501 = floor(_433);
    bool _503 = _447 >= 0.0;
    bool _505 = isnan(_447);
    bool _507 = _503 || _505;
    bool _509 = isnan(0.0);
    bool _511 = _507 || _509;
    float _513 = _207 + _283;
    float _515 = _489 * _403;
    int _517 = _511 ? 0 : 1;
    float _519 = _513 + (-1.0);
    float _521 = 1.0 / _443;
    int _523 = ~_517;
    int _525 = _523 + 1;
    int _527 = _525 + 1;
    float _529 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _531 = _315 * _377;
    int _533 = _527;
    if (!_499)
    {
        int _535 = ~_517;
        int _537 = _535 + 1;
        _533 = _537;
    }
    int _539 = _533;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _541;
    bool _545 = _475 > 0.0;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _547;
    bool _551 = _475 >= 0.0;
    bool _553 = isnan(_475);
    bool _555 = _551 || _553;
    bool _557 = isnan(0.0);
    bool _559 = _555 || _557;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _561;
    float _565 = fma(_549, _467, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _567 = fma(_543, _467, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _569 = fma(_563, _467, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _571 = _341 * _365;
    bool _573 = _501 > 0.0;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _579 = _501 >= 0.0;
    bool _581 = isnan(_501);
    bool _583 = _579 || _581;
    bool _585 = isnan(0.0);
    bool _587 = _583 || _585;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _611 = _197 + _609;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _617 = fma(_591, _571, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _619 = fma(_603, _515, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _621 = fma(_607, _515, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _625 = _197 + _623;
    float _627 = _611 * _431;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _629;
    float _633 = fma(_615, _515, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _635;
    float _639 = _293 * _145;
    float _641 = _625 * _521;
    float _643 = fma(_631, _531, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _645 = fma(_595, _531, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _651 = fma(_637, _531, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _653 = fma(_577, _571, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _655;
    float _659 = fma(_599, _571, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _669 = fma(_649, _641, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    bool _671 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _673 = isnan(_197);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = exp2(_639);
    float _685 = fma(_663, _627, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _687 = fma(_667, _641, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    bool _689 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _691 = isnan(_197);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -_681;
    float _703 = _701 + 1.0;
    bool _705 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _707 = isnan(_197);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    float _717 = fma(_657, _627, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    bool _719 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _721 = isnan(_197);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _733 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _735 = isnan(_197);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = _283 + (-0.5);
    bool _747 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _749 = isnan(_197);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = _495 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _761 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _763 = isnan(_197);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = -_743;
    float _775 = _773 + 1.0;
    float _777 = -_757;
    float _779 = _777 + 1.0;
    float _781 = _771 * _703;
    float _783 = -_771;
    float _785 = _783 + 1.0;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _787;
    bool _791 = !_355;
    int _793 = _791 ? 0 : 1;
    float _795 = -_683;
    float _797 = _795 + 1.0;
    bool _799 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _801 = isnan(0.0);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _807 = _803 || _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _811 = 1.0 + _809;
    float _813 = fma(_789, _627, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _821 = -_715;
    float _823 = _821 + 1.0;
    float _825 = 1.0 / _811;
    float _827 = _743 * _779;
    float _829 = _729 * _775;
    float _831 = _807 ? _797 : 0.0;
    float _833 = fma(_819, _641, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    bool _835 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _837 = isnan(1.0);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _843 = _839 || _841;
    float _845 = -_729;
    float _847 = _845 + 1.0;
    float _849 = _681 * _823;
    float _851 = _757 * _785;
    float _853 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[78].z, _815);
    float _855 = in.m_63.x;
    float _857 = in.m_63.y;
    float _859 = in.m_63.z;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _863 = _731 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _865 = _699 * _847;
    int _867 = abs(_793);
    float _869 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[78].w, _861);
    float _871 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _425);
    float _873 = -_145;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[76].x, _323);
    float _877 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _853);
    float _879 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _869);
    if (_843)
    {
        float _881 = _831 * _825;
        _149 = _881;
    }
    float _883 = _149;
    float _885 = float(_867);
    float _887 = _567 * _865;
    float _889 = float(_539);
    float _891 = fma(_863, _423, -0.5);
    float _893 = _565 * _865;
    float _895 = -_699;
    float _897 = _895 + 1.0;
    int _899 = _559 ? 0 : 1;
    float _901 = _885 * _889;
    float _903 = _569 * _865;
    float _905 = -_871;
    float _907 = fma(_879, _891, _905);
    float _909 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[143].x, _893);
    float _911 = _901 * (-2.0);
    int _913 = ~_899;
    int _915 = _913 + 1;
    int _917 = _915 + 1;
    float _919 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[143].y, _887);
    bool _921 = !_359;
    int _923 = _921 ? 0 : 1;
    float _925 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[143].z, _903);
    int _927 = _917;
    if (!_545)
    {
        int _929 = ~_899;
        int _931 = _929 + 1;
        _927 = _931;
    }
    int _933 = _927;
    float _935 = fma(_497, _911, _497);
    float _937 = fma(_911, _855, _855);
    int _939 = _587 ? 0 : 1;
    float _941 = _207 + (-0.5);
    bool _943 = !_363;
    int _945 = _943 ? 0 : 1;
    float _947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _949 = abs(_923);
    float _951 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[196].x, _937);
    int _953 = ~_939;
    int _955 = _953 + 1;
    int _957 = _955 + 1;
    float _959 = _367 + (-0.5);
    int _961 = abs(_945);
    float _963 = fma(_653, _829, _909);
    int _965 = _957;
    if (!_573)
    {
        int _967 = ~_939;
        int _969 = _967 + 1;
        _965 = _969;
    }
    int _971 = _965;
    float _973 = fma(_935, _883, _951);
    float _975 = float(_949);
    float _977 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _979 = float(_933);
    float _981 = fma(_617, _829, _919);
    float _983 = float(_961);
    float _985 = _973 * 0.15915493667125701904296875;
    float _987 = float(_971);
    float _989 = _975 * _979;
    float _991 = _947 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _993 = fma(_659, _829, _925);
    float _995 = fma(_645, _827, _981);
    float _997 = _983 * _987;
    float _999 = _989 * (-2.0);
    float _1001 = fma(_991, _471, -0.5);
    float _1003 = _985 * 6.283185482025146484375;
    float _1005 = sin(_1003);
    float _1007 = _997 * (-2.0);
    float _1009 = fma(_999, _857, _857);
    float _1011 = fma(_481, _999, _481);
    float _1013 = fma(_621, _851, _995);
    float _1015 = fma(_1007, _859, _859);
    float _1017 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1009);
    float _1019 = fma(_529, _1007, _529);
    float _1021 = fma(_877, _1001, _875);
    float _1023 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1015);
    float _1025 = fma(_1011, _883, _1017);
    float _1027 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1029 = fma(_643, _827, _963);
    float _1031 = fma(_1019, _883, _1023);
    float _1033 = _1025 * 0.15915493667125701904296875;
    float _1035 = fma(_717, _781, _1013);
    float _1037 = fma(_619, _851, _1029);
    float _1039 = _1031 * 0.15915493667125701904296875;
    float _1041 = _387 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1043 = _985 * 6.283185482025146484375;
    float _1045 = cos(_1043);
    float _1047 = fma(_685, _781, _1037);
    float _1049 = fma(_687, _849, _1035);
    float _1051 = _1041 * _977;
    float _1053 = _1021 + 0.5;
    float _1055 = fma(_669, _849, _1047);
    float _1057 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[149].y, _1049);
    float _1059 = _907 + 0.5;
    float _1061 = _1033 * 6.283185482025146484375;
    float _1063 = sin(_1061);
    float _1065 = fma(_651, _827, _993);
    float _1067 = _759 * _1027;
    float _1069 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[149].x, _1055);
    float _1071 = fma(_633, _851, _1065);
    float _1073 = in.m_65.x;
    float _1075 = in.m_65.y;
    float _1077 = in.m_65.z;
    float _1079 = in.m_65.w;
    float _1081 = _1033 * 6.283185482025146484375;
    float _1083 = cos(_1081);
    float _1085 = fma(_813, _781, _1071);
    out.m_67.x = _1053;
    out.m_67.y = _1059;
    out.m_67.z = _1067;
    out.m_67.w = _1051;
    float _1087 = fma(_833, _849, _1085);
    float _1089 = _1039 * 6.283185482025146484375;
    float _1091 = cos(_1089);
    float _1093 = _1005 * _1063;
    float _1095 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[149].z, _1087);
    float _1097 = _1045 * _1063;
    float _1099 = _1039 * 6.283185482025146484375;
    float _1101 = sin(_1099);
    float _1103 = _1045 * _1083;
    float _1105 = _1005 * _1083;
    float _1107 = -_257;
    float _1109 = _1107 + _277;
    float _1111 = _1045 * _1091;
    float _1113 = _1005 * _1091;
    float _1115 = _1083 * _1091;
    float _1117 = _1063 * _1091;
    float _1119 = _1111 * _1075;
    float _1121 = floor(_231);
    float _1123 = fma(_1101, _1103, _1093);
    float _1125 = fma(_1101, _1093, _1103);
    float _1127 = -_1097;
    float _1129 = fma(_1101, _1105, _1127);
    float _1131 = in.m_69.x;
    float _1133 = in.m_69.y;
    float _1135 = in.m_69.z;
    float _1137 = -_1075;
    float _1139 = _1101 * _1137;
    float _1141 = -_1105;
    float _1143 = fma(_1101, _1097, _1141);
    float _1145 = fma(_1123, _1073, _1119);
    float _1147 = _1113 * _1075;
    float _1149 = fma(_1115, _1073, _1139);
    float _1151 = in.m_48.x;
    float _1153 = in.m_48.y;
    float _1155 = in.m_48.z;
    float _1157 = fma(_1143, _1077, _1145);
    float _1159 = fma(_1129, _1073, _1147);
    float _1161 = fma(_1117, _1077, _1149);
    float _1163 = -_1121;
    float _1165 = _231 + _1163;
    float _1167 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1169 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1171 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1173 = fma(_1125, _1077, _1159);
    float _1175 = fma(_1161, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1167);
    float _1177 = fma(_1161, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1169);
    float _1179 = fma(_1161, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1171);
    float _1181 = fma(_1173, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1175);
    float _1183 = fma(_1173, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1177);
    float _1185 = fma(_1173, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1179);
    float _1187 = -_261;
    float _1189 = _1187 + _281;
    float _1191 = fma(_1165, _1109, _257);
    float _1193 = _1069 * _1131;
    float _1195 = -_259;
    float _1197 = _1195 + _279;
    float _1199 = _1057 * _1133;
    float _1201 = fma(_1165, _1189, _261);
    float _1203 = fma(_1165, _1197, _259);
    float _1205 = in.m_71.x;
    float _1207 = in.m_71.y;
    float _1209 = in.m_71.z;
    float _1211 = _1153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1213 = _1153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1215 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1203);
    bool _1217 = _1203 != 0.0;
    bool _1219 = isnan(_1203);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan(0.0);
    bool _1225 = _1221 || _1223;
    out.m_73.x = _1181;
    out.m_73.y = _1183;
    out.m_73.z = _1185;
    float _1227 = _1095 * _1135;
    float _1229 = _1153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1231 = _1191 == 0.0;
    bool _1233 = !_1225;
    bool _1235 = _1231 && _1233;
    float _1237 = fma(_1151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1213);
    float _1239 = fma(_1151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1211);
    float _1241 = fma(_1151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1229);
    bool _1243 = _1201 == 0.0;
    bool _1245 = _1243 && _1235;
    float _1247 = _1227 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1249 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1201);
    float _1251 = fma(_1155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1237);
    float _1253 = fma(_1155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1239);
    float _1255 = _1199 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1257 = fma(_1155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1241);
    float _1259 = _1249 * _1247;
    float _1261 = _1253 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1263 = _1215 * _1255;
    float _1265 = _1193 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1267 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1191);
    float _1269 = _1257 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1271 = _1111 * _1263;
    float _1273 = -_1263;
    float _1275 = _1101 * _1273;
    float _1277 = _1267 * _1265;
    float _1279 = _1113 * _1263;
    float _1281 = _1121;
    float _1283 = _1279;
    float _1285 = _1019;
    float _1287 = _1199;
    float _1289 = _1193;
    float _1291 = _1251;
    if (_1245)
    {
        _1281 = _1205;
    }
    float _1293 = _1281;
    float _1295 = fma(_1123, _1277, _1271);
    float _1297 = fma(_1115, _1277, _1275);
    float _1299 = fma(_1129, _1277, _1279);
    float _1301 = _1293;
    if (_1245)
    {
        _1283 = _1293;
    }
    float _1303 = _1283;
    float _1305 = fma(_1143, _1259, _1295);
    float _1307 = fma(_1117, _1259, _1297);
    float _1309 = _1303;
    if (!_1245)
    {
        _1301 = _1205;
    }
    float _1311 = _1301;
    float _1313 = fma(_1125, _1259, _1299);
    float _1315 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1317 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (_1245)
    {
        _1285 = _1207;
    }
    float _1319 = _1285;
    float _1321 = _1319;
    if (!_1245)
    {
        float _1323 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1311);
        _1309 = _1323;
    }
    float _1325 = _1309;
    float _1327 = fma(_1307, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1315);
    float _1329 = fma(_1307, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1317);
    float _1331 = _1327;
    if (_1245)
    {
        _1287 = _1209;
    }
    float _1333 = _1287;
    float _1335 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1337 = fma(_1313, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1327);
    float _1339 = fma(_1313, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1329);
    float _1341 = _1333;
    if (_1245)
    {
        _1331 = _1319;
    }
    float _1343 = _1331;
    float _1345 = _1077 * _1311;
    float _1347 = _1261 + _1337;
    float _1349 = _1269 + _1339;
    float _1351 = _1343;
    float _1353 = _1347;
    float _1355 = _1349;
    if (!_1245)
    {
        _1321 = _1207;
    }
    float _1357 = _1321;
    float _1359 = fma(_1307, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1335);
    if (_1245)
    {
        _1289 = _1333;
    }
    float _1361 = _1289;
    float _1363 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1365 = _1347 + _1363;
    float _1367 = _1361;
    if (!_1245)
    {
        _1341 = _1209;
    }
    float _1369 = _1341;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1373 = _1349 + _1371;
    if (!_1245)
    {
        float _1375 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1357);
        _1351 = _1375;
    }
    float _1377 = _1351;
    float _1379 = _1365 * _1365;
    float _1381 = fma(_1313, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1359);
    float _1383 = _1373 * _1373;
    float _1385 = _1379;
    float _1387 = _1383;
    if (!_1245)
    {
        float _1389 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1369);
        _1367 = _1389;
    }
    float _1391 = _1367;
    float _1393 = _1075 * _1369;
    float _1395 = -_1345;
    float _1397 = fma(_1073, _1369, _1395);
    float _1399 = _1379 + _1383;
    float _1401 = _1073 * _1357;
    float _1403 = -_1393;
    float _1405 = fma(_1077, _1357, _1403);
    float _1407 = -_1377;
    float _1409 = _1101 * _1407;
    float _1411 = sqrt(_1399);
    float _1413 = _1111 * _1377;
    float _1415 = _1113 * _1377;
    float _1417 = _1397 * _1079;
    float _1419 = fma(_1115, _1325, _1409);
    float _1421 = fma(_1123, _1325, _1413);
    float _1423 = fma(_1129, _1325, _1415);
    float _1425 = _1405 * _1079;
    float _1427 = _1111 * _1417;
    float _1429 = -_1417;
    float _1431 = _1101 * _1429;
    float _1433 = -_1401;
    float _1435 = fma(_1075, _1311, _1433);
    float _1437 = _1113 * _1417;
    float _1439 = fma(_1123, _1425, _1427);
    float _1441 = _1251 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1443 = fma(_1115, _1425, _1431);
    float _1445 = _1435 * _1079;
    bool _1447 = _1411 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1449 = _1441 + _1381;
    float _1451 = fma(_1129, _1425, _1437);
    float _1453 = fma(_1117, _1391, _1419);
    float _1455 = fma(_1143, _1391, _1421);
    float _1457 = fma(_1125, _1391, _1423);
    float _1459 = fma(_1117, _1445, _1443);
    float _1461 = fma(_1143, _1445, _1439);
    float _1463 = fma(_1125, _1445, _1451);
    float _1465 = _1425;
    if (!_1447)
    {
        _1291 = _1379;
    }
    float _1467 = _1291;
    float _1469 = _1467;
    if (!_1447)
    {
        _1385 = _1449;
    }
    float _1471 = _1385;
    bool _1473 = !_1447;
    float _1475 = _1471;
    if (!_1473)
    {
        float _1477 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1481 = _1411 + _1479;
        float _1483 = rsqrt(_1399);
        float _1485 = _1481 * _1477;
        float _1487 = _1449 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1489 = _1485 * 0.15915493667125701904296875;
        float _1491 = _1489 * 6.283185482025146484375;
        float _1493 = sin(_1491);
        float _1495 = _1489 * 6.283185482025146484375;
        float _1497 = cos(_1495);
        float _1499 = fma(_1493, _1487, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1501 = _1483 * _1499;
        float _1503 = _1497 + (-1.0);
        float _1505 = fma(_1365, _1501, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1507 = fma(_1373, _1501, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1509 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1511 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1513 = _1505 + _1511;
        float _1515 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1517 = _1507 + _1515;
        float _1519 = fma(_1449, _1497, _1509);
        float _1521 = _1513 * _1513;
        float _1523 = _1517 * _1517;
        _1475 = _1519;
        _1469 = _1521;
        _1387 = _1523;
        _1353 = _1505;
        _1355 = _1507;
    }
    float _1525 = _1475;
    float _1527 = _1469;
    float _1529 = _1387;
    float _1531 = _1353;
    float _1533 = _1355;
    float _1535 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1537 = _1525 + _1535;
    float _1539 = _1461 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1541 = _1461 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1543 = _1461 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1545 = fma(_1537, _1537, _1527);
    float _1547 = fma(_1459, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1539);
    float _1549 = fma(_1459, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1541);
    float _1551 = _1455 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1553 = _1545 + _1529;
    float _1555 = _1455 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1557 = _1455 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1559 = fma(_1453, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1551);
    float _1561 = fma(_1459, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1543);
    float _1563 = fma(_1453, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1555);
    float _1565 = sqrt(_1553);
    float _1567 = fma(_1453, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1557);
    float _1569 = fma(_1463, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1547);
    float _1571 = fma(_1457, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1563);
    float _1573 = fma(_1463, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1549);
    float _1575 = fma(_1463, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1561);
    float _1577 = fma(_1457, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1559);
    float _1579 = fma(_1457, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1567);
    out.m_75.x = _1569;
    out.m_75.y = _1573;
    out.m_75.z = _1575;
    out.m_77.x = _1577;
    out.m_77.y = _1571;
    out.m_77.z = _1579;
    bool _1581 = _1565 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1583 = isnan(_1565);
    bool _1585 = _1581 || _1583;
    bool _1587 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1589 = _1585 || _1587;
    float _1591 = _1547;
    float _1593 = _1573;
    float _1595 = _1575;
    if (!_1589)
    {
        _1591 = 1.0;
    }
    float _1597 = _1591;
    bool _1599 = !_1589;
    float _1601 = _1597;
    if (!_1599)
    {
        bool _1603 = _1565 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1605 = isnan(_1565);
        bool _1607 = _1603 || _1605;
        bool _1609 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1611 = _1607 || _1609;
        if (!_1611)
        {
            float _1613 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1615 = _1565 + _1613;
            float _1617 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1619 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1617;
            float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1623 = _1621 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1625 = 1.0 / _1619;
            float _1627 = _1615 * _1625;
            float _1629 = fma(_1627, _1623, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1601 = _1629;
            _1593 = _1625;
            _1631 = true;
        }
        else
        {
            bool _1633 = _1565 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1635 = isnan(_1565);
            bool _1637 = _1633 || _1635;
            bool _1639 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1641 = _1637 || _1639;
            if (!_1641)
            {
                float _1643 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1645 = _1565 + _1643;
                float _1647 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1649 = _1647 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1651 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1653 = _1651 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1655 = 1.0 / _1649;
                float _1657 = _1645 * _1655;
                float _1659 = fma(_1657, _1653, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1601 = _1659;
                _1593 = _1655;
                _1631 = true;
            }
            else
            {
                _1601 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1631 = false;
    float _1661 = _1601;
    float _1663 = _1593;
    float _1665 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1667 = _1531 + _1665;
    float _1669 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1671 = _1533 + _1669;
    bool _1673 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1675 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1677 = _1673 || _1675;
    bool _1679 = isnan(0.5);
    bool _1681 = _1677 || _1679;
    float _1683 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1685 = _1525 + _1683;
    float _1687 = fma(_1667, _1661, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1689 = fma(_1671, _1661, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1691 = fma(_1685, _1661, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1693 = _1685;
    float _1695 = _1663;
    float _1697 = _1691;
    float _1699 = _1687;
    if (_1681)
    {
        _1693 = _1687;
    }
    float _1701 = _1693;
    float _1703 = _1701;
    if (_1681)
    {
        _1695 = _1691;
    }
    float _1705 = _1695;
    float _1707 = _1705;
    if (_1681)
    {
        _1595 = _1689;
    }
    float _1709 = _1595;
    float _1711 = _1709;
    if (!_1681)
    {
        float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1715 = _1441 + _1713;
        float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1719 = _1261 + _1717;
        float _1721 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1723 = _1715 * _1715;
        float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1727 = _1269 + _1725;
        float _1729 = fma(_1719, _1719, _1723);
        float _1731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1733 = fma(_1727, _1727, _1729);
        float _1735 = sqrt(_1733);
        float _1737 = _1721 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1739 = precise::min(_1735, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1741 = _1739 * _1731;
        float _1743 = -_1261;
        float _1745 = _1743 + _1687;
        float _1747 = _1737 * _1741;
        float _1749 = -_1441;
        float _1751 = _1749 + _1691;
        float _1753 = -_1269;
        float _1755 = _1753 + _1689;
        float _1757 = fma(_1745, _1747, _1261);
        float _1759 = fma(_1751, _1747, _1441);
        float _1761 = fma(_1755, _1747, _1269);
        _1707 = _1759;
        _1703 = _1757;
        _1711 = _1761;
    }
    float _1763 = _1707;
    float _1765 = _1703;
    float _1767 = _1711;
    float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1771 = _1763 + _1769;
    float _1773 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1775 = _1765 + _1773;
    float _1777 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1779 = _1767 + _1777;
    float _1781 = _1771 * _1771;
    float _1783 = fma(_1775, _1775, _1781);
    float _1785 = fma(_1779, _1779, _1783);
    float _1787 = rsqrt(_1785);
    float _1789 = _1787 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1791 = _1775 * _1789;
    float _1793 = _1779 * _1789;
    float _1795 = _1791 * _1791;
    float _1797 = _1793 * _1793;
    float _1799 = _1795 + _1797;
    float _1801 = sqrt(_1799);
    bool _1803 = _1801 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1807 = _1801 + _1805;
    float _1809 = _1779;
    float _1811 = _1807;
    float _1813 = _1791;
    if (_1803)
    {
        float _1815 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1809 = _1815;
    }
    float _1817 = _1809;
    if (_1803)
    {
        float _1819 = rsqrt(_1799);
        _1697 = _1819;
    }
    float _1821 = _1697;
    float _1823 = _1821;
    if (_1803)
    {
        float _1825 = _1807 * _1817;
        _1811 = _1825;
    }
    float _1827 = _1811;
    if (_1803)
    {
        float _1829 = _1827 * 0.15915493667125701904296875;
        _1699 = _1829;
    }
    float _1831 = _1699;
    float _1833 = _1781;
    float _1835 = _1831;
    if (_1803)
    {
        float _1837 = _1831 * 6.283185482025146484375;
        float _1839 = sin(_1837);
        _1833 = _1839;
    }
    float _1841 = _1833;
    float _1843 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1845 = precise::max(0.0, _1843);
    float _1847 = _1787;
    float _1849 = _1845;
    float _1851 = _1843;
    if (_1803)
    {
        float _1853 = _1831 * 6.283185482025146484375;
        float _1855 = cos(_1853);
        _1847 = _1855;
    }
    float _1857 = _1847;
    float _1859 = -_1789;
    float _1861 = -_1845;
    float _1863 = fma(_1771, _1859, _1861);
    float _1865 = _1863;
    if (!_1803)
    {
        _1849 = _1795;
    }
    float _1867 = _1849;
    float _1869 = _1867;
    if (_1803)
    {
        float _1871 = _1863 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1851 = _1871;
    }
    float _1873 = _1851;
    float _1875 = _1841;
    float _1877 = _1873;
    if (_1803)
    {
        float _1879 = fma(_1841, _1873, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1875 = _1879;
    }
    float _1881 = _1875;
    float _1883 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1885 = _1881;
    if (_1803)
    {
        float _1887 = _1857 + (-1.0);
        _1877 = _1887;
    }
    float _1889 = _1877;
    if (_1803)
    {
        float _1891 = _1821 * _1881;
        _1465 = _1891;
    }
    float _1893 = _1465;
    if (!_1803)
    {
        _1823 = _1863;
    }
    float _1895 = _1823;
    float _1897 = _1895;
    if (_1803)
    {
        float _1899 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1835 = _1899;
    }
    float _1901 = _1835;
    if (_1803)
    {
        float _1903 = _1791 * _1893;
        _1813 = _1903;
    }
    float _1905 = _1813;
    if (!_1803)
    {
        _1885 = _1793;
    }
    float _1907 = _1885;
    float _1909 = _1907;
    if (_1803)
    {
        float _1911 = _1793 * _1893;
        _1909 = _1911;
    }
    float _1913 = _1909;
    if (_1803)
    {
        float _1915 = fma(_1863, _1857, _1901);
        _1897 = _1915;
    }
    float _1917 = _1897;
    if (_1803)
    {
        float _1919 = _1905 * _1905;
        _1869 = _1919;
    }
    float _1921 = _1869;
    float _1923 = sqrt(_1785);
    if (!_1803)
    {
        _1865 = _1797;
    }
    float _1925 = _1865;
    float _1927 = _1925;
    if (_1803)
    {
        float _1929 = _1913 * _1913;
        _1927 = _1929;
    }
    float _1931 = _1927;
    float _1933 = fma(_1917, _1917, _1921);
    float _1935 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1937 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1939 = _1933 + _1931;
    float _1941 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1935);
    float _1943 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1945 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1937);
    float _1947 = rsqrt(_1939);
    float _1949 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1941);
    float _1951 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1953 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1943);
    float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1957 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1955);
    float _1959 = precise::clamp(_1957, 0.0, 1.0);
    float _1961 = _1949 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1963 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1951);
    float _1965 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1953);
    float _1967 = -_1959;
    float _1969 = _1967 + 1.0;
    float _1971 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1973 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1963);
    float _1975 = _1965 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1977 = abs(_1969);
    float _1979 = log2(_1977);
    float _1981 = -_1971;
    float _1983 = fma(_1981, _1883, 1.0);
    float _1985 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1945);
    float _1987 = _1947 * _1905;
    float _1989 = _1973 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1991 = _1975 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1993 = _1947 * _1917;
    float _1995 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1997 = _1947 * _1913;
    float _1999 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1991);
    float _2001 = _1985 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2003 = -_1995;
    float _2005 = fma(_1993, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2003);
    float _2007 = log2(_1983);
    float _2009 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1999);
    float _2011 = _1975 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2013 = -_1997;
    float _2015 = fma(_2013, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2005);
    float _2017 = _1979 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2019 = fma(_2001, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2009);
    float _2021 = _1975 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2023 = fma(_2015, -0.5, 0.5);
    float _2025 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2011);
    float _2027 = 1.0 / _2019;
    float _2029 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2021);
    float _2031 = fma(_2015, 0.5, 0.5);
    float _2033 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2025);
    float _2035 = _1993 + 1.0;
    float _2037 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2029);
    float _2039 = fma(_2031, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2041 = _2007 * 0.693147182464599609375;
    float _2043 = exp2(_2017);
    float _2045 = fma(_2001, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2037);
    float _2047 = fma(_2001, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2033);
    float _2049 = fma(_2031, _2039, -0.212114393711090087890625);
    float _2051 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2053 = fma(_2031, _2049, 1.570728778839111328125);
    float _2055 = sqrt(_2023);
    float _2057 = _2045 * _2027;
    float _2059 = fma(_2057, 0.5, 0.5);
    float _2061 = -_1993;
    float _2063 = fma(_2043, _2035, _2061);
    float _2065 = _2047 * _2027;
    float _2067 = fma(_2063, 0.5, 0.5);
    float _2069 = fma(_2065, -0.5, 0.5);
    float _2071 = _2055 * 0.636619746685028076171875;
    float3 _5713 = float3(_2059, _2069, _2051);
    float _2073 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5713, float3(0.0), isnan(_5713)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5713, float3(0.0), isnan(_5713)), level(0.0)).x;
    float _2075 = -_2053;
    float _2077 = fma(_2071, _2075, 1.0);
    float3 _5729 = float3(_2059, _2069, _2051);
    float4 _2080 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5729, float3(0.0), isnan(_5729)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5729, float3(0.0), isnan(_5729)), level(0.0)).xyzw;
    float _2082 = _2080.x;
    float _2084 = _2080.y;
    float _2086 = _2080.z;
    float _2088 = _2080.w;
    float2 _5746 = float2(_2077, _2067);
    float3 _2090 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5746, float2(0.0), isnan(_5746)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5746, float2(0.0), isnan(_5746)), level(0.0)).xyz;
    float _2092 = _2090.x;
    float _2094 = _2090.y;
    float _2096 = _2090.z;
    float _2098 = _1979 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2100 = _1975 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2102 = _2019 * 0.5;
    out.m_79.x = _1765;
    out.m_79.y = _1763;
    out.m_79.z = _1767;
    float _2104 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2100);
    float _2106 = exp2(_2098);
    float _2108 = fma(_2047, -0.5, _2102);
    bool _2110 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2112 = isnan(_1923);
    bool _2114 = _2110 || _2112;
    bool _2116 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2118 = _2114 || _2116;
    float _2120 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2104);
    float _2122 = fma(_2001, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2120);
    float _2124 = _2045 + _2019;
    float _2126 = _2122 + _2019;
    float _2128 = _2124 * 0.5;
    out.gl_Position.x = _2045;
    out.gl_Position.y = _2047;
    out.gl_Position.z = _2122;
    out.gl_Position.w = _2019;
    float _2130 = _2126 * 0.5;
    float _2132 = -_2106;
    float _2134 = _2132 + 1.0;
    float _2136 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _2128;
    out.m_81.y = _2108;
    out.m_81.z = _2130;
    out.m_81.w = _2019;
    float _2138 = -_2136;
    float _2140 = _2138 + 1.0;
    float _2142 = _2122;
    float _2144 = _2047;
    float _2146 = _2045;
    float _2148 = _2136;
    float _2150 = _2140;
    if (!_2118)
    {
        _2142 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2152 = _2142;
    float _2154 = _2152;
    float _2156 = _2152;
    if (!_2118)
    {
        _2144 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2158 = _2144;
    float _2160 = _2158;
    float _2162 = _2158;
    if (!_2118)
    {
        _2146 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2164 = _2146;
    float _2166 = _2136 * _2073;
    float _2168 = _2164;
    float _2170 = _2164;
    if (!_2118)
    {
        _2148 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2172 = _2148;
    float _2174 = _2088 * _2166;
    float _2176 = _2088 * _2140;
    float _2178 = _2174;
    float _2180 = _2172;
    float _2182 = _2172;
    if (!_2118)
    {
        _2150 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2184 = _2150;
    float _2186 = _2096 * _2166;
    float _2188 = fma(_2092, _2174, _2082);
    float _2190 = fma(_2094, _2174, _2084);
    float _2192 = _2184;
    float _2194 = _2184;
    if (!_2118)
    {
        _2178 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2196 = _2178;
    float _2198 = fma(_2088, _2186, _2086);
    out.m_83.x = _2188;
    out.m_83.y = _2190;
    out.m_83.z = _2198;
    out.m_83.w = _2176;
    bool _2200 = !_2118;
    float _2202 = _2196;
    float _2204 = _2196;
    if (!_2200)
    {
        bool _2206 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2208 = isnan(_1923);
        bool _2210 = _2206 || _2208;
        bool _2212 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2214 = _2210 || _2212;
        if (!_2214)
        {
            float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2218 = _1923 + _2216;
            float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2222 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2220;
            float _2224 = 1.0 / _2222;
            float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2228 = _2226 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2232 = _2230 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2236 = _2234 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2238 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2240 = _2238 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2242 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2244 = _2242 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2246 = _2218 * _2224;
            float _2248 = precise::clamp(_2246, 0.0, 1.0);
            float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2252 = _2250 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2254 = fma(_2248, _2228, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2256 = fma(_2248, _2252, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2258 = fma(_2248, _2232, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2260 = fma(_2248, _2236, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2262 = fma(_2248, _2240, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2264 = fma(_2248, _2244, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2162 = _2256;
            _2194 = _2262;
            _2156 = _2254;
            _2204 = _2260;
            _2170 = _2258;
            _2182 = _2264;
            _2266 = true;
        }
        else
        {
            bool _2268 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2270 = isnan(_1923);
            bool _2272 = _2268 || _2270;
            bool _2274 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2276 = _2272 || _2274;
            if (!_2276)
            {
                _2154 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2278 = _2154;
            _2156 = _2278;
            if (!_2276)
            {
                _2160 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2280 = _2160;
            _2162 = _2280;
            if (!_2276)
            {
                _2168 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2282 = _2168;
            _2170 = _2282;
            if (!_2276)
            {
                _2202 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2284 = _2202;
            _2204 = _2284;
            if (!_2276)
            {
                _2192 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2286 = _2192;
            _2194 = _2286;
            if (!_2276)
            {
                _2180 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2288 = _2180;
            bool _2290 = !_2276;
            _2182 = _2288;
            if (!_2290)
            {
                bool _2292 = _1923 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2294 = isnan(_1923);
                bool _2296 = _2292 || _2294;
                bool _2298 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2300 = _2296 || _2298;
                if (!_2300)
                {
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2304 = _1923 + _2302;
                    float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2308 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2306;
                    float _2310 = 1.0 / _2308;
                    float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2314 = _2312 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2318 = _2316 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2322 = _2320 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2324 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2326 = _2324 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2330 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2332 = _2304 * _2310;
                    float _2334 = precise::clamp(_2332, 0.0, 1.0);
                    float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2338 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2340 = fma(_2334, _2314, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2342 = fma(_2334, _2338, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2344 = fma(_2334, _2318, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2346 = fma(_2334, _2322, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2348 = fma(_2334, _2326, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2350 = fma(_2334, _2330, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2162 = _2342;
                    _2194 = _2348;
                    _2156 = _2340;
                    _2204 = _2346;
                    _2170 = _2344;
                    _2182 = _2350;
                    _2266 = true;
                }
                else
                {
                    _2162 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2194 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2156 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2204 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2170 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2182 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2266 = false;
    float _2352 = _2162;
    float _2354 = _2194;
    float _2356 = _2156;
    float _2358 = _2204;
    float _2360 = _2170;
    float _2362 = _2182;
    float _2364 = fma(_1571, -0.5, 0.5);
    float _2366 = precise::clamp(_2364, 0.0, 1.0);
    float _2368 = -_2352;
    float _2370 = _2368 + _2354;
    float _2372 = -_2356;
    float _2374 = _2372 + _2358;
    float _2376 = -_2360;
    float _2378 = _2376 + _2362;
    bool _2380 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2382 = fma(_2366, _2370, _2352);
    float _2384 = fma(_2366, _2374, _2356);
    float _2386 = fma(_2366, _2378, _2360);
    float _2388 = _2382 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2390 = fma(_2384, 0.298911988735198974609375, _2388);
    float _2392 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2394 = fma(_2386, 0.114477999508380889892578125, _2390);
    out.m_85.w = _2392;
    float _2396 = -_2394;
    float _2398 = _2384 + _2396;
    float _2400 = -_2394;
    float _2402 = _2382 + _2400;
    float _2404 = -_2394;
    float _2406 = _2386 + _2404;
    out.m_87.x = 0.0;
    float _2408 = fma(_2398, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2394);
    float _2410 = fma(_2402, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2394);
    float _2412 = fma(_2406, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2394);
    out.m_89.x = _2408;
    out.m_89.y = _2410;
    out.m_89.z = _2412;
    if (!_2380)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2414 = -_1763;
    float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2418 = -_1765;
    float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2422 = -_1767;
    float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2426 = _2416 * _2416;
    float _2428 = fma(_2420, _2420, _2426);
    float _2430 = fma(_2424, _2424, _2428);
    float _2432 = sqrt(_2430);
    float _2434 = rsqrt(_2430);
    float _2436 = -_2432;
    float _2438 = _2436 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2440 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2442 = precise::clamp(_2440, 0.0, 1.0);
    float _2444 = _2420 * _2434;
    float _2446 = _2416 * _2434;
    float _2448 = abs(_2442);
    float _2450 = log2(_2448);
    float _2452 = _2424 * _2434;
    float _2454 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2456 = _1571 * _2446;
    float _2458 = -_2446;
    float _2460 = -_2454;
    float _2462 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2460);
    float _2464 = fma(_1577, _2444, _2456);
    float _2466 = -_2452;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2462);
    float _2470 = fma(_1579, _2452, _2464);
    float _2472 = precise::clamp(_2470, 0.0, 1.0);
    float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2476 = _2468 + _2474;
    float _2478 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2480 = _2476 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2482 = precise::clamp(_2480, 0.0, 1.0);
    float _2484 = exp2(_2478);
    float _2486 = _2484 * _2482;
    float _2488 = _2472 * _2486;
    float _2490 = _2488 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2492 = _2488 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2494 = _2488 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2490;
    out.m_87.y = _2492;
    out.m_87.z = _2494;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

