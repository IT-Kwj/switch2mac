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
    constant _16* vp_c7 [[id(5)]];
    constant _16* vp_c13 [[id(6)]];
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
    float4 m_57 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_83 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_69 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_77 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_55 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_65 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _98(thread const int& _8705, thread const int& _8706, constant _10& support_buffer)
{
    float _8709 = as_type<float>(support_buffer._m4);
    int _8711 = _8706 + as_type<int>(_8709);
    int _8713 = 1 + _8711;
    float _8715 = support_buffer._m5[_8713].x;
    float _8717 = abs(_8715);
    bool _8719 = _8717 == 1.0;
    if (_8719)
    {
        return _8705;
    }
    float _8721 = float(_8705);
    float _8723 = _8721 / _8717;
    int _8725 = int(_8723);
    return _8725;
}

static inline __attribute__((always_inline))
int _99(thread const int& _8755, thread const int& _8756, constant _10& support_buffer)
{
    float _8759 = as_type<float>(support_buffer._m4);
    int _8761 = _8756 + as_type<int>(_8759);
    int _8763 = 1 + _8761;
    float _8765 = support_buffer._m5[_8763].x;
    bool _8767 = _8765 == 1.0;
    if (_8767)
    {
        return _8755;
    }
    float _8769 = float(_8755);
    float _8771 = _8769 * _8765;
    int _8773 = int(_8771);
    return _8773;
}

