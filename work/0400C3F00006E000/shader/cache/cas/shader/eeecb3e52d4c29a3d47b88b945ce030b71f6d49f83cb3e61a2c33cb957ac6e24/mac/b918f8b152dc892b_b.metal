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
    texture2d<float> vp_t_tcb_C [[id(6)]];
    sampler vp_t_tcb_CSmplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_32Smplr_w [[id(14)]];
    sampler vp_t_tcb_30Smplr_w [[id(15)]];
    sampler vp_t_tcb_1CSmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_55 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_69 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
};

static inline __attribute__((always_inline))
int _84(thread const int& _8046, thread const int& _8047, constant _10& support_buffer)
{
    float _8050 = as_type<float>(support_buffer._m4);
    int _8052 = _8047 + as_type<int>(_8050);
    int _8054 = 1 + _8052;
    float _8056 = support_buffer._m5[_8054].x;
    float _8058 = abs(_8056);
    bool _8060 = _8058 == 1.0;
    if (_8060)
    {
        return _8046;
    }
    float _8062 = float(_8046);
    float _8064 = _8062 / _8058;
    int _8066 = int(_8064);
    return _8066;
}

static inline __attribute__((always_inline))
int _85(thread const int& _8096, thread const int& _8097, constant _10& support_buffer)
{
    float _8100 = as_type<float>(support_buffer._m4);
    int _8102 = _8097 + as_type<int>(_8100);
    int _8104 = 1 + _8102;
    float _8106 = support_buffer._m5[_8104].x;
    bool _8108 = _8106 == 1.0;
    if (_8108)
    {
        return _8096;
    }
    float _8110 = float(_8096);
    float _8112 = _8110 * _8106;
    int _8114 = int(_8112);
    return _8114;
}

static inline __attribute__((always_inline))
void _82(thread int& _8043, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    _8043 = 0;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1383 = false;
    bool _1215 = false;
    bool _999 = false;
    bool _833 = false;
    bool _709 = false;
    bool _471 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _93 = int(_91);
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
        out.m_47.x = 0.0;
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
        float _3196 = as_type<float>(_109);
        out.gl_Position.z = _3196;
    }
    if (!_97)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_123)
    {
        float _129 = float(_93);
        _103 = _129;
    }
    float _131 = _103;
    bool _133 = _127 >= _131;
    bool _135 = !_123;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    float _143 = _141;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _145 = _141 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3266 = as_type<float>(_147);
        out.gl_Position.z = _3266;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _149 = in.m_49.x;
    float _151 = in.m_49.y;
    float _153 = in.m_49.z;
    float _155 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = 0.0;
    float _169 = _155;
    if (!_165)
    {
        float _171 = _155 * _155;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = 0.0;
    float _179 = _175;
    if (!_165)
    {
        float _181 = _127 * _127;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    if (!_165)
    {
        float _187 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _187;
    }
    float _189 = _179;
    bool _191 = !_165;
    float _193 = _189;
    float _195 = 0.0;
    if (!_191)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _155 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _155);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _225;
        _195 = _213;
        _143 = _215;
    }
    float _227 = _193;
    float _229 = _195;
    float _231 = _143;
    bool _233 = !_165;
    float _235 = _231;
    float _237 = _229;
    if (!_233)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _155 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _235 = _245;
        _169 = _257;
    }
    float _259 = _235;
    float _261 = _169;
    float _263 = _259;
    if (!_165)
    {
        _263 = _127;
    }
    float _265 = _263;
    float _267 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _265;
    if (!_165)
    {
        float _271 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _271;
    }
    float _273 = _237;
    bool _275 = !_165;
    float _277 = _273;
    if (!_275)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _127 * _281;
        float _291 = 1.0 / _285;
        float _293 = _287 * 0.693147182464599609375;
        float _295 = exp2(_289);
        float _297 = 1.0 / _293;
        float _299 = _295 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _297, _127);
        float _305 = _303 * _291;
        float _307 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _307;
    }
    float _309 = _277;
    bool _311 = !_165;
    if (!_311)
    {
        float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = log2(_313);
        float _317 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _319 = _317 + 1.0;
        float _321 = 1.0 / _319;
        float _323 = _127 * _315;
        float _325 = exp2(_323);
        float _327 = -_325;
        float _329 = _327 + 1.0;
        float _331 = _329 * _321;
        _269 = _331;
    }
    float _333 = _269;
    float _335 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = fma(_261, _151, _267);
    float _339 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _341 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _343 = fma(_333, _151, _335);
    float _345 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _347 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = fma(_261, _149, _339);
    float _351 = fma(_333, _149, _341);
    float _353 = -_343;
    float _355 = _337 + _353;
    float _357 = fma(_261, _153, _345);
    float _359 = fma(_333, _153, _347);
    float _361 = -_351;
    float _363 = _349 + _361;
    float _365 = _355 * _355;
    float _367 = in.m_51.w;
    float _369 = -_359;
    float _371 = _357 + _369;
    float _373 = _355 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _375 = fma(_363, _363, _365);
    float _377 = in.m_44.x;
    float _379 = in.m_44.y;
    float _381 = in.m_44.z;
    float _383 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _373);
    float _385 = fma(_371, _371, _375);
    float _387 = _355 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _389 = _355 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _391 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _383);
    float _393 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _387);
    float _395 = sqrt(_385);
    float _397 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _389);
    float _399 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _393);
    float _401 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _397);
    float _403 = fma(_349, _367, _377);
    bool _405 = _395 >= 9.9999999747524270787835121154785e-07;
    bool _407 = isnan(_395);
    bool _409 = _405 || _407;
    bool _411 = isnan(9.9999999747524270787835121154785e-07);
    bool _413 = _409 || _411;
    float _415 = fma(_337, _367, _379);
    float _417 = fma(_357, _367, _381);
    float _419 = _367;
    float _421 = _357;
    float _423 = _391;
    if (_413)
    {
        _419 = _399;
    }
    float _425 = _419;
    float _427 = _425;
    if (_413)
    {
        _421 = _401;
    }
    float _429 = _421;
    float _431 = _429;
    if (!_413)
    {
        bool _433 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _435 = !_433;
        if (!_435)
        {
            float _437 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _439 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _441 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _437);
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _439);
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _447);
            float _455 = _449 * _449;
            float _457 = fma(_451, _451, _455);
            float _459 = fma(_453, _453, _457);
            float _461 = rsqrt(_459);
            float _463 = _461 * 9.9999999747524270787835121154785e-07;
            float _465 = _451 * _463;
            float _467 = _449 * _463;
            float _469 = _453 * _463;
            _423 = _467;
            _427 = _465;
            _431 = _469;
            _471 = true;
        }
        else
        {
            float _473 = _151 * _151;
            float _475 = fma(_149, _149, _473);
            float _477 = fma(_153, _153, _475);
            float _479 = sqrt(_477);
            bool _481 = _479 >= 9.9999999747524270787835121154785e-07;
            bool _483 = isnan(_479);
            bool _485 = _481 || _483;
            bool _487 = isnan(9.9999999747524270787835121154785e-07);
            bool _489 = _485 || _487;
            if (!_489)
            {
                float _491 = _379 * _379;
                float _493 = fma(_377, _377, _491);
                float _495 = fma(_381, _381, _493);
                float _497 = sqrt(_495);
                bool _499 = _497 >= 9.9999999747524270787835121154785e-07;
                bool _501 = isnan(_497);
                bool _503 = _499 || _501;
                bool _505 = isnan(9.9999999747524270787835121154785e-07);
                bool _507 = _503 || _505;
                if (!_507)
                {
                    float _509 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _511 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _509);
                    float _513 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _511);
                    float _515 = rsqrt(_513);
                    float _517 = _515 * 9.9999999747524270787835121154785e-07;
                    float _519 = _517 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _521 = _517 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _523 = _517 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _423 = _521;
                    _427 = _519;
                    _431 = _523;
                    _471 = true;
                }
                else
                {
                    float _525 = _379 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _527 = _379 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _529 = _379 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _531 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _525);
                    float _533 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _527);
                    float _535 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _529);
                    float _537 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].z, _531);
                    float _539 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].z, _533);
                    float _541 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
                    float _543 = _537 * _537;
                    float _545 = fma(_539, _539, _543);
                    float _547 = fma(_541, _541, _545);
                    float _549 = rsqrt(_547);
                    float _551 = _549 * 9.9999999747524270787835121154785e-07;
                    float _553 = _539 * _551;
                    float _555 = _537 * _551;
                    float _557 = _541 * _551;
                    _423 = _555;
                    _427 = _553;
                    _431 = _557;
                    _471 = true;
                }
            }
            else
            {
                float _559 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _561 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _563 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _565 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _559);
                float _567 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _561);
                float _569 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _563);
                float _571 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _565);
                float _573 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _567);
                float _575 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _569);
                float _577 = _571 * _571;
                float _579 = fma(_573, _573, _577);
                float _581 = fma(_575, _575, _579);
                float _583 = rsqrt(_581);
                float _585 = _583 * 9.9999999747524270787835121154785e-07;
                float _587 = _573 * _585;
                float _589 = _571 * _585;
                float _591 = _575 * _585;
                _423 = _589;
                _427 = _587;
                _431 = _591;
            }
        }
    }
    _471 = false;
    float _593 = _423;
    float _595 = _427;
    float _597 = _431;
    float _599 = in.m_53.x;
    float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _603 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _605 = _603 * _601;
    float _607 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[20].x, _605);
    float _609 = _607 * 6.283185482025146484375;
    float _611 = floor(_607);
    float _613 = _609 * 0.15915493667125701904296875;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _617 = _615 != 0;
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _621 = _619 != 0;
    float _623 = _613 * 6.283185482025146484375;
    float _625 = cos(_623);
    int _627 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _629 = _627 != 0;
    bool _631 = !_617;
    int _633 = _631 ? 0 : 1;
    float _635 = -_611;
    float _637 = _607 + _635;
    int _639 = abs(_633);
    bool _641 = !_629;
    int _643 = _641 ? 0 : 1;
    bool _645 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _647 = abs(_643);
    float _649 = fma(_625, 0.5, 0.5);
    bool _651 = !_621;
    int _653 = _651 ? 0 : 1;
    float _655 = float(_639);
    float _657 = -_637;
    float _659 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _661 = abs(_653);
    float _663 = -_649;
    float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _667 = abs(_659);
    float _669 = _655 * _667;
    bool _671 = _637 < 0.5;
    float _673 = float(_671);
    float _675 = float(_647);
    float _677 = float(_661);
    float _679 = -_673;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _683 = fma(_675, _665, _669);
    float _685 = abs(_681);
    float _687 = fma(_677, _685, _683);
    bool _689 = !_645;
    bool _691 = _621;
    float _707;
    if (!_689)
    {
        float _693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _695 = _599 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _699 = _697 * _693;
        float _701 = floor(_699);
        float _703 = -_701;
        float _705 = _699 + _703;
        _707 = _705;
        _709 = true;
    }
    else
    {
        float _711 = float(_93);
        float _713 = 1.0 / _711;
        float _715 = _127 * _713;
        _707 = _715;
    }
    _709 = false;
    float _717 = _707;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _721 = _717 + _719;
    bool _723 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _725 = isnan(_717);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _735;
    float _739 = -_733;
    float _741 = _739 + 1.0;
    bool _743 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _745 = isnan(_717);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = 1.0 / _737;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _757;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _761;
    bool _765 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _767 = _753 * _741;
    float _769 = -_753;
    float _771 = _769 + 1.0;
    float _773 = _721 * _755;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _775;
    float _779 = in.m_51.x;
    float _781 = in.m_51.y;
    float _783 = in.m_51.z;
    float _785 = fma(_759, _773, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _787 = fma(_777, _773, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _789 = fma(_763, _773, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _791 = _785 * _767;
    float _793 = _787 * _767;
    float _795 = _789 * _767;
    float _797 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[143].x, _791);
    float _799 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[143].y, _793);
    float _801 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[143].z, _795);
    float _803 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[144].x, _797);
    float _805 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[144].y, _799);
    float _807 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[144].z, _801);
    float _809 = _803 * _779;
    float _811 = _805 * _781;
    float _813 = _807 * _783;
    bool _815 = !_765;
    float _831;
    if (!_815)
    {
        float _817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _819 = _599 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _821 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _823 = _821 * _817;
        float _825 = floor(_823);
        float _827 = -_825;
        float _829 = _823 + _827;
        _831 = _829;
        _833 = true;
    }
    else
    {
        float _835 = float(_93);
        float _837 = 1.0 / _835;
        float _839 = _127 * _837;
        _831 = _839;
    }
    _833 = false;
    float _841 = _831;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _845 = _841 + _843;
    bool _847 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _849 = isnan(_841);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _861 = _841 + _859;
    bool _863 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _865 = isnan(_841);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _875;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _883 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _885 = isnan(_841);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = 1.0 / _877;
    float _897 = -_893;
    float _899 = _897 + 1.0;
    bool _901 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _903 = _873 * _899;
    float _905 = -_873;
    float _907 = _905 + 1.0;
    float _909 = 1.0 / _881;
    float _911 = _845 * _895;
    float _913 = -_857;
    float _915 = _913 + 1.0;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _917;
    float _921 = _893 * _915;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _923;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _927;
    float _931 = fma(_919, _911, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _933 = _861 * _909;
    float _935 = fma(_925, _911, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _937 = fma(_929, _911, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _939 = _931 * _903;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _945 = _935 * _903;
    float _947 = _937 * _903;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _957 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[107].x, _945);
    float _959 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[107].y, _939);
    float _961 = fma(_951, _933, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _963 = fma(_943, _933, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _965 = fma(_955, _933, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _967 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[107].z, _947);
    float _969 = fma(_961, _921, _957);
    float _971 = fma(_963, _921, _959);
    float _973 = fma(_965, _921, _967);
    float _975 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[109].x, _969);
    float _977 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[109].y, _971);
    float _979 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[109].z, _973);
    bool _981 = !_901;
    float _997;
    if (!_981)
    {
        float _983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _985 = _599 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _989 = _987 * _983;
        float _991 = floor(_989);
        float _993 = -_991;
        float _995 = _989 + _993;
        _997 = _995;
        _999 = true;
    }
    else
    {
        float _1001 = float(_93);
        float _1003 = 1.0 / _1001;
        float _1005 = _127 * _1003;
        _997 = _1005;
    }
    _999 = false;
    float _1007 = _997;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1011 = _1007 + _1009;
    float _1013 = _975 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1019;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1025 = _1023 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1027 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1029 = isnan(_1007);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1035 = _1031 || _1033;
    float _1037 = float(_1035);
    float _1039 = 1.0 / _1017;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1043 = _1041 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1045 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1047 = isnan(_1007);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1053 = _1049 || _1051;
    float _1055 = float(_1053);
    float _1057 = _977 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1059 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1061 = 1.0 / _1025;
    float _1063 = _1021 * _1039;
    bool _1065 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1067 = isnan(_1007);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1073 = _1069 || _1071;
    float _1075 = float(_1073);
    float _1077 = 1.0 / _1043;
    float _1079 = -_1037;
    float _1081 = _1079 + 1.0;
    float _1083 = fma(_1063, _1011, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1089 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1091 = isnan(_1007);
    bool _1093 = _1089 || _1091;
    bool _1095 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1097 = _1093 || _1095;
    float _1099 = float(_1097);
    float _1101 = -_1075;
    float _1103 = _1101 + 1.0;
    float _1105 = _1075 * _1081;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1109 = _1107 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1111 = 1.0 / _1087;
    float _1113 = -_1099;
    float _1115 = _1113 + 1.0;
    float _1117 = _1055 * _1103;
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1119;
    float _1123 = _1109 * _1061;
    float _1125 = _1037 * _1115;
    float _1127 = _1083 * _1117;
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1131 = _1007 + _1129;
    float _1133 = -_1055;
    float _1135 = _1133 + 1.0;
    bool _1137 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1139 = isnan(_1007);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1145 = _1141 || _1143;
    float _1147 = float(_1145);
    float _1149 = _1121 * _1077;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1157 = _1007 + _1155;
    float _1159 = fma(_1123, _1131, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1161 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1127);
    float _1163 = -_1147;
    float _1165 = _1163 + 1.0;
    float _1167 = _1153 * _1111;
    float _1169 = fma(_1149, _1157, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1173 = _1007 + _1171;
    float _1175 = fma(_1159, _1105, _1161);
    float _1177 = _1099 * _1165;
    float _1179 = _979 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1181 = fma(_1167, _1173, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1183 = fma(_1169, _1125, _1175);
    float _1185 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1187 = _1179 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1189 = fma(_1181, _1177, _1183);
    float _1191 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1193 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1189);
    float _1195 = _1193 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _1185;
    out.m_55.y = _1191;
    out.m_55.z = _1187;
    out.m_55.w = _1195;
    bool _1197 = !_1059;
    float _1213;
    if (!_1197)
    {
        float _1199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1201 = _599 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1203 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _1205 = _1203 * _1199;
        float _1207 = floor(_1205);
        float _1209 = -_1207;
        float _1211 = _1205 + _1209;
        _1213 = _1211;
        _1215 = true;
    }
    else
    {
        float _1217 = float(_93);
        float _1219 = 1.0 / _1217;
        float _1221 = _127 * _1219;
        _1213 = _1221;
    }
    _1215 = false;
    float _1223 = _1213;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1227 = _1223 + _1225;
    bool _1229 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1231 = isnan(_1223);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1237 = _1233 || _1235;
    float _1239 = float(_1237);
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1243 = _1223 + _1241;
    bool _1245 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1247 = isnan(_1223);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1253 = _1249 || _1251;
    float _1255 = float(_1253);
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1263 = _1261 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1265 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1267 = isnan(_1223);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1273 = _1269 || _1271;
    float _1275 = float(_1273);
    float _1277 = 1.0 / _1259;
    float _1279 = -_1275;
    float _1281 = _1279 + 1.0;
    bool _1283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1285 = _1255 * _1281;
    float _1287 = -_1255;
    float _1289 = _1287 + 1.0;
    float _1291 = 1.0 / _1263;
    float _1293 = _1227 * _1277;
    float _1295 = -_1239;
    float _1297 = _1295 + 1.0;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1299;
    float _1303 = _1275 * _1297;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1305;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1309;
    float _1313 = fma(_1301, _1293, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1315 = _1243 * _1291;
    float _1317 = fma(_1307, _1293, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1319 = fma(_1311, _1293, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1321 = _1313 * _1285;
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1325 = _1323 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1327 = _1317 * _1285;
    float _1329 = _1319 * _1285;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1337 = _1335 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1339 = fma(_1325, _1315, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1341 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1327);
    float _1343 = fma(_1333, _1315, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1345 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1321);
    float _1347 = fma(_1337, _1315, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1349 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1329);
    float _1351 = fma(_1343, _1303, _1341);
    float _1353 = fma(_1339, _1303, _1345);
    float _1355 = fma(_1347, _1303, _1349);
    float _1357 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1351);
    float _1359 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1353);
    float _1361 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1355);
    bool _1363 = !_1283;
    int _1365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1381;
    if (!_1363)
    {
        float _1367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1369 = _599 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1371 = fma(_1369, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _1373 = _1371 * _1367;
        float _1375 = floor(_1373);
        float _1377 = -_1375;
        float _1379 = _1373 + _1377;
        _1381 = _1379;
        _1383 = true;
    }
    else
    {
        float _1385 = float(_93);
        float _1387 = 1.0 / _1385;
        float _1389 = _127 * _1387;
        _1381 = _1389;
    }
    _1383 = false;
    float _1391 = _1381;
    int _1393 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1395 = _1393;
    int _1397 = 0;
    int _1399 = _84(_1395, _1397, (*spvDescriptorSet0.support_buffer));
    float _1401 = in.m_53.y;
    float _1403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1405 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _599);
    float _1407 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1409 = -_1403;
    float _1411 = _1409 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1413 = fma(_1411, _1401, _1403);
    float _1415 = _1407 * _1413;
    float _1417 = float(_1399);
    int _1419 = abs(_1399);
    bool _1421 = _1399 == 0;
    float _1423 = _1415 * _1417;
    float _1425 = float(uint(_1419));
    float _1427 = trunc(_1423);
    int _1429 = int(_1427);
    float _1431 = 1.0 / _1425;
    int _1433 = abs(_1429);
    uint _1436 = uint(int(uint(_1429) >> uint(31)));
    float _1438 = float(uint(_1433));
    int _1440 = ~int(_1436);
    int _1442 = _1440 + 1;
    int _1444 = as_type<int>(_1431) + (-2);
    float _1446 = as_type<float>(_1444) * _1438;
    float _1448 = trunc(_1446);
    float _1450 = precise::max(_1448, 0.0);
    uint _1452 = uint(_1450);
    int _1454 = ~int(_1452);
    int _1456 = _1454 + 1;
    int _1458 = _1456 * _1419;
    int _1460 = _1458 + _1433;
    float _1462 = float(uint(_1460));
    float _1464 = as_type<float>(_1444) * _1462;
    float _1466 = in.m_57.z;
    float _1468 = trunc(_1464);
    float _1470 = precise::max(_1468, 0.0);
    uint _1472 = uint(_1470);
    int _1474 = int(_1452) + int(_1472);
    int _1476 = ~_1474;
    int _1478 = _1476 + 1;
    float _1480 = trunc(_1466);
    int _1482 = int(_1480);
    int _1484 = _1478 * _1419;
    int _1486 = _1484 + _1433;
    bool _1488 = uint(_1486) >= uint(_1419);
    bool _1490 = !_1488;
    int _1492 = _1490 ? 0 : (-1);
    int _1494 = ~_1474;
    int _1496 = _1494 + _1492;
    int _1498 = _1496 + 1;
    int _1500 = _1498 * _1419;
    int _1502 = _1500 + _1433;
    int _1504 = _1502 ^ _1442;
    int _1506 = ~_1442;
    int _1508 = _1506 + _1504;
    int _1510 = _1508 + 1;
    bool _1512 = !_1421;
    int _1514 = _1512 ? _1510 : (-1);
    int _1516 = _1514;
    int _1518 = 0;
    int _1520 = _85(_1516, _1518, (*spvDescriptorSet0.support_buffer));
    int _1522 = _1482;
    int _1524 = 0;
    int _1526 = _85(_1522, _1524, (*spvDescriptorSet0.support_buffer));
    float4 _1529 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1520, _1526)), 0).xyzw;
    float _1531 = _1529.x;
    float _1533 = _1529.y;
    float _1535 = _1529.z;
    float _1537 = _1529.w;
    float _1539 = in.m_57.x;
    float _1541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1543 = in.m_57.y;
    int _1545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1547 = _1545 != 0;
    float _1549 = _1401 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1553 = _1551 != 0;
    float _1555 = in.m_53.z;
    float _1557 = in.m_53.w;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1561 = _1559 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1565 = _1563 != 0;
    float _1567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1571 = _1569 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1575 = _1573 != 0;
    if (_1547)
    {
        bool _1577 = _599 > 0.5;
        _691 = _1577;
    }
    bool _1579 = _691;
    float _1581 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1583 = 0.0;
    if (_1553)
    {
        float _1585 = in.m_53.z;
        _1583 = _1585;
    }
    float _1587 = _1583;
    float _1589 = 1.0 / _1561;
    bool _1591 = _1391 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1593 = isnan(_1391);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1599 = _1595 || _1597;
    float _1601 = float(_1599);
    float _1603 = _1539;
    if (_1547)
    {
        float _1605 = -_1539;
        float _1607 = _1605 + 1.0;
        _1365 = as_type<int>(_1607);
    }
    int _1609 = _1365;
    float _1611 = 0.0;
    if (!_1547)
    {
        _1611 = _1539;
    }
    float _1613 = _1611;
    float _1615 = -_1543;
    float _1617 = _1615 + 1.0;
    float _1619 = _1613;
    if (_1547)
    {
        float _1621 = _1579 ? as_type<float>(_1609) : _1539;
        _1619 = _1621;
    }
    float _1623 = _1619;
    float _1625 = 1.0 / _1571;
    int _1627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1629 = _1627 != 0;
    float _1631 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    bool _1633 = _1557 > 0.5;
    bool _1635 = _1633 && _1565;
    bool _1637 = _1555 > 0.5;
    bool _1639 = _1401 > 0.5;
    bool _1641 = _1639 && _1629;
    float _1643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1645 = _1635 ? _1617 : _1543;
    int _1647 = _1637 ? as_type<int>(_1617) : as_type<int>(_1543);
    int _1649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1651 = _1649 != 0;
    float _1653 = fma(_1645, _1581, -0.5);
    int _1655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1657 = _1655 != 0;
    int _1659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1661 = _1659 != 0;
    float _1663 = _1641 ? _1617 : _1543;
    float _1665 = _599 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1669 = _1667 != 0;
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1675 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1673;
    float _1677 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1679 = _1677 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1681 = -_1671;
    float _1683 = fma(_1665, 2.0, _1681);
    float _1685 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1687 = _1675 * _1589;
    float _1689 = _1657 ? as_type<float>(_1647) : _1543;
    float _1691 = _1679 * _1625;
    bool _1693 = _1657;
    float _1695 = _1631;
    float _1697 = _1555;
    if (_1553)
    {
        bool _1699 = _1587 > 0.5;
        _1693 = _1699;
    }
    bool _1701 = _1693;
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1705 = _1391 + _1703;
    int _1707 = _1661 ? _1647 : as_type<int>(_1543);
    float _1709 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1713 = fma(_1691, _1705, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1715 = fma(_1549, -2.0, _1685);
    float _1717 = fma(_1663, _1709, -0.5);
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1721 = _1391 + _1719;
    bool _1723 = _1391 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1725 = isnan(_1391);
    bool _1727 = _1723 || _1725;
    bool _1729 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1731 = _1727 || _1729;
    float _1733 = float(_1731);
    float _1735 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1737 = _1391 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1739 = isnan(_1391);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1745 = _1741 || _1743;
    int _1747 = _1745 ? 1065353216 : 0;
    float _1749 = fma(_1687, _1721, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1751 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1715);
    float _1753 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1735);
    float _1755 = -_1733;
    float _1757 = _1755 + 1.0;
    bool _1759 = _1401 > 0.5;
    float _1761 = -as_type<float>(_1747);
    float _1763 = _1761 + 1.0;
    float _1765 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1753);
    float _1767 = _1601 * _1757;
    float _1769 = -_1601;
    float _1771 = _1769 + 1.0;
    float _1773 = _1711 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1775 = -_1751;
    float _1777 = fma(_1765, _1717, _1775);
    int _1779 = as_type<int>(_1765);
    int _1781 = _1707;
    float _1783 = _1773;
    float _1785 = _1771;
    bool _1787 = _1701;
    int _1789 = _1747;
    if (_1651)
    {
        float _1791 = -_1539;
        float _1793 = _1791 + 1.0;
        _1779 = as_type<int>(_1793);
    }
    int _1795 = _1779;
    float _1797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1799 = as_type<float>(_1747) * _1771;
    float _1801 = fma(as_type<float>(_1707), _1773, -0.5);
    int _1803 = as_type<int>(_1799);
    if (_1553)
    {
        float _1805 = -_1539;
        float _1807 = _1805 + 1.0;
        _1781 = as_type<int>(_1807);
    }
    int _1809 = _1781;
    if (!_1553)
    {
        _1783 = _1539;
    }
    float _1811 = _1783;
    float _1813 = _1749 * _1799;
    float _1815 = _1811;
    float _1817 = _1813;
    if (_1575)
    {
        float _1819 = -_1539;
        float _1821 = _1819 + 1.0;
        _1803 = as_type<int>(_1821);
    }
    int _1823 = _1803;
    if (!_1575)
    {
        _1785 = _1539;
    }
    float _1825 = _1785;
    float _1827 = fma(_1689, _1631, -0.5);
    float _1829 = _1825;
    if (_1553)
    {
        float _1831 = _1701 ? as_type<float>(_1809) : _1539;
        _1815 = _1831;
    }
    float _1833 = _1815;
    float _1835 = fma(_1763, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1813);
    if (_1575)
    {
        float _1837 = _1759 ? as_type<float>(_1823) : _1539;
        _1829 = _1837;
    }
    float _1839 = _1829;
    float _1841 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_1651)
    {
        float _1843 = _1759 ? as_type<float>(_1795) : _1539;
        _1603 = _1843;
    }
    float _1845 = _1603;
    if (_1669)
    {
        _1787 = false;
    }
    bool _1847 = _1787;
    bool _1849 = _1847;
    if (_1669)
    {
        _1695 = _599;
    }
    float _1851 = _1695;
    float _1853 = 0.0;
    float _1855 = _1851;
    if (_1669)
    {
        _1853 = _1401;
    }
    float _1857 = _1853;
    float _1859 = _1857;
    if (_1669)
    {
        _1789 = as_type<int>(_1555);
    }
    int _1861 = _1789;
    int _1863 = _1861;
    if (!_1669)
    {
        float _1865 = _599 * 3.1415927410125732421875;
        float _1867 = _1865 * 0.15915493667125701904296875;
        float _1869 = _1401 * 3.1415927410125732421875;
        float _1871 = _1869 * 0.15915493667125701904296875;
        float _1873 = _1555 * 3.1415927410125732421875;
        float _1875 = _1867 * 6.283185482025146484375;
        float _1877 = sin(_1875);
        float _1879 = _1873 * 0.15915493667125701904296875;
        float _1881 = _1871 * 6.283185482025146484375;
        float _1883 = sin(_1881);
        float _1885 = _1879 * 6.283185482025146484375;
        float _1887 = sin(_1885);
        _1855 = _1877;
        _1849 = true;
        _1859 = _1883;
        _1863 = as_type<int>(_1887);
        _1817 = _1879;
    }
    float _1889 = _1855;
    bool _1891 = _1849;
    float _1893 = _1859;
    int _1895 = _1863;
    float _1897 = _1817;
    float _1899 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1841);
    float _1901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1903 = _1889 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1905 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1907 = _1897;
    if (_1891)
    {
        _1907 = _1401;
    }
    float _1909 = _1907;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1913 = 0.0;
    float _1915 = _1909;
    if (_1891)
    {
        _1913 = _1401;
    }
    float _1917 = _1913;
    float _1919 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1921 = _1917;
    if (!_1891)
    {
        _1915 = _599;
    }
    float _1923 = _1915;
    float _1925 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1905);
    if (!_1891)
    {
        _1921 = _599;
    }
    float _1927 = _1921;
    float _1929 = fma(_1893, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1919);
    float _1931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1933 = fma(_1713, _1767, _1835);
    float _1935 = _1891 ? as_type<float>(_1895) : _1893;
    float _1937 = -_1911;
    float _1939 = fma(_1903, 2.0, _1937);
    float _1941 = _1797 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1943 = _1891 ? _1893 : _1889;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _1949 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1951 = 0.0;
    if (_1891)
    {
        _1951 = _1555;
    }
    float _1953 = _1951;
    float _1955 = _1901 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1957 = fma(_1941, _1623, -0.5);
    float _1959 = _1953;
    if (!_1891)
    {
        _1697 = _1401;
    }
    float _1961 = _1697;
    float _1963 = -_127;
    float _1965 = fma(_1963, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1683);
    if (!_1891)
    {
        _1959 = _1401;
    }
    float _1967 = _1959;
    float _1969 = fma(_1949, -2.0, _1945);
    float _1971 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1973 = _1931 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1975 = fma(_1955, _1833, -0.5);
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1979 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1971);
    float _1981 = fma(_1973, _1839, -0.5);
    float _1983 = fma(_1927, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1977);
    float _1985 = _1947 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _1987 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _1989 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _1991 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1899);
    float _1993 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _1995 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[98].z, _1989);
    float _1997 = _1943 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _1999 = fma(_1991, _1957, _1965);
    float _2001 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[98].w, _1993);
    float _2003 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1925);
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _2007 = _1935 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _2009 = fma(_1985, _1845, -0.5);
    float _2011 = -_1987;
    float _2013 = fma(_1997, 2.0, _2011);
    float _2015 = -_127;
    float _2017 = fma(_2015, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1939);
    float _2019 = fma(_2007, -2.0, _2005);
    float _2021 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1929);
    float _2023 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1969);
    float _2025 = fma(_1733, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1933);
    float _2027 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2029 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2031 = fma(_2003, _1981, _2017);
    float _2033 = -_2023;
    float _2035 = fma(_2021, _1801, _2033);
    float _2037 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[97].w, _2001);
    float _2039 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[96].y, _2019);
    float _2041 = -_2027;
    float _2043 = fma(_2029, 2.0, _2041);
    float _2045 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1983);
    float _2047 = -_2039;
    float _2049 = fma(_2037, _1827, _2047);
    float _2051 = -_127;
    float _2053 = fma(_2051, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2043);
    int _2055 = _1514 + 1;
    float _2057 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2059 = _1961 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2061 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[97].z, _1995);
    float _2063 = -_127;
    float _2065 = fma(_2063, (*spvDescriptorSet0.vp_c9)._m0[96].x, _2013);
    float _2067 = fma(_2045, _1975, _2053);
    int _2069 = abs(_2055);
    float _2071 = fma(_2059, -2.0, _2057);
    float _2073 = fma(_2061, _2009, _2065);
    float _2075 = _1357 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2077 = float(uint(_2069));
    float _2079 = _1359 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2081 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2083 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1979);
    float _2085 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2071);
    float _2087 = as_type<float>(_1444) * _2077;
    float _2089 = _2075 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2091 = _2079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2093 = _2081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2095 = _2025 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _2097 = as_type<uint>(half2(float2(_1537, 0.0)));
    float _2099 = trunc(_2087);
    float _2101 = precise::max(_2099, 0.0);
    uint _2103 = uint(_2101);
    float _2105 = _2031 + 0.5;
    float _2107 = _2035 + 0.5;
    out.m_59.x = _2089;
    out.m_59.y = _2091;
    out.m_59.z = _2093;
    out.m_59.w = _2095;
    uint _2109 = extract_bits(_2097, 0u, 8u);
    int _2111 = int(_2109) & 255;
    uint _2113 = extract_bits(_2097, 8u, 8u);
    int _2115 = int(_2113) & 255;
    int _2117 = _2115 << 8;
    int _2119 = _2111 | _2117;
    float _2121 = _2073 + 0.5;
    float _2123 = _2049 + 0.5;
    out.m_61.x = _2105;
    out.m_61.y = _2107;
    uint _2125 = uint(int(uint(_2055) >> uint(31)));
    float _2127 = -_2085;
    float _2129 = fma(_2083, _1653, _2127);
    out.m_63.x = _2121;
    out.m_63.y = _2123;
    int _2131 = ~int(_2125);
    int _2133 = _2131 + 1;
    int _2135 = ~int(_2103);
    int _2137 = _2135 + 1;
    int _2139 = _2137 * _1419;
    int _2141 = _2139 + _2069;
    float _2143 = float(uint(_2141));
    float _2145 = as_type<float>(_1444) * _2143;
    float _2147 = trunc(_2145);
    float _2149 = precise::max(_2147, 0.0);
    uint _2151 = uint(_2149);
    int _2153 = int(_2103) + int(_2151);
    int _2155 = ~_2153;
    int _2157 = _2155 + 1;
    int _2159 = _2157 * _1419;
    int _2161 = _2159 + _2069;
    bool _2163 = uint(_2161) >= uint(_1419);
    float _2165 = _2067 + 0.5;
    bool _2167 = !_2163;
    int _2169 = _2167 ? 0 : (-1);
    bool _2171 = _2119 >= 32768;
    int _2173 = ~_2153;
    int _2175 = _2173 + _2169;
    int _2177 = _2175 + 1;
    float _2179 = _2129 + 0.5;
    int _2181 = _2177 * _1419;
    int _2183 = _2181 + _2069;
    int _2185 = _2119 + (-1024);
    int _2187 = _2183 ^ _2133;
    int _2189 = _2185;
    if (_2171)
    {
        int _2191 = ~_2119;
        int _2193 = _2191 + 33792;
        int _2195 = _2193 + 1;
        _2189 = _2195;
    }
    int _2197 = _2189;
    int _2199 = ~_2133;
    int _2201 = _2199 + _2187;
    int _2203 = _2201 + 1;
    int _2205 = _2197 + 30719;
    bool _2207 = !_1421;
    int _2209 = _2207 ? _2203 : (-1);
    float _2211 = float(_2205);
    float _2213 = fma(_2211, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2215 = _1777 + 0.5;
    float _2217 = abs(_2213);
    float _2219 = -_2217;
    float _2221 = _2219 + 1.0;
    int _2223 = as_type<int>(_2221) + (-218103808);
    bool _2225 = uint(_2223) >= 1920991232u;
    float _2227 = _1999 + 0.5;
    bool _2229 = !_2225;
    if (!_2229)
    {
        int _2231;
        _82(_2231, out.gl_Position, out.gl_PointSize);
    }
    int _2233 = _2209;
    int _2235 = 0;
    int _2237 = _85(_2233, _2235, (*spvDescriptorSet0.support_buffer));
    int _2239 = _1482;
    int _2241 = 0;
    int _2243 = _85(_2239, _2241, (*spvDescriptorSet0.support_buffer));
    float4 _2245 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2237, _2243)), 0).xyzw;
    float _2247 = _2245.x;
    float _2249 = _2245.y;
    float _2251 = _2245.z;
    float _2253 = _2245.w;
    float _2255 = floor(_1423);
    float _2257 = -_2255;
    float _2259 = _1423 + _2257;
    uint _2261 = as_type<uint>(half2(float2(_2253, 0.0)));
    float _2263 = -_1531;
    float _2265 = _2263 + _2247;
    float _2267 = -_1533;
    float _2269 = _2267 + _2249;
    float _2271 = -_1535;
    float _2273 = _2271 + _2251;
    uint _2275 = extract_bits(_2261, 0u, 8u);
    int _2277 = int(_2275) & 255;
    uint _2279 = extract_bits(_2261, 8u, 8u);
    int _2281 = int(_2279) & 255;
    int _2283 = _2281 << 8;
    int _2285 = _2277 | _2283;
    float _2287 = fma(_2259, _2265, _1531);
    float _2289 = fma(_2259, _2269, _1533);
    float _2291 = fma(_2259, _2273, _1535);
    bool _2293 = _2285 >= 32768;
    int _2295 = _2285 + (-1024);
    int _2297 = _2295;
    if (_2293)
    {
        int _2299 = ~_2285;
        int _2301 = _2299 + 33792;
        int _2303 = _2301 + 1;
        _2297 = _2303;
    }
    int _2305 = _2297;
    int _2307 = _2305 + 30719;
    float _2309 = float(_2307);
    float _2311 = fma(_2309, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2313 = abs(_2311);
    float _2315 = -_2313;
    float _2317 = _2315 + 1.0;
    int _2319 = as_type<int>(_2317) + (-218103808);
    bool _2321 = uint(_2319) >= 1920991232u;
    bool _2323 = !_2321;
    if (!_2323)
    {
        int _2325;
        _82(_2325, out.gl_Position, out.gl_PointSize);
    }
    float _2327 = _593 * _593;
    float _2329 = _811 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2331 = _809 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2333 = _813 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2335 = fma(_595, _595, _2327);
    float _2337 = fma(_597, _597, _2335);
    float _2339 = rsqrt(_2337);
    float _2341 = _2339 * _597;
    float _2343 = _2339 * _595;
    float _2345 = _2339 * _593;
    float _2347 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2349 = _2341 * _2347;
    float _2351 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2353 = _2343 * _2351;
    float _2355 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2357 = _2345 * _2355;
    bool _2359 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2361 = isnan(0.5);
    bool _2363 = _2359 || _2361;
    bool _2365 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2367 = _2363 || _2365;
    float _2369 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2371 = -_2349;
    float _2373 = fma(_2343, _2369, _2371);
    float _2375 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2377 = -_2353;
    float _2379 = fma(_2345, _2375, _2377);
    float _2381 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2383 = -_2357;
    float _2385 = fma(_2341, _2381, _2383);
    float _2387 = _415 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2389 = _2373 * _2373;
    float _2391 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2289);
    float _2393 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2287);
    float _2395 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2387);
    float _2397 = fma(_2385, _2385, _2389);
    float _2399 = _2329 * _2391;
    float _2401 = _2331 * _2393;
    float _2403 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2395);
    float _2405 = fma(_2379, _2379, _2397);
    float _2407 = _415 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2409 = _415 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2411 = _2399 * _2343;
    float _2413 = rsqrt(_2405);
    float _2415 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2407);
    float _2417 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2409);
    float _2419 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2291);
    float _2421 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2415);
    float _2423 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2417);
    float _2425 = _2333 * _2419;
    float _2427 = _2421 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2429 = _2423 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2431 = _2399 * _2341;
    float _2433 = _2373 * _2413;
    float _2435 = _2385 * _2413;
    float _2437 = _2379 * _2413;
    float _2439 = _2403 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2441 = _2343 * _2433;
    float _2443 = _2427 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2445 = fma(_2401, _2437, _2431);
    float _2447 = _2345 * _2437;
    float _2449 = -_2441;
    float _2451 = fma(_2345, _2435, _2449);
    float _2453 = fma(_2439, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2443);
    float _2455 = fma(_2401, _2435, _2411);
    float _2457 = -_2447;
    float _2459 = fma(_2341, _2433, _2457);
    float _2461 = fma(_2425, _2451, _2445);
    float _2463 = fma(_2429, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2453);
    float _2465 = fma(_2425, _2459, _2455);
    float _2467 = _2429 + _2461;
    float _2469 = _2463 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2471 = _2427 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2473 = _2439 + _2465;
    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2477 = _2467 + _2475;
    float _2479 = 1.0 / _2469;
    float _2481 = fma(_2439, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2471);
    float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2485 = _2473 + _2483;
    float _2487 = _2477 * _2477;
    float _2489 = fma(_2429, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2481);
    float _2491 = fma(_2485, _2485, _2487);
    float _2493 = _2399 * _2345;
    float _2495 = _2489 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2497 = sqrt(_2491);
    float _2499 = fma(_2401, _2433, _2493);
    float _2501 = _2495 + _2469;
    float _2503 = _2341 * _2435;
    float _2505 = _2501 * _2479;
    float _2507 = _2505 * 0.5;
    float _2509 = -_2503;
    float _2511 = fma(_2343, _2437, _2509);
    float _2513 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2515 = fma(_2507, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2513);
    float _2517 = fma(_2425, _2511, _2499);
    float _2519 = _2427 + _2517;
    bool _2521 = _2497 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2523 = 1.0 / _2515;
    float _2525 = _2517;
    float _2527 = _2425;
    float _2529 = _2435;
    float _2531 = _2507;
    float _2533 = _2497;
    float _2535 = _2401;
    float _2537 = _2399;
    float _2539 = _2429;
    if (_2367)
    {
        _2525 = 1.0;
    }
    float _2541 = _2525;
    float _2543 = _2541;
    if (!_2521)
    {
        _2527 = _2473;
    }
    float _2545 = _2527;
    float _2547 = _2545;
    if (!_2521)
    {
        _2529 = _2467;
    }
    float _2549 = _2529;
    float _2551 = _2549;
    if (!_2521)
    {
        _2531 = _2519;
    }
    float _2553 = _2531;
    bool _2555 = !_2521;
    float _2557 = _2553;
    if (!_2555)
    {
        float _2559 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2563 = _2497 + _2561;
        float _2565 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2567 = rsqrt(_2491);
        float _2569 = _2563 * _2559;
        float _2571 = _2569 * 0.15915493667125701904296875;
        float _2573 = _2571 * 6.283185482025146484375;
        float _2575 = cos(_2573);
        float _2577 = _2571 * 6.283185482025146484375;
        float _2579 = sin(_2577);
        float _2581 = _2575 + (-1.0);
        float _2583 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2585 = fma(_2579, _2565, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2587 = fma(_2519, _2575, _2583);
        float _2589 = _2567 * _2585;
        float _2591 = fma(_2485, _2589, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2593 = fma(_2477, _2589, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2533 = _2563;
        _2557 = _2587;
        _2547 = _2591;
        _2551 = _2593;
        _2535 = _2579;
    }
    float _2595 = _2533;
    float _2597 = _2557;
    float _2599 = _2547;
    float _2601 = _2551;
    float _2603 = _2535;
    float _2605 = _2603;
    float _2607 = _2595;
    if (_2367)
    {
        _2605 = 1.0;
    }
    float _2609 = _2605;
    float _2611 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2613 = _2523 * _2611;
    float _2615 = _2609;
    float _2617 = _2613;
    if (!_2367)
    {
        float _2619 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2621 = _2619 * 0.15915493667125701904296875;
        float _2623 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2625 = _2621 * 6.283185482025146484375;
        float _2627 = cos(_2625);
        float _2629 = _2623 * 0.15915493667125701904296875;
        float _2631 = _2621 * 6.283185482025146484375;
        float _2633 = sin(_2631);
        float _2635 = 1.0 / _2627;
        float _2637 = _2629 * 6.283185482025146484375;
        float _2639 = cos(_2637);
        float _2641 = _2633 * _2635;
        float _2643 = _2629 * 6.283185482025146484375;
        float _2645 = sin(_2643);
        float _2647 = _2639 * _2641;
        float _2649 = 1.0 / _2647;
        float _2651 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2653 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2651;
        float _2655 = 1.0 / _2653;
        float _2657 = _2645 * _2649;
        float _2659 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2661 = fma(_2613, _2657, _2659);
        float _2663 = _2661 * _2655;
        float _2665 = precise::clamp(_2663, 0.0, 1.0);
        _2607 = _2621;
        _2537 = _2655;
        _2543 = _2665;
    }
    float _2667 = _2607;
    float _2669 = _2537;
    float _2671 = _2543;
    float _2673 = _2667;
    float _2675 = _2669;
    if (!_2367)
    {
        float _2677 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2679 = _2677 * 0.15915493667125701904296875;
        float _2681 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2683 = _2679 * 6.283185482025146484375;
        float _2685 = cos(_2683);
        float _2687 = _2681 * 0.15915493667125701904296875;
        float _2689 = _2679 * 6.283185482025146484375;
        float _2691 = sin(_2689);
        float _2693 = 1.0 / _2685;
        float _2695 = _2687 * 6.283185482025146484375;
        float _2697 = cos(_2695);
        float _2699 = _2691 * _2693;
        float _2701 = _2687 * 6.283185482025146484375;
        float _2703 = sin(_2701);
        float _2705 = _2697 * _2699;
        float _2707 = 1.0 / _2705;
        float _2709 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2711 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2709;
        float _2713 = 1.0 / _2711;
        float _2715 = _2703 * _2707;
        float _2717 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2719 = fma(_2613, _2715, _2717);
        float _2721 = _2719 * _2713;
        float _2723 = precise::clamp(_2721, 0.0, 1.0);
        float _2725 = -_2723;
        float _2727 = _2725 + 1.0;
        _2673 = _2685;
        _2675 = _2693;
        _2615 = _2727;
    }
    float _2729 = _2673;
    float _2731 = _2675;
    float _2733 = _2615;
    float _2735 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2737 = _2597 + _2735;
    float _2739 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2741 = _2599 + _2739;
    float _2743 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2745 = _2601 + _2743;
    float _2747 = _2737 * _2737;
    float _2749 = fma(_2741, _2741, _2747);
    float _2751 = fma(_2745, _2745, _2749);
    float _2753 = rsqrt(_2751);
    float _2755 = _2753 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2757 = _2741 * _2755;
    float _2759 = _2745 * _2755;
    float _2761 = _2757 * _2757;
    float _2763 = _2759 * _2759;
    float _2765 = _2761 + _2763;
    float _2767 = sqrt(_2765);
    bool _2769 = _2767 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2771 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2773 = _2767 + _2771;
    float _2775 = _2753;
    float _2777 = _2729;
    float _2779 = _2773;
    float _2781 = _2737;
    float _2783 = _2731;
    float _2785 = _2757;
    if (_2769)
    {
        float _2787 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2775 = _2787;
    }
    float _2789 = _2775;
    if (_2769)
    {
        float _2791 = rsqrt(_2765);
        _2777 = _2791;
    }
    float _2793 = _2777;
    float _2795 = _2793;
    if (_2769)
    {
        float _2797 = _2773 * _2789;
        _2779 = _2797;
    }
    float _2799 = _2779;
    if (_2769)
    {
        float _2801 = _2799 * 0.15915493667125701904296875;
        _2617 = _2801;
    }
    float _2803 = _2617;
    float _2805 = _2789;
    if (_2769)
    {
        float _2807 = _2803 * 6.283185482025146484375;
        float _2809 = sin(_2807);
        _2805 = _2809;
    }
    float _2811 = _2805;
    float _2813 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2815 = precise::max(0.0, _2813);
    float _2817 = _2745;
    float _2819 = _2815;
    if (_2769)
    {
        float _2821 = _2803 * 6.283185482025146484375;
        float _2823 = cos(_2821);
        _2817 = _2823;
    }
    float _2825 = _2817;
    float _2827 = -_2755;
    float _2829 = -_2815;
    float _2831 = fma(_2737, _2827, _2829);
    if (!_2769)
    {
        _2781 = _2759;
    }
    float _2833 = _2781;
    float _2835 = _2833;
    if (_2769)
    {
        float _2837 = _2831 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2819 = _2837;
    }
    float _2839 = _2819;
    float _2841 = sqrt(_2751);
    float _2843 = _2811;
    float _2845 = _2839;
    if (_2769)
    {
        float _2847 = fma(_2811, _2839, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2783 = _2847;
    }
    float _2849 = _2783;
    float _2851 = _2849;
    if (!_2769)
    {
        _2843 = _2761;
    }
    float _2853 = _2843;
    float _2855 = _2853;
    if (_2769)
    {
        float _2857 = _2825 + (-1.0);
        _2845 = _2857;
    }
    float _2859 = _2845;
    float _2861 = _2859;
    if (_2769)
    {
        float _2863 = _2793 * _2849;
        _2539 = _2863;
    }
    float _2865 = _2539;
    if (!_2769)
    {
        _2851 = _2831;
    }
    float _2867 = _2851;
    float _2869 = _2867;
    if (_2769)
    {
        float _2871 = _2859 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2795 = _2871;
    }
    float _2873 = _2795;
    if (_2769)
    {
        float _2875 = _2757 * _2865;
        _2785 = _2875;
    }
    float _2877 = _2785;
    if (_2769)
    {
        float _2879 = _2759 * _2865;
        _2835 = _2879;
    }
    float _2881 = _2835;
    if (!_2769)
    {
        _2861 = _2763;
    }
    float _2883 = _2861;
    float _2885 = _2883;
    if (_2769)
    {
        float _2887 = fma(_2831, _2825, _2873);
        _2869 = _2887;
    }
    float _2889 = _2869;
    if (_2769)
    {
        float _2891 = _2877 * _2877;
        _2855 = _2891;
    }
    float _2893 = _2855;
    if (_2769)
    {
        float _2895 = _2881 * _2881;
        _2885 = _2895;
    }
    float _2897 = _2885;
    float _2899 = fma(_2889, _2889, _2893);
    float _2901 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2903 = fma(_2841, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2901);
    float _2905 = precise::clamp(_2903, 0.0, 1.0);
    float _2907 = _2899 + _2897;
    float _2909 = _2597 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2911 = _2597 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2913 = -_2905;
    float _2915 = _2913 + 1.0;
    float _2917 = rsqrt(_2907);
    float _2919 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2909);
    float _2921 = _2597 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2923 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2911);
    float _2925 = _2597 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2927 = fma(_2601, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2919);
    float _2929 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2921);
    float _2931 = fma(_2601, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2923);
    float _2933 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2925);
    float _2935 = abs(_2915);
    float _2937 = log2(_2935);
    float _2939 = fma(_2601, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2929);
    float _2941 = _2931 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2943 = fma(_2601, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2933);
    float _2945 = _2927 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2947 = _2939 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2949 = _2941 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2951 = _2917 * _2877;
    float _2953 = _2917 * _2889;
    float _2955 = _2917 * _2881;
    float _2957 = fma(_2947, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2949);
    float _2959 = _2951 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2961 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2963 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2965 = _2943 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2967 = -_2959;
    float _2969 = fma(_2953, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2967);
    float _2971 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2957);
    float _2973 = -_2963;
    float _2975 = fma(_2973, _2961, 1.0);
    float _2977 = _2937 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2979 = -_2955;
    float _2981 = fma(_2979, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2969);
    float _2983 = fma(_2965, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2971);
    float _2985 = _2941 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2987 = _2941 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2989 = fma(_2981, -0.5, 0.5);
    float _2991 = log2(_2975);
    float _2993 = fma(_2947, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2985);
    float _2995 = fma(_2981, 0.5, 0.5);
    float _2997 = fma(_2947, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2987);
    float _2999 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2993);
    float _3001 = fma(_2995, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3003 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2997);
    float _3005 = 1.0 / _2983;
    float _3007 = fma(_2965, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2999);
    float _3009 = fma(_2995, _3001, -0.212114393711090087890625);
    float _3011 = fma(_2965, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3003);
    float _3013 = fma(_2995, _3009, 1.570728778839111328125);
    float _3015 = exp2(_2977);
    float _3017 = _2991 * 0.693147182464599609375;
    float _3019 = _3017 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3021 = sqrt(_2989);
    float _3023 = _2953 + 1.0;
    float _3025 = _3007 * _3005;
    float _3027 = _3011 * _3005;
    float _3029 = fma(_3025, 0.5, 0.5);
    float _3031 = fma(_3027, -0.5, 0.5);
    float _3033 = -_2953;
    float _3035 = fma(_3015, _3023, _3033);
    float _3037 = fma(_3035, 0.5, 0.5);
    float _3039 = _3021 * 0.636619746685028076171875;
    float3 _7844 = float3(_3029, _3031, _3019);
    float _3041 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7844, float3(0.0), isnan(_7844)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7844, float3(0.0), isnan(_7844)), level(0.0)).x;
    float3 _7855 = float3(_3029, _3031, _3019);
    float4 _3043 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7855, float3(0.0), isnan(_7855)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7855, float3(0.0), isnan(_7855)), level(0.0)).xyzw;
    float _3045 = _3043.x;
    float _3047 = _3043.y;
    float _3049 = _3043.z;
    float _3051 = _3043.w;
    float _3053 = -_3013;
    float _3055 = fma(_3039, _3053, 1.0);
    float2 _7876 = float2(_3055, _3037);
    float3 _3059 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7876, float2(0.0), isnan(_7876)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7876, float2(0.0), isnan(_7876)), level(0.0)).xyz;
    float _3061 = _3059.x;
    float _3063 = _3059.y;
    float _3065 = _3059.z;
    float _3067 = _2937 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3069 = _2941 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3071 = _2671 * _2733;
    bool _3073 = _2671 > 0.0;
    bool _3075 = isnan(_2671);
    bool _3077 = _3073 || _3075;
    bool _3079 = isnan(0.0);
    bool _3081 = _3077 || _3079;
    out.m_65.x = _2227;
    out.m_65.y = _2215;
    out.m_65.z = _2165;
    out.m_65.w = _2179;
    float _3083 = fma(_2947, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3069);
    float _3085 = exp2(_3067);
    float _3087 = _3071 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3089 = _2983 * 0.5;
    float _3091 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3083);
    bool _3093 = _2733 <= 0.0;
    bool _3095 = !_3081;
    bool _3097 = _3093 || _3095;
    float _3099 = _687 * _3087;
    float _3101 = _3007 + _2983;
    float _3103 = fma(_2965, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3091);
    float _3105 = _3099 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3107 = fma(_3011, -0.5, _3089);
    float _3109 = _3103 + _2983;
    float _3111 = _3101 * 0.5;
    out.gl_Position.x = _3007;
    out.gl_Position.y = _3011;
    out.gl_Position.z = _3103;
    out.gl_Position.w = _2983;
    float _3113 = _3109 * 0.5;
    float _3115 = -_3085;
    float _3117 = _3115 + 1.0;
    out.m_47.x = _3105;
    float _3119 = _3117 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _3111;
    out.m_67.y = _3107;
    out.m_67.z = _3113;
    out.m_67.w = _2983;
    float _3121 = -_3119;
    float _3123 = _3121 + 1.0;
    float _3125 = _3119 * _3041;
    float _3127 = _3051 * _3125;
    float _3129 = _3051 * _3123;
    float _3131 = _3065 * _3125;
    float _3133 = fma(_3061, _3127, _3045);
    float _3135 = fma(_3063, _3127, _3047);
    float _3137 = fma(_3051, _3131, _3049);
    out.m_69.x = _3133;
    out.m_69.y = _3135;
    out.m_69.z = _3137;
    out.m_69.w = _3129;
    if (!_3097)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _3139 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3139;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1383 = false;
    bool _1215 = false;
    bool _999 = false;
    bool _833 = false;
    bool _709 = false;
    bool _471 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _93 = int(_91);
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
        out.m_47.x = 0.0;
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
        float _3196 = as_type<float>(_109);
        out.gl_Position.z = _3196;
    }
    if (!_97)
    {
        return out;
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_123)
    {
        float _129 = float(_93);
        _103 = _129;
    }
    float _131 = _103;
    bool _133 = _127 >= _131;
    bool _135 = !_123;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    float _143 = _141;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _145 = _141 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3266 = as_type<float>(_147);
        out.gl_Position.z = _3266;
    }
    if (_137)
    {
        return out;
    }
    float _149 = in.m_49.x;
    float _151 = in.m_49.y;
    float _153 = in.m_49.z;
    float _155 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = 0.0;
    float _169 = _155;
    if (!_165)
    {
        float _171 = _155 * _155;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = 0.0;
    float _179 = _175;
    if (!_165)
    {
        float _181 = _127 * _127;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    if (!_165)
    {
        float _187 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _187;
    }
    float _189 = _179;
    bool _191 = !_165;
    float _193 = _189;
    float _195 = 0.0;
    if (!_191)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _155 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _155);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _225;
        _195 = _213;
        _143 = _215;
    }
    float _227 = _193;
    float _229 = _195;
    float _231 = _143;
    bool _233 = !_165;
    float _235 = _231;
    float _237 = _229;
    if (!_233)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _155 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _235 = _245;
        _169 = _257;
    }
    float _259 = _235;
    float _261 = _169;
    float _263 = _259;
    if (!_165)
    {
        _263 = _127;
    }
    float _265 = _263;
    float _267 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _265;
    if (!_165)
    {
        float _271 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _271;
    }
    float _273 = _237;
    bool _275 = !_165;
    float _277 = _273;
    if (!_275)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _127 * _281;
        float _291 = 1.0 / _285;
        float _293 = _287 * 0.693147182464599609375;
        float _295 = exp2(_289);
        float _297 = 1.0 / _293;
        float _299 = _295 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _297, _127);
        float _305 = _303 * _291;
        float _307 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _307;
    }
    float _309 = _277;
    bool _311 = !_165;
    if (!_311)
    {
        float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = log2(_313);
        float _317 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _319 = _317 + 1.0;
        float _321 = 1.0 / _319;
        float _323 = _127 * _315;
        float _325 = exp2(_323);
        float _327 = -_325;
        float _329 = _327 + 1.0;
        float _331 = _329 * _321;
        _269 = _331;
    }
    float _333 = _269;
    float _335 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = fma(_261, _151, _267);
    float _339 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _341 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _343 = fma(_333, _151, _335);
    float _345 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _347 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = fma(_261, _149, _339);
    float _351 = fma(_333, _149, _341);
    float _353 = -_343;
    float _355 = _337 + _353;
    float _357 = fma(_261, _153, _345);
    float _359 = fma(_333, _153, _347);
    float _361 = -_351;
    float _363 = _349 + _361;
    float _365 = _355 * _355;
    float _367 = in.m_51.w;
    float _369 = -_359;
    float _371 = _357 + _369;
    float _373 = _355 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _375 = fma(_363, _363, _365);
    float _377 = in.m_44.x;
    float _379 = in.m_44.y;
    float _381 = in.m_44.z;
    float _383 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _373);
    float _385 = fma(_371, _371, _375);
    float _387 = _355 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _389 = _355 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _391 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _383);
    float _393 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _387);
    float _395 = sqrt(_385);
    float _397 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _389);
    float _399 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _393);
    float _401 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _397);
    float _403 = fma(_349, _367, _377);
    bool _405 = _395 >= 9.9999999747524270787835121154785e-07;
    bool _407 = isnan(_395);
    bool _409 = _405 || _407;
    bool _411 = isnan(9.9999999747524270787835121154785e-07);
    bool _413 = _409 || _411;
    float _415 = fma(_337, _367, _379);
    float _417 = fma(_357, _367, _381);
    float _419 = _367;
    float _421 = _357;
    float _423 = _391;
    if (_413)
    {
        _419 = _399;
    }
    float _425 = _419;
    float _427 = _425;
    if (_413)
    {
        _421 = _401;
    }
    float _429 = _421;
    float _431 = _429;
    if (!_413)
    {
        bool _433 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _435 = !_433;
        if (!_435)
        {
            float _437 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _439 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _441 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _437);
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _439);
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _447);
            float _455 = _449 * _449;
            float _457 = fma(_451, _451, _455);
            float _459 = fma(_453, _453, _457);
            float _461 = rsqrt(_459);
            float _463 = _461 * 9.9999999747524270787835121154785e-07;
            float _465 = _451 * _463;
            float _467 = _449 * _463;
            float _469 = _453 * _463;
            _423 = _467;
            _427 = _465;
            _431 = _469;
            _471 = true;
        }
        else
        {
            float _473 = _151 * _151;
            float _475 = fma(_149, _149, _473);
            float _477 = fma(_153, _153, _475);
            float _479 = sqrt(_477);
            bool _481 = _479 >= 9.9999999747524270787835121154785e-07;
            bool _483 = isnan(_479);
            bool _485 = _481 || _483;
            bool _487 = isnan(9.9999999747524270787835121154785e-07);
            bool _489 = _485 || _487;
            if (!_489)
            {
                float _491 = _379 * _379;
                float _493 = fma(_377, _377, _491);
                float _495 = fma(_381, _381, _493);
                float _497 = sqrt(_495);
                bool _499 = _497 >= 9.9999999747524270787835121154785e-07;
                bool _501 = isnan(_497);
                bool _503 = _499 || _501;
                bool _505 = isnan(9.9999999747524270787835121154785e-07);
                bool _507 = _503 || _505;
                if (!_507)
                {
                    float _509 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _511 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _509);
                    float _513 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _511);
                    float _515 = rsqrt(_513);
                    float _517 = _515 * 9.9999999747524270787835121154785e-07;
                    float _519 = _517 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _521 = _517 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _523 = _517 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _423 = _521;
                    _427 = _519;
                    _431 = _523;
                    _471 = true;
                }
                else
                {
                    float _525 = _379 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _527 = _379 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _529 = _379 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _531 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _525);
                    float _533 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _527);
                    float _535 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _529);
                    float _537 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].z, _531);
                    float _539 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].z, _533);
                    float _541 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
                    float _543 = _537 * _537;
                    float _545 = fma(_539, _539, _543);
                    float _547 = fma(_541, _541, _545);
                    float _549 = rsqrt(_547);
                    float _551 = _549 * 9.9999999747524270787835121154785e-07;
                    float _553 = _539 * _551;
                    float _555 = _537 * _551;
                    float _557 = _541 * _551;
                    _423 = _555;
                    _427 = _553;
                    _431 = _557;
                    _471 = true;
                }
            }
            else
            {
                float _559 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _561 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _563 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _565 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _559);
                float _567 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _561);
                float _569 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _563);
                float _571 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _565);
                float _573 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _567);
                float _575 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _569);
                float _577 = _571 * _571;
                float _579 = fma(_573, _573, _577);
                float _581 = fma(_575, _575, _579);
                float _583 = rsqrt(_581);
                float _585 = _583 * 9.9999999747524270787835121154785e-07;
                float _587 = _573 * _585;
                float _589 = _571 * _585;
                float _591 = _575 * _585;
                _423 = _589;
                _427 = _587;
                _431 = _591;
            }
        }
    }
    _471 = false;
    float _593 = _423;
    float _595 = _427;
    float _597 = _431;
    float _599 = in.m_53.x;
    float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _603 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _605 = _603 * _601;
    float _607 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[20].x, _605);
    float _609 = _607 * 6.283185482025146484375;
    float _611 = floor(_607);
    float _613 = _609 * 0.15915493667125701904296875;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _617 = _615 != 0;
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _621 = _619 != 0;
    float _623 = _613 * 6.283185482025146484375;
    float _625 = cos(_623);
    int _627 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _629 = _627 != 0;
    bool _631 = !_617;
    int _633 = _631 ? 0 : 1;
    float _635 = -_611;
    float _637 = _607 + _635;
    int _639 = abs(_633);
    bool _641 = !_629;
    int _643 = _641 ? 0 : 1;
    bool _645 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _647 = abs(_643);
    float _649 = fma(_625, 0.5, 0.5);
    bool _651 = !_621;
    int _653 = _651 ? 0 : 1;
    float _655 = float(_639);
    float _657 = -_637;
    float _659 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _661 = abs(_653);
    float _663 = -_649;
    float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _667 = abs(_659);
    float _669 = _655 * _667;
    bool _671 = _637 < 0.5;
    float _673 = float(_671);
    float _675 = float(_647);
    float _677 = float(_661);
    float _679 = -_673;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _683 = fma(_675, _665, _669);
    float _685 = abs(_681);
    float _687 = fma(_677, _685, _683);
    bool _689 = !_645;
    bool _691 = _621;
    float _707;
    if (!_689)
    {
        float _693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _695 = _599 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _699 = _697 * _693;
        float _701 = floor(_699);
        float _703 = -_701;
        float _705 = _699 + _703;
        _707 = _705;
        _709 = true;
    }
    else
    {
        float _711 = float(_93);
        float _713 = 1.0 / _711;
        float _715 = _127 * _713;
        _707 = _715;
    }
    _709 = false;
    float _717 = _707;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _721 = _717 + _719;
    bool _723 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _725 = isnan(_717);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _735;
    float _739 = -_733;
    float _741 = _739 + 1.0;
    bool _743 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _745 = isnan(_717);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = 1.0 / _737;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _757;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _761;
    bool _765 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _767 = _753 * _741;
    float _769 = -_753;
    float _771 = _769 + 1.0;
    float _773 = _721 * _755;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _775;
    float _779 = in.m_51.x;
    float _781 = in.m_51.y;
    float _783 = in.m_51.z;
    float _785 = fma(_759, _773, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _787 = fma(_777, _773, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _789 = fma(_763, _773, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _791 = _785 * _767;
    float _793 = _787 * _767;
    float _795 = _789 * _767;
    float _797 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[143].x, _791);
    float _799 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[143].y, _793);
    float _801 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[143].z, _795);
    float _803 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[144].x, _797);
    float _805 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[144].y, _799);
    float _807 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[144].z, _801);
    float _809 = _803 * _779;
    float _811 = _805 * _781;
    float _813 = _807 * _783;
    bool _815 = !_765;
    float _831;
    if (!_815)
    {
        float _817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _819 = _599 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _821 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _823 = _821 * _817;
        float _825 = floor(_823);
        float _827 = -_825;
        float _829 = _823 + _827;
        _831 = _829;
        _833 = true;
    }
    else
    {
        float _835 = float(_93);
        float _837 = 1.0 / _835;
        float _839 = _127 * _837;
        _831 = _839;
    }
    _833 = false;
    float _841 = _831;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _845 = _841 + _843;
    bool _847 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _849 = isnan(_841);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _861 = _841 + _859;
    bool _863 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _865 = isnan(_841);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _875;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _883 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _885 = isnan(_841);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = 1.0 / _877;
    float _897 = -_893;
    float _899 = _897 + 1.0;
    bool _901 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _903 = _873 * _899;
    float _905 = -_873;
    float _907 = _905 + 1.0;
    float _909 = 1.0 / _881;
    float _911 = _845 * _895;
    float _913 = -_857;
    float _915 = _913 + 1.0;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _917;
    float _921 = _893 * _915;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _923;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _927;
    float _931 = fma(_919, _911, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _933 = _861 * _909;
    float _935 = fma(_925, _911, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _937 = fma(_929, _911, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _939 = _931 * _903;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _945 = _935 * _903;
    float _947 = _937 * _903;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _957 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[107].x, _945);
    float _959 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[107].y, _939);
    float _961 = fma(_951, _933, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _963 = fma(_943, _933, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _965 = fma(_955, _933, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _967 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[107].z, _947);
    float _969 = fma(_961, _921, _957);
    float _971 = fma(_963, _921, _959);
    float _973 = fma(_965, _921, _967);
    float _975 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[109].x, _969);
    float _977 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[109].y, _971);
    float _979 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[109].z, _973);
    bool _981 = !_901;
    float _997;
    if (!_981)
    {
        float _983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _985 = _599 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _989 = _987 * _983;
        float _991 = floor(_989);
        float _993 = -_991;
        float _995 = _989 + _993;
        _997 = _995;
        _999 = true;
    }
    else
    {
        float _1001 = float(_93);
        float _1003 = 1.0 / _1001;
        float _1005 = _127 * _1003;
        _997 = _1005;
    }
    _999 = false;
    float _1007 = _997;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1011 = _1007 + _1009;
    float _1013 = _975 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1019;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1025 = _1023 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1027 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1029 = isnan(_1007);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1035 = _1031 || _1033;
    float _1037 = float(_1035);
    float _1039 = 1.0 / _1017;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1043 = _1041 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1045 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1047 = isnan(_1007);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1053 = _1049 || _1051;
    float _1055 = float(_1053);
    float _1057 = _977 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1059 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1061 = 1.0 / _1025;
    float _1063 = _1021 * _1039;
    bool _1065 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1067 = isnan(_1007);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1073 = _1069 || _1071;
    float _1075 = float(_1073);
    float _1077 = 1.0 / _1043;
    float _1079 = -_1037;
    float _1081 = _1079 + 1.0;
    float _1083 = fma(_1063, _1011, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1089 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1091 = isnan(_1007);
    bool _1093 = _1089 || _1091;
    bool _1095 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1097 = _1093 || _1095;
    float _1099 = float(_1097);
    float _1101 = -_1075;
    float _1103 = _1101 + 1.0;
    float _1105 = _1075 * _1081;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1109 = _1107 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1111 = 1.0 / _1087;
    float _1113 = -_1099;
    float _1115 = _1113 + 1.0;
    float _1117 = _1055 * _1103;
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1119;
    float _1123 = _1109 * _1061;
    float _1125 = _1037 * _1115;
    float _1127 = _1083 * _1117;
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1131 = _1007 + _1129;
    float _1133 = -_1055;
    float _1135 = _1133 + 1.0;
    bool _1137 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1139 = isnan(_1007);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1145 = _1141 || _1143;
    float _1147 = float(_1145);
    float _1149 = _1121 * _1077;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1157 = _1007 + _1155;
    float _1159 = fma(_1123, _1131, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1161 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1127);
    float _1163 = -_1147;
    float _1165 = _1163 + 1.0;
    float _1167 = _1153 * _1111;
    float _1169 = fma(_1149, _1157, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1173 = _1007 + _1171;
    float _1175 = fma(_1159, _1105, _1161);
    float _1177 = _1099 * _1165;
    float _1179 = _979 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1181 = fma(_1167, _1173, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1183 = fma(_1169, _1125, _1175);
    float _1185 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1187 = _1179 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1189 = fma(_1181, _1177, _1183);
    float _1191 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1193 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1189);
    float _1195 = _1193 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _1185;
    out.m_55.y = _1191;
    out.m_55.z = _1187;
    out.m_55.w = _1195;
    bool _1197 = !_1059;
    float _1213;
    if (!_1197)
    {
        float _1199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1201 = _599 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1203 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _1205 = _1203 * _1199;
        float _1207 = floor(_1205);
        float _1209 = -_1207;
        float _1211 = _1205 + _1209;
        _1213 = _1211;
        _1215 = true;
    }
    else
    {
        float _1217 = float(_93);
        float _1219 = 1.0 / _1217;
        float _1221 = _127 * _1219;
        _1213 = _1221;
    }
    _1215 = false;
    float _1223 = _1213;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1227 = _1223 + _1225;
    bool _1229 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1231 = isnan(_1223);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1237 = _1233 || _1235;
    float _1239 = float(_1237);
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1243 = _1223 + _1241;
    bool _1245 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1247 = isnan(_1223);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1253 = _1249 || _1251;
    float _1255 = float(_1253);
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1263 = _1261 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1265 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1267 = isnan(_1223);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1273 = _1269 || _1271;
    float _1275 = float(_1273);
    float _1277 = 1.0 / _1259;
    float _1279 = -_1275;
    float _1281 = _1279 + 1.0;
    bool _1283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1285 = _1255 * _1281;
    float _1287 = -_1255;
    float _1289 = _1287 + 1.0;
    float _1291 = 1.0 / _1263;
    float _1293 = _1227 * _1277;
    float _1295 = -_1239;
    float _1297 = _1295 + 1.0;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1299;
    float _1303 = _1275 * _1297;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1305;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1309;
    float _1313 = fma(_1301, _1293, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1315 = _1243 * _1291;
    float _1317 = fma(_1307, _1293, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1319 = fma(_1311, _1293, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1321 = _1313 * _1285;
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1325 = _1323 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1327 = _1317 * _1285;
    float _1329 = _1319 * _1285;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1337 = _1335 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1339 = fma(_1325, _1315, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1341 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1327);
    float _1343 = fma(_1333, _1315, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1345 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1321);
    float _1347 = fma(_1337, _1315, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1349 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1329);
    float _1351 = fma(_1343, _1303, _1341);
    float _1353 = fma(_1339, _1303, _1345);
    float _1355 = fma(_1347, _1303, _1349);
    float _1357 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1351);
    float _1359 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1353);
    float _1361 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1355);
    bool _1363 = !_1283;
    int _1365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1381;
    if (!_1363)
    {
        float _1367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1369 = _599 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1371 = fma(_1369, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _1373 = _1371 * _1367;
        float _1375 = floor(_1373);
        float _1377 = -_1375;
        float _1379 = _1373 + _1377;
        _1381 = _1379;
        _1383 = true;
    }
    else
    {
        float _1385 = float(_93);
        float _1387 = 1.0 / _1385;
        float _1389 = _127 * _1387;
        _1381 = _1389;
    }
    _1383 = false;
    float _1391 = _1381;
    int _1393 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1395 = _1393;
    int _1397 = 0;
    int _1399 = _84(_1395, _1397, (*spvDescriptorSet0.support_buffer));
    float _1401 = in.m_53.y;
    float _1403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1405 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _599);
    float _1407 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1409 = -_1403;
    float _1411 = _1409 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1413 = fma(_1411, _1401, _1403);
    float _1415 = _1407 * _1413;
    float _1417 = float(_1399);
    int _1419 = abs(_1399);
    bool _1421 = _1399 == 0;
    float _1423 = _1415 * _1417;
    float _1425 = float(uint(_1419));
    float _1427 = trunc(_1423);
    int _1429 = int(_1427);
    float _1431 = 1.0 / _1425;
    int _1433 = abs(_1429);
    uint _1436 = uint(int(uint(_1429) >> uint(31)));
    float _1438 = float(uint(_1433));
    int _1440 = ~int(_1436);
    int _1442 = _1440 + 1;
    int _1444 = as_type<int>(_1431) + (-2);
    float _1446 = as_type<float>(_1444) * _1438;
    float _1448 = trunc(_1446);
    float _1450 = precise::max(_1448, 0.0);
    uint _1452 = uint(_1450);
    int _1454 = ~int(_1452);
    int _1456 = _1454 + 1;
    int _1458 = _1456 * _1419;
    int _1460 = _1458 + _1433;
    float _1462 = float(uint(_1460));
    float _1464 = as_type<float>(_1444) * _1462;
    float _1466 = in.m_57.z;
    float _1468 = trunc(_1464);
    float _1470 = precise::max(_1468, 0.0);
    uint _1472 = uint(_1470);
    int _1474 = int(_1452) + int(_1472);
    int _1476 = ~_1474;
    int _1478 = _1476 + 1;
    float _1480 = trunc(_1466);
    int _1482 = int(_1480);
    int _1484 = _1478 * _1419;
    int _1486 = _1484 + _1433;
    bool _1488 = uint(_1486) >= uint(_1419);
    bool _1490 = !_1488;
    int _1492 = _1490 ? 0 : (-1);
    int _1494 = ~_1474;
    int _1496 = _1494 + _1492;
    int _1498 = _1496 + 1;
    int _1500 = _1498 * _1419;
    int _1502 = _1500 + _1433;
    int _1504 = _1502 ^ _1442;
    int _1506 = ~_1442;
    int _1508 = _1506 + _1504;
    int _1510 = _1508 + 1;
    bool _1512 = !_1421;
    int _1514 = _1512 ? _1510 : (-1);
    int _1516 = _1514;
    int _1518 = 0;
    int _1520 = _85(_1516, _1518, (*spvDescriptorSet0.support_buffer));
    int _1522 = _1482;
    int _1524 = 0;
    int _1526 = _85(_1522, _1524, (*spvDescriptorSet0.support_buffer));
    float4 _1529 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1520, _1526)), 0).xyzw;
    float _1531 = _1529.x;
    float _1533 = _1529.y;
    float _1535 = _1529.z;
    float _1537 = _1529.w;
    float _1539 = in.m_57.x;
    float _1541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1543 = in.m_57.y;
    int _1545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1547 = _1545 != 0;
    float _1549 = _1401 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1553 = _1551 != 0;
    float _1555 = in.m_53.z;
    float _1557 = in.m_53.w;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1561 = _1559 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1565 = _1563 != 0;
    float _1567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1571 = _1569 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1575 = _1573 != 0;
    if (_1547)
    {
        bool _1577 = _599 > 0.5;
        _691 = _1577;
    }
    bool _1579 = _691;
    float _1581 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1583 = 0.0;
    if (_1553)
    {
        float _1585 = in.m_53.z;
        _1583 = _1585;
    }
    float _1587 = _1583;
    float _1589 = 1.0 / _1561;
    bool _1591 = _1391 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1593 = isnan(_1391);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1599 = _1595 || _1597;
    float _1601 = float(_1599);
    float _1603 = _1539;
    if (_1547)
    {
        float _1605 = -_1539;
        float _1607 = _1605 + 1.0;
        _1365 = as_type<int>(_1607);
    }
    int _1609 = _1365;
    float _1611 = 0.0;
    if (!_1547)
    {
        _1611 = _1539;
    }
    float _1613 = _1611;
    float _1615 = -_1543;
    float _1617 = _1615 + 1.0;
    float _1619 = _1613;
    if (_1547)
    {
        float _1621 = _1579 ? as_type<float>(_1609) : _1539;
        _1619 = _1621;
    }
    float _1623 = _1619;
    float _1625 = 1.0 / _1571;
    int _1627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1629 = _1627 != 0;
    float _1631 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    bool _1633 = _1557 > 0.5;
    bool _1635 = _1633 && _1565;
    bool _1637 = _1555 > 0.5;
    bool _1639 = _1401 > 0.5;
    bool _1641 = _1639 && _1629;
    float _1643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1645 = _1635 ? _1617 : _1543;
    int _1647 = _1637 ? as_type<int>(_1617) : as_type<int>(_1543);
    int _1649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1651 = _1649 != 0;
    float _1653 = fma(_1645, _1581, -0.5);
    int _1655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1657 = _1655 != 0;
    int _1659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1661 = _1659 != 0;
    float _1663 = _1641 ? _1617 : _1543;
    float _1665 = _599 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1669 = _1667 != 0;
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1675 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1673;
    float _1677 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1679 = _1677 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1681 = -_1671;
    float _1683 = fma(_1665, 2.0, _1681);
    float _1685 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1687 = _1675 * _1589;
    float _1689 = _1657 ? as_type<float>(_1647) : _1543;
    float _1691 = _1679 * _1625;
    bool _1693 = _1657;
    float _1695 = _1631;
    float _1697 = _1555;
    if (_1553)
    {
        bool _1699 = _1587 > 0.5;
        _1693 = _1699;
    }
    bool _1701 = _1693;
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1705 = _1391 + _1703;
    int _1707 = _1661 ? _1647 : as_type<int>(_1543);
    float _1709 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1713 = fma(_1691, _1705, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1715 = fma(_1549, -2.0, _1685);
    float _1717 = fma(_1663, _1709, -0.5);
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1721 = _1391 + _1719;
    bool _1723 = _1391 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1725 = isnan(_1391);
    bool _1727 = _1723 || _1725;
    bool _1729 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1731 = _1727 || _1729;
    float _1733 = float(_1731);
    float _1735 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1737 = _1391 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1739 = isnan(_1391);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1745 = _1741 || _1743;
    int _1747 = _1745 ? 1065353216 : 0;
    float _1749 = fma(_1687, _1721, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1751 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1715);
    float _1753 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1735);
    float _1755 = -_1733;
    float _1757 = _1755 + 1.0;
    bool _1759 = _1401 > 0.5;
    float _1761 = -as_type<float>(_1747);
    float _1763 = _1761 + 1.0;
    float _1765 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1753);
    float _1767 = _1601 * _1757;
    float _1769 = -_1601;
    float _1771 = _1769 + 1.0;
    float _1773 = _1711 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1775 = -_1751;
    float _1777 = fma(_1765, _1717, _1775);
    int _1779 = as_type<int>(_1765);
    int _1781 = _1707;
    float _1783 = _1773;
    float _1785 = _1771;
    bool _1787 = _1701;
    int _1789 = _1747;
    if (_1651)
    {
        float _1791 = -_1539;
        float _1793 = _1791 + 1.0;
        _1779 = as_type<int>(_1793);
    }
    int _1795 = _1779;
    float _1797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1799 = as_type<float>(_1747) * _1771;
    float _1801 = fma(as_type<float>(_1707), _1773, -0.5);
    int _1803 = as_type<int>(_1799);
    if (_1553)
    {
        float _1805 = -_1539;
        float _1807 = _1805 + 1.0;
        _1781 = as_type<int>(_1807);
    }
    int _1809 = _1781;
    if (!_1553)
    {
        _1783 = _1539;
    }
    float _1811 = _1783;
    float _1813 = _1749 * _1799;
    float _1815 = _1811;
    float _1817 = _1813;
    if (_1575)
    {
        float _1819 = -_1539;
        float _1821 = _1819 + 1.0;
        _1803 = as_type<int>(_1821);
    }
    int _1823 = _1803;
    if (!_1575)
    {
        _1785 = _1539;
    }
    float _1825 = _1785;
    float _1827 = fma(_1689, _1631, -0.5);
    float _1829 = _1825;
    if (_1553)
    {
        float _1831 = _1701 ? as_type<float>(_1809) : _1539;
        _1815 = _1831;
    }
    float _1833 = _1815;
    float _1835 = fma(_1763, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1813);
    if (_1575)
    {
        float _1837 = _1759 ? as_type<float>(_1823) : _1539;
        _1829 = _1837;
    }
    float _1839 = _1829;
    float _1841 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_1651)
    {
        float _1843 = _1759 ? as_type<float>(_1795) : _1539;
        _1603 = _1843;
    }
    float _1845 = _1603;
    if (_1669)
    {
        _1787 = false;
    }
    bool _1847 = _1787;
    bool _1849 = _1847;
    if (_1669)
    {
        _1695 = _599;
    }
    float _1851 = _1695;
    float _1853 = 0.0;
    float _1855 = _1851;
    if (_1669)
    {
        _1853 = _1401;
    }
    float _1857 = _1853;
    float _1859 = _1857;
    if (_1669)
    {
        _1789 = as_type<int>(_1555);
    }
    int _1861 = _1789;
    int _1863 = _1861;
    if (!_1669)
    {
        float _1865 = _599 * 3.1415927410125732421875;
        float _1867 = _1865 * 0.15915493667125701904296875;
        float _1869 = _1401 * 3.1415927410125732421875;
        float _1871 = _1869 * 0.15915493667125701904296875;
        float _1873 = _1555 * 3.1415927410125732421875;
        float _1875 = _1867 * 6.283185482025146484375;
        float _1877 = sin(_1875);
        float _1879 = _1873 * 0.15915493667125701904296875;
        float _1881 = _1871 * 6.283185482025146484375;
        float _1883 = sin(_1881);
        float _1885 = _1879 * 6.283185482025146484375;
        float _1887 = sin(_1885);
        _1855 = _1877;
        _1849 = true;
        _1859 = _1883;
        _1863 = as_type<int>(_1887);
        _1817 = _1879;
    }
    float _1889 = _1855;
    bool _1891 = _1849;
    float _1893 = _1859;
    int _1895 = _1863;
    float _1897 = _1817;
    float _1899 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1841);
    float _1901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1903 = _1889 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1905 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1907 = _1897;
    if (_1891)
    {
        _1907 = _1401;
    }
    float _1909 = _1907;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1913 = 0.0;
    float _1915 = _1909;
    if (_1891)
    {
        _1913 = _1401;
    }
    float _1917 = _1913;
    float _1919 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1921 = _1917;
    if (!_1891)
    {
        _1915 = _599;
    }
    float _1923 = _1915;
    float _1925 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1905);
    if (!_1891)
    {
        _1921 = _599;
    }
    float _1927 = _1921;
    float _1929 = fma(_1893, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1919);
    float _1931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1933 = fma(_1713, _1767, _1835);
    float _1935 = _1891 ? as_type<float>(_1895) : _1893;
    float _1937 = -_1911;
    float _1939 = fma(_1903, 2.0, _1937);
    float _1941 = _1797 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1943 = _1891 ? _1893 : _1889;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _1949 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1951 = 0.0;
    if (_1891)
    {
        _1951 = _1555;
    }
    float _1953 = _1951;
    float _1955 = _1901 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1957 = fma(_1941, _1623, -0.5);
    float _1959 = _1953;
    if (!_1891)
    {
        _1697 = _1401;
    }
    float _1961 = _1697;
    float _1963 = -_127;
    float _1965 = fma(_1963, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1683);
    if (!_1891)
    {
        _1959 = _1401;
    }
    float _1967 = _1959;
    float _1969 = fma(_1949, -2.0, _1945);
    float _1971 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1973 = _1931 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1975 = fma(_1955, _1833, -0.5);
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1979 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1971);
    float _1981 = fma(_1973, _1839, -0.5);
    float _1983 = fma(_1927, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1977);
    float _1985 = _1947 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _1987 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _1989 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _1991 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1899);
    float _1993 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _1995 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[98].z, _1989);
    float _1997 = _1943 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _1999 = fma(_1991, _1957, _1965);
    float _2001 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[98].w, _1993);
    float _2003 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1925);
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _2007 = _1935 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _2009 = fma(_1985, _1845, -0.5);
    float _2011 = -_1987;
    float _2013 = fma(_1997, 2.0, _2011);
    float _2015 = -_127;
    float _2017 = fma(_2015, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1939);
    float _2019 = fma(_2007, -2.0, _2005);
    float _2021 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1929);
    float _2023 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1969);
    float _2025 = fma(_1733, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1933);
    float _2027 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2029 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2031 = fma(_2003, _1981, _2017);
    float _2033 = -_2023;
    float _2035 = fma(_2021, _1801, _2033);
    float _2037 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[97].w, _2001);
    float _2039 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[96].y, _2019);
    float _2041 = -_2027;
    float _2043 = fma(_2029, 2.0, _2041);
    float _2045 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1983);
    float _2047 = -_2039;
    float _2049 = fma(_2037, _1827, _2047);
    float _2051 = -_127;
    float _2053 = fma(_2051, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2043);
    int _2055 = _1514 + 1;
    float _2057 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2059 = _1961 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2061 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[97].z, _1995);
    float _2063 = -_127;
    float _2065 = fma(_2063, (*spvDescriptorSet0.vp_c9)._m0[96].x, _2013);
    float _2067 = fma(_2045, _1975, _2053);
    int _2069 = abs(_2055);
    float _2071 = fma(_2059, -2.0, _2057);
    float _2073 = fma(_2061, _2009, _2065);
    float _2075 = _1357 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2077 = float(uint(_2069));
    float _2079 = _1359 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2081 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2083 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1979);
    float _2085 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2071);
    float _2087 = as_type<float>(_1444) * _2077;
    float _2089 = _2075 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2091 = _2079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2093 = _2081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2095 = _2025 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _2097 = as_type<uint>(half2(float2(_1537, 0.0)));
    float _2099 = trunc(_2087);
    float _2101 = precise::max(_2099, 0.0);
    uint _2103 = uint(_2101);
    float _2105 = _2031 + 0.5;
    float _2107 = _2035 + 0.5;
    out.m_59.x = _2089;
    out.m_59.y = _2091;
    out.m_59.z = _2093;
    out.m_59.w = _2095;
    uint _2109 = extract_bits(_2097, 0u, 8u);
    int _2111 = int(_2109) & 255;
    uint _2113 = extract_bits(_2097, 8u, 8u);
    int _2115 = int(_2113) & 255;
    int _2117 = _2115 << 8;
    int _2119 = _2111 | _2117;
    float _2121 = _2073 + 0.5;
    float _2123 = _2049 + 0.5;
    out.m_61.x = _2105;
    out.m_61.y = _2107;
    uint _2125 = uint(int(uint(_2055) >> uint(31)));
    float _2127 = -_2085;
    float _2129 = fma(_2083, _1653, _2127);
    out.m_63.x = _2121;
    out.m_63.y = _2123;
    int _2131 = ~int(_2125);
    int _2133 = _2131 + 1;
    int _2135 = ~int(_2103);
    int _2137 = _2135 + 1;
    int _2139 = _2137 * _1419;
    int _2141 = _2139 + _2069;
    float _2143 = float(uint(_2141));
    float _2145 = as_type<float>(_1444) * _2143;
    float _2147 = trunc(_2145);
    float _2149 = precise::max(_2147, 0.0);
    uint _2151 = uint(_2149);
    int _2153 = int(_2103) + int(_2151);
    int _2155 = ~_2153;
    int _2157 = _2155 + 1;
    int _2159 = _2157 * _1419;
    int _2161 = _2159 + _2069;
    bool _2163 = uint(_2161) >= uint(_1419);
    float _2165 = _2067 + 0.5;
    bool _2167 = !_2163;
    int _2169 = _2167 ? 0 : (-1);
    bool _2171 = _2119 >= 32768;
    int _2173 = ~_2153;
    int _2175 = _2173 + _2169;
    int _2177 = _2175 + 1;
    float _2179 = _2129 + 0.5;
    int _2181 = _2177 * _1419;
    int _2183 = _2181 + _2069;
    int _2185 = _2119 + (-1024);
    int _2187 = _2183 ^ _2133;
    int _2189 = _2185;
    if (_2171)
    {
        int _2191 = ~_2119;
        int _2193 = _2191 + 33792;
        int _2195 = _2193 + 1;
        _2189 = _2195;
    }
    int _2197 = _2189;
    int _2199 = ~_2133;
    int _2201 = _2199 + _2187;
    int _2203 = _2201 + 1;
    int _2205 = _2197 + 30719;
    bool _2207 = !_1421;
    int _2209 = _2207 ? _2203 : (-1);
    float _2211 = float(_2205);
    float _2213 = fma(_2211, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2215 = _1777 + 0.5;
    float _2217 = abs(_2213);
    float _2219 = -_2217;
    float _2221 = _2219 + 1.0;
    int _2223 = as_type<int>(_2221) + (-218103808);
    bool _2225 = uint(_2223) >= 1920991232u;
    float _2227 = _1999 + 0.5;
    bool _2229 = !_2225;
    if (!_2229)
    {
        int _2231;
        _82(_2231, out.gl_Position, out.gl_PointSize);
    }
    int _2233 = _2209;
    int _2235 = 0;
    int _2237 = _85(_2233, _2235, (*spvDescriptorSet0.support_buffer));
    int _2239 = _1482;
    int _2241 = 0;
    int _2243 = _85(_2239, _2241, (*spvDescriptorSet0.support_buffer));
    float4 _2245 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2237, _2243)), 0).xyzw;
    float _2247 = _2245.x;
    float _2249 = _2245.y;
    float _2251 = _2245.z;
    float _2253 = _2245.w;
    float _2255 = floor(_1423);
    float _2257 = -_2255;
    float _2259 = _1423 + _2257;
    uint _2261 = as_type<uint>(half2(float2(_2253, 0.0)));
    float _2263 = -_1531;
    float _2265 = _2263 + _2247;
    float _2267 = -_1533;
    float _2269 = _2267 + _2249;
    float _2271 = -_1535;
    float _2273 = _2271 + _2251;
    uint _2275 = extract_bits(_2261, 0u, 8u);
    int _2277 = int(_2275) & 255;
    uint _2279 = extract_bits(_2261, 8u, 8u);
    int _2281 = int(_2279) & 255;
    int _2283 = _2281 << 8;
    int _2285 = _2277 | _2283;
    float _2287 = fma(_2259, _2265, _1531);
    float _2289 = fma(_2259, _2269, _1533);
    float _2291 = fma(_2259, _2273, _1535);
    bool _2293 = _2285 >= 32768;
    int _2295 = _2285 + (-1024);
    int _2297 = _2295;
    if (_2293)
    {
        int _2299 = ~_2285;
        int _2301 = _2299 + 33792;
        int _2303 = _2301 + 1;
        _2297 = _2303;
    }
    int _2305 = _2297;
    int _2307 = _2305 + 30719;
    float _2309 = float(_2307);
    float _2311 = fma(_2309, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2313 = abs(_2311);
    float _2315 = -_2313;
    float _2317 = _2315 + 1.0;
    int _2319 = as_type<int>(_2317) + (-218103808);
    bool _2321 = uint(_2319) >= 1920991232u;
    bool _2323 = !_2321;
    if (!_2323)
    {
        int _2325;
        _82(_2325, out.gl_Position, out.gl_PointSize);
    }
    float _2327 = _593 * _593;
    float _2329 = _811 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2331 = _809 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2333 = _813 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2335 = fma(_595, _595, _2327);
    float _2337 = fma(_597, _597, _2335);
    float _2339 = rsqrt(_2337);
    float _2341 = _2339 * _597;
    float _2343 = _2339 * _595;
    float _2345 = _2339 * _593;
    float _2347 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2349 = _2341 * _2347;
    float _2351 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2353 = _2343 * _2351;
    float _2355 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2357 = _2345 * _2355;
    bool _2359 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2361 = isnan(0.5);
    bool _2363 = _2359 || _2361;
    bool _2365 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2367 = _2363 || _2365;
    float _2369 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2371 = -_2349;
    float _2373 = fma(_2343, _2369, _2371);
    float _2375 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2377 = -_2353;
    float _2379 = fma(_2345, _2375, _2377);
    float _2381 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2383 = -_2357;
    float _2385 = fma(_2341, _2381, _2383);
    float _2387 = _415 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2389 = _2373 * _2373;
    float _2391 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2289);
    float _2393 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2287);
    float _2395 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2387);
    float _2397 = fma(_2385, _2385, _2389);
    float _2399 = _2329 * _2391;
    float _2401 = _2331 * _2393;
    float _2403 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2395);
    float _2405 = fma(_2379, _2379, _2397);
    float _2407 = _415 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2409 = _415 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2411 = _2399 * _2343;
    float _2413 = rsqrt(_2405);
    float _2415 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2407);
    float _2417 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2409);
    float _2419 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2291);
    float _2421 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2415);
    float _2423 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2417);
    float _2425 = _2333 * _2419;
    float _2427 = _2421 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2429 = _2423 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2431 = _2399 * _2341;
    float _2433 = _2373 * _2413;
    float _2435 = _2385 * _2413;
    float _2437 = _2379 * _2413;
    float _2439 = _2403 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2441 = _2343 * _2433;
    float _2443 = _2427 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2445 = fma(_2401, _2437, _2431);
    float _2447 = _2345 * _2437;
    float _2449 = -_2441;
    float _2451 = fma(_2345, _2435, _2449);
    float _2453 = fma(_2439, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2443);
    float _2455 = fma(_2401, _2435, _2411);
    float _2457 = -_2447;
    float _2459 = fma(_2341, _2433, _2457);
    float _2461 = fma(_2425, _2451, _2445);
    float _2463 = fma(_2429, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2453);
    float _2465 = fma(_2425, _2459, _2455);
    float _2467 = _2429 + _2461;
    float _2469 = _2463 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2471 = _2427 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2473 = _2439 + _2465;
    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2477 = _2467 + _2475;
    float _2479 = 1.0 / _2469;
    float _2481 = fma(_2439, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2471);
    float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2485 = _2473 + _2483;
    float _2487 = _2477 * _2477;
    float _2489 = fma(_2429, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2481);
    float _2491 = fma(_2485, _2485, _2487);
    float _2493 = _2399 * _2345;
    float _2495 = _2489 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2497 = sqrt(_2491);
    float _2499 = fma(_2401, _2433, _2493);
    float _2501 = _2495 + _2469;
    float _2503 = _2341 * _2435;
    float _2505 = _2501 * _2479;
    float _2507 = _2505 * 0.5;
    float _2509 = -_2503;
    float _2511 = fma(_2343, _2437, _2509);
    float _2513 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2515 = fma(_2507, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2513);
    float _2517 = fma(_2425, _2511, _2499);
    float _2519 = _2427 + _2517;
    bool _2521 = _2497 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2523 = 1.0 / _2515;
    float _2525 = _2517;
    float _2527 = _2425;
    float _2529 = _2435;
    float _2531 = _2507;
    float _2533 = _2497;
    float _2535 = _2401;
    float _2537 = _2399;
    float _2539 = _2429;
    if (_2367)
    {
        _2525 = 1.0;
    }
    float _2541 = _2525;
    float _2543 = _2541;
    if (!_2521)
    {
        _2527 = _2473;
    }
    float _2545 = _2527;
    float _2547 = _2545;
    if (!_2521)
    {
        _2529 = _2467;
    }
    float _2549 = _2529;
    float _2551 = _2549;
    if (!_2521)
    {
        _2531 = _2519;
    }
    float _2553 = _2531;
    bool _2555 = !_2521;
    float _2557 = _2553;
    if (!_2555)
    {
        float _2559 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2563 = _2497 + _2561;
        float _2565 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2567 = rsqrt(_2491);
        float _2569 = _2563 * _2559;
        float _2571 = _2569 * 0.15915493667125701904296875;
        float _2573 = _2571 * 6.283185482025146484375;
        float _2575 = cos(_2573);
        float _2577 = _2571 * 6.283185482025146484375;
        float _2579 = sin(_2577);
        float _2581 = _2575 + (-1.0);
        float _2583 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2585 = fma(_2579, _2565, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2587 = fma(_2519, _2575, _2583);
        float _2589 = _2567 * _2585;
        float _2591 = fma(_2485, _2589, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2593 = fma(_2477, _2589, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2533 = _2563;
        _2557 = _2587;
        _2547 = _2591;
        _2551 = _2593;
        _2535 = _2579;
    }
    float _2595 = _2533;
    float _2597 = _2557;
    float _2599 = _2547;
    float _2601 = _2551;
    float _2603 = _2535;
    float _2605 = _2603;
    float _2607 = _2595;
    if (_2367)
    {
        _2605 = 1.0;
    }
    float _2609 = _2605;
    float _2611 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2613 = _2523 * _2611;
    float _2615 = _2609;
    float _2617 = _2613;
    if (!_2367)
    {
        float _2619 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2621 = _2619 * 0.15915493667125701904296875;
        float _2623 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2625 = _2621 * 6.283185482025146484375;
        float _2627 = cos(_2625);
        float _2629 = _2623 * 0.15915493667125701904296875;
        float _2631 = _2621 * 6.283185482025146484375;
        float _2633 = sin(_2631);
        float _2635 = 1.0 / _2627;
        float _2637 = _2629 * 6.283185482025146484375;
        float _2639 = cos(_2637);
        float _2641 = _2633 * _2635;
        float _2643 = _2629 * 6.283185482025146484375;
        float _2645 = sin(_2643);
        float _2647 = _2639 * _2641;
        float _2649 = 1.0 / _2647;
        float _2651 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2653 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2651;
        float _2655 = 1.0 / _2653;
        float _2657 = _2645 * _2649;
        float _2659 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2661 = fma(_2613, _2657, _2659);
        float _2663 = _2661 * _2655;
        float _2665 = precise::clamp(_2663, 0.0, 1.0);
        _2607 = _2621;
        _2537 = _2655;
        _2543 = _2665;
    }
    float _2667 = _2607;
    float _2669 = _2537;
    float _2671 = _2543;
    float _2673 = _2667;
    float _2675 = _2669;
    if (!_2367)
    {
        float _2677 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2679 = _2677 * 0.15915493667125701904296875;
        float _2681 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2683 = _2679 * 6.283185482025146484375;
        float _2685 = cos(_2683);
        float _2687 = _2681 * 0.15915493667125701904296875;
        float _2689 = _2679 * 6.283185482025146484375;
        float _2691 = sin(_2689);
        float _2693 = 1.0 / _2685;
        float _2695 = _2687 * 6.283185482025146484375;
        float _2697 = cos(_2695);
        float _2699 = _2691 * _2693;
        float _2701 = _2687 * 6.283185482025146484375;
        float _2703 = sin(_2701);
        float _2705 = _2697 * _2699;
        float _2707 = 1.0 / _2705;
        float _2709 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2711 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2709;
        float _2713 = 1.0 / _2711;
        float _2715 = _2703 * _2707;
        float _2717 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2719 = fma(_2613, _2715, _2717);
        float _2721 = _2719 * _2713;
        float _2723 = precise::clamp(_2721, 0.0, 1.0);
        float _2725 = -_2723;
        float _2727 = _2725 + 1.0;
        _2673 = _2685;
        _2675 = _2693;
        _2615 = _2727;
    }
    float _2729 = _2673;
    float _2731 = _2675;
    float _2733 = _2615;
    float _2735 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2737 = _2597 + _2735;
    float _2739 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2741 = _2599 + _2739;
    float _2743 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2745 = _2601 + _2743;
    float _2747 = _2737 * _2737;
    float _2749 = fma(_2741, _2741, _2747);
    float _2751 = fma(_2745, _2745, _2749);
    float _2753 = rsqrt(_2751);
    float _2755 = _2753 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2757 = _2741 * _2755;
    float _2759 = _2745 * _2755;
    float _2761 = _2757 * _2757;
    float _2763 = _2759 * _2759;
    float _2765 = _2761 + _2763;
    float _2767 = sqrt(_2765);
    bool _2769 = _2767 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2771 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2773 = _2767 + _2771;
    float _2775 = _2753;
    float _2777 = _2729;
    float _2779 = _2773;
    float _2781 = _2737;
    float _2783 = _2731;
    float _2785 = _2757;
    if (_2769)
    {
        float _2787 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2775 = _2787;
    }
    float _2789 = _2775;
    if (_2769)
    {
        float _2791 = rsqrt(_2765);
        _2777 = _2791;
    }
    float _2793 = _2777;
    float _2795 = _2793;
    if (_2769)
    {
        float _2797 = _2773 * _2789;
        _2779 = _2797;
    }
    float _2799 = _2779;
    if (_2769)
    {
        float _2801 = _2799 * 0.15915493667125701904296875;
        _2617 = _2801;
    }
    float _2803 = _2617;
    float _2805 = _2789;
    if (_2769)
    {
        float _2807 = _2803 * 6.283185482025146484375;
        float _2809 = sin(_2807);
        _2805 = _2809;
    }
    float _2811 = _2805;
    float _2813 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2815 = precise::max(0.0, _2813);
    float _2817 = _2745;
    float _2819 = _2815;
    if (_2769)
    {
        float _2821 = _2803 * 6.283185482025146484375;
        float _2823 = cos(_2821);
        _2817 = _2823;
    }
    float _2825 = _2817;
    float _2827 = -_2755;
    float _2829 = -_2815;
    float _2831 = fma(_2737, _2827, _2829);
    if (!_2769)
    {
        _2781 = _2759;
    }
    float _2833 = _2781;
    float _2835 = _2833;
    if (_2769)
    {
        float _2837 = _2831 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2819 = _2837;
    }
    float _2839 = _2819;
    float _2841 = sqrt(_2751);
    float _2843 = _2811;
    float _2845 = _2839;
    if (_2769)
    {
        float _2847 = fma(_2811, _2839, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2783 = _2847;
    }
    float _2849 = _2783;
    float _2851 = _2849;
    if (!_2769)
    {
        _2843 = _2761;
    }
    float _2853 = _2843;
    float _2855 = _2853;
    if (_2769)
    {
        float _2857 = _2825 + (-1.0);
        _2845 = _2857;
    }
    float _2859 = _2845;
    float _2861 = _2859;
    if (_2769)
    {
        float _2863 = _2793 * _2849;
        _2539 = _2863;
    }
    float _2865 = _2539;
    if (!_2769)
    {
        _2851 = _2831;
    }
    float _2867 = _2851;
    float _2869 = _2867;
    if (_2769)
    {
        float _2871 = _2859 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2795 = _2871;
    }
    float _2873 = _2795;
    if (_2769)
    {
        float _2875 = _2757 * _2865;
        _2785 = _2875;
    }
    float _2877 = _2785;
    if (_2769)
    {
        float _2879 = _2759 * _2865;
        _2835 = _2879;
    }
    float _2881 = _2835;
    if (!_2769)
    {
        _2861 = _2763;
    }
    float _2883 = _2861;
    float _2885 = _2883;
    if (_2769)
    {
        float _2887 = fma(_2831, _2825, _2873);
        _2869 = _2887;
    }
    float _2889 = _2869;
    if (_2769)
    {
        float _2891 = _2877 * _2877;
        _2855 = _2891;
    }
    float _2893 = _2855;
    if (_2769)
    {
        float _2895 = _2881 * _2881;
        _2885 = _2895;
    }
    float _2897 = _2885;
    float _2899 = fma(_2889, _2889, _2893);
    float _2901 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2903 = fma(_2841, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2901);
    float _2905 = precise::clamp(_2903, 0.0, 1.0);
    float _2907 = _2899 + _2897;
    float _2909 = _2597 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2911 = _2597 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2913 = -_2905;
    float _2915 = _2913 + 1.0;
    float _2917 = rsqrt(_2907);
    float _2919 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2909);
    float _2921 = _2597 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2923 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2911);
    float _2925 = _2597 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2927 = fma(_2601, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2919);
    float _2929 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2921);
    float _2931 = fma(_2601, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2923);
    float _2933 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2925);
    float _2935 = abs(_2915);
    float _2937 = log2(_2935);
    float _2939 = fma(_2601, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2929);
    float _2941 = _2931 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2943 = fma(_2601, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2933);
    float _2945 = _2927 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2947 = _2939 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2949 = _2941 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2951 = _2917 * _2877;
    float _2953 = _2917 * _2889;
    float _2955 = _2917 * _2881;
    float _2957 = fma(_2947, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2949);
    float _2959 = _2951 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2961 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2963 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2965 = _2943 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2967 = -_2959;
    float _2969 = fma(_2953, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2967);
    float _2971 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2957);
    float _2973 = -_2963;
    float _2975 = fma(_2973, _2961, 1.0);
    float _2977 = _2937 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2979 = -_2955;
    float _2981 = fma(_2979, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2969);
    float _2983 = fma(_2965, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2971);
    float _2985 = _2941 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2987 = _2941 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2989 = fma(_2981, -0.5, 0.5);
    float _2991 = log2(_2975);
    float _2993 = fma(_2947, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2985);
    float _2995 = fma(_2981, 0.5, 0.5);
    float _2997 = fma(_2947, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2987);
    float _2999 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2993);
    float _3001 = fma(_2995, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3003 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2997);
    float _3005 = 1.0 / _2983;
    float _3007 = fma(_2965, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2999);
    float _3009 = fma(_2995, _3001, -0.212114393711090087890625);
    float _3011 = fma(_2965, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3003);
    float _3013 = fma(_2995, _3009, 1.570728778839111328125);
    float _3015 = exp2(_2977);
    float _3017 = _2991 * 0.693147182464599609375;
    float _3019 = _3017 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3021 = sqrt(_2989);
    float _3023 = _2953 + 1.0;
    float _3025 = _3007 * _3005;
    float _3027 = _3011 * _3005;
    float _3029 = fma(_3025, 0.5, 0.5);
    float _3031 = fma(_3027, -0.5, 0.5);
    float _3033 = -_2953;
    float _3035 = fma(_3015, _3023, _3033);
    float _3037 = fma(_3035, 0.5, 0.5);
    float _3039 = _3021 * 0.636619746685028076171875;
    float3 _7844 = float3(_3029, _3031, _3019);
    float _3041 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7844, float3(0.0), isnan(_7844)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7844, float3(0.0), isnan(_7844)), level(0.0)).x;
    float3 _7855 = float3(_3029, _3031, _3019);
    float4 _3043 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7855, float3(0.0), isnan(_7855)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7855, float3(0.0), isnan(_7855)), level(0.0)).xyzw;
    float _3045 = _3043.x;
    float _3047 = _3043.y;
    float _3049 = _3043.z;
    float _3051 = _3043.w;
    float _3053 = -_3013;
    float _3055 = fma(_3039, _3053, 1.0);
    float2 _7876 = float2(_3055, _3037);
    float3 _3059 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7876, float2(0.0), isnan(_7876)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7876, float2(0.0), isnan(_7876)), level(0.0)).xyz;
    float _3061 = _3059.x;
    float _3063 = _3059.y;
    float _3065 = _3059.z;
    float _3067 = _2937 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3069 = _2941 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3071 = _2671 * _2733;
    bool _3073 = _2671 > 0.0;
    bool _3075 = isnan(_2671);
    bool _3077 = _3073 || _3075;
    bool _3079 = isnan(0.0);
    bool _3081 = _3077 || _3079;
    out.m_65.x = _2227;
    out.m_65.y = _2215;
    out.m_65.z = _2165;
    out.m_65.w = _2179;
    float _3083 = fma(_2947, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3069);
    float _3085 = exp2(_3067);
    float _3087 = _3071 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3089 = _2983 * 0.5;
    float _3091 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3083);
    bool _3093 = _2733 <= 0.0;
    bool _3095 = !_3081;
    bool _3097 = _3093 || _3095;
    float _3099 = _687 * _3087;
    float _3101 = _3007 + _2983;
    float _3103 = fma(_2965, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3091);
    float _3105 = _3099 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3107 = fma(_3011, -0.5, _3089);
    float _3109 = _3103 + _2983;
    float _3111 = _3101 * 0.5;
    out.gl_Position.x = _3007;
    out.gl_Position.y = _3011;
    out.gl_Position.z = _3103;
    out.gl_Position.w = _2983;
    float _3113 = _3109 * 0.5;
    float _3115 = -_3085;
    float _3117 = _3115 + 1.0;
    out.m_47.x = _3105;
    float _3119 = _3117 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _3111;
    out.m_67.y = _3107;
    out.m_67.z = _3113;
    out.m_67.w = _2983;
    float _3121 = -_3119;
    float _3123 = _3121 + 1.0;
    float _3125 = _3119 * _3041;
    float _3127 = _3051 * _3125;
    float _3129 = _3051 * _3123;
    float _3131 = _3065 * _3125;
    float _3133 = fma(_3061, _3127, _3045);
    float _3135 = fma(_3063, _3127, _3047);
    float _3137 = fma(_3051, _3131, _3049);
    out.m_69.x = _3133;
    out.m_69.y = _3135;
    out.m_69.z = _3137;
    out.m_69.w = _3129;
    if (!_3097)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _3139 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3139;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1383 = false;
    bool _1215 = false;
    bool _999 = false;
    bool _833 = false;
    bool _709 = false;
    bool _471 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _93 = int(_91);
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
        out.m_47.x = 0.0;
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
        float _3196 = as_type<float>(_109);
        out.gl_Position.z = _3196;
    }
    if (!_97)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_123)
    {
        float _129 = float(_93);
        _103 = _129;
    }
    float _131 = _103;
    bool _133 = _127 >= _131;
    bool _135 = !_123;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    float _143 = _141;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _145 = _141 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3266 = as_type<float>(_147);
        out.gl_Position.z = _3266;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _149 = in.m_49.x;
    float _151 = in.m_49.y;
    float _153 = in.m_49.z;
    float _155 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = 0.0;
    float _169 = _155;
    if (!_165)
    {
        float _171 = _155 * _155;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = 0.0;
    float _179 = _175;
    if (!_165)
    {
        float _181 = _127 * _127;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    if (!_165)
    {
        float _187 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _187;
    }
    float _189 = _179;
    bool _191 = !_165;
    float _193 = _189;
    float _195 = 0.0;
    if (!_191)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _155 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _155);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _225;
        _195 = _213;
        _143 = _215;
    }
    float _227 = _193;
    float _229 = _195;
    float _231 = _143;
    bool _233 = !_165;
    float _235 = _231;
    float _237 = _229;
    if (!_233)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _155 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _235 = _245;
        _169 = _257;
    }
    float _259 = _235;
    float _261 = _169;
    float _263 = _259;
    if (!_165)
    {
        _263 = _127;
    }
    float _265 = _263;
    float _267 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _265;
    if (!_165)
    {
        float _271 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _271;
    }
    float _273 = _237;
    bool _275 = !_165;
    float _277 = _273;
    if (!_275)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _127 * _281;
        float _291 = 1.0 / _285;
        float _293 = _287 * 0.693147182464599609375;
        float _295 = exp2(_289);
        float _297 = 1.0 / _293;
        float _299 = _295 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _297, _127);
        float _305 = _303 * _291;
        float _307 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _307;
    }
    float _309 = _277;
    bool _311 = !_165;
    if (!_311)
    {
        float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = log2(_313);
        float _317 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _319 = _317 + 1.0;
        float _321 = 1.0 / _319;
        float _323 = _127 * _315;
        float _325 = exp2(_323);
        float _327 = -_325;
        float _329 = _327 + 1.0;
        float _331 = _329 * _321;
        _269 = _331;
    }
    float _333 = _269;
    float _335 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = fma(_261, _151, _267);
    float _339 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _341 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _343 = fma(_333, _151, _335);
    float _345 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _347 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = fma(_261, _149, _339);
    float _351 = fma(_333, _149, _341);
    float _353 = -_343;
    float _355 = _337 + _353;
    float _357 = fma(_261, _153, _345);
    float _359 = fma(_333, _153, _347);
    float _361 = -_351;
    float _363 = _349 + _361;
    float _365 = _355 * _355;
    float _367 = in.m_51.w;
    float _369 = -_359;
    float _371 = _357 + _369;
    float _373 = _355 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _375 = fma(_363, _363, _365);
    float _377 = in.m_44.x;
    float _379 = in.m_44.y;
    float _381 = in.m_44.z;
    float _383 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _373);
    float _385 = fma(_371, _371, _375);
    float _387 = _355 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _389 = _355 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _391 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _383);
    float _393 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _387);
    float _395 = sqrt(_385);
    float _397 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _389);
    float _399 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _393);
    float _401 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _397);
    float _403 = fma(_349, _367, _377);
    bool _405 = _395 >= 9.9999999747524270787835121154785e-07;
    bool _407 = isnan(_395);
    bool _409 = _405 || _407;
    bool _411 = isnan(9.9999999747524270787835121154785e-07);
    bool _413 = _409 || _411;
    float _415 = fma(_337, _367, _379);
    float _417 = fma(_357, _367, _381);
    float _419 = _367;
    float _421 = _357;
    float _423 = _391;
    if (_413)
    {
        _419 = _399;
    }
    float _425 = _419;
    float _427 = _425;
    if (_413)
    {
        _421 = _401;
    }
    float _429 = _421;
    float _431 = _429;
    if (!_413)
    {
        bool _433 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _435 = !_433;
        if (!_435)
        {
            float _437 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _439 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _441 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _437);
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _439);
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _447);
            float _455 = _449 * _449;
            float _457 = fma(_451, _451, _455);
            float _459 = fma(_453, _453, _457);
            float _461 = rsqrt(_459);
            float _463 = _461 * 9.9999999747524270787835121154785e-07;
            float _465 = _451 * _463;
            float _467 = _449 * _463;
            float _469 = _453 * _463;
            _423 = _467;
            _427 = _465;
            _431 = _469;
            _471 = true;
        }
        else
        {
            float _473 = _151 * _151;
            float _475 = fma(_149, _149, _473);
            float _477 = fma(_153, _153, _475);
            float _479 = sqrt(_477);
            bool _481 = _479 >= 9.9999999747524270787835121154785e-07;
            bool _483 = isnan(_479);
            bool _485 = _481 || _483;
            bool _487 = isnan(9.9999999747524270787835121154785e-07);
            bool _489 = _485 || _487;
            if (!_489)
            {
                float _491 = _379 * _379;
                float _493 = fma(_377, _377, _491);
                float _495 = fma(_381, _381, _493);
                float _497 = sqrt(_495);
                bool _499 = _497 >= 9.9999999747524270787835121154785e-07;
                bool _501 = isnan(_497);
                bool _503 = _499 || _501;
                bool _505 = isnan(9.9999999747524270787835121154785e-07);
                bool _507 = _503 || _505;
                if (!_507)
                {
                    float _509 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _511 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _509);
                    float _513 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _511);
                    float _515 = rsqrt(_513);
                    float _517 = _515 * 9.9999999747524270787835121154785e-07;
                    float _519 = _517 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _521 = _517 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _523 = _517 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _423 = _521;
                    _427 = _519;
                    _431 = _523;
                    _471 = true;
                }
                else
                {
                    float _525 = _379 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _527 = _379 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _529 = _379 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _531 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _525);
                    float _533 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _527);
                    float _535 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _529);
                    float _537 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].z, _531);
                    float _539 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].z, _533);
                    float _541 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
                    float _543 = _537 * _537;
                    float _545 = fma(_539, _539, _543);
                    float _547 = fma(_541, _541, _545);
                    float _549 = rsqrt(_547);
                    float _551 = _549 * 9.9999999747524270787835121154785e-07;
                    float _553 = _539 * _551;
                    float _555 = _537 * _551;
                    float _557 = _541 * _551;
                    _423 = _555;
                    _427 = _553;
                    _431 = _557;
                    _471 = true;
                }
            }
            else
            {
                float _559 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _561 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _563 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _565 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _559);
                float _567 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _561);
                float _569 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _563);
                float _571 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _565);
                float _573 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _567);
                float _575 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _569);
                float _577 = _571 * _571;
                float _579 = fma(_573, _573, _577);
                float _581 = fma(_575, _575, _579);
                float _583 = rsqrt(_581);
                float _585 = _583 * 9.9999999747524270787835121154785e-07;
                float _587 = _573 * _585;
                float _589 = _571 * _585;
                float _591 = _575 * _585;
                _423 = _589;
                _427 = _587;
                _431 = _591;
            }
        }
    }
    _471 = false;
    float _593 = _423;
    float _595 = _427;
    float _597 = _431;
    float _599 = in.m_53.x;
    float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _603 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _605 = _603 * _601;
    float _607 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[20].x, _605);
    float _609 = _607 * 6.283185482025146484375;
    float _611 = floor(_607);
    float _613 = _609 * 0.15915493667125701904296875;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _617 = _615 != 0;
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _621 = _619 != 0;
    float _623 = _613 * 6.283185482025146484375;
    float _625 = cos(_623);
    int _627 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _629 = _627 != 0;
    bool _631 = !_617;
    int _633 = _631 ? 0 : 1;
    float _635 = -_611;
    float _637 = _607 + _635;
    int _639 = abs(_633);
    bool _641 = !_629;
    int _643 = _641 ? 0 : 1;
    bool _645 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _647 = abs(_643);
    float _649 = fma(_625, 0.5, 0.5);
    bool _651 = !_621;
    int _653 = _651 ? 0 : 1;
    float _655 = float(_639);
    float _657 = -_637;
    float _659 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _661 = abs(_653);
    float _663 = -_649;
    float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _667 = abs(_659);
    float _669 = _655 * _667;
    bool _671 = _637 < 0.5;
    float _673 = float(_671);
    float _675 = float(_647);
    float _677 = float(_661);
    float _679 = -_673;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _683 = fma(_675, _665, _669);
    float _685 = abs(_681);
    float _687 = fma(_677, _685, _683);
    bool _689 = !_645;
    bool _691 = _621;
    float _707;
    if (!_689)
    {
        float _693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _695 = _599 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _699 = _697 * _693;
        float _701 = floor(_699);
        float _703 = -_701;
        float _705 = _699 + _703;
        _707 = _705;
        _709 = true;
    }
    else
    {
        float _711 = float(_93);
        float _713 = 1.0 / _711;
        float _715 = _127 * _713;
        _707 = _715;
    }
    _709 = false;
    float _717 = _707;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _721 = _717 + _719;
    bool _723 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _725 = isnan(_717);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _735;
    float _739 = -_733;
    float _741 = _739 + 1.0;
    bool _743 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _745 = isnan(_717);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = 1.0 / _737;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _757;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _761;
    bool _765 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _767 = _753 * _741;
    float _769 = -_753;
    float _771 = _769 + 1.0;
    float _773 = _721 * _755;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _775;
    float _779 = in.m_51.x;
    float _781 = in.m_51.y;
    float _783 = in.m_51.z;
    float _785 = fma(_759, _773, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _787 = fma(_777, _773, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _789 = fma(_763, _773, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _791 = _785 * _767;
    float _793 = _787 * _767;
    float _795 = _789 * _767;
    float _797 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[143].x, _791);
    float _799 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[143].y, _793);
    float _801 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[143].z, _795);
    float _803 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[144].x, _797);
    float _805 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[144].y, _799);
    float _807 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[144].z, _801);
    float _809 = _803 * _779;
    float _811 = _805 * _781;
    float _813 = _807 * _783;
    bool _815 = !_765;
    float _831;
    if (!_815)
    {
        float _817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _819 = _599 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _821 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _823 = _821 * _817;
        float _825 = floor(_823);
        float _827 = -_825;
        float _829 = _823 + _827;
        _831 = _829;
        _833 = true;
    }
    else
    {
        float _835 = float(_93);
        float _837 = 1.0 / _835;
        float _839 = _127 * _837;
        _831 = _839;
    }
    _833 = false;
    float _841 = _831;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _845 = _841 + _843;
    bool _847 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _849 = isnan(_841);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _861 = _841 + _859;
    bool _863 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _865 = isnan(_841);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _875;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _883 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _885 = isnan(_841);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = 1.0 / _877;
    float _897 = -_893;
    float _899 = _897 + 1.0;
    bool _901 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _903 = _873 * _899;
    float _905 = -_873;
    float _907 = _905 + 1.0;
    float _909 = 1.0 / _881;
    float _911 = _845 * _895;
    float _913 = -_857;
    float _915 = _913 + 1.0;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _917;
    float _921 = _893 * _915;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _923;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _927;
    float _931 = fma(_919, _911, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _933 = _861 * _909;
    float _935 = fma(_925, _911, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _937 = fma(_929, _911, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _939 = _931 * _903;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _945 = _935 * _903;
    float _947 = _937 * _903;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _957 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[107].x, _945);
    float _959 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[107].y, _939);
    float _961 = fma(_951, _933, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _963 = fma(_943, _933, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _965 = fma(_955, _933, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _967 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[107].z, _947);
    float _969 = fma(_961, _921, _957);
    float _971 = fma(_963, _921, _959);
    float _973 = fma(_965, _921, _967);
    float _975 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[109].x, _969);
    float _977 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[109].y, _971);
    float _979 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[109].z, _973);
    bool _981 = !_901;
    float _997;
    if (!_981)
    {
        float _983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _985 = _599 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _989 = _987 * _983;
        float _991 = floor(_989);
        float _993 = -_991;
        float _995 = _989 + _993;
        _997 = _995;
        _999 = true;
    }
    else
    {
        float _1001 = float(_93);
        float _1003 = 1.0 / _1001;
        float _1005 = _127 * _1003;
        _997 = _1005;
    }
    _999 = false;
    float _1007 = _997;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1011 = _1007 + _1009;
    float _1013 = _975 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1019;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1025 = _1023 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1027 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1029 = isnan(_1007);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1035 = _1031 || _1033;
    float _1037 = float(_1035);
    float _1039 = 1.0 / _1017;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1043 = _1041 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1045 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1047 = isnan(_1007);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1053 = _1049 || _1051;
    float _1055 = float(_1053);
    float _1057 = _977 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1059 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1061 = 1.0 / _1025;
    float _1063 = _1021 * _1039;
    bool _1065 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1067 = isnan(_1007);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1073 = _1069 || _1071;
    float _1075 = float(_1073);
    float _1077 = 1.0 / _1043;
    float _1079 = -_1037;
    float _1081 = _1079 + 1.0;
    float _1083 = fma(_1063, _1011, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1089 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1091 = isnan(_1007);
    bool _1093 = _1089 || _1091;
    bool _1095 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1097 = _1093 || _1095;
    float _1099 = float(_1097);
    float _1101 = -_1075;
    float _1103 = _1101 + 1.0;
    float _1105 = _1075 * _1081;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1109 = _1107 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1111 = 1.0 / _1087;
    float _1113 = -_1099;
    float _1115 = _1113 + 1.0;
    float _1117 = _1055 * _1103;
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1119;
    float _1123 = _1109 * _1061;
    float _1125 = _1037 * _1115;
    float _1127 = _1083 * _1117;
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1131 = _1007 + _1129;
    float _1133 = -_1055;
    float _1135 = _1133 + 1.0;
    bool _1137 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1139 = isnan(_1007);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1145 = _1141 || _1143;
    float _1147 = float(_1145);
    float _1149 = _1121 * _1077;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1157 = _1007 + _1155;
    float _1159 = fma(_1123, _1131, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1161 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1127);
    float _1163 = -_1147;
    float _1165 = _1163 + 1.0;
    float _1167 = _1153 * _1111;
    float _1169 = fma(_1149, _1157, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1173 = _1007 + _1171;
    float _1175 = fma(_1159, _1105, _1161);
    float _1177 = _1099 * _1165;
    float _1179 = _979 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1181 = fma(_1167, _1173, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1183 = fma(_1169, _1125, _1175);
    float _1185 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1187 = _1179 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1189 = fma(_1181, _1177, _1183);
    float _1191 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1193 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1189);
    float _1195 = _1193 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _1185;
    out.m_55.y = _1191;
    out.m_55.z = _1187;
    out.m_55.w = _1195;
    bool _1197 = !_1059;
    float _1213;
    if (!_1197)
    {
        float _1199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1201 = _599 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1203 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _1205 = _1203 * _1199;
        float _1207 = floor(_1205);
        float _1209 = -_1207;
        float _1211 = _1205 + _1209;
        _1213 = _1211;
        _1215 = true;
    }
    else
    {
        float _1217 = float(_93);
        float _1219 = 1.0 / _1217;
        float _1221 = _127 * _1219;
        _1213 = _1221;
    }
    _1215 = false;
    float _1223 = _1213;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1227 = _1223 + _1225;
    bool _1229 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1231 = isnan(_1223);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1237 = _1233 || _1235;
    float _1239 = float(_1237);
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1243 = _1223 + _1241;
    bool _1245 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1247 = isnan(_1223);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1253 = _1249 || _1251;
    float _1255 = float(_1253);
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1263 = _1261 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1265 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1267 = isnan(_1223);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1273 = _1269 || _1271;
    float _1275 = float(_1273);
    float _1277 = 1.0 / _1259;
    float _1279 = -_1275;
    float _1281 = _1279 + 1.0;
    bool _1283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1285 = _1255 * _1281;
    float _1287 = -_1255;
    float _1289 = _1287 + 1.0;
    float _1291 = 1.0 / _1263;
    float _1293 = _1227 * _1277;
    float _1295 = -_1239;
    float _1297 = _1295 + 1.0;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1299;
    float _1303 = _1275 * _1297;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1305;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1309;
    float _1313 = fma(_1301, _1293, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1315 = _1243 * _1291;
    float _1317 = fma(_1307, _1293, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1319 = fma(_1311, _1293, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1321 = _1313 * _1285;
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1325 = _1323 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1327 = _1317 * _1285;
    float _1329 = _1319 * _1285;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1337 = _1335 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1339 = fma(_1325, _1315, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1341 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1327);
    float _1343 = fma(_1333, _1315, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1345 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1321);
    float _1347 = fma(_1337, _1315, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1349 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1329);
    float _1351 = fma(_1343, _1303, _1341);
    float _1353 = fma(_1339, _1303, _1345);
    float _1355 = fma(_1347, _1303, _1349);
    float _1357 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1351);
    float _1359 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1353);
    float _1361 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1355);
    bool _1363 = !_1283;
    int _1365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1381;
    if (!_1363)
    {
        float _1367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1369 = _599 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1371 = fma(_1369, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _1373 = _1371 * _1367;
        float _1375 = floor(_1373);
        float _1377 = -_1375;
        float _1379 = _1373 + _1377;
        _1381 = _1379;
        _1383 = true;
    }
    else
    {
        float _1385 = float(_93);
        float _1387 = 1.0 / _1385;
        float _1389 = _127 * _1387;
        _1381 = _1389;
    }
    _1383 = false;
    float _1391 = _1381;
    int _1393 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1395 = _1393;
    int _1397 = 0;
    int _1399 = _84(_1395, _1397, (*spvDescriptorSet0.support_buffer));
    float _1401 = in.m_53.y;
    float _1403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1405 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _599);
    float _1407 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1409 = -_1403;
    float _1411 = _1409 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1413 = fma(_1411, _1401, _1403);
    float _1415 = _1407 * _1413;
    float _1417 = float(_1399);
    int _1419 = abs(_1399);
    bool _1421 = _1399 == 0;
    float _1423 = _1415 * _1417;
    float _1425 = float(uint(_1419));
    float _1427 = trunc(_1423);
    int _1429 = int(_1427);
    float _1431 = 1.0 / _1425;
    int _1433 = abs(_1429);
    uint _1436 = uint(int(uint(_1429) >> uint(31)));
    float _1438 = float(uint(_1433));
    int _1440 = ~int(_1436);
    int _1442 = _1440 + 1;
    int _1444 = as_type<int>(_1431) + (-2);
    float _1446 = as_type<float>(_1444) * _1438;
    float _1448 = trunc(_1446);
    float _1450 = precise::max(_1448, 0.0);
    uint _1452 = uint(_1450);
    int _1454 = ~int(_1452);
    int _1456 = _1454 + 1;
    int _1458 = _1456 * _1419;
    int _1460 = _1458 + _1433;
    float _1462 = float(uint(_1460));
    float _1464 = as_type<float>(_1444) * _1462;
    float _1466 = in.m_57.z;
    float _1468 = trunc(_1464);
    float _1470 = precise::max(_1468, 0.0);
    uint _1472 = uint(_1470);
    int _1474 = int(_1452) + int(_1472);
    int _1476 = ~_1474;
    int _1478 = _1476 + 1;
    float _1480 = trunc(_1466);
    int _1482 = int(_1480);
    int _1484 = _1478 * _1419;
    int _1486 = _1484 + _1433;
    bool _1488 = uint(_1486) >= uint(_1419);
    bool _1490 = !_1488;
    int _1492 = _1490 ? 0 : (-1);
    int _1494 = ~_1474;
    int _1496 = _1494 + _1492;
    int _1498 = _1496 + 1;
    int _1500 = _1498 * _1419;
    int _1502 = _1500 + _1433;
    int _1504 = _1502 ^ _1442;
    int _1506 = ~_1442;
    int _1508 = _1506 + _1504;
    int _1510 = _1508 + 1;
    bool _1512 = !_1421;
    int _1514 = _1512 ? _1510 : (-1);
    int _1516 = _1514;
    int _1518 = 0;
    int _1520 = _85(_1516, _1518, (*spvDescriptorSet0.support_buffer));
    int _1522 = _1482;
    int _1524 = 0;
    int _1526 = _85(_1522, _1524, (*spvDescriptorSet0.support_buffer));
    float4 _1529 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1520, _1526)), 0).xyzw;
    float _1531 = _1529.x;
    float _1533 = _1529.y;
    float _1535 = _1529.z;
    float _1537 = _1529.w;
    float _1539 = in.m_57.x;
    float _1541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1543 = in.m_57.y;
    int _1545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1547 = _1545 != 0;
    float _1549 = _1401 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1553 = _1551 != 0;
    float _1555 = in.m_53.z;
    float _1557 = in.m_53.w;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1561 = _1559 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1565 = _1563 != 0;
    float _1567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1571 = _1569 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1575 = _1573 != 0;
    if (_1547)
    {
        bool _1577 = _599 > 0.5;
        _691 = _1577;
    }
    bool _1579 = _691;
    float _1581 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1583 = 0.0;
    if (_1553)
    {
        float _1585 = in.m_53.z;
        _1583 = _1585;
    }
    float _1587 = _1583;
    float _1589 = 1.0 / _1561;
    bool _1591 = _1391 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1593 = isnan(_1391);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1599 = _1595 || _1597;
    float _1601 = float(_1599);
    float _1603 = _1539;
    if (_1547)
    {
        float _1605 = -_1539;
        float _1607 = _1605 + 1.0;
        _1365 = as_type<int>(_1607);
    }
    int _1609 = _1365;
    float _1611 = 0.0;
    if (!_1547)
    {
        _1611 = _1539;
    }
    float _1613 = _1611;
    float _1615 = -_1543;
    float _1617 = _1615 + 1.0;
    float _1619 = _1613;
    if (_1547)
    {
        float _1621 = _1579 ? as_type<float>(_1609) : _1539;
        _1619 = _1621;
    }
    float _1623 = _1619;
    float _1625 = 1.0 / _1571;
    int _1627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1629 = _1627 != 0;
    float _1631 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    bool _1633 = _1557 > 0.5;
    bool _1635 = _1633 && _1565;
    bool _1637 = _1555 > 0.5;
    bool _1639 = _1401 > 0.5;
    bool _1641 = _1639 && _1629;
    float _1643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1645 = _1635 ? _1617 : _1543;
    int _1647 = _1637 ? as_type<int>(_1617) : as_type<int>(_1543);
    int _1649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1651 = _1649 != 0;
    float _1653 = fma(_1645, _1581, -0.5);
    int _1655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1657 = _1655 != 0;
    int _1659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1661 = _1659 != 0;
    float _1663 = _1641 ? _1617 : _1543;
    float _1665 = _599 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1669 = _1667 != 0;
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1675 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1673;
    float _1677 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1679 = _1677 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1681 = -_1671;
    float _1683 = fma(_1665, 2.0, _1681);
    float _1685 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1687 = _1675 * _1589;
    float _1689 = _1657 ? as_type<float>(_1647) : _1543;
    float _1691 = _1679 * _1625;
    bool _1693 = _1657;
    float _1695 = _1631;
    float _1697 = _1555;
    if (_1553)
    {
        bool _1699 = _1587 > 0.5;
        _1693 = _1699;
    }
    bool _1701 = _1693;
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1705 = _1391 + _1703;
    int _1707 = _1661 ? _1647 : as_type<int>(_1543);
    float _1709 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1713 = fma(_1691, _1705, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1715 = fma(_1549, -2.0, _1685);
    float _1717 = fma(_1663, _1709, -0.5);
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1721 = _1391 + _1719;
    bool _1723 = _1391 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1725 = isnan(_1391);
    bool _1727 = _1723 || _1725;
    bool _1729 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1731 = _1727 || _1729;
    float _1733 = float(_1731);
    float _1735 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1737 = _1391 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1739 = isnan(_1391);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1745 = _1741 || _1743;
    int _1747 = _1745 ? 1065353216 : 0;
    float _1749 = fma(_1687, _1721, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1751 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1715);
    float _1753 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1735);
    float _1755 = -_1733;
    float _1757 = _1755 + 1.0;
    bool _1759 = _1401 > 0.5;
    float _1761 = -as_type<float>(_1747);
    float _1763 = _1761 + 1.0;
    float _1765 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1753);
    float _1767 = _1601 * _1757;
    float _1769 = -_1601;
    float _1771 = _1769 + 1.0;
    float _1773 = _1711 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1775 = -_1751;
    float _1777 = fma(_1765, _1717, _1775);
    int _1779 = as_type<int>(_1765);
    int _1781 = _1707;
    float _1783 = _1773;
    float _1785 = _1771;
    bool _1787 = _1701;
    int _1789 = _1747;
    if (_1651)
    {
        float _1791 = -_1539;
        float _1793 = _1791 + 1.0;
        _1779 = as_type<int>(_1793);
    }
    int _1795 = _1779;
    float _1797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1799 = as_type<float>(_1747) * _1771;
    float _1801 = fma(as_type<float>(_1707), _1773, -0.5);
    int _1803 = as_type<int>(_1799);
    if (_1553)
    {
        float _1805 = -_1539;
        float _1807 = _1805 + 1.0;
        _1781 = as_type<int>(_1807);
    }
    int _1809 = _1781;
    if (!_1553)
    {
        _1783 = _1539;
    }
    float _1811 = _1783;
    float _1813 = _1749 * _1799;
    float _1815 = _1811;
    float _1817 = _1813;
    if (_1575)
    {
        float _1819 = -_1539;
        float _1821 = _1819 + 1.0;
        _1803 = as_type<int>(_1821);
    }
    int _1823 = _1803;
    if (!_1575)
    {
        _1785 = _1539;
    }
    float _1825 = _1785;
    float _1827 = fma(_1689, _1631, -0.5);
    float _1829 = _1825;
    if (_1553)
    {
        float _1831 = _1701 ? as_type<float>(_1809) : _1539;
        _1815 = _1831;
    }
    float _1833 = _1815;
    float _1835 = fma(_1763, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1813);
    if (_1575)
    {
        float _1837 = _1759 ? as_type<float>(_1823) : _1539;
        _1829 = _1837;
    }
    float _1839 = _1829;
    float _1841 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_1651)
    {
        float _1843 = _1759 ? as_type<float>(_1795) : _1539;
        _1603 = _1843;
    }
    float _1845 = _1603;
    if (_1669)
    {
        _1787 = false;
    }
    bool _1847 = _1787;
    bool _1849 = _1847;
    if (_1669)
    {
        _1695 = _599;
    }
    float _1851 = _1695;
    float _1853 = 0.0;
    float _1855 = _1851;
    if (_1669)
    {
        _1853 = _1401;
    }
    float _1857 = _1853;
    float _1859 = _1857;
    if (_1669)
    {
        _1789 = as_type<int>(_1555);
    }
    int _1861 = _1789;
    int _1863 = _1861;
    if (!_1669)
    {
        float _1865 = _599 * 3.1415927410125732421875;
        float _1867 = _1865 * 0.15915493667125701904296875;
        float _1869 = _1401 * 3.1415927410125732421875;
        float _1871 = _1869 * 0.15915493667125701904296875;
        float _1873 = _1555 * 3.1415927410125732421875;
        float _1875 = _1867 * 6.283185482025146484375;
        float _1877 = sin(_1875);
        float _1879 = _1873 * 0.15915493667125701904296875;
        float _1881 = _1871 * 6.283185482025146484375;
        float _1883 = sin(_1881);
        float _1885 = _1879 * 6.283185482025146484375;
        float _1887 = sin(_1885);
        _1855 = _1877;
        _1849 = true;
        _1859 = _1883;
        _1863 = as_type<int>(_1887);
        _1817 = _1879;
    }
    float _1889 = _1855;
    bool _1891 = _1849;
    float _1893 = _1859;
    int _1895 = _1863;
    float _1897 = _1817;
    float _1899 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1841);
    float _1901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1903 = _1889 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1905 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1907 = _1897;
    if (_1891)
    {
        _1907 = _1401;
    }
    float _1909 = _1907;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1913 = 0.0;
    float _1915 = _1909;
    if (_1891)
    {
        _1913 = _1401;
    }
    float _1917 = _1913;
    float _1919 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1921 = _1917;
    if (!_1891)
    {
        _1915 = _599;
    }
    float _1923 = _1915;
    float _1925 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1905);
    if (!_1891)
    {
        _1921 = _599;
    }
    float _1927 = _1921;
    float _1929 = fma(_1893, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1919);
    float _1931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1933 = fma(_1713, _1767, _1835);
    float _1935 = _1891 ? as_type<float>(_1895) : _1893;
    float _1937 = -_1911;
    float _1939 = fma(_1903, 2.0, _1937);
    float _1941 = _1797 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1943 = _1891 ? _1893 : _1889;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _1949 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1951 = 0.0;
    if (_1891)
    {
        _1951 = _1555;
    }
    float _1953 = _1951;
    float _1955 = _1901 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1957 = fma(_1941, _1623, -0.5);
    float _1959 = _1953;
    if (!_1891)
    {
        _1697 = _1401;
    }
    float _1961 = _1697;
    float _1963 = -_127;
    float _1965 = fma(_1963, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1683);
    if (!_1891)
    {
        _1959 = _1401;
    }
    float _1967 = _1959;
    float _1969 = fma(_1949, -2.0, _1945);
    float _1971 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1973 = _1931 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1975 = fma(_1955, _1833, -0.5);
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1979 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1971);
    float _1981 = fma(_1973, _1839, -0.5);
    float _1983 = fma(_1927, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1977);
    float _1985 = _1947 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _1987 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _1989 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _1991 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1899);
    float _1993 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _1995 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[98].z, _1989);
    float _1997 = _1943 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _1999 = fma(_1991, _1957, _1965);
    float _2001 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[98].w, _1993);
    float _2003 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1925);
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _2007 = _1935 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _2009 = fma(_1985, _1845, -0.5);
    float _2011 = -_1987;
    float _2013 = fma(_1997, 2.0, _2011);
    float _2015 = -_127;
    float _2017 = fma(_2015, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1939);
    float _2019 = fma(_2007, -2.0, _2005);
    float _2021 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1929);
    float _2023 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1969);
    float _2025 = fma(_1733, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1933);
    float _2027 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2029 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2031 = fma(_2003, _1981, _2017);
    float _2033 = -_2023;
    float _2035 = fma(_2021, _1801, _2033);
    float _2037 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[97].w, _2001);
    float _2039 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[96].y, _2019);
    float _2041 = -_2027;
    float _2043 = fma(_2029, 2.0, _2041);
    float _2045 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1983);
    float _2047 = -_2039;
    float _2049 = fma(_2037, _1827, _2047);
    float _2051 = -_127;
    float _2053 = fma(_2051, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2043);
    int _2055 = _1514 + 1;
    float _2057 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2059 = _1961 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2061 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[97].z, _1995);
    float _2063 = -_127;
    float _2065 = fma(_2063, (*spvDescriptorSet0.vp_c9)._m0[96].x, _2013);
    float _2067 = fma(_2045, _1975, _2053);
    int _2069 = abs(_2055);
    float _2071 = fma(_2059, -2.0, _2057);
    float _2073 = fma(_2061, _2009, _2065);
    float _2075 = _1357 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2077 = float(uint(_2069));
    float _2079 = _1359 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2081 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2083 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1979);
    float _2085 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2071);
    float _2087 = as_type<float>(_1444) * _2077;
    float _2089 = _2075 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2091 = _2079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2093 = _2081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2095 = _2025 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _2097 = as_type<uint>(half2(float2(_1537, 0.0)));
    float _2099 = trunc(_2087);
    float _2101 = precise::max(_2099, 0.0);
    uint _2103 = uint(_2101);
    float _2105 = _2031 + 0.5;
    float _2107 = _2035 + 0.5;
    out.m_59.x = _2089;
    out.m_59.y = _2091;
    out.m_59.z = _2093;
    out.m_59.w = _2095;
    uint _2109 = extract_bits(_2097, 0u, 8u);
    int _2111 = int(_2109) & 255;
    uint _2113 = extract_bits(_2097, 8u, 8u);
    int _2115 = int(_2113) & 255;
    int _2117 = _2115 << 8;
    int _2119 = _2111 | _2117;
    float _2121 = _2073 + 0.5;
    float _2123 = _2049 + 0.5;
    out.m_61.x = _2105;
    out.m_61.y = _2107;
    uint _2125 = uint(int(uint(_2055) >> uint(31)));
    float _2127 = -_2085;
    float _2129 = fma(_2083, _1653, _2127);
    out.m_63.x = _2121;
    out.m_63.y = _2123;
    int _2131 = ~int(_2125);
    int _2133 = _2131 + 1;
    int _2135 = ~int(_2103);
    int _2137 = _2135 + 1;
    int _2139 = _2137 * _1419;
    int _2141 = _2139 + _2069;
    float _2143 = float(uint(_2141));
    float _2145 = as_type<float>(_1444) * _2143;
    float _2147 = trunc(_2145);
    float _2149 = precise::max(_2147, 0.0);
    uint _2151 = uint(_2149);
    int _2153 = int(_2103) + int(_2151);
    int _2155 = ~_2153;
    int _2157 = _2155 + 1;
    int _2159 = _2157 * _1419;
    int _2161 = _2159 + _2069;
    bool _2163 = uint(_2161) >= uint(_1419);
    float _2165 = _2067 + 0.5;
    bool _2167 = !_2163;
    int _2169 = _2167 ? 0 : (-1);
    bool _2171 = _2119 >= 32768;
    int _2173 = ~_2153;
    int _2175 = _2173 + _2169;
    int _2177 = _2175 + 1;
    float _2179 = _2129 + 0.5;
    int _2181 = _2177 * _1419;
    int _2183 = _2181 + _2069;
    int _2185 = _2119 + (-1024);
    int _2187 = _2183 ^ _2133;
    int _2189 = _2185;
    if (_2171)
    {
        int _2191 = ~_2119;
        int _2193 = _2191 + 33792;
        int _2195 = _2193 + 1;
        _2189 = _2195;
    }
    int _2197 = _2189;
    int _2199 = ~_2133;
    int _2201 = _2199 + _2187;
    int _2203 = _2201 + 1;
    int _2205 = _2197 + 30719;
    bool _2207 = !_1421;
    int _2209 = _2207 ? _2203 : (-1);
    float _2211 = float(_2205);
    float _2213 = fma(_2211, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2215 = _1777 + 0.5;
    float _2217 = abs(_2213);
    float _2219 = -_2217;
    float _2221 = _2219 + 1.0;
    int _2223 = as_type<int>(_2221) + (-218103808);
    bool _2225 = uint(_2223) >= 1920991232u;
    float _2227 = _1999 + 0.5;
    bool _2229 = !_2225;
    if (!_2229)
    {
        int _2231;
        _82(_2231, out.gl_Position, out.gl_PointSize);
    }
    int _2233 = _2209;
    int _2235 = 0;
    int _2237 = _85(_2233, _2235, (*spvDescriptorSet0.support_buffer));
    int _2239 = _1482;
    int _2241 = 0;
    int _2243 = _85(_2239, _2241, (*spvDescriptorSet0.support_buffer));
    float4 _2245 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2237, _2243)), 0).xyzw;
    float _2247 = _2245.x;
    float _2249 = _2245.y;
    float _2251 = _2245.z;
    float _2253 = _2245.w;
    float _2255 = floor(_1423);
    float _2257 = -_2255;
    float _2259 = _1423 + _2257;
    uint _2261 = as_type<uint>(half2(float2(_2253, 0.0)));
    float _2263 = -_1531;
    float _2265 = _2263 + _2247;
    float _2267 = -_1533;
    float _2269 = _2267 + _2249;
    float _2271 = -_1535;
    float _2273 = _2271 + _2251;
    uint _2275 = extract_bits(_2261, 0u, 8u);
    int _2277 = int(_2275) & 255;
    uint _2279 = extract_bits(_2261, 8u, 8u);
    int _2281 = int(_2279) & 255;
    int _2283 = _2281 << 8;
    int _2285 = _2277 | _2283;
    float _2287 = fma(_2259, _2265, _1531);
    float _2289 = fma(_2259, _2269, _1533);
    float _2291 = fma(_2259, _2273, _1535);
    bool _2293 = _2285 >= 32768;
    int _2295 = _2285 + (-1024);
    int _2297 = _2295;
    if (_2293)
    {
        int _2299 = ~_2285;
        int _2301 = _2299 + 33792;
        int _2303 = _2301 + 1;
        _2297 = _2303;
    }
    int _2305 = _2297;
    int _2307 = _2305 + 30719;
    float _2309 = float(_2307);
    float _2311 = fma(_2309, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2313 = abs(_2311);
    float _2315 = -_2313;
    float _2317 = _2315 + 1.0;
    int _2319 = as_type<int>(_2317) + (-218103808);
    bool _2321 = uint(_2319) >= 1920991232u;
    bool _2323 = !_2321;
    if (!_2323)
    {
        int _2325;
        _82(_2325, out.gl_Position, out.gl_PointSize);
    }
    float _2327 = _593 * _593;
    float _2329 = _811 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2331 = _809 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2333 = _813 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2335 = fma(_595, _595, _2327);
    float _2337 = fma(_597, _597, _2335);
    float _2339 = rsqrt(_2337);
    float _2341 = _2339 * _597;
    float _2343 = _2339 * _595;
    float _2345 = _2339 * _593;
    float _2347 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2349 = _2341 * _2347;
    float _2351 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2353 = _2343 * _2351;
    float _2355 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2357 = _2345 * _2355;
    bool _2359 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2361 = isnan(0.5);
    bool _2363 = _2359 || _2361;
    bool _2365 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2367 = _2363 || _2365;
    float _2369 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2371 = -_2349;
    float _2373 = fma(_2343, _2369, _2371);
    float _2375 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2377 = -_2353;
    float _2379 = fma(_2345, _2375, _2377);
    float _2381 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2383 = -_2357;
    float _2385 = fma(_2341, _2381, _2383);
    float _2387 = _415 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2389 = _2373 * _2373;
    float _2391 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2289);
    float _2393 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2287);
    float _2395 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2387);
    float _2397 = fma(_2385, _2385, _2389);
    float _2399 = _2329 * _2391;
    float _2401 = _2331 * _2393;
    float _2403 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2395);
    float _2405 = fma(_2379, _2379, _2397);
    float _2407 = _415 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2409 = _415 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2411 = _2399 * _2343;
    float _2413 = rsqrt(_2405);
    float _2415 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2407);
    float _2417 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2409);
    float _2419 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2291);
    float _2421 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2415);
    float _2423 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2417);
    float _2425 = _2333 * _2419;
    float _2427 = _2421 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2429 = _2423 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2431 = _2399 * _2341;
    float _2433 = _2373 * _2413;
    float _2435 = _2385 * _2413;
    float _2437 = _2379 * _2413;
    float _2439 = _2403 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2441 = _2343 * _2433;
    float _2443 = _2427 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2445 = fma(_2401, _2437, _2431);
    float _2447 = _2345 * _2437;
    float _2449 = -_2441;
    float _2451 = fma(_2345, _2435, _2449);
    float _2453 = fma(_2439, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2443);
    float _2455 = fma(_2401, _2435, _2411);
    float _2457 = -_2447;
    float _2459 = fma(_2341, _2433, _2457);
    float _2461 = fma(_2425, _2451, _2445);
    float _2463 = fma(_2429, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2453);
    float _2465 = fma(_2425, _2459, _2455);
    float _2467 = _2429 + _2461;
    float _2469 = _2463 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2471 = _2427 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2473 = _2439 + _2465;
    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2477 = _2467 + _2475;
    float _2479 = 1.0 / _2469;
    float _2481 = fma(_2439, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2471);
    float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2485 = _2473 + _2483;
    float _2487 = _2477 * _2477;
    float _2489 = fma(_2429, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2481);
    float _2491 = fma(_2485, _2485, _2487);
    float _2493 = _2399 * _2345;
    float _2495 = _2489 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2497 = sqrt(_2491);
    float _2499 = fma(_2401, _2433, _2493);
    float _2501 = _2495 + _2469;
    float _2503 = _2341 * _2435;
    float _2505 = _2501 * _2479;
    float _2507 = _2505 * 0.5;
    float _2509 = -_2503;
    float _2511 = fma(_2343, _2437, _2509);
    float _2513 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2515 = fma(_2507, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2513);
    float _2517 = fma(_2425, _2511, _2499);
    float _2519 = _2427 + _2517;
    bool _2521 = _2497 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2523 = 1.0 / _2515;
    float _2525 = _2517;
    float _2527 = _2425;
    float _2529 = _2435;
    float _2531 = _2507;
    float _2533 = _2497;
    float _2535 = _2401;
    float _2537 = _2399;
    float _2539 = _2429;
    if (_2367)
    {
        _2525 = 1.0;
    }
    float _2541 = _2525;
    float _2543 = _2541;
    if (!_2521)
    {
        _2527 = _2473;
    }
    float _2545 = _2527;
    float _2547 = _2545;
    if (!_2521)
    {
        _2529 = _2467;
    }
    float _2549 = _2529;
    float _2551 = _2549;
    if (!_2521)
    {
        _2531 = _2519;
    }
    float _2553 = _2531;
    bool _2555 = !_2521;
    float _2557 = _2553;
    if (!_2555)
    {
        float _2559 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2563 = _2497 + _2561;
        float _2565 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2567 = rsqrt(_2491);
        float _2569 = _2563 * _2559;
        float _2571 = _2569 * 0.15915493667125701904296875;
        float _2573 = _2571 * 6.283185482025146484375;
        float _2575 = cos(_2573);
        float _2577 = _2571 * 6.283185482025146484375;
        float _2579 = sin(_2577);
        float _2581 = _2575 + (-1.0);
        float _2583 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2585 = fma(_2579, _2565, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2587 = fma(_2519, _2575, _2583);
        float _2589 = _2567 * _2585;
        float _2591 = fma(_2485, _2589, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2593 = fma(_2477, _2589, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2533 = _2563;
        _2557 = _2587;
        _2547 = _2591;
        _2551 = _2593;
        _2535 = _2579;
    }
    float _2595 = _2533;
    float _2597 = _2557;
    float _2599 = _2547;
    float _2601 = _2551;
    float _2603 = _2535;
    float _2605 = _2603;
    float _2607 = _2595;
    if (_2367)
    {
        _2605 = 1.0;
    }
    float _2609 = _2605;
    float _2611 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2613 = _2523 * _2611;
    float _2615 = _2609;
    float _2617 = _2613;
    if (!_2367)
    {
        float _2619 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2621 = _2619 * 0.15915493667125701904296875;
        float _2623 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2625 = _2621 * 6.283185482025146484375;
        float _2627 = cos(_2625);
        float _2629 = _2623 * 0.15915493667125701904296875;
        float _2631 = _2621 * 6.283185482025146484375;
        float _2633 = sin(_2631);
        float _2635 = 1.0 / _2627;
        float _2637 = _2629 * 6.283185482025146484375;
        float _2639 = cos(_2637);
        float _2641 = _2633 * _2635;
        float _2643 = _2629 * 6.283185482025146484375;
        float _2645 = sin(_2643);
        float _2647 = _2639 * _2641;
        float _2649 = 1.0 / _2647;
        float _2651 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2653 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2651;
        float _2655 = 1.0 / _2653;
        float _2657 = _2645 * _2649;
        float _2659 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2661 = fma(_2613, _2657, _2659);
        float _2663 = _2661 * _2655;
        float _2665 = precise::clamp(_2663, 0.0, 1.0);
        _2607 = _2621;
        _2537 = _2655;
        _2543 = _2665;
    }
    float _2667 = _2607;
    float _2669 = _2537;
    float _2671 = _2543;
    float _2673 = _2667;
    float _2675 = _2669;
    if (!_2367)
    {
        float _2677 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2679 = _2677 * 0.15915493667125701904296875;
        float _2681 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2683 = _2679 * 6.283185482025146484375;
        float _2685 = cos(_2683);
        float _2687 = _2681 * 0.15915493667125701904296875;
        float _2689 = _2679 * 6.283185482025146484375;
        float _2691 = sin(_2689);
        float _2693 = 1.0 / _2685;
        float _2695 = _2687 * 6.283185482025146484375;
        float _2697 = cos(_2695);
        float _2699 = _2691 * _2693;
        float _2701 = _2687 * 6.283185482025146484375;
        float _2703 = sin(_2701);
        float _2705 = _2697 * _2699;
        float _2707 = 1.0 / _2705;
        float _2709 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2711 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2709;
        float _2713 = 1.0 / _2711;
        float _2715 = _2703 * _2707;
        float _2717 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2719 = fma(_2613, _2715, _2717);
        float _2721 = _2719 * _2713;
        float _2723 = precise::clamp(_2721, 0.0, 1.0);
        float _2725 = -_2723;
        float _2727 = _2725 + 1.0;
        _2673 = _2685;
        _2675 = _2693;
        _2615 = _2727;
    }
    float _2729 = _2673;
    float _2731 = _2675;
    float _2733 = _2615;
    float _2735 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2737 = _2597 + _2735;
    float _2739 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2741 = _2599 + _2739;
    float _2743 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2745 = _2601 + _2743;
    float _2747 = _2737 * _2737;
    float _2749 = fma(_2741, _2741, _2747);
    float _2751 = fma(_2745, _2745, _2749);
    float _2753 = rsqrt(_2751);
    float _2755 = _2753 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2757 = _2741 * _2755;
    float _2759 = _2745 * _2755;
    float _2761 = _2757 * _2757;
    float _2763 = _2759 * _2759;
    float _2765 = _2761 + _2763;
    float _2767 = sqrt(_2765);
    bool _2769 = _2767 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2771 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2773 = _2767 + _2771;
    float _2775 = _2753;
    float _2777 = _2729;
    float _2779 = _2773;
    float _2781 = _2737;
    float _2783 = _2731;
    float _2785 = _2757;
    if (_2769)
    {
        float _2787 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2775 = _2787;
    }
    float _2789 = _2775;
    if (_2769)
    {
        float _2791 = rsqrt(_2765);
        _2777 = _2791;
    }
    float _2793 = _2777;
    float _2795 = _2793;
    if (_2769)
    {
        float _2797 = _2773 * _2789;
        _2779 = _2797;
    }
    float _2799 = _2779;
    if (_2769)
    {
        float _2801 = _2799 * 0.15915493667125701904296875;
        _2617 = _2801;
    }
    float _2803 = _2617;
    float _2805 = _2789;
    if (_2769)
    {
        float _2807 = _2803 * 6.283185482025146484375;
        float _2809 = sin(_2807);
        _2805 = _2809;
    }
    float _2811 = _2805;
    float _2813 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2815 = precise::max(0.0, _2813);
    float _2817 = _2745;
    float _2819 = _2815;
    if (_2769)
    {
        float _2821 = _2803 * 6.283185482025146484375;
        float _2823 = cos(_2821);
        _2817 = _2823;
    }
    float _2825 = _2817;
    float _2827 = -_2755;
    float _2829 = -_2815;
    float _2831 = fma(_2737, _2827, _2829);
    if (!_2769)
    {
        _2781 = _2759;
    }
    float _2833 = _2781;
    float _2835 = _2833;
    if (_2769)
    {
        float _2837 = _2831 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2819 = _2837;
    }
    float _2839 = _2819;
    float _2841 = sqrt(_2751);
    float _2843 = _2811;
    float _2845 = _2839;
    if (_2769)
    {
        float _2847 = fma(_2811, _2839, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2783 = _2847;
    }
    float _2849 = _2783;
    float _2851 = _2849;
    if (!_2769)
    {
        _2843 = _2761;
    }
    float _2853 = _2843;
    float _2855 = _2853;
    if (_2769)
    {
        float _2857 = _2825 + (-1.0);
        _2845 = _2857;
    }
    float _2859 = _2845;
    float _2861 = _2859;
    if (_2769)
    {
        float _2863 = _2793 * _2849;
        _2539 = _2863;
    }
    float _2865 = _2539;
    if (!_2769)
    {
        _2851 = _2831;
    }
    float _2867 = _2851;
    float _2869 = _2867;
    if (_2769)
    {
        float _2871 = _2859 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2795 = _2871;
    }
    float _2873 = _2795;
    if (_2769)
    {
        float _2875 = _2757 * _2865;
        _2785 = _2875;
    }
    float _2877 = _2785;
    if (_2769)
    {
        float _2879 = _2759 * _2865;
        _2835 = _2879;
    }
    float _2881 = _2835;
    if (!_2769)
    {
        _2861 = _2763;
    }
    float _2883 = _2861;
    float _2885 = _2883;
    if (_2769)
    {
        float _2887 = fma(_2831, _2825, _2873);
        _2869 = _2887;
    }
    float _2889 = _2869;
    if (_2769)
    {
        float _2891 = _2877 * _2877;
        _2855 = _2891;
    }
    float _2893 = _2855;
    if (_2769)
    {
        float _2895 = _2881 * _2881;
        _2885 = _2895;
    }
    float _2897 = _2885;
    float _2899 = fma(_2889, _2889, _2893);
    float _2901 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2903 = fma(_2841, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2901);
    float _2905 = precise::clamp(_2903, 0.0, 1.0);
    float _2907 = _2899 + _2897;
    float _2909 = _2597 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2911 = _2597 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2913 = -_2905;
    float _2915 = _2913 + 1.0;
    float _2917 = rsqrt(_2907);
    float _2919 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2909);
    float _2921 = _2597 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2923 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2911);
    float _2925 = _2597 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2927 = fma(_2601, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2919);
    float _2929 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2921);
    float _2931 = fma(_2601, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2923);
    float _2933 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2925);
    float _2935 = abs(_2915);
    float _2937 = log2(_2935);
    float _2939 = fma(_2601, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2929);
    float _2941 = _2931 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2943 = fma(_2601, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2933);
    float _2945 = _2927 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2947 = _2939 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2949 = _2941 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2951 = _2917 * _2877;
    float _2953 = _2917 * _2889;
    float _2955 = _2917 * _2881;
    float _2957 = fma(_2947, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2949);
    float _2959 = _2951 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2961 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2963 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2965 = _2943 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2967 = -_2959;
    float _2969 = fma(_2953, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2967);
    float _2971 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2957);
    float _2973 = -_2963;
    float _2975 = fma(_2973, _2961, 1.0);
    float _2977 = _2937 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2979 = -_2955;
    float _2981 = fma(_2979, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2969);
    float _2983 = fma(_2965, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2971);
    float _2985 = _2941 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2987 = _2941 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2989 = fma(_2981, -0.5, 0.5);
    float _2991 = log2(_2975);
    float _2993 = fma(_2947, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2985);
    float _2995 = fma(_2981, 0.5, 0.5);
    float _2997 = fma(_2947, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2987);
    float _2999 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2993);
    float _3001 = fma(_2995, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3003 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2997);
    float _3005 = 1.0 / _2983;
    float _3007 = fma(_2965, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2999);
    float _3009 = fma(_2995, _3001, -0.212114393711090087890625);
    float _3011 = fma(_2965, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3003);
    float _3013 = fma(_2995, _3009, 1.570728778839111328125);
    float _3015 = exp2(_2977);
    float _3017 = _2991 * 0.693147182464599609375;
    float _3019 = _3017 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3021 = sqrt(_2989);
    float _3023 = _2953 + 1.0;
    float _3025 = _3007 * _3005;
    float _3027 = _3011 * _3005;
    float _3029 = fma(_3025, 0.5, 0.5);
    float _3031 = fma(_3027, -0.5, 0.5);
    float _3033 = -_2953;
    float _3035 = fma(_3015, _3023, _3033);
    float _3037 = fma(_3035, 0.5, 0.5);
    float _3039 = _3021 * 0.636619746685028076171875;
    float3 _7844 = float3(_3029, _3031, _3019);
    float _3041 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7844, float3(0.0), isnan(_7844)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7844, float3(0.0), isnan(_7844)), level(0.0)).x;
    float3 _7855 = float3(_3029, _3031, _3019);
    float4 _3043 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7855, float3(0.0), isnan(_7855)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7855, float3(0.0), isnan(_7855)), level(0.0)).xyzw;
    float _3045 = _3043.x;
    float _3047 = _3043.y;
    float _3049 = _3043.z;
    float _3051 = _3043.w;
    float _3053 = -_3013;
    float _3055 = fma(_3039, _3053, 1.0);
    float2 _7876 = float2(_3055, _3037);
    float3 _3059 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7876, float2(0.0), isnan(_7876)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7876, float2(0.0), isnan(_7876)), level(0.0)).xyz;
    float _3061 = _3059.x;
    float _3063 = _3059.y;
    float _3065 = _3059.z;
    float _3067 = _2937 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3069 = _2941 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3071 = _2671 * _2733;
    bool _3073 = _2671 > 0.0;
    bool _3075 = isnan(_2671);
    bool _3077 = _3073 || _3075;
    bool _3079 = isnan(0.0);
    bool _3081 = _3077 || _3079;
    out.m_65.x = _2227;
    out.m_65.y = _2215;
    out.m_65.z = _2165;
    out.m_65.w = _2179;
    float _3083 = fma(_2947, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3069);
    float _3085 = exp2(_3067);
    float _3087 = _3071 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3089 = _2983 * 0.5;
    float _3091 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3083);
    bool _3093 = _2733 <= 0.0;
    bool _3095 = !_3081;
    bool _3097 = _3093 || _3095;
    float _3099 = _687 * _3087;
    float _3101 = _3007 + _2983;
    float _3103 = fma(_2965, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3091);
    float _3105 = _3099 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3107 = fma(_3011, -0.5, _3089);
    float _3109 = _3103 + _2983;
    float _3111 = _3101 * 0.5;
    out.gl_Position.x = _3007;
    out.gl_Position.y = _3011;
    out.gl_Position.z = _3103;
    out.gl_Position.w = _2983;
    float _3113 = _3109 * 0.5;
    float _3115 = -_3085;
    float _3117 = _3115 + 1.0;
    out.m_47.x = _3105;
    float _3119 = _3117 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _3111;
    out.m_67.y = _3107;
    out.m_67.z = _3113;
    out.m_67.w = _2983;
    float _3121 = -_3119;
    float _3123 = _3121 + 1.0;
    float _3125 = _3119 * _3041;
    float _3127 = _3051 * _3125;
    float _3129 = _3051 * _3123;
    float _3131 = _3065 * _3125;
    float _3133 = fma(_3061, _3127, _3045);
    float _3135 = fma(_3063, _3127, _3047);
    float _3137 = fma(_3051, _3131, _3049);
    out.m_69.x = _3133;
    out.m_69.y = _3135;
    out.m_69.z = _3137;
    out.m_69.w = _3129;
    if (!_3097)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _3139 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3139;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