static inline __attribute__((always_inline))
void _96(thread const int& _8400, thread const int& _8401, thread const int& _8402, thread const int& _8403, thread int& _8404, thread int& _8405, thread int& _8406, thread int& _8407, thread int& _8408, thread int& _8409, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _8412 = _8403;
    int _8414 = _8401;
    float _8416 = 0.0 + as_type<float>(_8400);
    bool _8418 = _8416 != 0.0;
    bool _8420 = isnan(_8416);
    bool _8422 = _8418 || _8420;
    bool _8424 = isnan(0.0);
    bool _8426 = _8422 || _8424;
    int _8428 = as_type<int>(_8416);
    int _8430 = _8426 ? (-1) : 0;
    if (!_8426)
    {
        float _8432 = as_type<float>(_8400) * 1.0;
        _8412 = as_type<int>(_8432);
    }
    int _8434 = _8412;
    bool _8436 = !_8426;
    int _8438 = _8434;
    int _8440 = _8434;
    if (!_8436)
    {
        bool _8442 = _8416 >= 0.0;
        bool _8444 = isnan(_8416);
        bool _8446 = _8442 || _8444;
        bool _8448 = isnan(0.0);
        bool _8450 = _8446 || _8448;
        _8430 = _8450 ? (-1) : 0;
        if (!_8450)
        {
            _8438 = 2147483647;
        }
        int _8452 = _8438;
        bool _8454 = !_8450;
        int _8456 = _8452;
        _8440 = _8452;
        if (!_8454)
        {
            float _8458 = abs(as_type<float>(_8400));
            float _8460 = 0.0 + _8458;
            bool _8462 = _8460 > as_type<float>(0x7f800000u /* inf */);
            bool _8464 = isnan(_8460);
            bool _8466 = _8462 || _8464;
            bool _8468 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _8470 = _8466 || _8468;
            _8428 = as_type<int>(_8460);
            _8430 = _8470 ? (-1) : 0;
            if (_8470)
            {
                float _8472 = as_type<float>(_8400) + 1.0;
                _8456 = as_type<int>(_8472);
            }
            int _8474 = _8456;
            int _8476 = _8474;
            _8440 = _8474;
            if (!_8470)
            {
                bool _8478 = _8460 != as_type<float>(0x7f800000u /* inf */);
                bool _8480 = isnan(_8460);
                bool _8482 = _8478 || _8480;
                bool _8484 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _8486 = _8482 || _8484;
                _8430 = _8486 ? (-1) : 0;
                if (!_8486)
                {
                    _8476 = _8400;
                }
                int _8488 = _8476;
                bool _8490 = !_8486;
                _8440 = _8488;
                if (!_8490)
                {
                    float _8492 = as_type<float>(_8400) * 18446744073709551616.0;
                    float _8494 = rsqrt(_8492);
                    float _8496 = _8492 * _8494;
                    float _8498 = _8494 * 0.5;
                    float _8500 = -_8496;
                    float _8502 = 0.0 + _8500;
                    float _8504 = fma(_8498, _8502, 0.5);
                    float _8506 = fma(_8496, _8504, _8496);
                    float _8508 = -_8506;
                    float _8510 = 0.0 + _8508;
                    float _8512 = fma(_8506, _8510, _8492);
                    float _8514 = fma(_8498, _8512, _8506);
                    float _8516 = _8514 * 2.3283064365386962890625e-10;
                    _8414 = as_type<int>(_8514);
                    _8428 = as_type<int>(_8506);
                    _8440 = as_type<int>(_8516);
                }
            }
        }
    }
    int _8518 = _8414;
    int _8520 = _8428;
    int _8522 = _8440;
    int _8524 = _8430;
    _8404 = _8402;
    _8405 = 0;
    _8406 = _8518;
    _8407 = _8520;
    _8408 = _8522;
    _8409 = _8524;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3075 = false;
    bool _1953 = false;
    bool _1765 = false;
    bool _1213 = false;
    bool _1033 = false;
    bool _815 = false;
    bool _689 = false;
    bool _305 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _107 = int(_105);
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
        float _3360 = as_type<float>(_123);
        out.gl_Position.z = _3360;
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
    float _143 = _141;
    if (_137)
    {
        float _145 = float(_107);
        _117 = _145;
    }
    float _147 = _117;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3430 = as_type<float>(_161);
        out.gl_Position.z = _3430;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = in.m_53.w;
    float _165 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = in.m_51.x;
    float _179 = in.m_51.y;
    float _181 = in.m_51.z;
    float _183 = in.m_46.x;
    float _185 = in.m_46.y;
    float _187 = in.m_46.z;
    float _189 = 0.0;
    float _191 = _165;
    if (!_175)
    {
        float _193 = _165 * _165;
        float _195 = _193 * 0.5;
        _189 = _195;
    }
    float _197 = _189;
    float _199 = _197;
    if (!_175)
    {
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    bool _205 = !_175;
    float _207 = _203;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _165 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _165);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_175;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _165 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _191 = _261;
    }
    float _263 = _191;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_263, _179, _267);
    float _275 = fma(_263, _177, _269);
    float _277 = fma(_263, _181, _271);
    float _279 = fma(_273, _163, _185);
    float _281 = fma(_275, _163, _183);
    float _283 = fma(_277, _163, _187);
    bool _285 = !_265;
    float _303;
    if (!_285)
    {
        float _287 = in.m_55.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        float _307 = float(_107);
        float _309 = 1.0 / _307;
        float _311 = _141 * _309;
        _303 = _311;
    }
    _305 = false;
    float _313 = _303;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _331 = 1.0 / _317;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _341 = 1.0 / _321;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _345 = _313 + _343;
    bool _347 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _349 = isnan(_313);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = 1.0 / _325;
    float _361 = _345 * _331;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _365 = _313 + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _369 = _313 + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _373 = _313 + _371;
    bool _375 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _377 = 1.0 / _335;
    float _379 = _365 * _341;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _383 = _313 + _381;
    bool _385 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _387 = isnan(_313);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _399 = _313 + _397;
    float _401 = 1.0 / _329;
    float _403 = _369 * _359;
    bool _405 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _407 = isnan(_313);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _417;
    float _421 = -_395;
    float _423 = _421 + 1.0;
    float _425 = fma(_419, _361, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _427 = 1.0 / _339;
    float _429 = _383 * _377;
    float _431 = -_415;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _435;
    float _439 = _395 * _433;
    float _441 = fma(_437, _361, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _443 = _373 * _401;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _445;
    bool _449 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _451 = isnan(_313);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = -_459;
    float _463 = _461 + 1.0;
    float _465 = _399 * _427;
    float _467 = fma(_447, _361, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _469 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _471 = isnan(_313);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = _459 * _423;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _495 = _479 * _463;
    bool _497 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _499 = isnan(_313);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -_479;
    float _511 = _509 + 1.0;
    bool _513 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _515 = isnan(_313);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    float _525 = fma(_489, _379, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _527 = _357 * _511;
    float _529 = -_357;
    float _531 = _529 + 1.0;
    float _533 = -_523;
    float _535 = _533 + 1.0;
    float _537 = fma(_485, _379, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _539 = fma(_493, _379, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _541 = _523 * _531;
    float _543 = _507 * _535;
    float _545 = -_507;
    float _547 = _545 + 1.0;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _553;
    float _557 = _441 * _543;
    float _559 = _467 * _543;
    float _561 = _425 * _543;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _567 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].x, _557);
    float _569 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].y, _559);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _575 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].z, _561);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _581 = fma(_525, _541, _567);
    float _583 = fma(_537, _541, _569);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _585;
    float _589 = fma(_565, _443, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _591 = fma(_573, _443, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _593 = fma(_539, _541, _575);
    float _595 = fma(_555, _403, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _597 = fma(_579, _443, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _599 = fma(_551, _403, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _601 = fma(_587, _403, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _603 = fma(_595, _527, _583);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _605;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _609;
    float _613 = fma(_599, _527, _581);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _615;
    float _619 = fma(_601, _527, _593);
    float _621 = fma(_607, _429, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _623 = fma(_611, _429, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _625 = fma(_617, _429, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _627 = fma(_589, _495, _613);
    float _629 = fma(_597, _495, _619);
    float _631 = fma(_591, _495, _603);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _645 = fma(_621, _481, _627);
    float _647 = fma(_635, _465, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _649 = fma(_639, _465, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _651 = fma(_643, _465, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _653 = fma(_623, _481, _631);
    float _655 = fma(_625, _481, _629);
    float _657 = fma(_647, _439, _645);
    float _659 = fma(_649, _439, _653);
    float _661 = fma(_651, _439, _655);
    float _663 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[149].x, _657);
    float _665 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[149].y, _659);
    float _667 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[149].z, _661);
    bool _669 = !_375;
    float _687;
    if (!_669)
    {
        float _671 = in.m_55.x;
        float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _675 = _671 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[11].x, _141);
        float _679 = _677 * _673;
        float _681 = floor(_679);
        float _683 = -_681;
        float _685 = _679 + _683;
        _687 = _685;
        _689 = true;
    }
    else
    {
        float _691 = float(_107);
        float _693 = 1.0 / _691;
        float _695 = _141 * _693;
        _687 = _695;
    }
    _689 = false;
    float _697 = _687;
    float _699 = in.m_53.x;
    float _701 = in.m_53.y;
    float _703 = in.m_53.z;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _707 = _697 + _705;
    bool _709 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _711;
    float _715 = 1.0 / _713;
    float _717 = _667 * _703;
    float _719 = _665 * _701;
    float _721 = _707 * _715;
    bool _723 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _725 = isnan(_697);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = -_733;
    float _737 = _735 + 1.0;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _739;
    bool _743 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _745 = isnan(_697);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _755;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _759;
    float _763 = fma(_741, _721, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _765 = _753 * _737;
    float _767 = fma(_757, _721, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _769 = fma(_761, _721, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _771 = -_753;
    float _773 = _771 + 1.0;
    float _775 = _763 * _765;
    float _777 = _767 * _765;
    float _779 = _769 * _765;
    float _781 = _663 * _699;
    float _783 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[107].x, _775);
    float _785 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[107].y, _777);
    float _787 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[107].z, _779);
    float _789 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[108].x, _783);
    float _791 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[108].y, _785);
    float _793 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[108].z, _787);
    bool _795 = !_709;
    float _813;
    if (!_795)
    {
        float _797 = in.m_55.x;
        float _799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _801 = _797 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _803 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _805 = _803 * _799;
        float _807 = floor(_805);
        float _809 = -_807;
        float _811 = _805 + _809;
        _813 = _811;
        _815 = true;
    }
    else
    {
        float _817 = float(_107);
        float _819 = 1.0 / _817;
        float _821 = _141 * _819;
        _813 = _821;
    }
    _815 = false;
    float _823 = _813;
    float _825 = _789 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _827 = _791 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _837 = 1.0 / _831;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _843;
    bool _847 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _849 = isnan(_823);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _863 = _793 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _865 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _867 = isnan(_823);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    float _877 = 1.0 / _835;
    bool _879 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _881 = isnan(_823);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    bool _891 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _893 = isnan(_823);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _899 = _895 || _897;
    float _901 = float(_899);
    bool _903 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _905 = 1.0 / _841;
    float _907 = _845 * _837;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _911 = _823 + _909;
    float _913 = -_901;
    float _915 = _913 + 1.0;
    float _917 = fma(_907, _911, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _919 = -_857;
    float _921 = _919 + 1.0;
    float _923 = 1.0 / _861;
    float _925 = -_889;
    float _927 = _925 + 1.0;
    float _929 = _857 * _915;
    float _931 = _889 * _921;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _937;
    float _941 = _875 * _927;
    float _943 = -_875;
    float _945 = _943 + 1.0;
    float _947 = _935 * _905;
    float _949 = _939 * _877;
    float _951 = _917 * _941;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _955 = _823 + _953;
    bool _957 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _959 = isnan(_823);
    bool _961 = _957 || _959;
    bool _963 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _965 = _961 || _963;
    float _967 = float(_965);
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _971 = _969 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _975 = _823 + _973;
    float _977 = fma(_947, _955, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _979 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[115].x, _951);
    float _981 = _971 * _923;
    float _983 = fma(_949, _975, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _985 = -_967;
    float _987 = _985 + 1.0;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _991 = _823 + _989;
    float _993 = fma(_977, _931, _979);
    float _995 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _997 = _901 * _987;
    float _999 = fma(_981, _991, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1001 = fma(_983, _929, _993);
    float _1003 = _825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1005 = fma(_999, _997, _1001);
    float _1007 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1005);
    float _1009 = _827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _1003;
    out.m_57.y = _1009;
    out.m_57.z = _995;
    out.m_57.w = _1011;
    bool _1013 = !_903;
    float _1031;
    if (!_1013)
    {
        float _1015 = in.m_55.x;
        float _1017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1019 = _1015 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1021 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[11].z, _141);
        float _1023 = _1021 * _1017;
        float _1025 = floor(_1023);
        float _1027 = -_1025;
        float _1029 = _1023 + _1027;
        _1031 = _1029;
        _1033 = true;
    }
    else
    {
        float _1035 = float(_107);
        float _1037 = 1.0 / _1035;
        float _1039 = _141 * _1037;
        _1031 = _1039;
    }
    _1033 = false;
    float _1041 = _1031;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1045 = _1041 + _1043;
    bool _1047 = _1041 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1049 = isnan(_1041);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1055 = _1051 || _1053;
    float _1057 = float(_1055);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1061 = _1041 + _1059;
    bool _1063 = _1041 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1065 = isnan(_1041);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1075;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1081 = _1079 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1083 = _1041 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1085 = isnan(_1041);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = -_1057;
    float _1097 = _1095 + 1.0;
    float _1099 = 1.0 / _1077;
    float _1101 = _1093 * _1097;
    float _1103 = -_1093;
    float _1105 = _1103 + 1.0;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1107;
    bool _1111 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1113 = 1.0 / _1081;
    float _1115 = _1073 * _1105;
    float _1117 = -_1073;
    float _1119 = _1117 + 1.0;
    float _1121 = _1045 * _1099;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1123;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1127;
    float _1131 = fma(_1109, _1121, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1133 = fma(_1125, _1121, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1135 = fma(_1129, _1121, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1137 = _1061 * _1113;
    float _1139 = _1131 * _1115;
    float _1141 = _1133 * _1115;
    float _1143 = _1135 * _1115;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1147 = _1145 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1151 = _1149 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1155 = _1153 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1157 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1139);
    float _1159 = fma(_1147, _1137, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1161 = fma(_1151, _1137, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1163 = fma(_1155, _1137, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1165 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1141);
    float _1167 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1143);
    float _1169 = fma(_1159, _1101, _1157);
    float _1171 = fma(_1161, _1101, _1165);
    float _1173 = fma(_1163, _1101, _1167);
    float _1175 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1169);
    float _1177 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1171);
    float _1179 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1173);
    float _1181 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1183 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1185 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1187 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1189 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1191 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _1187;
    out.m_59.y = _1189;
    out.m_59.z = _1191;
    bool _1193 = !_1111;
    float _1211;
    if (!_1193)
    {
        float _1195 = in.m_55.x;
        float _1197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1199 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[14].x, _141);
        float _1203 = _1201 * _1197;
        float _1205 = floor(_1203);
        float _1207 = -_1205;
        float _1209 = _1203 + _1207;
        _1211 = _1209;
        _1213 = true;
    }
    else
    {
        float _1215 = float(_107);
        float _1217 = 1.0 / _1215;
        float _1219 = _141 * _1217;
        _1211 = _1219;
    }
    _1213 = false;
    float _1221 = _1211;
    int _1223 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1225 = _1223;
    int _1227 = 0;
    int _1229 = _98(_1225, _1227, (*spvDescriptorSet0.support_buffer));
    float _1231 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1233 = _1231 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1235 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1237 = _1235 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1239 = 1.0 / _1233;
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1243 = _1241 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1245;
    float _1249 = 1.0 / _1237;
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1253 = _1251 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1257 = _1255 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1261 = _1259 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1263 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1265 = isnan(_1221);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1271 = _1267 || _1269;
    float _1273 = float(_1271);
    bool _1275 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1277 = isnan(_1221);
    bool _1279 = _1275 || _1277;
    bool _1281 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1283 = _1279 || _1281;
    float _1285 = float(_1283);
    float _1287 = 1.0 / _1243;
    float _1289 = _1247 * _1239;
    bool _1291 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1293 = isnan(_1221);
    bool _1295 = _1291 || _1293;
    bool _1297 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1299 = _1295 || _1297;
    float _1301 = float(_1299);
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1303;
    float _1307 = -_1301;
    float _1309 = _1307 + 1.0;
    float _1311 = 1.0 / _1257;
    bool _1313 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1315 = isnan(_1221);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1321 = _1317 || _1319;
    float _1323 = float(_1321);
    float _1325 = _1253 * _1249;
    bool _1327 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1329 = isnan(_1221);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1335 = _1331 || _1333;
    float _1337 = float(_1335);
    float _1339 = 1.0 / _1261;
    float _1341 = _1305 * _1287;
    float _1343 = _1323 * _1309;
    float _1345 = -_1323;
    float _1347 = _1345 + 1.0;
    float _1349 = -_1337;
    float _1351 = _1349 + 1.0;
    float _1353 = _1337 * _1347;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1359 = _1273 * _1351;
    float _1361 = -_1273;
    float _1363 = _1361 + 1.0;
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1367 = _1365 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1369;
    float _1373 = _1357 * _1339;
    float _1375 = _1285 * _1363;
    float _1377 = 1.0 / _1367;
    float _1379 = _1371 * _1311;
    bool _1381 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1383 = isnan(_1221);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1389 = _1385 || _1387;
    float _1391 = float(_1389);
    float _1393 = -_1285;
    float _1395 = _1393 + 1.0;
    bool _1397 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1399 = isnan(_1221);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1405 = _1401 || _1403;
    float _1407 = float(_1405);
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1411 = _1221 + _1409;
    float _1413 = _1391 * _1395;
    float _1415 = -_1391;
    float _1417 = _1415 + 1.0;
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1421 = _1419 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1423 = fma(_1289, _1411, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1425 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1427 = _1425 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1429 = _1407 * _1417;
    float _1431 = -_1407;
    float _1433 = _1431 + 1.0;
    float _1435 = _1421 * _1377;
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1439 = _1221 + _1437;
    float _1441 = _1423 * _1429;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1445 = _1221 + _1443;
    float _1447 = 1.0 / _1427;
    float _1449 = fma(_1325, _1439, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1451 = fma(_1433, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1441);
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1455 = _1221 + _1453;
    float _1457 = fma(_1341, _1445, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1459 = fma(_1449, _1413, _1451);
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1463 = _1221 + _1461;
    float _1465 = fma(_1373, _1455, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1467 = in.m_55.x;
    float _1469 = in.m_55.y;
    float _1471 = fma(_1457, _1375, _1459);
    float _1473 = fma(_1379, _1463, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _1475 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1477 = isnan(_1221);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1483 = _1479 || _1481;
    float _1485 = float(_1483);
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1487;
    float _1491 = fma(_1465, _1359, _1471);
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1495 = _1221 + _1493;
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1499 = _1221 + _1497;
    float _1501 = _1489 * _1447;
    float _1503 = fma(_1473, _1353, _1491);
    float _1505 = -_1485;
    float _1507 = _1505 + 1.0;
    float _1509 = fma(_1435, _1495, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1511 = in.m_61.z;
    float _1513 = fma(_1501, _1499, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1515 = _1301 * _1507;
    float _1517 = fma(_1509, _1343, _1503);
    float _1519 = fma(_1513, _1515, _1517);
    float _1521 = fma(_1485, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1519);
    float _1523 = -_1467;
    float _1525 = fma(0.5, _1523, 1.0);
    float _1527 = _1521 * _1525;
    float _1529 = precise::clamp(_1527, 0.0, 1.0);
    float _1531 = trunc(_1511);
    int _1533 = int(_1531);
    int _1535 = _1229 + (-1);
    float _1537 = float(_1535);
    float _1539 = _1529 * _1537;
    float _1541 = trunc(_1539);
    int _1543 = int(_1541);
    int _1545 = _1543;
    int _1547 = 0;
    int _1549 = _99(_1545, _1547, (*spvDescriptorSet0.support_buffer));
    int _1551 = _1533;
    int _1553 = 0;
    int _1555 = _99(_1551, _1553, (*spvDescriptorSet0.support_buffer));
    float4 _1558 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1549, _1555)), 0).xyzw;
    float _1560 = _1558.x;
    float _1562 = _1558.y;
    float _1564 = _1558.z;
    float _1566 = _1558.w;
    float _1568 = in.m_61.x;
    float _1570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1574 = _1572 != 0;
    float _1576 = in.m_61.y;
    int _1578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1580 = _1578 != 0;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1584 = _1467 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1586 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1588 = _1469 > 0.5;
    bool _1590 = _1588 && _1580;
    float _1592 = -_1582;
    float _1594 = fma(_1584, 2.0, _1592);
    float _1596 = -_141;
    float _1598 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1594);
    float _1600 = _1495;
    float _1602 = _1491;
    float _1604 = _1582;
    if (_1574)
    {
        float _1606 = in.m_55.x;
        _1600 = _1606;
    }
    float _1608 = _1600;
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1612 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1610);
    if (_1574)
    {
        _1602 = _1568;
    }
    float _1614 = _1602;
    float _1616 = _1614;
    if (!_1574)
    {
        _1604 = _1568;
    }
    float _1618 = _1604;
    float _1620 = _1576;
    float _1622 = _1618;
    if (_1590)
    {
        float _1624 = -_1576;
        float _1626 = _1624 + 1.0;
        _1620 = _1626;
    }
    float _1628 = _1620;
    bool _1630 = _1608 > 0.5;
    bool _1632 = _1630 && _1574;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1636 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1634);
    float _1638 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1632)
    {
        float _1640 = -_1614;
        float _1642 = _1640 + 1.0;
        _1616 = _1642;
    }
    float _1644 = _1616;
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1648 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1650 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1652 = fma(_1638, _1628, -0.5);
    if (_1574)
    {
        _1622 = _1644;
    }
    float _1654 = _1622;
    float _1656 = fma(_1648, -2.0, _1646);
    float _1658 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1636);
    float _1660 = fma(_1650, _1654, -0.5);
    float _1662 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1612);
    float _1664 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1656);
    float _1666 = fma(_1658, _1660, _1598);
    float _1668 = -_1664;
    float _1670 = fma(_1662, _1652, _1668);
    int _1672 = _1543 + 1;
    float _1674 = _1666 + 0.5;
    float _1676 = _1670 + 0.5;
    int _1678 = min(_1535, _1672);
    uint _1681 = as_type<uint>(half2(float2(_1566, 0.0)));
    uint _1683 = extract_bits(_1681, 0u, 8u);
    int _1685 = int(_1683) & 255;
    uint _1687 = extract_bits(_1681, 8u, 8u);
    int _1689 = int(_1687) & 255;
    int _1691 = _1689 << 8;
    int _1693 = _1685 | _1691;
    bool _1695 = _1693 >= 32768;
    int _1697 = _1693 + (-1024);
    int _1699 = _1697;
    if (_1695)
    {
        int _1701 = ~_1693;
        int _1703 = _1701 + 33792;
        int _1705 = _1703 + 1;
        _1699 = _1705;
    }
    int _1707 = _1699;
    int _1709 = _1707 + 30719;
    float _1711 = float(_1709);
    float _1713 = fma(_1711, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1715 = abs(_1713);
    float _1717 = -_1715;
    float _1719 = _1717 + 1.0;
    float _1721 = abs(_1713);
    float _1723 = fma(_1721, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1725 = _1713 < 0.0;
    float _1727 = float(_1725);
    int _1729 = as_type<int>(_1719) + (-218103808);
    float _1731 = abs(_1713);
    float _1733 = fma(_1731, _1723, -0.212114393711090087890625);
    bool _1735 = uint(_1729) >= 1920991232u;
    float _1737 = abs(_1713);
    float _1739 = fma(_1737, _1733, 1.570728778839111328125);
    bool _1741 = !_1735;
    float _1763;
    if (!_1741)
    {
        int _1743 = as_type<int>(_1719);
        int _1745 = as_type<int>(_1646);
        int _1747 = 8704;
        int _1749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[146].z);
        int _1751;
        int _1753;
        int _1755;
        int _1757;
        int _1759;
        int _1761;
        _96(_1743, _1745, _1747, _1749, _1751, _1753, _1755, _1757, _1759, _1761, out.gl_Position, out.gl_PointSize);
        _1763 = as_type<float>(_1759);
        _1765 = true;
    }
    else
    {
        float _1767 = rsqrt(_1719);
        float _1769 = _1719 * _1767;
        float _1771 = _1767 * 0.5;
        float _1773 = -_1769;
        float _1775 = 0.0 + _1773;
        float _1777 = fma(_1771, _1775, 0.5);
        float _1779 = fma(_1769, _1777, _1769);
        float _1781 = -_1779;
        float _1783 = 0.0 + _1781;
        float _1785 = fma(_1779, _1783, _1719);
        float _1787 = fma(_1771, _1785, _1779);
        _1763 = _1787;
    }
    _1765 = false;
    float _1789 = _1763;
    int _1791 = _1678;
    int _1793 = 0;
    int _1795 = _99(_1791, _1793, (*spvDescriptorSet0.support_buffer));
    int _1797 = _1533;
    int _1799 = 0;
    int _1801 = _99(_1797, _1799, (*spvDescriptorSet0.support_buffer));
    float4 _1803 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1795, _1801)), 0).xyzw;
    float _1805 = _1803.x;
    float _1807 = _1803.y;
    float _1809 = _1803.z;
    float _1811 = _1803.w;
    float _1813 = _1739 * _1789;
    float _1815 = _1727 * 2.0;
    float _1817 = _1711 * 3.883221149444580078125;
    float _1819 = floor(_1539);
    float _1821 = -_1815;
    float _1823 = fma(_1813, _1821, _1813);
    float _1825 = _1817 * 0.15915493667125701904296875;
    float _1827 = fma(_1727, 3.1415927410125732421875, _1823);
    float _1829 = _1825 * 6.283185482025146484375;
    float _1831 = cos(_1829);
    float _1833 = _1827 * 0.15915493667125701904296875;
    float _1835 = _1833 * 6.283185482025146484375;
    float _1837 = sin(_1835);
    float _1839 = -_1819;
    float _1841 = _1539 + _1839;
    float _1843 = _1825 * 6.283185482025146484375;
    float _1845 = sin(_1843);
    float _1847 = _1837 * _1831;
    float _1849 = _1837 * _1845;
    uint _1851 = as_type<uint>(half2(float2(_1811, 0.0)));
    float _1853 = -_1560;
    float _1855 = _1853 + _1805;
    float _1857 = -_1562;
    float _1859 = _1857 + _1807;
    uint _1861 = extract_bits(_1851, 0u, 8u);
    int _1863 = int(_1861) & 255;
    uint _1865 = extract_bits(_1851, 8u, 8u);
    int _1867 = int(_1865) & 255;
    int _1869 = _1867 << 8;
    int _1871 = _1863 | _1869;
    float _1873 = fma(_1841, _1855, _1560);
    float _1875 = fma(_1841, _1859, _1562);
    bool _1877 = _1871 >= 32768;
    int _1879 = _1871 + (-1024);
    int _1881 = _1879;
    if (_1877)
    {
        int _1883 = ~_1871;
        int _1885 = _1883 + 33792;
        int _1887 = _1885 + 1;
        _1881 = _1887;
    }
    int _1889 = _1881;
    int _1891 = _1889 + 30719;
    float _1893 = float(_1891);
    float _1895 = fma(_1893, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1897 = abs(_1895);
    float _1899 = -_1897;
    float _1901 = _1899 + 1.0;
    float _1903 = abs(_1895);
    float _1905 = fma(_1903, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1907 = _1895 < 0.0;
    float _1909 = float(_1907);
    int _1911 = as_type<int>(_1901) + (-218103808);
    float _1913 = abs(_1895);
    float _1915 = fma(_1913, _1905, -0.212114393711090087890625);
    bool _1917 = uint(_1911) >= 1920991232u;
    float _1919 = -_1564;
    float _1921 = _1919 + _1809;
    float _1923 = abs(_1895);
    float _1925 = fma(_1923, _1915, 1.570728778839111328125);
    float _1927 = fma(_1841, _1921, _1564);
    bool _1929 = !_1917;
    float _1951;
    if (!_1929)
    {
        int _1931 = as_type<int>(_1901);
        int _1933 = as_type<int>(_1831);
        int _1935 = 9600;
        int _1937 = as_type<int>(_1813);
        int _1939;
        int _1941;
        int _1943;
        int _1945;
        int _1947;
        int _1949;
        _96(_1931, _1933, _1935, _1937, _1939, _1941, _1943, _1945, _1947, _1949, out.gl_Position, out.gl_PointSize);
        _1951 = as_type<float>(_1947);
        _1953 = true;
    }
    else
    {
        float _1955 = rsqrt(_1901);
        float _1957 = _1901 * _1955;
        float _1959 = _1955 * 0.5;
        float _1961 = -_1957;
        float _1963 = 0.0 + _1961;
        float _1965 = fma(_1959, _1963, 0.5);
        float _1967 = fma(_1957, _1965, _1957);
        float _1969 = -_1967;
        float _1971 = 0.0 + _1969;
        float _1973 = fma(_1967, _1971, _1901);
        float _1975 = fma(_1959, _1973, _1967);
        _1951 = _1975;
    }
    _1953 = false;
    float _1977 = _1951;
    float _1979 = in.m_55.x;
    float _1981 = in.m_55.y;
    float _1983 = in.m_55.z;
    float _1985 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1987 = log2(_1985);
    float _1989 = _719 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1991 = _781 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1995 = _1993 != 0;
    int _1997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1999 = _1997 != 0;
    int _2001 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2003 = _2001 != 0;
    float _2005 = _717 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2007 = _1983 * 2.0;
    float _2009 = _1979 * 2.0;
    float _2011 = _1983 + _1981;
    float _2013 = _1981 + _1979;
    float _2015 = _1981 * 2.0;
    float _2017 = floor(_2009);
    float _2019 = _2011 + (-1.0);
    float _2021 = _2013 + (-1.0);
    float _2023 = _1981 + (-0.5);
    float _2025 = fma(_2021, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2027 = !_1995;
    int _2029 = _2027 ? 0 : 1;
    float _2031 = floor(_2007);
    float _2033 = _1987 * _141;
    int _2035 = abs(_2029);
    float _2037 = exp2(_2033);
    bool _2039 = _2017 >= 0.0;
    bool _2041 = isnan(_2017);
    bool _2043 = _2039 || _2041;
    bool _2045 = isnan(0.0);
    bool _2047 = _2043 || _2045;
    int _2049 = _2047 ? 0 : 1;
    bool _2051 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2053 = isnan(0.0);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2059 = _2055 || _2057;
    float _2061 = floor(_2015);
    bool _2063 = _2031 > 0.0;
    bool _2065 = _2031 >= 0.0;
    bool _2067 = isnan(_2031);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan(0.0);
    bool _2073 = _2069 || _2071;
    float _2075 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2077 = _2073 ? 0 : 1;
    float _2079 = -_2037;
    float _2081 = _2079 + 1.0;
    bool _2083 = _2017 > 0.0;
    float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2087 = 1.0 + _2085;
    int _2089 = ~_2077;
    int _2091 = _2089 + 1;
    int _2093 = _2091 + 1;
    bool _2095 = !_1999;
    int _2097 = _2095 ? 0 : 1;
    float _2099 = 1.0 / _2087;
    int _2101 = _2093;
    if (!_2063)
    {
        int _2103 = ~_2077;
        int _2105 = _2103 + 1;
        _2101 = _2105;
    }
    int _2107 = _2101;
    float _2109 = in.m_63.x;
    float _2111 = in.m_63.y;
    float _2113 = in.m_63.z;
    bool _2115 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2117 = isnan(1.0);
    bool _2119 = _2115 || _2117;
    bool _2121 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2123 = _2119 || _2121;
    float _2125 = float(_2107);
    float _2127 = _2059 ? _2081 : 0.0;
    int _2129 = abs(_2097);
    float _2131 = float(_2035);
    int _2133 = ~_2049;
    int _2135 = _2133 + 1;
    int _2137 = _2135 + 1;
    int _2139 = _2137;
    if (!_2083)
    {
        int _2141 = ~_2049;
        int _2143 = _2141 + 1;
        _2139 = _2143;
    }
    int _2145 = _2139;
    float _2147 = _2131 * _2125;
    bool _2149 = _2061 > 0.0;
    if (_2123)
    {
        float _2151 = _2127 * _2099;
        _143 = _2151;
    }
    float _2153 = _143;
    float _2155 = float(_2129);
    float _2157 = _2147 * (-2.0);
    float _2159 = float(_2145);
    float _2161 = _1979 + (-0.5);
    bool _2163 = _2061 >= 0.0;
    bool _2165 = isnan(_2061);
    bool _2167 = _2163 || _2165;
    bool _2169 = isnan(0.0);
    bool _2171 = _2167 || _2169;
    float _2173 = fma(_2025, _2157, _2025);
    float _2175 = _1983 + _1979;
    float _2177 = fma(_2157, _2109, _2109);
    bool _2179 = !_2003;
    int _2181 = _2179 ? 0 : 1;
    float _2183 = _2155 * _2159;
    int _2185 = _2171 ? 0 : 1;
    float _2187 = fma(_2161, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2177);
    int _2189 = abs(_2181);
    float _2191 = _2183 * (-2.0);
    int _2193 = ~_2185;
    int _2195 = _2193 + 1;
    int _2197 = _2195 + 1;
    float _2199 = fma(_2173, _2153, _2187);
    int _2201 = _2197;
    if (!_2149)
    {
        int _2203 = ~_2185;
        int _2205 = _2203 + 1;
        _2201 = _2205;
    }
    int _2207 = _2201;
    float _2209 = fma(_2191, _2111, _2111);
    float _2211 = fma(_2075, _2191, _2075);
    float _2213 = float(_2207);
    float _2215 = fma(_2023, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2209);
    float _2217 = float(_2189);
    float _2219 = _2175 + (-1.0);
    float _2221 = fma(_2211, _2153, _2215);
    float _2223 = _1983 + (-0.5);
    float _2225 = _2217 * _2213;
    float _2227 = _2199 * 0.15915493667125701904296875;
    float _2229 = fma(_2219, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2231 = _2221 * 0.15915493667125701904296875;
    float _2233 = _2225 * (-2.0);
    float _2235 = _2227 * 6.283185482025146484375;
    float _2237 = sin(_2235);
    float _2239 = fma(_2233, _2113, _2113);
    float _2241 = fma(_2229, _2233, _2229);
    float _2243 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1873);
    float _2245 = fma(_2223, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2239);
    float _2247 = _2227 * 6.283185482025146484375;
    float _2249 = cos(_2247);
    float _2251 = _1991 * _2243;
    float _2253 = fma(_2241, _2153, _2245);
    float _2255 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1927);
    float _2257 = _2253 * 0.15915493667125701904296875;
    float _2259 = _2231 * 6.283185482025146484375;
    float _2261 = sin(_2259);
    float _2263 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1875);
    float _2265 = _1989 * _2263;
    float _2267 = _2231 * 6.283185482025146484375;
    float _2269 = cos(_2267);
    float _2271 = _2257 * 6.283185482025146484375;
    float _2273 = cos(_2271);
    float _2275 = _2237 * _2261;
    float _2277 = _2249 * _2261;
    float _2279 = _2005 * _2255;
    float _2281 = _2257 * 6.283185482025146484375;
    float _2283 = sin(_2281);
    float _2285 = _2249 * _2269;
    float _2287 = _2237 * _2269;
    float _2289 = _2249 * _2273;
    float _2291 = _2237 * _2273;
    float _2293 = _2269 * _2273;
    float _2295 = _2261 * _2273;
    float _2297 = _2289 * _2265;
    float _2299 = _279 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2301 = fma(_2283, _2285, _2275);
    float _2303 = -_2277;
    float _2305 = fma(_2283, _2287, _2303);
    float _2307 = -_2287;
    float _2309 = fma(_2283, _2277, _2307);
    float _2311 = -_2265;
    float _2313 = _2283 * _2311;
    float _2315 = fma(_2301, _2251, _2297);
    float _2317 = fma(_2283, _2275, _2285);
    float _2319 = _2291 * _2265;
    float _2321 = fma(_2293, _2251, _2313);
    float _2323 = fma(_2309, _2279, _2315);
    float _2325 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2299);
    float _2327 = fma(_2305, _2251, _2319);
    float _2329 = _279 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2331 = fma(_2295, _2279, _2321);
    float _2333 = _2323 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2335 = fma(_2317, _2279, _2327);
    float _2337 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2329);
    float _2339 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2325);
    float _2341 = _2323 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2343 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2333);
    float _2345 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2337);
    float _2347 = _2339 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2349 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2341);
    float _2351 = fma(_2335, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2343);
    float _2353 = _2345 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2355 = _2323 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2357 = fma(_2335, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2349);
    float _2359 = _2347 + _2351;
    float _2361 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2355);
    float _2363 = _2353 + _2357;
    float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2367 = _2359 + _2365;
    float _2369 = fma(_2335, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2361);
    float _2371 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2373 = _2363 + _2371;
    float _2375 = _2367 * _2367;
    float _2377 = fma(_2373, _2373, _2375);
    float _2379 = _279 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2381 = sqrt(_2377);
    float _2383 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2379);
    float _2385 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2383);
    float _2387 = _2385 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2389 = _2387 + _2369;
    bool _2391 = _2381 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2393 = _2387;
    float _2395 = _2345;
    float _2397 = _2359;
    float _2399 = _2335;
    if (!_2391)
    {
        _2393 = _2363;
    }
    float _2401 = _2393;
    float _2403 = _2401;
    if (!_2391)
    {
        _2395 = _2389;
    }
    float _2405 = _2395;
    bool _2407 = !_2391;
    float _2409 = _2405;
    if (!_2407)
    {
        float _2411 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2413 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2415 = _2381 + _2413;
        float _2417 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2419 = _2415 * _2411;
        float _2421 = rsqrt(_2377);
        float _2423 = _2419 * 0.15915493667125701904296875;
        float _2425 = _2423 * 6.283185482025146484375;
        float _2427 = cos(_2425);
        float _2429 = _2423 * 6.283185482025146484375;
        float _2431 = sin(_2429);
        float _2433 = _2427 + (-1.0);
        float _2435 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2437 = fma(_2431, _2417, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2439 = fma(_2389, _2427, _2435);
        float _2441 = _2421 * _2437;
        float _2443 = fma(_2373, _2441, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2445 = fma(_2367, _2441, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2409 = _2439;
        _2403 = _2443;
        _2397 = _2445;
    }
    float _2447 = _2409;
    float _2449 = _2403;
    float _2451 = _2397;
    float _2453 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2455 = _2447 + _2453;
    float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2459 = _2449 + _2457;
    float _2461 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2463 = _2451 + _2461;
    float _2465 = _2455 * _2455;
    float _2467 = fma(_2459, _2459, _2465);
    float _2469 = fma(_2463, _2463, _2467);
    float _2471 = rsqrt(_2469);
    float _2473 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2475 = _2459 * _2473;
    float _2477 = _2463 * _2473;
    float _2479 = _2475 * _2475;
    float _2481 = _2477 * _2477;
    float _2483 = _2479 + _2481;
    float _2485 = sqrt(_2483);
    bool _2487 = _2485 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2491 = _2485 + _2489;
    float _2493 = _2471;
    float _2495 = _2483;
    float _2497 = _2491;
    float _2499 = _2455;
    if (_2487)
    {
        float _2501 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2493 = _2501;
    }
    float _2503 = _2493;
    if (_2487)
    {
        float _2505 = rsqrt(_2483);
        _2495 = _2505;
    }
    float _2507 = _2495;
    float _2509 = _2507;
    if (_2487)
    {
        float _2511 = _2491 * _2503;
        _2497 = _2511;
    }
    float _2513 = _2497;
    if (_2487)
    {
        float _2515 = _2513 * 0.15915493667125701904296875;
        _2399 = _2515;
    }
    float _2517 = _2399;
    float _2519 = _2463;
    float _2521 = _2517;
    if (_2487)
    {
        float _2523 = _2517 * 6.283185482025146484375;
        float _2525 = sin(_2523);
        _2519 = _2525;
    }
    float _2527 = _2519;
    float _2529 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2531 = precise::max(0.0, _2529);
    float _2533 = _2389;
    float _2535 = _2531;
    if (_2487)
    {
        float _2537 = _2517 * 6.283185482025146484375;
        float _2539 = cos(_2537);
        _2533 = _2539;
    }
    float _2541 = _2533;
    float _2543 = -_2473;
    float _2545 = -_2531;
    float _2547 = fma(_2455, _2543, _2545);
    if (_2487)
    {
        float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2535 = _2549;
    }
    float _2551 = _2535;
    float _2553 = sqrt(_2469);
    float _2555 = _2551;
    float _2557 = _2527;
    if (_2487)
    {
        float _2559 = fma(_2527, _2551, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2499 = _2559;
    }
    float _2561 = _2499;
    float _2563 = _2561;
    if (!_2487)
    {
        _2555 = _2475;
    }
    float _2565 = _2555;
    float _2567 = _2565;
    float _2569 = _2541;
    if (_2487)
    {
        float _2571 = _2541 + (-1.0);
        _2557 = _2571;
    }
    float _2573 = _2557;
    float _2575 = 0.0;
    float _2577 = _2573;
    if (_2487)
    {
        float _2579 = _2507 * _2561;
        _2575 = _2579;
    }
    float _2581 = _2575;
    if (!_2487)
    {
        _2563 = _2547;
    }
    float _2583 = _2563;
    float _2585 = _2447 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2587 = _2583;
    if (_2487)
    {
        float _2589 = _2573 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2521 = _2589;
    }
    float _2591 = _2521;
    if (_2487)
    {
        float _2593 = _2475 * _2581;
        _2567 = _2593;
    }
    float _2595 = _2567;
    if (!_2487)
    {
        _2577 = _2477;
    }
    float _2597 = _2577;
    float _2599 = _2597;
    if (_2487)
    {
        float _2601 = _2477 * _2581;
        _2599 = _2601;
    }
    float _2603 = _2599;
    if (!_2487)
    {
        _2509 = _2479;
    }
    float _2605 = _2509;
    float _2607 = _2605;
    if (_2487)
    {
        float _2609 = fma(_2547, _2541, _2591);
        _2587 = _2609;
    }
    float _2611 = _2587;
    if (_2487)
    {
        float _2613 = _2595 * _2595;
        _2607 = _2613;
    }
    float _2615 = _2607;
    if (!_2487)
    {
        _2569 = _2481;
    }
    float _2617 = _2569;
    float _2619 = _2617;
    if (_2487)
    {
        float _2621 = _2603 * _2603;
        _2619 = _2621;
    }
    float _2623 = _2619;
    float _2625 = fma(_2611, _2611, _2615);
    float _2627 = _2447 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2629 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2631 = _2625 + _2623;
    float _2633 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2585);
    float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2637 = fma(_2553, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2635);
    float _2639 = precise::clamp(_2637, 0.0, 1.0);
    float _2641 = _2447 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2643 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2627);
    float _2645 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2633);
    float _2647 = rsqrt(_2631);
    float _2649 = -_2639;
    float _2651 = _2649 + 1.0;
    float _2653 = _2447 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2655 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2641);
    float _2657 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2643);
    float _2659 = _2645 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2661 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2653);
    float _2663 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2655);
    float _2665 = abs(_2651);
    float _2667 = log2(_2665);
    float _2669 = _2657 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2671 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2661);
    float _2673 = _2663 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2675 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2677 = _2671 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2679 = _2673 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2681 = _2647 * _2595;
    float _2683 = _2647 * _2611;
    float _2685 = _2647 * _2603;
    float _2687 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2679);
    float _2689 = _2681 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2691 = -_2675;
    float _2693 = fma(_2691, _2629, 1.0);
    float _2695 = _2673 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2697 = fma(_2659, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2687);
    float _2699 = -_2689;
    float _2701 = fma(_2683, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2699);
    float _2703 = _2667 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2705 = log2(_2693);
    float _2707 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2697);
    float _2709 = -_2685;
    float _2711 = fma(_2709, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2701);
    float _2713 = _2673 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2715 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2695);
    float _2717 = fma(_2711, -0.5, 0.5);
    float _2719 = fma(_2711, 0.5, 0.5);
    float _2721 = exp2(_2703);
    float _2723 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2713);
    float _2725 = fma(_2659, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2715);
    float _2727 = fma(_2719, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2729 = _2683 + 1.0;
    float _2731 = fma(_2659, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2723);
    float _2733 = fma(_2719, _2727, -0.212114393711090087890625);
    float _2735 = 1.0 / _2707;
    float _2737 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2731);
    float _2739 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2725);
    float _2741 = _2705 * 0.693147182464599609375;
    float _2743 = fma(_2719, _2733, 1.570728778839111328125);
    float _2745 = _2741 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2747 = sqrt(_2717);
    float _2749 = -_2683;
    float _2751 = fma(_2721, _2729, _2749);
    float _2753 = fma(_2751, 0.5, 0.5);
    float _2755 = _2737 * _2735;
    float _2757 = _2739 * _2735;
    float _2759 = fma(_2755, 0.5, 0.5);
    float _2761 = fma(_2757, -0.5, 0.5);
    float _2763 = _2747 * 0.636619746685028076171875;
    float3 _7410 = float3(_2759, _2761, _2745);
    float _2765 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7410, float3(0.0), isnan(_7410)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7410, float3(0.0), isnan(_7410)), level(0.0)).x;
    float _2767 = -_2743;
    float _2769 = fma(_2763, _2767, 1.0);
    float3 _7426 = float3(_2759, _2761, _2745);
    float4 _2771 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7426, float3(0.0), isnan(_7426)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7426, float3(0.0), isnan(_7426)), level(0.0)).xyzw;
    float _2773 = _2771.x;
    float _2775 = _2771.y;
    float _2777 = _2771.z;
    float _2779 = _2771.w;
    float2 _7442 = float2(_2769, _2753);
    float3 _2783 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7442, float2(0.0), isnan(_7442)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7442, float2(0.0), isnan(_7442)), level(0.0)).xyz;
    float _2785 = _2783.x;
    float _2787 = _2783.y;
    float _2789 = _2783.z;
    float _2791 = _1925 * _1977;
    float _2793 = _1909 * 2.0;
    float _2795 = _1893 * 3.883221149444580078125;
    bool _2797 = _1875 != 0.0;
    bool _2799 = isnan(_1875);
    bool _2801 = _2797 || _2799;
    bool _2803 = isnan(0.0);
    bool _2805 = _2801 || _2803;
    float _2807 = _2667 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2809 = -_2793;
    float _2811 = fma(_2791, _2809, _2791);
    float _2813 = _2795 * 0.15915493667125701904296875;
    bool _2815 = _1873 == 0.0;
    bool _2817 = !_2805;
    bool _2819 = _2815 && _2817;
    float _2821 = _2673 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2823 = fma(_1909, 3.1415927410125732421875, _2811);
    float _2825 = _2813 * 6.283185482025146484375;
    float _2827 = sin(_2825);
    bool _2829 = _1927 == 0.0;
    bool _2831 = _2829 && _2819;
    float _2833 = -_1713;
    float _2835 = _2833 + _1895;
    float _2837 = _2823 * 0.15915493667125701904296875;
    float _2839 = in.m_65.w;
    float _2841 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2821);
    float _2843 = fma(_1841, _2835, _1713);
    float _2845 = _2813 * 6.283185482025146484375;
    float _2847 = cos(_2845);
    float _2849 = fma(_2659, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2841);
    out.m_67.x = _1674;
    out.m_67.y = _1676;
    float _2851 = _2843;
    float _2853 = _2707;
    float _2855 = _2739;
    if (!_2831)
    {
        float _2857 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2843);
        _2851 = _2857;
    }
    float _2859 = _2851;
    out.m_69.x = _2449;
    out.m_69.y = _2447;
    out.m_69.z = _2451;
    float _2861 = _2837 * 6.283185482025146484375;
    float _2863 = sin(_2861);
    float _2865 = -_2859;
    float _2867 = _2283 * _2865;
    float _2869 = _2291 * _2859;
    float _2871 = exp2(_2807);
    out.m_71.w = _2839;
    float _2873 = -_1847;
    float _2875 = fma(_2863, _2847, _2873);
    float _2877 = -_1849;
    float _2879 = fma(_2863, _2827, _2877);
    float _2881 = fma(_1841, _2875, _1847);
    float _2883 = fma(_1841, _2879, _1849);
    float _2885 = _2881;
    float _2887 = _2883;
    if (!_2831)
    {
        float _2889 = fma(_1873, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2881);
        _2885 = _2889;
    }
    float _2891 = _2885;
    if (!_2831)
    {
        float _2893 = fma(_1927, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2883);
        _2887 = _2893;
    }
    float _2895 = _2887;
    float _2897 = -_2871;
    float _2899 = _2897 + 1.0;
    bool _2901 = _2553 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2903 = isnan(_2553);
    bool _2905 = _2901 || _2903;
    bool _2907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2909 = _2905 || _2907;
    float _2911 = fma(_2293, _2891, _2867);
    float _2913 = _2289 * _2859;
    float _2915 = fma(_2305, _2891, _2869);
    float _2917 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2849);
    float _2919 = fma(_2295, _2895, _2911);
    float _2921 = fma(_2301, _2891, _2913);
    float _2923 = fma(_2317, _2895, _2915);
    float _2925 = _2917 + _2707;
    float _2927 = _2899 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2929 = fma(_2309, _2895, _2921);
    float _2931 = _2925 * 0.5;
    float _2933 = _2929 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2935 = _2929 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2937 = _2929 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_73.z = _2931;
    out.m_73.w = _2707;
    float _2939 = fma(_2919, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2933);
    float _2941 = fma(_2919, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2935);
    float _2943 = fma(_2919, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2937);
    out.gl_Position.x = _2737;
    out.gl_Position.y = _2739;
    out.gl_Position.z = _2917;
    out.gl_Position.w = _2707;
    float _2945 = fma(_2923, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2939);
    float _2947 = fma(_2923, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2941);
    float _2949 = fma(_2923, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2943);
    float _2951 = _2939;
    float _2953 = _2917;
    float _2955 = _2737;
    if (!_2909)
    {
        _2951 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2957 = _2951;
    out.m_75.x = _2945;
    out.m_75.y = _2947;
    out.m_75.z = _2949;
    float _2959 = _2957;
    float _2961 = _2957;
    if (!_2909)
    {
        _2853 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2963 = _2853;
    float _2965 = _2963;
    float _2967 = _2963;
    if (!_2909)
    {
        _2953 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2969 = _2953;
    float _2971 = _2969;
    float _2973 = _2969;
    if (!_2909)
    {
        _2855 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2975 = _2855;
    float _2977 = _2975;
    float _2979 = _2975;
    if (!_2909)
    {
        _2955 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2981 = _2955;
    float _2983 = _2927 * _2765;
    float _2985 = -_2927;
    float _2987 = _2985 + 1.0;
    float _2989 = _2779 * _2983;
    float _2991 = _2779 * _2987;
    float _2993 = _2789 * _2983;
    float _2995 = fma(_2785, _2989, _2773);
    float _2997 = fma(_2787, _2989, _2775);
    float _2999 = _2983;
    float _3001 = _2981;
    float _3003 = _2981;
    if (!_2909)
    {
        _2999 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3005 = _2999;
    float _3007 = fma(_2779, _2993, _2777);
    out.m_77.x = _2995;
    out.m_77.y = _2997;
    out.m_77.z = _3007;
    out.m_77.w = _2991;
    bool _3009 = !_2909;
    float _3011 = _3005;
    float _3013 = _3005;
    if (!_3009)
    {
        bool _3015 = _2553 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3017 = isnan(_2553);
        bool _3019 = _3015 || _3017;
        bool _3021 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3023 = _3019 || _3021;
        if (!_3023)
        {
            float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3027 = _2553 + _3025;
            float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3031 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3029;
            float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3037 = 1.0 / _3031;
            float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3041 = _3039 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3047 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3049 = _3047 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3053 = _3051 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3055 = _3027 * _3037;
            float _3057 = precise::clamp(_3055, 0.0, 1.0);
            float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3061 = _3059 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3063 = fma(_3057, _3035, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3065 = fma(_3057, _3061, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3067 = fma(_3057, _3041, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3069 = fma(_3057, _3045, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3071 = fma(_3057, _3049, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3073 = fma(_3057, _3053, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3013 = _3067;
            _2979 = _3071;
            _2961 = _3063;
            _2973 = _3069;
            _2967 = _3065;
            _3003 = _3073;
            _3075 = true;
        }
        else
        {
            bool _3077 = _2553 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3079 = isnan(_2553);
            bool _3081 = _3077 || _3079;
            bool _3083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3085 = _3081 || _3083;
            if (!_3085)
            {
                _2959 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3087 = _2959;
            _2961 = _3087;
            if (!_3085)
            {
                _3011 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3089 = _3011;
            _3013 = _3089;
            if (!_3085)
            {
                _2965 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3091 = _2965;
            _2967 = _3091;
            if (!_3085)
            {
                _2971 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3093 = _2971;
            _2973 = _3093;
            if (!_3085)
            {
                _2977 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3095 = _2977;
            _2979 = _3095;
            if (!_3085)
            {
                _3001 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3097 = _3001;
            bool _3099 = !_3085;
            _3003 = _3097;
            if (!_3099)
            {
                bool _3101 = _2553 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3103 = isnan(_2553);
                bool _3105 = _3101 || _3103;
                bool _3107 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3109 = _3105 || _3107;
                if (!_3109)
                {
                    float _3111 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3113 = _2553 + _3111;
                    float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3117 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3115;
                    float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3123 = 1.0 / _3117;
                    float _3125 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3127 = _3125 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3129 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3131 = _3129 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3133 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3135 = _3133 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3139 = _3137 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3141 = _3113 * _3123;
                    float _3143 = precise::clamp(_3141, 0.0, 1.0);
                    float _3145 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3149 = fma(_3143, _3121, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3151 = fma(_3143, _3147, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3153 = fma(_3143, _3127, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3155 = fma(_3143, _3131, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3157 = fma(_3143, _3135, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3159 = fma(_3143, _3139, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3013 = _3153;
                    _2979 = _3157;
                    _2961 = _3149;
                    _2973 = _3155;
                    _2967 = _3151;
                    _3003 = _3159;
                    _3075 = true;
                }
                else
                {
                    _3013 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2979 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2961 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2973 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2967 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3003 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3075 = false;
    float _3161 = _3013;
    float _3163 = _2979;
    float _3165 = _2961;
    float _3167 = _2973;
    float _3169 = _2967;
    float _3171 = _3003;
    float _3173 = fma(_2947, -0.5, 0.5);
    float _3175 = precise::clamp(_3173, 0.0, 1.0);
    float _3177 = -_3161;
    float _3179 = _3177 + _3163;
    float _3181 = -_3165;
    float _3183 = _3181 + _3167;
    float _3185 = -_3169;
    float _3187 = _3185 + _3171;
    bool _3189 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3191 = fma(_3175, _3179, _3161);
    float _3193 = fma(_3175, _3183, _3165);
    float _3195 = fma(_3175, _3187, _3169);
    float _3197 = _3191 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _3199 = fma(_3193, 0.298911988735198974609375, _3197);
    float _3201 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3203 = fma(_3195, 0.114477999508380889892578125, _3199);
    out.m_79.w = _3201;
    float _3205 = -_3203;
    float _3207 = _3193 + _3205;
    float _3209 = -_3203;
    float _3211 = _3191 + _3209;
    float _3213 = -_3203;
    float _3215 = _3195 + _3213;
    out.m_81.x = 0.0;
    float _3217 = fma(_3207, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3203);
    float _3219 = fma(_3211, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3203);
    float _3221 = fma(_3215, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3203);
    out.m_83.x = _3217;
    out.m_83.y = _3219;
    out.m_83.z = _3221;
    if (!_3189)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3223 = -_2447;
    float _3225 = _3223 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3227 = -_2449;
    float _3229 = _3227 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3231 = -_2451;
    float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3235 = _3225 * _3225;
    float _3237 = fma(_3229, _3229, _3235);
    float _3239 = fma(_3233, _3233, _3237);
    float _3241 = sqrt(_3239);
    float _3243 = rsqrt(_3239);
    float _3245 = -_3241;
    float _3247 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3249 = _3247 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3251 = precise::clamp(_3249, 0.0, 1.0);
    float _3253 = _3229 * _3243;
    float _3255 = _3225 * _3243;
    float _3257 = abs(_3251);
    float _3259 = log2(_3257);
    float _3261 = _3233 * _3243;
    float _3263 = _3253 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3265 = _2947 * _3255;
    float _3267 = -_3255;
    float _3269 = -_3263;
    float _3271 = fma(_3267, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3269);
    float _3273 = fma(_2945, _3253, _3265);
    float _3275 = -_3261;
    float _3277 = fma(_3275, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3271);
    float _3279 = fma(_2949, _3261, _3273);
    float _3281 = precise::clamp(_3279, 0.0, 1.0);
    float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3285 = _3277 + _3283;
    float _3287 = _3259 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3289 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3291 = precise::clamp(_3289, 0.0, 1.0);
    float _3293 = exp2(_3287);
    float _3295 = _3293 * _3291;
    float _3297 = _3281 * _3295;
    float _3299 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3301 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3303 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _3299;
    out.m_81.y = _3301;
    out.m_81.z = _3303;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3075 = false;
    bool _1953 = false;
    bool _1765 = false;
    bool _1213 = false;
    bool _1033 = false;
    bool _815 = false;
    bool _689 = false;
    bool _305 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _107 = int(_105);
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
        float _3360 = as_type<float>(_123);
        out.gl_Position.z = _3360;
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
    float _143 = _141;
    if (_137)
    {
        float _145 = float(_107);
        _117 = _145;
    }
    float _147 = _117;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3430 = as_type<float>(_161);
        out.gl_Position.z = _3430;
    }
    if (_153)
    {
        return out;
    }
    float _163 = in.m_53.w;
    float _165 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = in.m_51.x;
    float _179 = in.m_51.y;
    float _181 = in.m_51.z;
    float _183 = in.m_46.x;
    float _185 = in.m_46.y;
    float _187 = in.m_46.z;
    float _189 = 0.0;
    float _191 = _165;
    if (!_175)
    {
        float _193 = _165 * _165;
        float _195 = _193 * 0.5;
        _189 = _195;
    }
    float _197 = _189;
    float _199 = _197;
    if (!_175)
    {
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    bool _205 = !_175;
    float _207 = _203;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _165 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _165);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_175;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _165 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _191 = _261;
    }
    float _263 = _191;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_263, _179, _267);
    float _275 = fma(_263, _177, _269);
    float _277 = fma(_263, _181, _271);
    float _279 = fma(_273, _163, _185);
    float _281 = fma(_275, _163, _183);
    float _283 = fma(_277, _163, _187);
    bool _285 = !_265;
    float _303;
    if (!_285)
    {
        float _287 = in.m_55.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        float _307 = float(_107);
        float _309 = 1.0 / _307;
        float _311 = _141 * _309;
        _303 = _311;
    }
    _305 = false;
    float _313 = _303;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _331 = 1.0 / _317;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _341 = 1.0 / _321;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _345 = _313 + _343;
    bool _347 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _349 = isnan(_313);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = 1.0 / _325;
    float _361 = _345 * _331;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _365 = _313 + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _369 = _313 + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _373 = _313 + _371;
    bool _375 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _377 = 1.0 / _335;
    float _379 = _365 * _341;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _383 = _313 + _381;
    bool _385 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _387 = isnan(_313);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _399 = _313 + _397;
    float _401 = 1.0 / _329;
    float _403 = _369 * _359;
    bool _405 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _407 = isnan(_313);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _417;
    float _421 = -_395;
    float _423 = _421 + 1.0;
    float _425 = fma(_419, _361, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _427 = 1.0 / _339;
    float _429 = _383 * _377;
    float _431 = -_415;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _435;
    float _439 = _395 * _433;
    float _441 = fma(_437, _361, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _443 = _373 * _401;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _445;
    bool _449 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _451 = isnan(_313);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = -_459;
    float _463 = _461 + 1.0;
    float _465 = _399 * _427;
    float _467 = fma(_447, _361, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _469 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _471 = isnan(_313);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = _459 * _423;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _495 = _479 * _463;
    bool _497 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _499 = isnan(_313);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -_479;
    float _511 = _509 + 1.0;
    bool _513 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _515 = isnan(_313);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    float _525 = fma(_489, _379, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _527 = _357 * _511;
    float _529 = -_357;
    float _531 = _529 + 1.0;
    float _533 = -_523;
    float _535 = _533 + 1.0;
    float _537 = fma(_485, _379, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _539 = fma(_493, _379, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _541 = _523 * _531;
    float _543 = _507 * _535;
    float _545 = -_507;
    float _547 = _545 + 1.0;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _553;
    float _557 = _441 * _543;
    float _559 = _467 * _543;
    float _561 = _425 * _543;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _567 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].x, _557);
    float _569 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].y, _559);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _575 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].z, _561);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _581 = fma(_525, _541, _567);
    float _583 = fma(_537, _541, _569);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _585;
    float _589 = fma(_565, _443, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _591 = fma(_573, _443, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _593 = fma(_539, _541, _575);
    float _595 = fma(_555, _403, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _597 = fma(_579, _443, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _599 = fma(_551, _403, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _601 = fma(_587, _403, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _603 = fma(_595, _527, _583);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _605;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _609;
    float _613 = fma(_599, _527, _581);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _615;
    float _619 = fma(_601, _527, _593);
    float _621 = fma(_607, _429, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _623 = fma(_611, _429, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _625 = fma(_617, _429, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _627 = fma(_589, _495, _613);
    float _629 = fma(_597, _495, _619);
    float _631 = fma(_591, _495, _603);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _645 = fma(_621, _481, _627);
    float _647 = fma(_635, _465, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _649 = fma(_639, _465, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _651 = fma(_643, _465, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _653 = fma(_623, _481, _631);
    float _655 = fma(_625, _481, _629);
    float _657 = fma(_647, _439, _645);
    float _659 = fma(_649, _439, _653);
    float _661 = fma(_651, _439, _655);
    float _663 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[149].x, _657);
    float _665 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[149].y, _659);
    float _667 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[149].z, _661);
    bool _669 = !_375;
    float _687;
    if (!_669)
    {
        float _671 = in.m_55.x;
        float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _675 = _671 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[11].x, _141);
        float _679 = _677 * _673;
        float _681 = floor(_679);
        float _683 = -_681;
        float _685 = _679 + _683;
        _687 = _685;
        _689 = true;
    }
    else
    {
        float _691 = float(_107);
        float _693 = 1.0 / _691;
        float _695 = _141 * _693;
        _687 = _695;
    }
    _689 = false;
    float _697 = _687;
    float _699 = in.m_53.x;
    float _701 = in.m_53.y;
    float _703 = in.m_53.z;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _707 = _697 + _705;
    bool _709 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _711;
    float _715 = 1.0 / _713;
    float _717 = _667 * _703;
    float _719 = _665 * _701;
    float _721 = _707 * _715;
    bool _723 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _725 = isnan(_697);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = -_733;
    float _737 = _735 + 1.0;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _739;
    bool _743 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _745 = isnan(_697);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _755;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _759;
    float _763 = fma(_741, _721, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _765 = _753 * _737;
    float _767 = fma(_757, _721, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _769 = fma(_761, _721, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _771 = -_753;
    float _773 = _771 + 1.0;
    float _775 = _763 * _765;
    float _777 = _767 * _765;
    float _779 = _769 * _765;
    float _781 = _663 * _699;
    float _783 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[107].x, _775);
    float _785 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[107].y, _777);
    float _787 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[107].z, _779);
    float _789 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[108].x, _783);
    float _791 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[108].y, _785);
    float _793 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[108].z, _787);
    bool _795 = !_709;
    float _813;
    if (!_795)
    {
        float _797 = in.m_55.x;
        float _799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _801 = _797 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _803 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _805 = _803 * _799;
        float _807 = floor(_805);
        float _809 = -_807;
        float _811 = _805 + _809;
        _813 = _811;
        _815 = true;
    }
    else
    {
        float _817 = float(_107);
        float _819 = 1.0 / _817;
        float _821 = _141 * _819;
        _813 = _821;
    }
    _815 = false;
    float _823 = _813;
    float _825 = _789 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _827 = _791 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _837 = 1.0 / _831;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _843;
    bool _847 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _849 = isnan(_823);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _863 = _793 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _865 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _867 = isnan(_823);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    float _877 = 1.0 / _835;
    bool _879 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _881 = isnan(_823);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    bool _891 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _893 = isnan(_823);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _899 = _895 || _897;
    float _901 = float(_899);
    bool _903 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _905 = 1.0 / _841;
    float _907 = _845 * _837;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _911 = _823 + _909;
    float _913 = -_901;
    float _915 = _913 + 1.0;
    float _917 = fma(_907, _911, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _919 = -_857;
    float _921 = _919 + 1.0;
    float _923 = 1.0 / _861;
    float _925 = -_889;
    float _927 = _925 + 1.0;
    float _929 = _857 * _915;
    float _931 = _889 * _921;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _937;
    float _941 = _875 * _927;
    float _943 = -_875;
    float _945 = _943 + 1.0;
    float _947 = _935 * _905;
    float _949 = _939 * _877;
    float _951 = _917 * _941;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _955 = _823 + _953;
    bool _957 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _959 = isnan(_823);
    bool _961 = _957 || _959;
    bool _963 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _965 = _961 || _963;
    float _967 = float(_965);
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _971 = _969 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _975 = _823 + _973;
    float _977 = fma(_947, _955, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _979 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[115].x, _951);
    float _981 = _971 * _923;
    float _983 = fma(_949, _975, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _985 = -_967;
    float _987 = _985 + 1.0;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _991 = _823 + _989;
    float _993 = fma(_977, _931, _979);
    float _995 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _997 = _901 * _987;
    float _999 = fma(_981, _991, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1001 = fma(_983, _929, _993);
    float _1003 = _825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1005 = fma(_999, _997, _1001);
    float _1007 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1005);
    float _1009 = _827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _1003;
    out.m_57.y = _1009;
    out.m_57.z = _995;
    out.m_57.w = _1011;
    bool _1013 = !_903;
    float _1031;
    if (!_1013)
    {
        float _1015 = in.m_55.x;
        float _1017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1019 = _1015 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1021 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[11].z, _141);
        float _1023 = _1021 * _1017;
        float _1025 = floor(_1023);
        float _1027 = -_1025;
        float _1029 = _1023 + _1027;
        _1031 = _1029;
        _1033 = true;
    }
    else
    {
        float _1035 = float(_107);
        float _1037 = 1.0 / _1035;
        float _1039 = _141 * _1037;
        _1031 = _1039;
    }
    _1033 = false;
    float _1041 = _1031;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1045 = _1041 + _1043;
    bool _1047 = _1041 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1049 = isnan(_1041);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1055 = _1051 || _1053;
    float _1057 = float(_1055);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1061 = _1041 + _1059;
    bool _1063 = _1041 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1065 = isnan(_1041);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1075;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1081 = _1079 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1083 = _1041 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1085 = isnan(_1041);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = -_1057;
    float _1097 = _1095 + 1.0;
    float _1099 = 1.0 / _1077;
    float _1101 = _1093 * _1097;
    float _1103 = -_1093;
    float _1105 = _1103 + 1.0;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1107;
    bool _1111 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1113 = 1.0 / _1081;
    float _1115 = _1073 * _1105;
    float _1117 = -_1073;
    float _1119 = _1117 + 1.0;
    float _1121 = _1045 * _1099;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1123;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1127;
    float _1131 = fma(_1109, _1121, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1133 = fma(_1125, _1121, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1135 = fma(_1129, _1121, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1137 = _1061 * _1113;
    float _1139 = _1131 * _1115;
    float _1141 = _1133 * _1115;
    float _1143 = _1135 * _1115;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1147 = _1145 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1151 = _1149 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1155 = _1153 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1157 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1139);
    float _1159 = fma(_1147, _1137, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1161 = fma(_1151, _1137, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1163 = fma(_1155, _1137, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1165 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1141);
    float _1167 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1143);
    float _1169 = fma(_1159, _1101, _1157);
    float _1171 = fma(_1161, _1101, _1165);
    float _1173 = fma(_1163, _1101, _1167);
    float _1175 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1169);
    float _1177 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1171);
    float _1179 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1173);
    float _1181 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1183 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1185 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1187 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1189 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1191 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _1187;
    out.m_59.y = _1189;
    out.m_59.z = _1191;
    bool _1193 = !_1111;
    float _1211;
    if (!_1193)
    {
        float _1195 = in.m_55.x;
        float _1197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1199 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[14].x, _141);
        float _1203 = _1201 * _1197;
        float _1205 = floor(_1203);
        float _1207 = -_1205;
        float _1209 = _1203 + _1207;
        _1211 = _1209;
        _1213 = true;
    }
    else
    {
        float _1215 = float(_107);
        float _1217 = 1.0 / _1215;
        float _1219 = _141 * _1217;
        _1211 = _1219;
    }
    _1213 = false;
    float _1221 = _1211;
    int _1223 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1225 = _1223;
    int _1227 = 0;
    int _1229 = _98(_1225, _1227, (*spvDescriptorSet0.support_buffer));
    float _1231 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1233 = _1231 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1235 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1237 = _1235 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1239 = 1.0 / _1233;
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1243 = _1241 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1245;
    float _1249 = 1.0 / _1237;
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1253 = _1251 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1257 = _1255 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1261 = _1259 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1263 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1265 = isnan(_1221);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1271 = _1267 || _1269;
    float _1273 = float(_1271);
    bool _1275 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1277 = isnan(_1221);
    bool _1279 = _1275 || _1277;
    bool _1281 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1283 = _1279 || _1281;
    float _1285 = float(_1283);
    float _1287 = 1.0 / _1243;
    float _1289 = _1247 * _1239;
    bool _1291 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1293 = isnan(_1221);
    bool _1295 = _1291 || _1293;
    bool _1297 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1299 = _1295 || _1297;
    float _1301 = float(_1299);
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1303;
    float _1307 = -_1301;
    float _1309 = _1307 + 1.0;
    float _1311 = 1.0 / _1257;
    bool _1313 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1315 = isnan(_1221);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1321 = _1317 || _1319;
    float _1323 = float(_1321);
    float _1325 = _1253 * _1249;
    bool _1327 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1329 = isnan(_1221);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1335 = _1331 || _1333;
    float _1337 = float(_1335);
    float _1339 = 1.0 / _1261;
    float _1341 = _1305 * _1287;
    float _1343 = _1323 * _1309;
    float _1345 = -_1323;
    float _1347 = _1345 + 1.0;
    float _1349 = -_1337;
    float _1351 = _1349 + 1.0;
    float _1353 = _1337 * _1347;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1359 = _1273 * _1351;
    float _1361 = -_1273;
    float _1363 = _1361 + 1.0;
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1367 = _1365 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1369;
    float _1373 = _1357 * _1339;
    float _1375 = _1285 * _1363;
    float _1377 = 1.0 / _1367;
    float _1379 = _1371 * _1311;
    bool _1381 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1383 = isnan(_1221);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1389 = _1385 || _1387;
    float _1391 = float(_1389);
    float _1393 = -_1285;
    float _1395 = _1393 + 1.0;
    bool _1397 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1399 = isnan(_1221);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1405 = _1401 || _1403;
    float _1407 = float(_1405);
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1411 = _1221 + _1409;
    float _1413 = _1391 * _1395;
    float _1415 = -_1391;
    float _1417 = _1415 + 1.0;
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1421 = _1419 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1423 = fma(_1289, _1411, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1425 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1427 = _1425 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1429 = _1407 * _1417;
    float _1431 = -_1407;
    float _1433 = _1431 + 1.0;
    float _1435 = _1421 * _1377;
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1439 = _1221 + _1437;
    float _1441 = _1423 * _1429;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1445 = _1221 + _1443;
    float _1447 = 1.0 / _1427;
    float _1449 = fma(_1325, _1439, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1451 = fma(_1433, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1441);
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1455 = _1221 + _1453;
    float _1457 = fma(_1341, _1445, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1459 = fma(_1449, _1413, _1451);
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1463 = _1221 + _1461;
    float _1465 = fma(_1373, _1455, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1467 = in.m_55.x;
    float _1469 = in.m_55.y;
    float _1471 = fma(_1457, _1375, _1459);
    float _1473 = fma(_1379, _1463, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _1475 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1477 = isnan(_1221);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1483 = _1479 || _1481;
    float _1485 = float(_1483);
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1487;
    float _1491 = fma(_1465, _1359, _1471);
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1495 = _1221 + _1493;
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1499 = _1221 + _1497;
    float _1501 = _1489 * _1447;
    float _1503 = fma(_1473, _1353, _1491);
    float _1505 = -_1485;
    float _1507 = _1505 + 1.0;
    float _1509 = fma(_1435, _1495, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1511 = in.m_61.z;
    float _1513 = fma(_1501, _1499, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1515 = _1301 * _1507;
    float _1517 = fma(_1509, _1343, _1503);
    float _1519 = fma(_1513, _1515, _1517);
    float _1521 = fma(_1485, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1519);
    float _1523 = -_1467;
    float _1525 = fma(0.5, _1523, 1.0);
    float _1527 = _1521 * _1525;
    float _1529 = precise::clamp(_1527, 0.0, 1.0);
    float _1531 = trunc(_1511);
    int _1533 = int(_1531);
    int _1535 = _1229 + (-1);
    float _1537 = float(_1535);
    float _1539 = _1529 * _1537;
    float _1541 = trunc(_1539);
    int _1543 = int(_1541);
    int _1545 = _1543;
    int _1547 = 0;
    int _1549 = _99(_1545, _1547, (*spvDescriptorSet0.support_buffer));
    int _1551 = _1533;
    int _1553 = 0;
    int _1555 = _99(_1551, _1553, (*spvDescriptorSet0.support_buffer));
    float4 _1558 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1549, _1555)), 0).xyzw;
    float _1560 = _1558.x;
    float _1562 = _1558.y;
    float _1564 = _1558.z;
    float _1566 = _1558.w;
    float _1568 = in.m_61.x;
    float _1570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1574 = _1572 != 0;
    float _1576 = in.m_61.y;
    int _1578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1580 = _1578 != 0;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1584 = _1467 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1586 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1588 = _1469 > 0.5;
    bool _1590 = _1588 && _1580;
    float _1592 = -_1582;
    float _1594 = fma(_1584, 2.0, _1592);
    float _1596 = -_141;
    float _1598 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1594);
    float _1600 = _1495;
    float _1602 = _1491;
    float _1604 = _1582;
    if (_1574)
    {
        float _1606 = in.m_55.x;
        _1600 = _1606;
    }
    float _1608 = _1600;
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1612 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1610);
    if (_1574)
    {
        _1602 = _1568;
    }
    float _1614 = _1602;
    float _1616 = _1614;
    if (!_1574)
    {
        _1604 = _1568;
    }
    float _1618 = _1604;
    float _1620 = _1576;
    float _1622 = _1618;
    if (_1590)
    {
        float _1624 = -_1576;
        float _1626 = _1624 + 1.0;
        _1620 = _1626;
    }
    float _1628 = _1620;
    bool _1630 = _1608 > 0.5;
    bool _1632 = _1630 && _1574;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1636 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1634);
    float _1638 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1632)
    {
        float _1640 = -_1614;
        float _1642 = _1640 + 1.0;
        _1616 = _1642;
    }
    float _1644 = _1616;
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1648 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1650 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1652 = fma(_1638, _1628, -0.5);
    if (_1574)
    {
        _1622 = _1644;
    }
    float _1654 = _1622;
    float _1656 = fma(_1648, -2.0, _1646);
    float _1658 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1636);
    float _1660 = fma(_1650, _1654, -0.5);
    float _1662 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1612);
    float _1664 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1656);
    float _1666 = fma(_1658, _1660, _1598);
    float _1668 = -_1664;
    float _1670 = fma(_1662, _1652, _1668);
    int _1672 = _1543 + 1;
    float _1674 = _1666 + 0.5;
    float _1676 = _1670 + 0.5;
    int _1678 = min(_1535, _1672);
    uint _1681 = as_type<uint>(half2(float2(_1566, 0.0)));
    uint _1683 = extract_bits(_1681, 0u, 8u);
    int _1685 = int(_1683) & 255;
    uint _1687 = extract_bits(_1681, 8u, 8u);
    int _1689 = int(_1687) & 255;
    int _1691 = _1689 << 8;
    int _1693 = _1685 | _1691;
    bool _1695 = _1693 >= 32768;
    int _1697 = _1693 + (-1024);
    int _1699 = _1697;
    if (_1695)
    {
        int _1701 = ~_1693;
        int _1703 = _1701 + 33792;
        int _1705 = _1703 + 1;
        _1699 = _1705;
    }
    int _1707 = _1699;
    int _1709 = _1707 + 30719;
    float _1711 = float(_1709);
    float _1713 = fma(_1711, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1715 = abs(_1713);
    float _1717 = -_1715;
    float _1719 = _1717 + 1.0;
    float _1721 = abs(_1713);
    float _1723 = fma(_1721, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1725 = _1713 < 0.0;
    float _1727 = float(_1725);
    int _1729 = as_type<int>(_1719) + (-218103808);
    float _1731 = abs(_1713);
    float _1733 = fma(_1731, _1723, -0.212114393711090087890625);
    bool _1735 = uint(_1729) >= 1920991232u;
    float _1737 = abs(_1713);
    float _1739 = fma(_1737, _1733, 1.570728778839111328125);
    bool _1741 = !_1735;
    float _1763;
    if (!_1741)
    {
        int _1743 = as_type<int>(_1719);
        int _1745 = as_type<int>(_1646);
        int _1747 = 8704;
        int _1749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[146].z);
        int _1751;
        int _1753;
        int _1755;
        int _1757;
        int _1759;
        int _1761;
        _96(_1743, _1745, _1747, _1749, _1751, _1753, _1755, _1757, _1759, _1761, out.gl_Position, out.gl_PointSize);
        _1763 = as_type<float>(_1759);
        _1765 = true;
    }
    else
    {
        float _1767 = rsqrt(_1719);
        float _1769 = _1719 * _1767;
        float _1771 = _1767 * 0.5;
        float _1773 = -_1769;
        float _1775 = 0.0 + _1773;
        float _1777 = fma(_1771, _1775, 0.5);
        float _1779 = fma(_1769, _1777, _1769);
        float _1781 = -_1779;
        float _1783 = 0.0 + _1781;
        float _1785 = fma(_1779, _1783, _1719);
        float _1787 = fma(_1771, _1785, _1779);
        _1763 = _1787;
    }
    _1765 = false;
    float _1789 = _1763;
    int _1791 = _1678;
    int _1793 = 0;
    int _1795 = _99(_1791, _1793, (*spvDescriptorSet0.support_buffer));
    int _1797 = _1533;
    int _1799 = 0;
    int _1801 = _99(_1797, _1799, (*spvDescriptorSet0.support_buffer));
    float4 _1803 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1795, _1801)), 0).xyzw;
    float _1805 = _1803.x;
    float _1807 = _1803.y;
    float _1809 = _1803.z;
    float _1811 = _1803.w;
    float _1813 = _1739 * _1789;
    float _1815 = _1727 * 2.0;
    float _1817 = _1711 * 3.883221149444580078125;
    float _1819 = floor(_1539);
    float _1821 = -_1815;
    float _1823 = fma(_1813, _1821, _1813);
    float _1825 = _1817 * 0.15915493667125701904296875;
    float _1827 = fma(_1727, 3.1415927410125732421875, _1823);
    float _1829 = _1825 * 6.283185482025146484375;
    float _1831 = cos(_1829);
    float _1833 = _1827 * 0.15915493667125701904296875;
    float _1835 = _1833 * 6.283185482025146484375;
    float _1837 = sin(_1835);
    float _1839 = -_1819;
    float _1841 = _1539 + _1839;
    float _1843 = _1825 * 6.283185482025146484375;
    float _1845 = sin(_1843);
    float _1847 = _1837 * _1831;
    float _1849 = _1837 * _1845;
    uint _1851 = as_type<uint>(half2(float2(_1811, 0.0)));
    float _1853 = -_1560;
    float _1855 = _1853 + _1805;
    float _1857 = -_1562;
    float _1859 = _1857 + _1807;
    uint _1861 = extract_bits(_1851, 0u, 8u);
    int _1863 = int(_1861) & 255;
    uint _1865 = extract_bits(_1851, 8u, 8u);
    int _1867 = int(_1865) & 255;
    int _1869 = _1867 << 8;
    int _1871 = _1863 | _1869;
    float _1873 = fma(_1841, _1855, _1560);
    float _1875 = fma(_1841, _1859, _1562);
    bool _1877 = _1871 >= 32768;
    int _1879 = _1871 + (-1024);
    int _1881 = _1879;
    if (_1877)
    {
        int _1883 = ~_1871;
        int _1885 = _1883 + 33792;
        int _1887 = _1885 + 1;
        _1881 = _1887;
    }
    int _1889 = _1881;
    int _1891 = _1889 + 30719;
    float _1893 = float(_1891);
    float _1895 = fma(_1893, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1897 = abs(_1895);
    float _1899 = -_1897;
    float _1901 = _1899 + 1.0;
    float _1903 = abs(_1895);
    float _1905 = fma(_1903, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1907 = _1895 < 0.0;
    float _1909 = float(_1907);
    int _1911 = as_type<int>(_1901) + (-218103808);
    float _1913 = abs(_1895);
    float _1915 = fma(_1913, _1905, -0.212114393711090087890625);
    bool _1917 = uint(_1911) >= 1920991232u;
    float _1919 = -_1564;
    float _1921 = _1919 + _1809;
    float _1923 = abs(_1895);
    float _1925 = fma(_1923, _1915, 1.570728778839111328125);
    float _1927 = fma(_1841, _1921, _1564);
    bool _1929 = !_1917;
    float _1951;
    if (!_1929)
    {
        int _1931 = as_type<int>(_1901);
        int _1933 = as_type<int>(_1831);
        int _1935 = 9600;
        int _1937 = as_type<int>(_1813);
        int _1939;
        int _1941;
        int _1943;
        int _1945;
        int _1947;
        int _1949;
        _96(_1931, _1933, _1935, _1937, _1939, _1941, _1943, _1945, _1947, _1949, out.gl_Position, out.gl_PointSize);
        _1951 = as_type<float>(_1947);
        _1953 = true;
    }
    else
    {
        float _1955 = rsqrt(_1901);
        float _1957 = _1901 * _1955;
        float _1959 = _1955 * 0.5;
        float _1961 = -_1957;
        float _1963 = 0.0 + _1961;
        float _1965 = fma(_1959, _1963, 0.5);
        float _1967 = fma(_1957, _1965, _1957);
        float _1969 = -_1967;
        float _1971 = 0.0 + _1969;
        float _1973 = fma(_1967, _1971, _1901);
        float _1975 = fma(_1959, _1973, _1967);
        _1951 = _1975;
    }
    _1953 = false;
    float _1977 = _1951;
    float _1979 = in.m_55.x;
    float _1981 = in.m_55.y;
    float _1983 = in.m_55.z;
    float _1985 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1987 = log2(_1985);
    float _1989 = _719 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1991 = _781 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1995 = _1993 != 0;
    int _1997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1999 = _1997 != 0;
    int _2001 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2003 = _2001 != 0;
    float _2005 = _717 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2007 = _1983 * 2.0;
    float _2009 = _1979 * 2.0;
    float _2011 = _1983 + _1981;
    float _2013 = _1981 + _1979;
    float _2015 = _1981 * 2.0;
    float _2017 = floor(_2009);
    float _2019 = _2011 + (-1.0);
    float _2021 = _2013 + (-1.0);
    float _2023 = _1981 + (-0.5);
    float _2025 = fma(_2021, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2027 = !_1995;
    int _2029 = _2027 ? 0 : 1;
    float _2031 = floor(_2007);
    float _2033 = _1987 * _141;
    int _2035 = abs(_2029);
    float _2037 = exp2(_2033);
    bool _2039 = _2017 >= 0.0;
    bool _2041 = isnan(_2017);
    bool _2043 = _2039 || _2041;
    bool _2045 = isnan(0.0);
    bool _2047 = _2043 || _2045;
    int _2049 = _2047 ? 0 : 1;
    bool _2051 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2053 = isnan(0.0);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2059 = _2055 || _2057;
    float _2061 = floor(_2015);
    bool _2063 = _2031 > 0.0;
    bool _2065 = _2031 >= 0.0;
    bool _2067 = isnan(_2031);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan(0.0);
    bool _2073 = _2069 || _2071;
    float _2075 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2077 = _2073 ? 0 : 1;
    float _2079 = -_2037;
    float _2081 = _2079 + 1.0;
    bool _2083 = _2017 > 0.0;
    float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2087 = 1.0 + _2085;
    int _2089 = ~_2077;
    int _2091 = _2089 + 1;
    int _2093 = _2091 + 1;
    bool _2095 = !_1999;
    int _2097 = _2095 ? 0 : 1;
    float _2099 = 1.0 / _2087;
    int _2101 = _2093;
    if (!_2063)
    {
        int _2103 = ~_2077;
        int _2105 = _2103 + 1;
        _2101 = _2105;
    }
    int _2107 = _2101;
    float _2109 = in.m_63.x;
    float _2111 = in.m_63.y;
    float _2113 = in.m_63.z;
    bool _2115 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2117 = isnan(1.0);
    bool _2119 = _2115 || _2117;
    bool _2121 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2123 = _2119 || _2121;
    float _2125 = float(_2107);
    float _2127 = _2059 ? _2081 : 0.0;
    int _2129 = abs(_2097);
    float _2131 = float(_2035);
    int _2133 = ~_2049;
    int _2135 = _2133 + 1;
    int _2137 = _2135 + 1;
    int _2139 = _2137;
    if (!_2083)
    {
        int _2141 = ~_2049;
        int _2143 = _2141 + 1;
        _2139 = _2143;
    }
    int _2145 = _2139;
    float _2147 = _2131 * _2125;
    bool _2149 = _2061 > 0.0;
    if (_2123)
    {
        float _2151 = _2127 * _2099;
        _143 = _2151;
    }
    float _2153 = _143;
    float _2155 = float(_2129);
    float _2157 = _2147 * (-2.0);
    float _2159 = float(_2145);
    float _2161 = _1979 + (-0.5);
    bool _2163 = _2061 >= 0.0;
    bool _2165 = isnan(_2061);
    bool _2167 = _2163 || _2165;
    bool _2169 = isnan(0.0);
    bool _2171 = _2167 || _2169;
    float _2173 = fma(_2025, _2157, _2025);
    float _2175 = _1983 + _1979;
    float _2177 = fma(_2157, _2109, _2109);
    bool _2179 = !_2003;
    int _2181 = _2179 ? 0 : 1;
    float _2183 = _2155 * _2159;
    int _2185 = _2171 ? 0 : 1;
    float _2187 = fma(_2161, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2177);
    int _2189 = abs(_2181);
    float _2191 = _2183 * (-2.0);
    int _2193 = ~_2185;
    int _2195 = _2193 + 1;
    int _2197 = _2195 + 1;
    float _2199 = fma(_2173, _2153, _2187);
    int _2201 = _2197;
    if (!_2149)
    {
        int _2203 = ~_2185;
        int _2205 = _2203 + 1;
        _2201 = _2205;
    }
    int _2207 = _2201;
    float _2209 = fma(_2191, _2111, _2111);
    float _2211 = fma(_2075, _2191, _2075);
    float _2213 = float(_2207);
    float _2215 = fma(_2023, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2209);
    float _2217 = float(_2189);
    float _2219 = _2175 + (-1.0);
    float _2221 = fma(_2211, _2153, _2215);
    float _2223 = _1983 + (-0.5);
    float _2225 = _2217 * _2213;
    float _2227 = _2199 * 0.15915493667125701904296875;
    float _2229 = fma(_2219, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2231 = _2221 * 0.15915493667125701904296875;
    float _2233 = _2225 * (-2.0);
    float _2235 = _2227 * 6.283185482025146484375;
    float _2237 = sin(_2235);
    float _2239 = fma(_2233, _2113, _2113);
    float _2241 = fma(_2229, _2233, _2229);
    float _2243 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1873);
    float _2245 = fma(_2223, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2239);
    float _2247 = _2227 * 6.283185482025146484375;
    float _2249 = cos(_2247);
    float _2251 = _1991 * _2243;
    float _2253 = fma(_2241, _2153, _2245);
    float _2255 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1927);
    float _2257 = _2253 * 0.15915493667125701904296875;
    float _2259 = _2231 * 6.283185482025146484375;
    float _2261 = sin(_2259);
    float _2263 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1875);
    float _2265 = _1989 * _2263;
    float _2267 = _2231 * 6.283185482025146484375;
    float _2269 = cos(_2267);
    float _2271 = _2257 * 6.283185482025146484375;
    float _2273 = cos(_2271);
    float _2275 = _2237 * _2261;
    float _2277 = _2249 * _2261;
    float _2279 = _2005 * _2255;
    float _2281 = _2257 * 6.283185482025146484375;
    float _2283 = sin(_2281);
    float _2285 = _2249 * _2269;
    float _2287 = _2237 * _2269;
    float _2289 = _2249 * _2273;
    float _2291 = _2237 * _2273;
    float _2293 = _2269 * _2273;
    float _2295 = _2261 * _2273;
    float _2297 = _2289 * _2265;
    float _2299 = _279 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2301 = fma(_2283, _2285, _2275);
    float _2303 = -_2277;
    float _2305 = fma(_2283, _2287, _2303);
    float _2307 = -_2287;
    float _2309 = fma(_2283, _2277, _2307);
    float _2311 = -_2265;
    float _2313 = _2283 * _2311;
    float _2315 = fma(_2301, _2251, _2297);
    float _2317 = fma(_2283, _2275, _2285);
    float _2319 = _2291 * _2265;
    float _2321 = fma(_2293, _2251, _2313);
    float _2323 = fma(_2309, _2279, _2315);
    float _2325 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2299);
    float _2327 = fma(_2305, _2251, _2319);
    float _2329 = _279 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2331 = fma(_2295, _2279, _2321);
    float _2333 = _2323 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2335 = fma(_2317, _2279, _2327);
    float _2337 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2329);
    float _2339 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2325);
    float _2341 = _2323 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2343 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2333);
    float _2345 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2337);
    float _2347 = _2339 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2349 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2341);
    float _2351 = fma(_2335, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2343);
    float _2353 = _2345 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2355 = _2323 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2357 = fma(_2335, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2349);
    float _2359 = _2347 + _2351;
    float _2361 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2355);
    float _2363 = _2353 + _2357;
    float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2367 = _2359 + _2365;
    float _2369 = fma(_2335, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2361);
    float _2371 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2373 = _2363 + _2371;
    float _2375 = _2367 * _2367;
    float _2377 = fma(_2373, _2373, _2375);
    float _2379 = _279 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2381 = sqrt(_2377);
    float _2383 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2379);
    float _2385 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2383);
    float _2387 = _2385 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2389 = _2387 + _2369;
    bool _2391 = _2381 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2393 = _2387;
    float _2395 = _2345;
    float _2397 = _2359;
    float _2399 = _2335;
    if (!_2391)
    {
        _2393 = _2363;
    }
    float _2401 = _2393;
    float _2403 = _2401;
    if (!_2391)
    {
        _2395 = _2389;
    }
    float _2405 = _2395;
    bool _2407 = !_2391;
    float _2409 = _2405;
    if (!_2407)
    {
        float _2411 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2413 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2415 = _2381 + _2413;
        float _2417 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2419 = _2415 * _2411;
        float _2421 = rsqrt(_2377);
        float _2423 = _2419 * 0.15915493667125701904296875;
        float _2425 = _2423 * 6.283185482025146484375;
        float _2427 = cos(_2425);
        float _2429 = _2423 * 6.283185482025146484375;
        float _2431 = sin(_2429);
        float _2433 = _2427 + (-1.0);
        float _2435 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2437 = fma(_2431, _2417, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2439 = fma(_2389, _2427, _2435);
        float _2441 = _2421 * _2437;
        float _2443 = fma(_2373, _2441, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2445 = fma(_2367, _2441, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2409 = _2439;
        _2403 = _2443;
        _2397 = _2445;
    }
    float _2447 = _2409;
    float _2449 = _2403;
    float _2451 = _2397;
    float _2453 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2455 = _2447 + _2453;
    float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2459 = _2449 + _2457;
    float _2461 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2463 = _2451 + _2461;
    float _2465 = _2455 * _2455;
    float _2467 = fma(_2459, _2459, _2465);
    float _2469 = fma(_2463, _2463, _2467);
    float _2471 = rsqrt(_2469);
    float _2473 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2475 = _2459 * _2473;
    float _2477 = _2463 * _2473;
    float _2479 = _2475 * _2475;
    float _2481 = _2477 * _2477;
    float _2483 = _2479 + _2481;
    float _2485 = sqrt(_2483);
    bool _2487 = _2485 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2491 = _2485 + _2489;
    float _2493 = _2471;
    float _2495 = _2483;
    float _2497 = _2491;
    float _2499 = _2455;
    if (_2487)
    {
        float _2501 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2493 = _2501;
    }
    float _2503 = _2493;
    if (_2487)
    {
        float _2505 = rsqrt(_2483);
        _2495 = _2505;
    }
    float _2507 = _2495;
    float _2509 = _2507;
    if (_2487)
    {
        float _2511 = _2491 * _2503;
        _2497 = _2511;
    }
    float _2513 = _2497;
    if (_2487)
    {
        float _2515 = _2513 * 0.15915493667125701904296875;
        _2399 = _2515;
    }
    float _2517 = _2399;
    float _2519 = _2463;
    float _2521 = _2517;
    if (_2487)
    {
        float _2523 = _2517 * 6.283185482025146484375;
        float _2525 = sin(_2523);
        _2519 = _2525;
    }
    float _2527 = _2519;
    float _2529 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2531 = precise::max(0.0, _2529);
    float _2533 = _2389;
    float _2535 = _2531;
    if (_2487)
    {
        float _2537 = _2517 * 6.283185482025146484375;
        float _2539 = cos(_2537);
        _2533 = _2539;
    }
    float _2541 = _2533;
    float _2543 = -_2473;
    float _2545 = -_2531;
    float _2547 = fma(_2455, _2543, _2545);
    if (_2487)
    {
        float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2535 = _2549;
    }
    float _2551 = _2535;
    float _2553 = sqrt(_2469);
    float _2555 = _2551;
    float _2557 = _2527;
    if (_2487)
    {
        float _2559 = fma(_2527, _2551, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2499 = _2559;
    }
    float _2561 = _2499;
    float _2563 = _2561;
    if (!_2487)
    {
        _2555 = _2475;
    }
    float _2565 = _2555;
    float _2567 = _2565;
    float _2569 = _2541;
    if (_2487)
    {
        float _2571 = _2541 + (-1.0);
        _2557 = _2571;
    }
    float _2573 = _2557;
    float _2575 = 0.0;
    float _2577 = _2573;
    if (_2487)
    {
        float _2579 = _2507 * _2561;
        _2575 = _2579;
    }
    float _2581 = _2575;
    if (!_2487)
    {
        _2563 = _2547;
    }
    float _2583 = _2563;
    float _2585 = _2447 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2587 = _2583;
    if (_2487)
    {
        float _2589 = _2573 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2521 = _2589;
    }
    float _2591 = _2521;
    if (_2487)
    {
        float _2593 = _2475 * _2581;
        _2567 = _2593;
    }
    float _2595 = _2567;
    if (!_2487)
    {
        _2577 = _2477;
    }
    float _2597 = _2577;
    float _2599 = _2597;
    if (_2487)
    {
        float _2601 = _2477 * _2581;
        _2599 = _2601;
    }
    float _2603 = _2599;
    if (!_2487)
    {
        _2509 = _2479;
    }
    float _2605 = _2509;
    float _2607 = _2605;
    if (_2487)
    {
        float _2609 = fma(_2547, _2541, _2591);
        _2587 = _2609;
    }
    float _2611 = _2587;
    if (_2487)
    {
        float _2613 = _2595 * _2595;
        _2607 = _2613;
    }
    float _2615 = _2607;
    if (!_2487)
    {
        _2569 = _2481;
    }
    float _2617 = _2569;
    float _2619 = _2617;
    if (_2487)
    {
        float _2621 = _2603 * _2603;
        _2619 = _2621;
    }
    float _2623 = _2619;
    float _2625 = fma(_2611, _2611, _2615);
    float _2627 = _2447 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2629 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2631 = _2625 + _2623;
    float _2633 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2585);
    float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2637 = fma(_2553, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2635);
    float _2639 = precise::clamp(_2637, 0.0, 1.0);
    float _2641 = _2447 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2643 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2627);
    float _2645 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2633);
    float _2647 = rsqrt(_2631);
    float _2649 = -_2639;
    float _2651 = _2649 + 1.0;
    float _2653 = _2447 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2655 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2641);
    float _2657 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2643);
    float _2659 = _2645 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2661 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2653);
    float _2663 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2655);
    float _2665 = abs(_2651);
    float _2667 = log2(_2665);
    float _2669 = _2657 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2671 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2661);
    float _2673 = _2663 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2675 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2677 = _2671 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2679 = _2673 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2681 = _2647 * _2595;
    float _2683 = _2647 * _2611;
    float _2685 = _2647 * _2603;
    float _2687 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2679);
    float _2689 = _2681 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2691 = -_2675;
    float _2693 = fma(_2691, _2629, 1.0);
    float _2695 = _2673 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2697 = fma(_2659, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2687);
    float _2699 = -_2689;
    float _2701 = fma(_2683, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2699);
    float _2703 = _2667 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2705 = log2(_2693);
    float _2707 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2697);
    float _2709 = -_2685;
    float _2711 = fma(_2709, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2701);
    float _2713 = _2673 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2715 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2695);
    float _2717 = fma(_2711, -0.5, 0.5);
    float _2719 = fma(_2711, 0.5, 0.5);
    float _2721 = exp2(_2703);
    float _2723 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2713);
    float _2725 = fma(_2659, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2715);
    float _2727 = fma(_2719, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2729 = _2683 + 1.0;
    float _2731 = fma(_2659, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2723);
    float _2733 = fma(_2719, _2727, -0.212114393711090087890625);
    float _2735 = 1.0 / _2707;
    float _2737 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2731);
    float _2739 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2725);
    float _2741 = _2705 * 0.693147182464599609375;
    float _2743 = fma(_2719, _2733, 1.570728778839111328125);
    float _2745 = _2741 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2747 = sqrt(_2717);
    float _2749 = -_2683;
    float _2751 = fma(_2721, _2729, _2749);
    float _2753 = fma(_2751, 0.5, 0.5);
    float _2755 = _2737 * _2735;
    float _2757 = _2739 * _2735;
    float _2759 = fma(_2755, 0.5, 0.5);
    float _2761 = fma(_2757, -0.5, 0.5);
    float _2763 = _2747 * 0.636619746685028076171875;
    float3 _7410 = float3(_2759, _2761, _2745);
    float _2765 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7410, float3(0.0), isnan(_7410)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7410, float3(0.0), isnan(_7410)), level(0.0)).x;
    float _2767 = -_2743;
    float _2769 = fma(_2763, _2767, 1.0);
    float3 _7426 = float3(_2759, _2761, _2745);
    float4 _2771 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7426, float3(0.0), isnan(_7426)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7426, float3(0.0), isnan(_7426)), level(0.0)).xyzw;
    float _2773 = _2771.x;
    float _2775 = _2771.y;
    float _2777 = _2771.z;
    float _2779 = _2771.w;
    float2 _7442 = float2(_2769, _2753);
    float3 _2783 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7442, float2(0.0), isnan(_7442)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7442, float2(0.0), isnan(_7442)), level(0.0)).xyz;
    float _2785 = _2783.x;
    float _2787 = _2783.y;
    float _2789 = _2783.z;
    float _2791 = _1925 * _1977;
    float _2793 = _1909 * 2.0;
    float _2795 = _1893 * 3.883221149444580078125;
    bool _2797 = _1875 != 0.0;
    bool _2799 = isnan(_1875);
    bool _2801 = _2797 || _2799;
    bool _2803 = isnan(0.0);
    bool _2805 = _2801 || _2803;
    float _2807 = _2667 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2809 = -_2793;
    float _2811 = fma(_2791, _2809, _2791);
    float _2813 = _2795 * 0.15915493667125701904296875;
    bool _2815 = _1873 == 0.0;
    bool _2817 = !_2805;
    bool _2819 = _2815 && _2817;
    float _2821 = _2673 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2823 = fma(_1909, 3.1415927410125732421875, _2811);
    float _2825 = _2813 * 6.283185482025146484375;
    float _2827 = sin(_2825);
    bool _2829 = _1927 == 0.0;
    bool _2831 = _2829 && _2819;
    float _2833 = -_1713;
    float _2835 = _2833 + _1895;
    float _2837 = _2823 * 0.15915493667125701904296875;
    float _2839 = in.m_65.w;
    float _2841 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2821);
    float _2843 = fma(_1841, _2835, _1713);
    float _2845 = _2813 * 6.283185482025146484375;
    float _2847 = cos(_2845);
    float _2849 = fma(_2659, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2841);
    out.m_67.x = _1674;
    out.m_67.y = _1676;
    float _2851 = _2843;
    float _2853 = _2707;
    float _2855 = _2739;
    if (!_2831)
    {
        float _2857 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2843);
        _2851 = _2857;
    }
    float _2859 = _2851;
    out.m_69.x = _2449;
    out.m_69.y = _2447;
    out.m_69.z = _2451;
    float _2861 = _2837 * 6.283185482025146484375;
    float _2863 = sin(_2861);
    float _2865 = -_2859;
    float _2867 = _2283 * _2865;
    float _2869 = _2291 * _2859;
    float _2871 = exp2(_2807);
    out.m_71.w = _2839;
    float _2873 = -_1847;
    float _2875 = fma(_2863, _2847, _2873);
    float _2877 = -_1849;
    float _2879 = fma(_2863, _2827, _2877);
    float _2881 = fma(_1841, _2875, _1847);
    float _2883 = fma(_1841, _2879, _1849);
    float _2885 = _2881;
    float _2887 = _2883;
    if (!_2831)
    {
        float _2889 = fma(_1873, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2881);
        _2885 = _2889;
    }
    float _2891 = _2885;
    if (!_2831)
    {
        float _2893 = fma(_1927, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2883);
        _2887 = _2893;
    }
    float _2895 = _2887;
    float _2897 = -_2871;
    float _2899 = _2897 + 1.0;
    bool _2901 = _2553 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2903 = isnan(_2553);
    bool _2905 = _2901 || _2903;
    bool _2907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2909 = _2905 || _2907;
    float _2911 = fma(_2293, _2891, _2867);
    float _2913 = _2289 * _2859;
    float _2915 = fma(_2305, _2891, _2869);
    float _2917 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2849);
    float _2919 = fma(_2295, _2895, _2911);
    float _2921 = fma(_2301, _2891, _2913);
    float _2923 = fma(_2317, _2895, _2915);
    float _2925 = _2917 + _2707;
    float _2927 = _2899 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2929 = fma(_2309, _2895, _2921);
    float _2931 = _2925 * 0.5;
    float _2933 = _2929 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2935 = _2929 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2937 = _2929 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_73.z = _2931;
    out.m_73.w = _2707;
    float _2939 = fma(_2919, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2933);
    float _2941 = fma(_2919, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2935);
    float _2943 = fma(_2919, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2937);
    out.gl_Position.x = _2737;
    out.gl_Position.y = _2739;
    out.gl_Position.z = _2917;
    out.gl_Position.w = _2707;
    float _2945 = fma(_2923, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2939);
    float _2947 = fma(_2923, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2941);
    float _2949 = fma(_2923, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2943);
    float _2951 = _2939;
    float _2953 = _2917;
    float _2955 = _2737;
    if (!_2909)
    {
        _2951 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2957 = _2951;
    out.m_75.x = _2945;
    out.m_75.y = _2947;
    out.m_75.z = _2949;
    float _2959 = _2957;
    float _2961 = _2957;
    if (!_2909)
    {
        _2853 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2963 = _2853;
    float _2965 = _2963;
    float _2967 = _2963;
    if (!_2909)
    {
        _2953 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2969 = _2953;
    float _2971 = _2969;
    float _2973 = _2969;
    if (!_2909)
    {
        _2855 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2975 = _2855;
    float _2977 = _2975;
    float _2979 = _2975;
    if (!_2909)
    {
        _2955 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2981 = _2955;
    float _2983 = _2927 * _2765;
    float _2985 = -_2927;
    float _2987 = _2985 + 1.0;
    float _2989 = _2779 * _2983;
    float _2991 = _2779 * _2987;
    float _2993 = _2789 * _2983;
    float _2995 = fma(_2785, _2989, _2773);
    float _2997 = fma(_2787, _2989, _2775);
    float _2999 = _2983;
    float _3001 = _2981;
    float _3003 = _2981;
    if (!_2909)
    {
        _2999 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3005 = _2999;
    float _3007 = fma(_2779, _2993, _2777);
    out.m_77.x = _2995;
    out.m_77.y = _2997;
    out.m_77.z = _3007;
    out.m_77.w = _2991;
    bool _3009 = !_2909;
    float _3011 = _3005;
    float _3013 = _3005;
    if (!_3009)
    {
        bool _3015 = _2553 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3017 = isnan(_2553);
        bool _3019 = _3015 || _3017;
        bool _3021 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3023 = _3019 || _3021;
        if (!_3023)
        {
            float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3027 = _2553 + _3025;
            float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3031 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3029;
            float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3037 = 1.0 / _3031;
            float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3041 = _3039 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3047 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3049 = _3047 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3053 = _3051 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3055 = _3027 * _3037;
            float _3057 = precise::clamp(_3055, 0.0, 1.0);
            float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3061 = _3059 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3063 = fma(_3057, _3035, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3065 = fma(_3057, _3061, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3067 = fma(_3057, _3041, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3069 = fma(_3057, _3045, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3071 = fma(_3057, _3049, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3073 = fma(_3057, _3053, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3013 = _3067;
            _2979 = _3071;
            _2961 = _3063;
            _2973 = _3069;
            _2967 = _3065;
            _3003 = _3073;
            _3075 = true;
        }
        else
        {
            bool _3077 = _2553 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3079 = isnan(_2553);
            bool _3081 = _3077 || _3079;
            bool _3083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3085 = _3081 || _3083;
            if (!_3085)
            {
                _2959 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3087 = _2959;
            _2961 = _3087;
            if (!_3085)
            {
                _3011 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3089 = _3011;
            _3013 = _3089;
            if (!_3085)
            {
                _2965 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3091 = _2965;
            _2967 = _3091;
            if (!_3085)
            {
                _2971 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3093 = _2971;
            _2973 = _3093;
            if (!_3085)
            {
                _2977 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3095 = _2977;
            _2979 = _3095;
            if (!_3085)
            {
                _3001 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3097 = _3001;
            bool _3099 = !_3085;
            _3003 = _3097;
            if (!_3099)
            {
                bool _3101 = _2553 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3103 = isnan(_2553);
                bool _3105 = _3101 || _3103;
                bool _3107 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3109 = _3105 || _3107;
                if (!_3109)
                {
                    float _3111 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3113 = _2553 + _3111;
                    float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3117 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3115;
                    float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3123 = 1.0 / _3117;
                    float _3125 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3127 = _3125 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3129 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3131 = _3129 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3133 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3135 = _3133 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3139 = _3137 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3141 = _3113 * _3123;
                    float _3143 = precise::clamp(_3141, 0.0, 1.0);
                    float _3145 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3149 = fma(_3143, _3121, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3151 = fma(_3143, _3147, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3153 = fma(_3143, _3127, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3155 = fma(_3143, _3131, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3157 = fma(_3143, _3135, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3159 = fma(_3143, _3139, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3013 = _3153;
                    _2979 = _3157;
                    _2961 = _3149;
                    _2973 = _3155;
                    _2967 = _3151;
                    _3003 = _3159;
                    _3075 = true;
                }
                else
                {
                    _3013 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2979 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2961 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2973 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2967 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3003 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3075 = false;
    float _3161 = _3013;
    float _3163 = _2979;
    float _3165 = _2961;
    float _3167 = _2973;
    float _3169 = _2967;
    float _3171 = _3003;
    float _3173 = fma(_2947, -0.5, 0.5);
    float _3175 = precise::clamp(_3173, 0.0, 1.0);
    float _3177 = -_3161;
    float _3179 = _3177 + _3163;
    float _3181 = -_3165;
    float _3183 = _3181 + _3167;
    float _3185 = -_3169;
    float _3187 = _3185 + _3171;
    bool _3189 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3191 = fma(_3175, _3179, _3161);
    float _3193 = fma(_3175, _3183, _3165);
    float _3195 = fma(_3175, _3187, _3169);
    float _3197 = _3191 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _3199 = fma(_3193, 0.298911988735198974609375, _3197);
    float _3201 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3203 = fma(_3195, 0.114477999508380889892578125, _3199);
    out.m_79.w = _3201;
    float _3205 = -_3203;
    float _3207 = _3193 + _3205;
    float _3209 = -_3203;
    float _3211 = _3191 + _3209;
    float _3213 = -_3203;
    float _3215 = _3195 + _3213;
    out.m_81.x = 0.0;
    float _3217 = fma(_3207, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3203);
    float _3219 = fma(_3211, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3203);
    float _3221 = fma(_3215, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3203);
    out.m_83.x = _3217;
    out.m_83.y = _3219;
    out.m_83.z = _3221;
    if (!_3189)
    {
        return out;
    }
    float _3223 = -_2447;
    float _3225 = _3223 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3227 = -_2449;
    float _3229 = _3227 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3231 = -_2451;
    float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3235 = _3225 * _3225;
    float _3237 = fma(_3229, _3229, _3235);
    float _3239 = fma(_3233, _3233, _3237);
    float _3241 = sqrt(_3239);
    float _3243 = rsqrt(_3239);
    float _3245 = -_3241;
    float _3247 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3249 = _3247 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3251 = precise::clamp(_3249, 0.0, 1.0);
    float _3253 = _3229 * _3243;
    float _3255 = _3225 * _3243;
    float _3257 = abs(_3251);
    float _3259 = log2(_3257);
    float _3261 = _3233 * _3243;
    float _3263 = _3253 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3265 = _2947 * _3255;
    float _3267 = -_3255;
    float _3269 = -_3263;
    float _3271 = fma(_3267, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3269);
    float _3273 = fma(_2945, _3253, _3265);
    float _3275 = -_3261;
    float _3277 = fma(_3275, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3271);
    float _3279 = fma(_2949, _3261, _3273);
    float _3281 = precise::clamp(_3279, 0.0, 1.0);
    float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3285 = _3277 + _3283;
    float _3287 = _3259 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3289 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3291 = precise::clamp(_3289, 0.0, 1.0);
    float _3293 = exp2(_3287);
    float _3295 = _3293 * _3291;
    float _3297 = _3281 * _3295;
    float _3299 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3301 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3303 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _3299;
    out.m_81.y = _3301;
    out.m_81.z = _3303;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3075 = false;
    bool _1953 = false;
    bool _1765 = false;
    bool _1213 = false;
    bool _1033 = false;
    bool _815 = false;
    bool _689 = false;
    bool _305 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _107 = int(_105);
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
        float _3360 = as_type<float>(_123);
        out.gl_Position.z = _3360;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_51.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = _141;
    if (_137)
    {
        float _145 = float(_107);
        _117 = _145;
    }
    float _147 = _117;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3430 = as_type<float>(_161);
        out.gl_Position.z = _3430;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = in.m_53.w;
    float _165 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = in.m_51.x;
    float _179 = in.m_51.y;
    float _181 = in.m_51.z;
    float _183 = in.m_46.x;
    float _185 = in.m_46.y;
    float _187 = in.m_46.z;
    float _189 = 0.0;
    float _191 = _165;
    if (!_175)
    {
        float _193 = _165 * _165;
        float _195 = _193 * 0.5;
        _189 = _195;
    }
    float _197 = _189;
    float _199 = _197;
    if (!_175)
    {
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    bool _205 = !_175;
    float _207 = _203;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _165 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _165);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_175;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _165 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _191 = _261;
    }
    float _263 = _191;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_263, _179, _267);
    float _275 = fma(_263, _177, _269);
    float _277 = fma(_263, _181, _271);
    float _279 = fma(_273, _163, _185);
    float _281 = fma(_275, _163, _183);
    float _283 = fma(_277, _163, _187);
    bool _285 = !_265;
    float _303;
    if (!_285)
    {
        float _287 = in.m_55.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        float _307 = float(_107);
        float _309 = 1.0 / _307;
        float _311 = _141 * _309;
        _303 = _311;
    }
    _305 = false;
    float _313 = _303;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _331 = 1.0 / _317;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _341 = 1.0 / _321;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _345 = _313 + _343;
    bool _347 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _349 = isnan(_313);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = 1.0 / _325;
    float _361 = _345 * _331;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _365 = _313 + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _369 = _313 + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _373 = _313 + _371;
    bool _375 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _377 = 1.0 / _335;
    float _379 = _365 * _341;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _383 = _313 + _381;
    bool _385 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _387 = isnan(_313);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _399 = _313 + _397;
    float _401 = 1.0 / _329;
    float _403 = _369 * _359;
    bool _405 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _407 = isnan(_313);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _417;
    float _421 = -_395;
    float _423 = _421 + 1.0;
    float _425 = fma(_419, _361, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _427 = 1.0 / _339;
    float _429 = _383 * _377;
    float _431 = -_415;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _435;
    float _439 = _395 * _433;
    float _441 = fma(_437, _361, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _443 = _373 * _401;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _445;
    bool _449 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _451 = isnan(_313);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = -_459;
    float _463 = _461 + 1.0;
    float _465 = _399 * _427;
    float _467 = fma(_447, _361, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _469 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _471 = isnan(_313);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = _459 * _423;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _495 = _479 * _463;
    bool _497 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _499 = isnan(_313);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -_479;
    float _511 = _509 + 1.0;
    bool _513 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _515 = isnan(_313);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    float _525 = fma(_489, _379, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _527 = _357 * _511;
    float _529 = -_357;
    float _531 = _529 + 1.0;
    float _533 = -_523;
    float _535 = _533 + 1.0;
    float _537 = fma(_485, _379, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _539 = fma(_493, _379, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _541 = _523 * _531;
    float _543 = _507 * _535;
    float _545 = -_507;
    float _547 = _545 + 1.0;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _553;
    float _557 = _441 * _543;
    float _559 = _467 * _543;
    float _561 = _425 * _543;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _567 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].x, _557);
    float _569 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].y, _559);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _575 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].z, _561);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _581 = fma(_525, _541, _567);
    float _583 = fma(_537, _541, _569);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _585;
    float _589 = fma(_565, _443, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _591 = fma(_573, _443, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _593 = fma(_539, _541, _575);
    float _595 = fma(_555, _403, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _597 = fma(_579, _443, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _599 = fma(_551, _403, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _601 = fma(_587, _403, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _603 = fma(_595, _527, _583);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _605;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _609;
    float _613 = fma(_599, _527, _581);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _615;
    float _619 = fma(_601, _527, _593);
    float _621 = fma(_607, _429, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _623 = fma(_611, _429, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _625 = fma(_617, _429, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _627 = fma(_589, _495, _613);
    float _629 = fma(_597, _495, _619);
    float _631 = fma(_591, _495, _603);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _645 = fma(_621, _481, _627);
    float _647 = fma(_635, _465, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _649 = fma(_639, _465, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _651 = fma(_643, _465, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _653 = fma(_623, _481, _631);
    float _655 = fma(_625, _481, _629);
    float _657 = fma(_647, _439, _645);
    float _659 = fma(_649, _439, _653);
    float _661 = fma(_651, _439, _655);
    float _663 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[149].x, _657);
    float _665 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[149].y, _659);
    float _667 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[149].z, _661);
    bool _669 = !_375;
    float _687;
    if (!_669)
    {
        float _671 = in.m_55.x;
        float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _675 = _671 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[11].x, _141);
        float _679 = _677 * _673;
        float _681 = floor(_679);
        float _683 = -_681;
        float _685 = _679 + _683;
        _687 = _685;
        _689 = true;
    }
    else
    {
        float _691 = float(_107);
        float _693 = 1.0 / _691;
        float _695 = _141 * _693;
        _687 = _695;
    }
    _689 = false;
    float _697 = _687;
    float _699 = in.m_53.x;
    float _701 = in.m_53.y;
    float _703 = in.m_53.z;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _707 = _697 + _705;
    bool _709 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _711;
    float _715 = 1.0 / _713;
    float _717 = _667 * _703;
    float _719 = _665 * _701;
    float _721 = _707 * _715;
    bool _723 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _725 = isnan(_697);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = -_733;
    float _737 = _735 + 1.0;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _739;
    bool _743 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _745 = isnan(_697);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _755;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _759;
    float _763 = fma(_741, _721, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _765 = _753 * _737;
    float _767 = fma(_757, _721, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _769 = fma(_761, _721, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _771 = -_753;
    float _773 = _771 + 1.0;
    float _775 = _763 * _765;
    float _777 = _767 * _765;
    float _779 = _769 * _765;
    float _781 = _663 * _699;
    float _783 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[107].x, _775);
    float _785 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[107].y, _777);
    float _787 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[107].z, _779);
    float _789 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[108].x, _783);
    float _791 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[108].y, _785);
    float _793 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[108].z, _787);
    bool _795 = !_709;
    float _813;
    if (!_795)
    {
        float _797 = in.m_55.x;
        float _799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _801 = _797 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _803 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _805 = _803 * _799;
        float _807 = floor(_805);
        float _809 = -_807;
        float _811 = _805 + _809;
        _813 = _811;
        _815 = true;
    }
    else
    {
        float _817 = float(_107);
        float _819 = 1.0 / _817;
        float _821 = _141 * _819;
        _813 = _821;
    }
    _815 = false;
    float _823 = _813;
    float _825 = _789 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _827 = _791 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _837 = 1.0 / _831;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _843;
    bool _847 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _849 = isnan(_823);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _863 = _793 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _865 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _867 = isnan(_823);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    float _877 = 1.0 / _835;
    bool _879 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _881 = isnan(_823);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    bool _891 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _893 = isnan(_823);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _899 = _895 || _897;
    float _901 = float(_899);
    bool _903 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _905 = 1.0 / _841;
    float _907 = _845 * _837;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _911 = _823 + _909;
    float _913 = -_901;
    float _915 = _913 + 1.0;
    float _917 = fma(_907, _911, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _919 = -_857;
    float _921 = _919 + 1.0;
    float _923 = 1.0 / _861;
    float _925 = -_889;
    float _927 = _925 + 1.0;
    float _929 = _857 * _915;
    float _931 = _889 * _921;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _937;
    float _941 = _875 * _927;
    float _943 = -_875;
    float _945 = _943 + 1.0;
    float _947 = _935 * _905;
    float _949 = _939 * _877;
    float _951 = _917 * _941;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _955 = _823 + _953;
    bool _957 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _959 = isnan(_823);
    bool _961 = _957 || _959;
    bool _963 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _965 = _961 || _963;
    float _967 = float(_965);
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _971 = _969 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _975 = _823 + _973;
    float _977 = fma(_947, _955, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _979 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[115].x, _951);
    float _981 = _971 * _923;
    float _983 = fma(_949, _975, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _985 = -_967;
    float _987 = _985 + 1.0;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _991 = _823 + _989;
    float _993 = fma(_977, _931, _979);
    float _995 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _997 = _901 * _987;
    float _999 = fma(_981, _991, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1001 = fma(_983, _929, _993);
    float _1003 = _825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1005 = fma(_999, _997, _1001);
    float _1007 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1005);
    float _1009 = _827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _1003;
    out.m_57.y = _1009;
    out.m_57.z = _995;
    out.m_57.w = _1011;
    bool _1013 = !_903;
    float _1031;
    if (!_1013)
    {
        float _1015 = in.m_55.x;
        float _1017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1019 = _1015 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1021 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[11].z, _141);
        float _1023 = _1021 * _1017;
        float _1025 = floor(_1023);
        float _1027 = -_1025;
        float _1029 = _1023 + _1027;
        _1031 = _1029;
        _1033 = true;
    }
    else
    {
        float _1035 = float(_107);
        float _1037 = 1.0 / _1035;
        float _1039 = _141 * _1037;
        _1031 = _1039;
    }
    _1033 = false;
    float _1041 = _1031;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1045 = _1041 + _1043;
    bool _1047 = _1041 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1049 = isnan(_1041);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1055 = _1051 || _1053;
    float _1057 = float(_1055);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1061 = _1041 + _1059;
    bool _1063 = _1041 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1065 = isnan(_1041);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1075;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1081 = _1079 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1083 = _1041 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1085 = isnan(_1041);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = -_1057;
    float _1097 = _1095 + 1.0;
    float _1099 = 1.0 / _1077;
    float _1101 = _1093 * _1097;
    float _1103 = -_1093;
    float _1105 = _1103 + 1.0;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1107;
    bool _1111 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1113 = 1.0 / _1081;
    float _1115 = _1073 * _1105;
    float _1117 = -_1073;
    float _1119 = _1117 + 1.0;
    float _1121 = _1045 * _1099;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1123;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1127;
    float _1131 = fma(_1109, _1121, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1133 = fma(_1125, _1121, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1135 = fma(_1129, _1121, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1137 = _1061 * _1113;
    float _1139 = _1131 * _1115;
    float _1141 = _1133 * _1115;
    float _1143 = _1135 * _1115;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1147 = _1145 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1151 = _1149 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1155 = _1153 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1157 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1139);
    float _1159 = fma(_1147, _1137, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1161 = fma(_1151, _1137, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1163 = fma(_1155, _1137, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1165 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1141);
    float _1167 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1143);
    float _1169 = fma(_1159, _1101, _1157);
    float _1171 = fma(_1161, _1101, _1165);
    float _1173 = fma(_1163, _1101, _1167);
    float _1175 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1169);
    float _1177 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1171);
    float _1179 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1173);
    float _1181 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1183 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1185 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1187 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1189 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1191 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _1187;
    out.m_59.y = _1189;
    out.m_59.z = _1191;
    bool _1193 = !_1111;
    float _1211;
    if (!_1193)
    {
        float _1195 = in.m_55.x;
        float _1197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1199 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[14].x, _141);
        float _1203 = _1201 * _1197;
        float _1205 = floor(_1203);
        float _1207 = -_1205;
        float _1209 = _1203 + _1207;
        _1211 = _1209;
        _1213 = true;
    }
    else
    {
        float _1215 = float(_107);
        float _1217 = 1.0 / _1215;
        float _1219 = _141 * _1217;
        _1211 = _1219;
    }
    _1213 = false;
    float _1221 = _1211;
    int _1223 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1225 = _1223;
    int _1227 = 0;
    int _1229 = _98(_1225, _1227, (*spvDescriptorSet0.support_buffer));
    float _1231 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1233 = _1231 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1235 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1237 = _1235 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1239 = 1.0 / _1233;
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1243 = _1241 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1245;
    float _1249 = 1.0 / _1237;
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1253 = _1251 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1257 = _1255 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1261 = _1259 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1263 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1265 = isnan(_1221);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1271 = _1267 || _1269;
    float _1273 = float(_1271);
    bool _1275 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1277 = isnan(_1221);
    bool _1279 = _1275 || _1277;
    bool _1281 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1283 = _1279 || _1281;
    float _1285 = float(_1283);
    float _1287 = 1.0 / _1243;
    float _1289 = _1247 * _1239;
    bool _1291 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1293 = isnan(_1221);
    bool _1295 = _1291 || _1293;
    bool _1297 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1299 = _1295 || _1297;
    float _1301 = float(_1299);
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1303;
    float _1307 = -_1301;
    float _1309 = _1307 + 1.0;
    float _1311 = 1.0 / _1257;
    bool _1313 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1315 = isnan(_1221);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1321 = _1317 || _1319;
    float _1323 = float(_1321);
    float _1325 = _1253 * _1249;
    bool _1327 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1329 = isnan(_1221);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1335 = _1331 || _1333;
    float _1337 = float(_1335);
    float _1339 = 1.0 / _1261;
    float _1341 = _1305 * _1287;
    float _1343 = _1323 * _1309;
    float _1345 = -_1323;
    float _1347 = _1345 + 1.0;
    float _1349 = -_1337;
    float _1351 = _1349 + 1.0;
    float _1353 = _1337 * _1347;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1359 = _1273 * _1351;
    float _1361 = -_1273;
    float _1363 = _1361 + 1.0;
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1367 = _1365 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1369;
    float _1373 = _1357 * _1339;
    float _1375 = _1285 * _1363;
    float _1377 = 1.0 / _1367;
    float _1379 = _1371 * _1311;
    bool _1381 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1383 = isnan(_1221);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1389 = _1385 || _1387;
    float _1391 = float(_1389);
    float _1393 = -_1285;
    float _1395 = _1393 + 1.0;
    bool _1397 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1399 = isnan(_1221);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1405 = _1401 || _1403;
    float _1407 = float(_1405);
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1411 = _1221 + _1409;
    float _1413 = _1391 * _1395;
    float _1415 = -_1391;
    float _1417 = _1415 + 1.0;
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1421 = _1419 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1423 = fma(_1289, _1411, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1425 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1427 = _1425 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1429 = _1407 * _1417;
    float _1431 = -_1407;
    float _1433 = _1431 + 1.0;
    float _1435 = _1421 * _1377;
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1439 = _1221 + _1437;
    float _1441 = _1423 * _1429;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1445 = _1221 + _1443;
    float _1447 = 1.0 / _1427;
    float _1449 = fma(_1325, _1439, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1451 = fma(_1433, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1441);
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1455 = _1221 + _1453;
    float _1457 = fma(_1341, _1445, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1459 = fma(_1449, _1413, _1451);
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1463 = _1221 + _1461;
    float _1465 = fma(_1373, _1455, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1467 = in.m_55.x;
    float _1469 = in.m_55.y;
    float _1471 = fma(_1457, _1375, _1459);
    float _1473 = fma(_1379, _1463, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _1475 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1477 = isnan(_1221);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1483 = _1479 || _1481;
    float _1485 = float(_1483);
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1487;
    float _1491 = fma(_1465, _1359, _1471);
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1495 = _1221 + _1493;
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1499 = _1221 + _1497;
    float _1501 = _1489 * _1447;
    float _1503 = fma(_1473, _1353, _1491);
    float _1505 = -_1485;
    float _1507 = _1505 + 1.0;
    float _1509 = fma(_1435, _1495, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1511 = in.m_61.z;
    float _1513 = fma(_1501, _1499, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1515 = _1301 * _1507;
    float _1517 = fma(_1509, _1343, _1503);
    float _1519 = fma(_1513, _1515, _1517);
    float _1521 = fma(_1485, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1519);
    float _1523 = -_1467;
    float _1525 = fma(0.5, _1523, 1.0);
    float _1527 = _1521 * _1525;
    float _1529 = precise::clamp(_1527, 0.0, 1.0);
    float _1531 = trunc(_1511);
    int _1533 = int(_1531);
    int _1535 = _1229 + (-1);
    float _1537 = float(_1535);
    float _1539 = _1529 * _1537;
    float _1541 = trunc(_1539);
    int _1543 = int(_1541);
    int _1545 = _1543;
    int _1547 = 0;
    int _1549 = _99(_1545, _1547, (*spvDescriptorSet0.support_buffer));
    int _1551 = _1533;
    int _1553 = 0;
    int _1555 = _99(_1551, _1553, (*spvDescriptorSet0.support_buffer));
    float4 _1558 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1549, _1555)), 0).xyzw;
    float _1560 = _1558.x;
    float _1562 = _1558.y;
    float _1564 = _1558.z;
    float _1566 = _1558.w;
    float _1568 = in.m_61.x;
    float _1570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1574 = _1572 != 0;
    float _1576 = in.m_61.y;
    int _1578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1580 = _1578 != 0;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1584 = _1467 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1586 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1588 = _1469 > 0.5;
    bool _1590 = _1588 && _1580;
    float _1592 = -_1582;
    float _1594 = fma(_1584, 2.0, _1592);
    float _1596 = -_141;
    float _1598 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1594);
    float _1600 = _1495;
    float _1602 = _1491;
    float _1604 = _1582;
    if (_1574)
    {
        float _1606 = in.m_55.x;
        _1600 = _1606;
    }
    float _1608 = _1600;
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1612 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1610);
    if (_1574)
    {
        _1602 = _1568;
    }
    float _1614 = _1602;
    float _1616 = _1614;
    if (!_1574)
    {
        _1604 = _1568;
    }
    float _1618 = _1604;
    float _1620 = _1576;
    float _1622 = _1618;
    if (_1590)
    {
        float _1624 = -_1576;
        float _1626 = _1624 + 1.0;
        _1620 = _1626;
    }
    float _1628 = _1620;
    bool _1630 = _1608 > 0.5;
    bool _1632 = _1630 && _1574;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1636 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1634);
    float _1638 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1632)
    {
        float _1640 = -_1614;
        float _1642 = _1640 + 1.0;
        _1616 = _1642;
    }
    float _1644 = _1616;
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1648 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1650 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1652 = fma(_1638, _1628, -0.5);
    if (_1574)
    {
        _1622 = _1644;
    }
    float _1654 = _1622;
    float _1656 = fma(_1648, -2.0, _1646);
    float _1658 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1636);
    float _1660 = fma(_1650, _1654, -0.5);
    float _1662 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1612);
    float _1664 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1656);
    float _1666 = fma(_1658, _1660, _1598);
    float _1668 = -_1664;
    float _1670 = fma(_1662, _1652, _1668);
    int _1672 = _1543 + 1;
    float _1674 = _1666 + 0.5;
    float _1676 = _1670 + 0.5;
    int _1678 = min(_1535, _1672);
    uint _1681 = as_type<uint>(half2(float2(_1566, 0.0)));
    uint _1683 = extract_bits(_1681, 0u, 8u);
    int _1685 = int(_1683) & 255;
    uint _1687 = extract_bits(_1681, 8u, 8u);
    int _1689 = int(_1687) & 255;
    int _1691 = _1689 << 8;
    int _1693 = _1685 | _1691;
    bool _1695 = _1693 >= 32768;
    int _1697 = _1693 + (-1024);
    int _1699 = _1697;
    if (_1695)
    {
        int _1701 = ~_1693;
        int _1703 = _1701 + 33792;
        int _1705 = _1703 + 1;
        _1699 = _1705;
    }
    int _1707 = _1699;
    int _1709 = _1707 + 30719;
    float _1711 = float(_1709);
    float _1713 = fma(_1711, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1715 = abs(_1713);
    float _1717 = -_1715;
    float _1719 = _1717 + 1.0;
    float _1721 = abs(_1713);
    float _1723 = fma(_1721, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1725 = _1713 < 0.0;
    float _1727 = float(_1725);
    int _1729 = as_type<int>(_1719) + (-218103808);
    float _1731 = abs(_1713);
    float _1733 = fma(_1731, _1723, -0.212114393711090087890625);
    bool _1735 = uint(_1729) >= 1920991232u;
    float _1737 = abs(_1713);
    float _1739 = fma(_1737, _1733, 1.570728778839111328125);
    bool _1741 = !_1735;
    float _1763;
    if (!_1741)
    {
        int _1743 = as_type<int>(_1719);
        int _1745 = as_type<int>(_1646);
        int _1747 = 8704;
        int _1749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[146].z);
        int _1751;
        int _1753;
        int _1755;
        int _1757;
        int _1759;
        int _1761;
        _96(_1743, _1745, _1747, _1749, _1751, _1753, _1755, _1757, _1759, _1761, out.gl_Position, out.gl_PointSize);
        _1763 = as_type<float>(_1759);
        _1765 = true;
    }
    else
    {
        float _1767 = rsqrt(_1719);
        float _1769 = _1719 * _1767;
        float _1771 = _1767 * 0.5;
        float _1773 = -_1769;
        float _1775 = 0.0 + _1773;
        float _1777 = fma(_1771, _1775, 0.5);
        float _1779 = fma(_1769, _1777, _1769);
        float _1781 = -_1779;
        float _1783 = 0.0 + _1781;
        float _1785 = fma(_1779, _1783, _1719);
        float _1787 = fma(_1771, _1785, _1779);
        _1763 = _1787;
    }
    _1765 = false;
    float _1789 = _1763;
    int _1791 = _1678;
    int _1793 = 0;
    int _1795 = _99(_1791, _1793, (*spvDescriptorSet0.support_buffer));
    int _1797 = _1533;
    int _1799 = 0;
    int _1801 = _99(_1797, _1799, (*spvDescriptorSet0.support_buffer));
    float4 _1803 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1795, _1801)), 0).xyzw;
    float _1805 = _1803.x;
    float _1807 = _1803.y;
    float _1809 = _1803.z;
    float _1811 = _1803.w;
    float _1813 = _1739 * _1789;
    float _1815 = _1727 * 2.0;
    float _1817 = _1711 * 3.883221149444580078125;
    float _1819 = floor(_1539);
    float _1821 = -_1815;
    float _1823 = fma(_1813, _1821, _1813);
    float _1825 = _1817 * 0.15915493667125701904296875;
    float _1827 = fma(_1727, 3.1415927410125732421875, _1823);
    float _1829 = _1825 * 6.283185482025146484375;
    float _1831 = cos(_1829);
    float _1833 = _1827 * 0.15915493667125701904296875;
    float _1835 = _1833 * 6.283185482025146484375;
    float _1837 = sin(_1835);
    float _1839 = -_1819;
    float _1841 = _1539 + _1839;
    float _1843 = _1825 * 6.283185482025146484375;
    float _1845 = sin(_1843);
    float _1847 = _1837 * _1831;
    float _1849 = _1837 * _1845;
    uint _1851 = as_type<uint>(half2(float2(_1811, 0.0)));
    float _1853 = -_1560;
    float _1855 = _1853 + _1805;
    float _1857 = -_1562;
    float _1859 = _1857 + _1807;
    uint _1861 = extract_bits(_1851, 0u, 8u);
    int _1863 = int(_1861) & 255;
    uint _1865 = extract_bits(_1851, 8u, 8u);
    int _1867 = int(_1865) & 255;
    int _1869 = _1867 << 8;
    int _1871 = _1863 | _1869;
    float _1873 = fma(_1841, _1855, _1560);
    float _1875 = fma(_1841, _1859, _1562);
    bool _1877 = _1871 >= 32768;
    int _1879 = _1871 + (-1024);
    int _1881 = _1879;
    if (_1877)
    {
        int _1883 = ~_1871;
        int _1885 = _1883 + 33792;
        int _1887 = _1885 + 1;
        _1881 = _1887;
    }
    int _1889 = _1881;
    int _1891 = _1889 + 30719;
    float _1893 = float(_1891);
    float _1895 = fma(_1893, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1897 = abs(_1895);
    float _1899 = -_1897;
    float _1901 = _1899 + 1.0;
    float _1903 = abs(_1895);
    float _1905 = fma(_1903, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1907 = _1895 < 0.0;
    float _1909 = float(_1907);
    int _1911 = as_type<int>(_1901) + (-218103808);
    float _1913 = abs(_1895);
    float _1915 = fma(_1913, _1905, -0.212114393711090087890625);
    bool _1917 = uint(_1911) >= 1920991232u;
    float _1919 = -_1564;
    float _1921 = _1919 + _1809;
    float _1923 = abs(_1895);
    float _1925 = fma(_1923, _1915, 1.570728778839111328125);
    float _1927 = fma(_1841, _1921, _1564);
    bool _1929 = !_1917;
    float _1951;
    if (!_1929)
    {
        int _1931 = as_type<int>(_1901);
        int _1933 = as_type<int>(_1831);
        int _1935 = 9600;
        int _1937 = as_type<int>(_1813);
        int _1939;
        int _1941;
        int _1943;
        int _1945;
        int _1947;
        int _1949;
        _96(_1931, _1933, _1935, _1937, _1939, _1941, _1943, _1945, _1947, _1949, out.gl_Position, out.gl_PointSize);
        _1951 = as_type<float>(_1947);
        _1953 = true;
    }
    else
    {
        float _1955 = rsqrt(_1901);
        float _1957 = _1901 * _1955;
        float _1959 = _1955 * 0.5;
        float _1961 = -_1957;
        float _1963 = 0.0 + _1961;
        float _1965 = fma(_1959, _1963, 0.5);
        float _1967 = fma(_1957, _1965, _1957);
        float _1969 = -_1967;
        float _1971 = 0.0 + _1969;
        float _1973 = fma(_1967, _1971, _1901);
        float _1975 = fma(_1959, _1973, _1967);
        _1951 = _1975;
    }
    _1953 = false;
    float _1977 = _1951;
    float _1979 = in.m_55.x;
    float _1981 = in.m_55.y;
    float _1983 = in.m_55.z;
    float _1985 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1987 = log2(_1985);
    float _1989 = _719 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1991 = _781 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1995 = _1993 != 0;
    int _1997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1999 = _1997 != 0;
    int _2001 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2003 = _2001 != 0;
    float _2005 = _717 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2007 = _1983 * 2.0;
    float _2009 = _1979 * 2.0;
    float _2011 = _1983 + _1981;
    float _2013 = _1981 + _1979;
    float _2015 = _1981 * 2.0;
    float _2017 = floor(_2009);
    float _2019 = _2011 + (-1.0);
    float _2021 = _2013 + (-1.0);
    float _2023 = _1981 + (-0.5);
    float _2025 = fma(_2021, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2027 = !_1995;
    int _2029 = _2027 ? 0 : 1;
    float _2031 = floor(_2007);
    float _2033 = _1987 * _141;
    int _2035 = abs(_2029);
    float _2037 = exp2(_2033);
    bool _2039 = _2017 >= 0.0;
    bool _2041 = isnan(_2017);
    bool _2043 = _2039 || _2041;
    bool _2045 = isnan(0.0);
    bool _2047 = _2043 || _2045;
    int _2049 = _2047 ? 0 : 1;
    bool _2051 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2053 = isnan(0.0);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2059 = _2055 || _2057;
    float _2061 = floor(_2015);
    bool _2063 = _2031 > 0.0;
    bool _2065 = _2031 >= 0.0;
    bool _2067 = isnan(_2031);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan(0.0);
    bool _2073 = _2069 || _2071;
    float _2075 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2077 = _2073 ? 0 : 1;
    float _2079 = -_2037;
    float _2081 = _2079 + 1.0;
    bool _2083 = _2017 > 0.0;
    float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2087 = 1.0 + _2085;
    int _2089 = ~_2077;
    int _2091 = _2089 + 1;
    int _2093 = _2091 + 1;
    bool _2095 = !_1999;
    int _2097 = _2095 ? 0 : 1;
    float _2099 = 1.0 / _2087;
    int _2101 = _2093;
    if (!_2063)
    {
        int _2103 = ~_2077;
        int _2105 = _2103 + 1;
        _2101 = _2105;
    }
    int _2107 = _2101;
    float _2109 = in.m_63.x;
    float _2111 = in.m_63.y;
    float _2113 = in.m_63.z;
    bool _2115 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2117 = isnan(1.0);
    bool _2119 = _2115 || _2117;
    bool _2121 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2123 = _2119 || _2121;
    float _2125 = float(_2107);
    float _2127 = _2059 ? _2081 : 0.0;
    int _2129 = abs(_2097);
    float _2131 = float(_2035);
    int _2133 = ~_2049;
    int _2135 = _2133 + 1;
    int _2137 = _2135 + 1;
    int _2139 = _2137;
    if (!_2083)
    {
        int _2141 = ~_2049;
        int _2143 = _2141 + 1;
        _2139 = _2143;
    }
    int _2145 = _2139;
    float _2147 = _2131 * _2125;
    bool _2149 = _2061 > 0.0;
    if (_2123)
    {
        float _2151 = _2127 * _2099;
        _143 = _2151;
    }
    float _2153 = _143;
    float _2155 = float(_2129);
    float _2157 = _2147 * (-2.0);
    float _2159 = float(_2145);
    float _2161 = _1979 + (-0.5);
    bool _2163 = _2061 >= 0.0;
    bool _2165 = isnan(_2061);
    bool _2167 = _2163 || _2165;
    bool _2169 = isnan(0.0);
    bool _2171 = _2167 || _2169;
    float _2173 = fma(_2025, _2157, _2025);
    float _2175 = _1983 + _1979;
    float _2177 = fma(_2157, _2109, _2109);
    bool _2179 = !_2003;
    int _2181 = _2179 ? 0 : 1;
    float _2183 = _2155 * _2159;
    int _2185 = _2171 ? 0 : 1;
    float _2187 = fma(_2161, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2177);
    int _2189 = abs(_2181);
    float _2191 = _2183 * (-2.0);
    int _2193 = ~_2185;
    int _2195 = _2193 + 1;
    int _2197 = _2195 + 1;
    float _2199 = fma(_2173, _2153, _2187);
    int _2201 = _2197;
    if (!_2149)
    {
        int _2203 = ~_2185;
        int _2205 = _2203 + 1;
        _2201 = _2205;
    }
    int _2207 = _2201;
    float _2209 = fma(_2191, _2111, _2111);
    float _2211 = fma(_2075, _2191, _2075);
    float _2213 = float(_2207);
    float _2215 = fma(_2023, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2209);
    float _2217 = float(_2189);
    float _2219 = _2175 + (-1.0);
    float _2221 = fma(_2211, _2153, _2215);
    float _2223 = _1983 + (-0.5);
    float _2225 = _2217 * _2213;
    float _2227 = _2199 * 0.15915493667125701904296875;
    float _2229 = fma(_2219, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2231 = _2221 * 0.15915493667125701904296875;
    float _2233 = _2225 * (-2.0);
    float _2235 = _2227 * 6.283185482025146484375;
    float _2237 = sin(_2235);
    float _2239 = fma(_2233, _2113, _2113);
    float _2241 = fma(_2229, _2233, _2229);
    float _2243 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1873);
    float _2245 = fma(_2223, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2239);
    float _2247 = _2227 * 6.283185482025146484375;
    float _2249 = cos(_2247);
    float _2251 = _1991 * _2243;
    float _2253 = fma(_2241, _2153, _2245);
    float _2255 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1927);
    float _2257 = _2253 * 0.15915493667125701904296875;
    float _2259 = _2231 * 6.283185482025146484375;
    float _2261 = sin(_2259);
    float _2263 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1875);
    float _2265 = _1989 * _2263;
    float _2267 = _2231 * 6.283185482025146484375;
    float _2269 = cos(_2267);
    float _2271 = _2257 * 6.283185482025146484375;
    float _2273 = cos(_2271);
    float _2275 = _2237 * _2261;
    float _2277 = _2249 * _2261;
    float _2279 = _2005 * _2255;
    float _2281 = _2257 * 6.283185482025146484375;
    float _2283 = sin(_2281);
    float _2285 = _2249 * _2269;
    float _2287 = _2237 * _2269;
    float _2289 = _2249 * _2273;
    float _2291 = _2237 * _2273;
    float _2293 = _2269 * _2273;
    float _2295 = _2261 * _2273;
    float _2297 = _2289 * _2265;
    float _2299 = _279 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2301 = fma(_2283, _2285, _2275);
    float _2303 = -_2277;
    float _2305 = fma(_2283, _2287, _2303);
    float _2307 = -_2287;
    float _2309 = fma(_2283, _2277, _2307);
    float _2311 = -_2265;
    float _2313 = _2283 * _2311;
    float _2315 = fma(_2301, _2251, _2297);
    float _2317 = fma(_2283, _2275, _2285);
    float _2319 = _2291 * _2265;
    float _2321 = fma(_2293, _2251, _2313);
    float _2323 = fma(_2309, _2279, _2315);
    float _2325 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2299);
    float _2327 = fma(_2305, _2251, _2319);
    float _2329 = _279 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2331 = fma(_2295, _2279, _2321);
    float _2333 = _2323 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2335 = fma(_2317, _2279, _2327);
    float _2337 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2329);
    float _2339 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2325);
    float _2341 = _2323 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2343 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2333);
    float _2345 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2337);
    float _2347 = _2339 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2349 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2341);
    float _2351 = fma(_2335, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2343);
    float _2353 = _2345 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2355 = _2323 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2357 = fma(_2335, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2349);
    float _2359 = _2347 + _2351;
    float _2361 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2355);
    float _2363 = _2353 + _2357;
    float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2367 = _2359 + _2365;
    float _2369 = fma(_2335, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2361);
    float _2371 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2373 = _2363 + _2371;
    float _2375 = _2367 * _2367;
    float _2377 = fma(_2373, _2373, _2375);
    float _2379 = _279 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2381 = sqrt(_2377);
    float _2383 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2379);
    float _2385 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2383);
    float _2387 = _2385 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2389 = _2387 + _2369;
    bool _2391 = _2381 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2393 = _2387;
    float _2395 = _2345;
    float _2397 = _2359;
    float _2399 = _2335;
    if (!_2391)
    {
        _2393 = _2363;
    }
    float _2401 = _2393;
    float _2403 = _2401;
    if (!_2391)
    {
        _2395 = _2389;
    }
    float _2405 = _2395;
    bool _2407 = !_2391;
    float _2409 = _2405;
    if (!_2407)
    {
        float _2411 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2413 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2415 = _2381 + _2413;
        float _2417 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2419 = _2415 * _2411;
        float _2421 = rsqrt(_2377);
        float _2423 = _2419 * 0.15915493667125701904296875;
        float _2425 = _2423 * 6.283185482025146484375;
        float _2427 = cos(_2425);
        float _2429 = _2423 * 6.283185482025146484375;
        float _2431 = sin(_2429);
        float _2433 = _2427 + (-1.0);
        float _2435 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2437 = fma(_2431, _2417, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2439 = fma(_2389, _2427, _2435);
        float _2441 = _2421 * _2437;
        float _2443 = fma(_2373, _2441, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2445 = fma(_2367, _2441, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2409 = _2439;
        _2403 = _2443;
        _2397 = _2445;
    }
    float _2447 = _2409;
    float _2449 = _2403;
    float _2451 = _2397;
    float _2453 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2455 = _2447 + _2453;
    float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2459 = _2449 + _2457;
    float _2461 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2463 = _2451 + _2461;
    float _2465 = _2455 * _2455;
    float _2467 = fma(_2459, _2459, _2465);
    float _2469 = fma(_2463, _2463, _2467);
    float _2471 = rsqrt(_2469);
    float _2473 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2475 = _2459 * _2473;
    float _2477 = _2463 * _2473;
    float _2479 = _2475 * _2475;
    float _2481 = _2477 * _2477;
    float _2483 = _2479 + _2481;
    float _2485 = sqrt(_2483);
    bool _2487 = _2485 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2491 = _2485 + _2489;
    float _2493 = _2471;
    float _2495 = _2483;
    float _2497 = _2491;
    float _2499 = _2455;
    if (_2487)
    {
        float _2501 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2493 = _2501;
    }
    float _2503 = _2493;
    if (_2487)
    {
        float _2505 = rsqrt(_2483);
        _2495 = _2505;
    }
    float _2507 = _2495;
    float _2509 = _2507;
    if (_2487)
    {
        float _2511 = _2491 * _2503;
        _2497 = _2511;
    }
    float _2513 = _2497;
    if (_2487)
    {
        float _2515 = _2513 * 0.15915493667125701904296875;
        _2399 = _2515;
    }
    float _2517 = _2399;
    float _2519 = _2463;
    float _2521 = _2517;
    if (_2487)
    {
        float _2523 = _2517 * 6.283185482025146484375;
        float _2525 = sin(_2523);
        _2519 = _2525;
    }
    float _2527 = _2519;
    float _2529 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2531 = precise::max(0.0, _2529);
    float _2533 = _2389;
    float _2535 = _2531;
    if (_2487)
    {
        float _2537 = _2517 * 6.283185482025146484375;
        float _2539 = cos(_2537);
        _2533 = _2539;
    }
    float _2541 = _2533;
    float _2543 = -_2473;
    float _2545 = -_2531;
    float _2547 = fma(_2455, _2543, _2545);
    if (_2487)
    {
        float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2535 = _2549;
    }
    float _2551 = _2535;
    float _2553 = sqrt(_2469);
    float _2555 = _2551;
    float _2557 = _2527;
    if (_2487)
    {
        float _2559 = fma(_2527, _2551, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2499 = _2559;
    }
    float _2561 = _2499;
    float _2563 = _2561;
    if (!_2487)
    {
        _2555 = _2475;
    }
    float _2565 = _2555;
    float _2567 = _2565;
    float _2569 = _2541;
    if (_2487)
    {
        float _2571 = _2541 + (-1.0);
        _2557 = _2571;
    }
    float _2573 = _2557;
    float _2575 = 0.0;
    float _2577 = _2573;
    if (_2487)
    {
        float _2579 = _2507 * _2561;
        _2575 = _2579;
    }
    float _2581 = _2575;
    if (!_2487)
    {
        _2563 = _2547;
    }
    float _2583 = _2563;
    float _2585 = _2447 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2587 = _2583;
    if (_2487)
    {
        float _2589 = _2573 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2521 = _2589;
    }
    float _2591 = _2521;
    if (_2487)
    {
        float _2593 = _2475 * _2581;
        _2567 = _2593;
    }
    float _2595 = _2567;
    if (!_2487)
    {
        _2577 = _2477;
    }
    float _2597 = _2577;
    float _2599 = _2597;
    if (_2487)
    {
        float _2601 = _2477 * _2581;
        _2599 = _2601;
    }
    float _2603 = _2599;
    if (!_2487)
    {
        _2509 = _2479;
    }
    float _2605 = _2509;
    float _2607 = _2605;
    if (_2487)
    {
        float _2609 = fma(_2547, _2541, _2591);
        _2587 = _2609;
    }
    float _2611 = _2587;
    if (_2487)
    {
        float _2613 = _2595 * _2595;
        _2607 = _2613;
    }
    float _2615 = _2607;
    if (!_2487)
    {
        _2569 = _2481;
    }
    float _2617 = _2569;
    float _2619 = _2617;
    if (_2487)
    {
        float _2621 = _2603 * _2603;
        _2619 = _2621;
    }
    float _2623 = _2619;
    float _2625 = fma(_2611, _2611, _2615);
    float _2627 = _2447 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2629 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2631 = _2625 + _2623;
    float _2633 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2585);
    float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2637 = fma(_2553, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2635);
    float _2639 = precise::clamp(_2637, 0.0, 1.0);
    float _2641 = _2447 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2643 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2627);
    float _2645 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2633);
    float _2647 = rsqrt(_2631);
    float _2649 = -_2639;
    float _2651 = _2649 + 1.0;
    float _2653 = _2447 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2655 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2641);
    float _2657 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2643);
    float _2659 = _2645 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2661 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2653);
    float _2663 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2655);
    float _2665 = abs(_2651);
    float _2667 = log2(_2665);
    float _2669 = _2657 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2671 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2661);
    float _2673 = _2663 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2675 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2677 = _2671 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2679 = _2673 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2681 = _2647 * _2595;
    float _2683 = _2647 * _2611;
    float _2685 = _2647 * _2603;
    float _2687 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2679);
    float _2689 = _2681 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2691 = -_2675;
    float _2693 = fma(_2691, _2629, 1.0);
    float _2695 = _2673 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2697 = fma(_2659, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2687);
    float _2699 = -_2689;
    float _2701 = fma(_2683, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2699);
    float _2703 = _2667 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2705 = log2(_2693);
    float _2707 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2697);
    float _2709 = -_2685;
    float _2711 = fma(_2709, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2701);
    float _2713 = _2673 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2715 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2695);
    float _2717 = fma(_2711, -0.5, 0.5);
    float _2719 = fma(_2711, 0.5, 0.5);
    float _2721 = exp2(_2703);
    float _2723 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2713);
    float _2725 = fma(_2659, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2715);
    float _2727 = fma(_2719, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2729 = _2683 + 1.0;
    float _2731 = fma(_2659, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2723);
    float _2733 = fma(_2719, _2727, -0.212114393711090087890625);
    float _2735 = 1.0 / _2707;
    float _2737 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2731);
    float _2739 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2725);
    float _2741 = _2705 * 0.693147182464599609375;
    float _2743 = fma(_2719, _2733, 1.570728778839111328125);
    float _2745 = _2741 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2747 = sqrt(_2717);
    float _2749 = -_2683;
    float _2751 = fma(_2721, _2729, _2749);
    float _2753 = fma(_2751, 0.5, 0.5);
    float _2755 = _2737 * _2735;
    float _2757 = _2739 * _2735;
    float _2759 = fma(_2755, 0.5, 0.5);
    float _2761 = fma(_2757, -0.5, 0.5);
    float _2763 = _2747 * 0.636619746685028076171875;
    float3 _7410 = float3(_2759, _2761, _2745);
    float _2765 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7410, float3(0.0), isnan(_7410)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7410, float3(0.0), isnan(_7410)), level(0.0)).x;
    float _2767 = -_2743;
    float _2769 = fma(_2763, _2767, 1.0);
    float3 _7426 = float3(_2759, _2761, _2745);
    float4 _2771 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7426, float3(0.0), isnan(_7426)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7426, float3(0.0), isnan(_7426)), level(0.0)).xyzw;
    float _2773 = _2771.x;
    float _2775 = _2771.y;
    float _2777 = _2771.z;
    float _2779 = _2771.w;
    float2 _7442 = float2(_2769, _2753);
    float3 _2783 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7442, float2(0.0), isnan(_7442)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7442, float2(0.0), isnan(_7442)), level(0.0)).xyz;
    float _2785 = _2783.x;
    float _2787 = _2783.y;
    float _2789 = _2783.z;
    float _2791 = _1925 * _1977;
    float _2793 = _1909 * 2.0;
    float _2795 = _1893 * 3.883221149444580078125;
    bool _2797 = _1875 != 0.0;
    bool _2799 = isnan(_1875);
    bool _2801 = _2797 || _2799;
    bool _2803 = isnan(0.0);
    bool _2805 = _2801 || _2803;
    float _2807 = _2667 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2809 = -_2793;
    float _2811 = fma(_2791, _2809, _2791);
    float _2813 = _2795 * 0.15915493667125701904296875;
    bool _2815 = _1873 == 0.0;
    bool _2817 = !_2805;
    bool _2819 = _2815 && _2817;
    float _2821 = _2673 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2823 = fma(_1909, 3.1415927410125732421875, _2811);
    float _2825 = _2813 * 6.283185482025146484375;
    float _2827 = sin(_2825);
    bool _2829 = _1927 == 0.0;
    bool _2831 = _2829 && _2819;
    float _2833 = -_1713;
    float _2835 = _2833 + _1895;
    float _2837 = _2823 * 0.15915493667125701904296875;
    float _2839 = in.m_65.w;
    float _2841 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2821);
    float _2843 = fma(_1841, _2835, _1713);
    float _2845 = _2813 * 6.283185482025146484375;
    float _2847 = cos(_2845);
    float _2849 = fma(_2659, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2841);
    out.m_67.x = _1674;
    out.m_67.y = _1676;
    float _2851 = _2843;
    float _2853 = _2707;
    float _2855 = _2739;
    if (!_2831)
    {
        float _2857 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2843);
        _2851 = _2857;
    }
    float _2859 = _2851;
    out.m_69.x = _2449;
    out.m_69.y = _2447;
    out.m_69.z = _2451;
    float _2861 = _2837 * 6.283185482025146484375;
    float _2863 = sin(_2861);
    float _2865 = -_2859;
    float _2867 = _2283 * _2865;
    float _2869 = _2291 * _2859;
    float _2871 = exp2(_2807);
    out.m_71.w = _2839;
    float _2873 = -_1847;
    float _2875 = fma(_2863, _2847, _2873);
    float _2877 = -_1849;
    float _2879 = fma(_2863, _2827, _2877);
    float _2881 = fma(_1841, _2875, _1847);
    float _2883 = fma(_1841, _2879, _1849);
    float _2885 = _2881;
    float _2887 = _2883;
    if (!_2831)
    {
        float _2889 = fma(_1873, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2881);
        _2885 = _2889;
    }
    float _2891 = _2885;
    if (!_2831)
    {
        float _2893 = fma(_1927, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2883);
        _2887 = _2893;
    }
    float _2895 = _2887;
    float _2897 = -_2871;
    float _2899 = _2897 + 1.0;
    bool _2901 = _2553 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2903 = isnan(_2553);
    bool _2905 = _2901 || _2903;
    bool _2907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2909 = _2905 || _2907;
    float _2911 = fma(_2293, _2891, _2867);
    float _2913 = _2289 * _2859;
    float _2915 = fma(_2305, _2891, _2869);
    float _2917 = fma(_2669, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2849);
    float _2919 = fma(_2295, _2895, _2911);
    float _2921 = fma(_2301, _2891, _2913);
    float _2923 = fma(_2317, _2895, _2915);
    float _2925 = _2917 + _2707;
    float _2927 = _2899 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2929 = fma(_2309, _2895, _2921);
    float _2931 = _2925 * 0.5;
    float _2933 = _2929 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2935 = _2929 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2937 = _2929 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_73.z = _2931;
    out.m_73.w = _2707;
    float _2939 = fma(_2919, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2933);
    float _2941 = fma(_2919, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2935);
    float _2943 = fma(_2919, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2937);
    out.gl_Position.x = _2737;
    out.gl_Position.y = _2739;
    out.gl_Position.z = _2917;
    out.gl_Position.w = _2707;
    float _2945 = fma(_2923, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2939);
    float _2947 = fma(_2923, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2941);
    float _2949 = fma(_2923, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2943);
    float _2951 = _2939;
    float _2953 = _2917;
    float _2955 = _2737;
    if (!_2909)
    {
        _2951 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2957 = _2951;
    out.m_75.x = _2945;
    out.m_75.y = _2947;
    out.m_75.z = _2949;
    float _2959 = _2957;
    float _2961 = _2957;
    if (!_2909)
    {
        _2853 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2963 = _2853;
    float _2965 = _2963;
    float _2967 = _2963;
    if (!_2909)
    {
        _2953 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2969 = _2953;
    float _2971 = _2969;
    float _2973 = _2969;
    if (!_2909)
    {
        _2855 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2975 = _2855;
    float _2977 = _2975;
    float _2979 = _2975;
    if (!_2909)
    {
        _2955 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2981 = _2955;
    float _2983 = _2927 * _2765;
    float _2985 = -_2927;
    float _2987 = _2985 + 1.0;
    float _2989 = _2779 * _2983;
    float _2991 = _2779 * _2987;
    float _2993 = _2789 * _2983;
    float _2995 = fma(_2785, _2989, _2773);
    float _2997 = fma(_2787, _2989, _2775);
    float _2999 = _2983;
    float _3001 = _2981;
    float _3003 = _2981;
    if (!_2909)
    {
        _2999 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3005 = _2999;
    float _3007 = fma(_2779, _2993, _2777);
    out.m_77.x = _2995;
    out.m_77.y = _2997;
    out.m_77.z = _3007;
    out.m_77.w = _2991;
    bool _3009 = !_2909;
    float _3011 = _3005;
    float _3013 = _3005;
    if (!_3009)
    {
        bool _3015 = _2553 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3017 = isnan(_2553);
        bool _3019 = _3015 || _3017;
        bool _3021 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3023 = _3019 || _3021;
        if (!_3023)
        {
            float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3027 = _2553 + _3025;
            float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3031 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3029;
            float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3037 = 1.0 / _3031;
            float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3041 = _3039 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3047 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3049 = _3047 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3053 = _3051 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3055 = _3027 * _3037;
            float _3057 = precise::clamp(_3055, 0.0, 1.0);
            float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3061 = _3059 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3063 = fma(_3057, _3035, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3065 = fma(_3057, _3061, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3067 = fma(_3057, _3041, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3069 = fma(_3057, _3045, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3071 = fma(_3057, _3049, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3073 = fma(_3057, _3053, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3013 = _3067;
            _2979 = _3071;
            _2961 = _3063;
            _2973 = _3069;
            _2967 = _3065;
            _3003 = _3073;
            _3075 = true;
        }
        else
        {
            bool _3077 = _2553 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3079 = isnan(_2553);
            bool _3081 = _3077 || _3079;
            bool _3083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3085 = _3081 || _3083;
            if (!_3085)
            {
                _2959 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3087 = _2959;
            _2961 = _3087;
            if (!_3085)
            {
                _3011 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3089 = _3011;
            _3013 = _3089;
            if (!_3085)
            {
                _2965 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3091 = _2965;
            _2967 = _3091;
            if (!_3085)
            {
                _2971 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3093 = _2971;
            _2973 = _3093;
            if (!_3085)
            {
                _2977 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3095 = _2977;
            _2979 = _3095;
            if (!_3085)
            {
                _3001 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3097 = _3001;
            bool _3099 = !_3085;
            _3003 = _3097;
            if (!_3099)
            {
                bool _3101 = _2553 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3103 = isnan(_2553);
                bool _3105 = _3101 || _3103;
                bool _3107 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3109 = _3105 || _3107;
                if (!_3109)
                {
                    float _3111 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3113 = _2553 + _3111;
                    float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3117 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3115;
                    float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3123 = 1.0 / _3117;
                    float _3125 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3127 = _3125 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3129 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3131 = _3129 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3133 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3135 = _3133 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3139 = _3137 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3141 = _3113 * _3123;
                    float _3143 = precise::clamp(_3141, 0.0, 1.0);
                    float _3145 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3149 = fma(_3143, _3121, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3151 = fma(_3143, _3147, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3153 = fma(_3143, _3127, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3155 = fma(_3143, _3131, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3157 = fma(_3143, _3135, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3159 = fma(_3143, _3139, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3013 = _3153;
                    _2979 = _3157;
                    _2961 = _3149;
                    _2973 = _3155;
                    _2967 = _3151;
                    _3003 = _3159;
                    _3075 = true;
                }
                else
                {
                    _3013 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2979 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2961 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2973 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2967 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3003 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3075 = false;
    float _3161 = _3013;
    float _3163 = _2979;
    float _3165 = _2961;
    float _3167 = _2973;
    float _3169 = _2967;
    float _3171 = _3003;
    float _3173 = fma(_2947, -0.5, 0.5);
    float _3175 = precise::clamp(_3173, 0.0, 1.0);
    float _3177 = -_3161;
    float _3179 = _3177 + _3163;
    float _3181 = -_3165;
    float _3183 = _3181 + _3167;
    float _3185 = -_3169;
    float _3187 = _3185 + _3171;
    bool _3189 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3191 = fma(_3175, _3179, _3161);
    float _3193 = fma(_3175, _3183, _3165);
    float _3195 = fma(_3175, _3187, _3169);
    float _3197 = _3191 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _3199 = fma(_3193, 0.298911988735198974609375, _3197);
    float _3201 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3203 = fma(_3195, 0.114477999508380889892578125, _3199);
    out.m_79.w = _3201;
    float _3205 = -_3203;
    float _3207 = _3193 + _3205;
    float _3209 = -_3203;
    float _3211 = _3191 + _3209;
    float _3213 = -_3203;
    float _3215 = _3195 + _3213;
    out.m_81.x = 0.0;
    float _3217 = fma(_3207, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3203);
    float _3219 = fma(_3211, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3203);
    float _3221 = fma(_3215, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3203);
    out.m_83.x = _3217;
    out.m_83.y = _3219;
    out.m_83.z = _3221;
    if (!_3189)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3223 = -_2447;
    float _3225 = _3223 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3227 = -_2449;
    float _3229 = _3227 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3231 = -_2451;
    float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3235 = _3225 * _3225;
    float _3237 = fma(_3229, _3229, _3235);
    float _3239 = fma(_3233, _3233, _3237);
    float _3241 = sqrt(_3239);
    float _3243 = rsqrt(_3239);
    float _3245 = -_3241;
    float _3247 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3249 = _3247 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3251 = precise::clamp(_3249, 0.0, 1.0);
    float _3253 = _3229 * _3243;
    float _3255 = _3225 * _3243;
    float _3257 = abs(_3251);
    float _3259 = log2(_3257);
    float _3261 = _3233 * _3243;
    float _3263 = _3253 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3265 = _2947 * _3255;
    float _3267 = -_3255;
    float _3269 = -_3263;
    float _3271 = fma(_3267, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3269);
    float _3273 = fma(_2945, _3253, _3265);
    float _3275 = -_3261;
    float _3277 = fma(_3275, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3271);
    float _3279 = fma(_2949, _3261, _3273);
    float _3281 = precise::clamp(_3279, 0.0, 1.0);
    float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3285 = _3277 + _3283;
    float _3287 = _3259 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3289 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3291 = precise::clamp(_3289, 0.0, 1.0);
    float _3293 = exp2(_3287);
    float _3295 = _3293 * _3291;
    float _3297 = _3281 * _3295;
    float _3299 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3301 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3303 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _3299;
    out.m_81.y = _3301;
    out.m_81.z = _3303;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

