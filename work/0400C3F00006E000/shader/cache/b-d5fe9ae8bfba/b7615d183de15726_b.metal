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
    float4 m_63 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_75 [[user(locn10)]];
    float4 m_77 [[user(locn11)]];
    float4 m_89 [[user(locn12)]];
    float4 m_87 [[user(locn13)]];
    float4 m_85 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_59 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_53 [[attribute(9)]];
    float4 m_67 [[attribute(10)]];
};

static inline __attribute__((always_inline))
int _106(thread const int& _8247, thread const int& _8248, constant _10& support_buffer)
{
    float _8251 = as_type<float>(support_buffer._m4);
    int _8253 = _8248 + as_type<int>(_8251);
    int _8255 = 1 + _8253;
    float _8257 = support_buffer._m5[_8255].x;
    float _8259 = abs(_8257);
    bool _8261 = _8259 == 1.0;
    if (_8261)
    {
        return _8247;
    }
    float _8263 = float(_8247);
    float _8265 = _8263 / _8259;
    int _8267 = int(_8265);
    return _8267;
}

static inline __attribute__((always_inline))
int _107(thread const int& _8297, thread const int& _8298, constant _10& support_buffer)
{
    float _8301 = as_type<float>(support_buffer._m4);
    int _8303 = _8298 + as_type<int>(_8301);
    int _8305 = 1 + _8303;
    float _8307 = support_buffer._m5[_8305].x;
    bool _8309 = _8307 == 1.0;
    if (_8309)
    {
        return _8297;
    }
    float _8311 = float(_8297);
    float _8313 = _8311 * _8307;
    int _8315 = int(_8313);
    return _8315;
}

static inline __attribute__((always_inline))
void _104(thread const int& _7942, thread const int& _7943, thread const int& _7944, thread const int& _7945, thread int& _7946, thread int& _7947, thread int& _7948, thread int& _7949, thread int& _7950, thread int& _7951, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _7954 = _7943;
    int _7956 = _7944;
    float _7958 = 0.0 + as_type<float>(_7942);
    bool _7960 = _7958 != 0.0;
    bool _7962 = isnan(_7958);
    bool _7964 = _7960 || _7962;
    bool _7966 = isnan(0.0);
    bool _7968 = _7964 || _7966;
    int _7970 = as_type<int>(_7958);
    int _7972 = _7968 ? (-1) : 0;
    if (!_7968)
    {
        float _7974 = as_type<float>(_7942) * 1.0;
        _7954 = as_type<int>(_7974);
    }
    int _7976 = _7954;
    bool _7978 = !_7968;
    int _7980 = _7976;
    int _7982 = _7976;
    if (!_7978)
    {
        bool _7984 = _7958 >= 0.0;
        bool _7986 = isnan(_7958);
        bool _7988 = _7984 || _7986;
        bool _7990 = isnan(0.0);
        bool _7992 = _7988 || _7990;
        _7972 = _7992 ? (-1) : 0;
        if (!_7992)
        {
            _7980 = 2147483647;
        }
        int _7994 = _7980;
        bool _7996 = !_7992;
        int _7998 = _7994;
        _7982 = _7994;
        if (!_7996)
        {
            float _8000 = abs(as_type<float>(_7942));
            float _8002 = 0.0 + _8000;
            bool _8004 = _8002 > as_type<float>(0x7f800000u /* inf */);
            bool _8006 = isnan(_8002);
            bool _8008 = _8004 || _8006;
            bool _8010 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _8012 = _8008 || _8010;
            _7970 = as_type<int>(_8002);
            _7972 = _8012 ? (-1) : 0;
            if (_8012)
            {
                float _8014 = as_type<float>(_7942) + 1.0;
                _7998 = as_type<int>(_8014);
            }
            int _8016 = _7998;
            int _8018 = _8016;
            _7982 = _8016;
            if (!_8012)
            {
                bool _8020 = _8002 != as_type<float>(0x7f800000u /* inf */);
                bool _8022 = isnan(_8002);
                bool _8024 = _8020 || _8022;
                bool _8026 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _8028 = _8024 || _8026;
                _7972 = _8028 ? (-1) : 0;
                if (!_8028)
                {
                    _8018 = _7942;
                }
                int _8030 = _8018;
                bool _8032 = !_8028;
                _7982 = _8030;
                if (!_8032)
                {
                    float _8034 = as_type<float>(_7942) * 18446744073709551616.0;
                    float _8036 = rsqrt(_8034);
                    float _8038 = _8034 * _8036;
                    float _8040 = _8036 * 0.5;
                    float _8042 = -_8038;
                    float _8044 = 0.0 + _8042;
                    float _8046 = fma(_8040, _8044, 0.5);
                    float _8048 = fma(_8038, _8046, _8038);
                    float _8050 = -_8048;
                    float _8052 = 0.0 + _8050;
                    float _8054 = fma(_8048, _8052, _8034);
                    float _8056 = fma(_8040, _8054, _8048);
                    float _8058 = _8056 * 2.3283064365386962890625e-10;
                    _7982 = as_type<int>(_8058);
                    _7956 = as_type<int>(_8048);
                    _7970 = as_type<int>(_8044);
                }
            }
        }
    }
    int _8060 = _7982;
    int _8062 = _7956;
    int _8064 = _7970;
    int _8066 = _7972;
    _7946 = _7945;
    _7947 = 0;
    _7948 = _8060;
    _7949 = _8062;
    _7950 = _8064;
    _7951 = _8066;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2895 = false;
    bool _1467 = false;
    bool _1277 = false;
    bool _699 = false;
    bool _315 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = trunc(_111);
    int _115 = int(_113);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_49.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3178 = as_type<float>(_131);
        out.gl_Position.z = _3178;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_51.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = _149;
    if (_145)
    {
        float _153 = float(_115);
        _125 = _153;
    }
    float _155 = _125;
    bool _157 = _149 >= _155;
    bool _159 = !_145;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_49.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3248 = as_type<float>(_169);
        out.gl_Position.z = _3248;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = in.m_53.y;
    float _173 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = in.m_55.w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = in.m_51.x;
    float _189 = in.m_51.y;
    float _191 = in.m_51.z;
    float _193 = in.m_46.x;
    float _195 = in.m_46.y;
    float _197 = in.m_46.z;
    float _199 = 0.0;
    float _201 = _173;
    if (!_185)
    {
        float _203 = _173 * _173;
        float _205 = _203 * 0.5;
        _199 = _205;
    }
    float _207 = _199;
    float _209 = _207;
    if (!_185)
    {
        float _211 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _211;
    }
    float _213 = _209;
    out.m_57.y = _171;
    bool _215 = !_185;
    float _217 = _213;
    if (!_215)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _173 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _173);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _247;
    }
    float _249 = _217;
    bool _251 = !_185;
    if (!_251)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _173 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _201 = _271;
    }
    float _273 = _201;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _277 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _279 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _281 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _283 = fma(_273, _187, _277);
    float _285 = fma(_273, _189, _279);
    float _287 = fma(_273, _191, _281);
    float _289 = fma(_283, _175, _193);
    float _291 = fma(_285, _175, _195);
    float _293 = fma(_287, _175, _197);
    bool _295 = !_275;
    float _313;
    if (!_295)
    {
        float _297 = in.m_59.x;
        float _299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _301 = _297 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _305 = _303 * _299;
        float _307 = floor(_305);
        float _309 = -_307;
        float _311 = _305 + _309;
        _313 = _311;
        _315 = true;
    }
    else
    {
        float _317 = float(_115);
        float _319 = 1.0 / _317;
        float _321 = _149 * _319;
        _313 = _321;
    }
    _315 = false;
    float _323 = _313;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _341 = 1.0 / _327;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _351 = 1.0 / _331;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _355 = _323 + _353;
    bool _357 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _359 = isnan(_323);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_367;
    float _371 = _369 + 1.0;
    float _373 = 1.0 / _335;
    float _375 = _355 * _341;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _379 = _323 + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = _323 + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _387 = _323 + _385;
    bool _389 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _391 = 1.0 / _345;
    float _393 = _379 * _351;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _397 = _323 + _395;
    bool _399 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _401 = isnan(_323);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _413 = _323 + _411;
    float _415 = 1.0 / _339;
    float _417 = _383 * _373;
    bool _419 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _421 = isnan(_323);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    float _431 = -_409;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _435;
    float _439 = 1.0 / _349;
    float _441 = _397 * _391;
    float _443 = -_429;
    float _445 = _443 + 1.0;
    bool _447 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _449 = isnan(_323);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = fma(_437, _375, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _461 = _409 * _445;
    float _463 = _387 * _415;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _469;
    float _473 = fma(_467, _375, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _475 = _457 * _433;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _481 = _413 * _439;
    float _483 = fma(_471, _375, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _485 = -_457;
    float _487 = _485 + 1.0;
    bool _489 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _491 = isnan(_323);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _505 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _507 = isnan(_323);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _521 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _523 = isnan(_323);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = fma(_503, _393, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _535 = fma(_479, _393, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _537 = fma(_519, _393, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _539 = _499 * _371;
    float _541 = -_499;
    float _543 = _541 + 1.0;
    float _545 = -_531;
    float _547 = _545 + 1.0;
    float _549 = _367 * _487;
    float _551 = _531 * _543;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _553;
    float _557 = _515 * _547;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _559;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _563;
    float _567 = fma(_555, _417, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _569 = _459 * _557;
    float _571 = fma(_561, _417, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _573 = fma(_565, _417, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _575 = -_515;
    float _577 = _575 + 1.0;
    float _579 = _473 * _557;
    float _581 = _483 * _557;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _595 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[143].z, _569);
    float _597 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[143].x, _579);
    float _599 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[143].y, _581);
    float _601 = fma(_585, _463, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _603 = fma(_589, _463, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _605 = fma(_593, _463, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _607 = fma(_537, _551, _595);
    float _609 = fma(_533, _551, _597);
    float _611 = fma(_535, _551, _599);
    float _613 = fma(_571, _539, _609);
    float _615 = fma(_573, _539, _607);
    float _617 = fma(_567, _539, _611);
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _619;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _627;
    float _631 = fma(_601, _549, _613);
    float _633 = fma(_605, _549, _615);
    float _635 = fma(_621, _441, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _637 = fma(_625, _441, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _639 = fma(_603, _549, _617);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _649 = fma(_629, _441, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _655 = fma(_643, _481, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _657 = fma(_647, _481, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _659 = fma(_635, _475, _631);
    float _661 = fma(_653, _481, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _663 = fma(_637, _475, _639);
    float _665 = fma(_649, _475, _633);
    float _667 = fma(_655, _461, _659);
    float _669 = fma(_657, _461, _663);
    float _671 = fma(_661, _461, _665);
    float _673 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[149].x, _667);
    float _675 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[149].y, _669);
    float _677 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[149].z, _671);
    bool _679 = !_389;
    float _697;
    if (!_679)
    {
        float _681 = in.m_59.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[11].x, _149);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _697 = _695;
        _699 = true;
    }
    else
    {
        float _701 = float(_115);
        float _703 = 1.0 / _701;
        float _705 = _149 * _703;
        _697 = _705;
    }
    _699 = false;
    float _707 = _697;
    int _709 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _711 = _709;
    int _713 = 0;
    int _715 = _106(_711, _713, (*spvDescriptorSet0.support_buffer));
    float _717 = in.m_53.x;
    float _719 = _149 * 0.0500000007450580596923828125;
    float _721 = in.m_53.z;
    float _723 = fma(_717, 18.84955596923828125, _719);
    float _725 = _723 * 0.15915493667125701904296875;
    float _727 = trunc(_721);
    int _729 = int(_727);
    float _731 = _725 * 6.283185482025146484375;
    float _733 = sin(_731);
    float _735 = fma(_733, 0.5, 0.5);
    float _737 = float(_715);
    int _739 = abs(_715);
    bool _741 = _715 == 0;
    float _743 = _735 * _737;
    float _745 = float(uint(_739));
    float _747 = trunc(_743);
    int _749 = int(_747);
    float _751 = 1.0 / _745;
    int _753 = abs(_749);
    uint _756 = uint(int(uint(_749) >> uint(31)));
    float _758 = float(uint(_753));
    int _760 = ~int(_756);
    int _762 = _760 + 1;
    int _764 = as_type<int>(_751) + (-2);
    float _766 = as_type<float>(_764) * _758;
    float _768 = trunc(_766);
    float _770 = precise::max(_768, 0.0);
    uint _772 = uint(_770);
    int _774 = ~int(_772);
    int _776 = _774 + 1;
    int _778 = _776 * _739;
    int _780 = _778 + _753;
    float _782 = float(uint(_780));
    float _784 = as_type<float>(_764) * _782;
    float _786 = trunc(_784);
    float _788 = precise::max(_786, 0.0);
    uint _790 = uint(_788);
    int _792 = int(_772) + int(_790);
    int _794 = ~_792;
    int _796 = _794 + 1;
    int _798 = _796 * _739;
    int _800 = _798 + _753;
    bool _802 = uint(_800) >= uint(_739);
    bool _804 = !_802;
    int _806 = _804 ? 0 : (-1);
    int _808 = ~_792;
    int _810 = _808 + _806;
    int _812 = _810 + 1;
    int _814 = _812 * _739;
    int _816 = _814 + _753;
    int _818 = _816 ^ _762;
    int _820 = ~_762;
    int _822 = _820 + _818;
    int _824 = _822 + 1;
    bool _826 = !_741;
    int _828 = _826 ? _824 : (-1);
    int _830 = _828;
    int _832 = 0;
    int _834 = _107(_830, _832, (*spvDescriptorSet0.support_buffer));
    int _836 = _729;
    int _838 = 0;
    int _840 = _107(_836, _838, (*spvDescriptorSet0.support_buffer));
    float4 _843 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_834, _840)), 0).xyzw;
    float _845 = _843.x;
    float _847 = _843.y;
    float _849 = _843.z;
    float _851 = _843.w;
    float _853 = in.m_55.x;
    float _855 = in.m_55.y;
    float _857 = in.m_55.z;
    float _859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _861 = in.m_59.x;
    float _863 = in.m_59.y;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _865;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _871 = _869 != 0;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _875 = _873 != 0;
    float _877 = 1.0 / _867;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _881 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _883 = _675 * _855;
    float _885 = _677 * _857;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _891 = _863 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _895 = 1.0 / _889;
    float _897 = _861 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _899 = _861 > 0.5;
    bool _901 = _899 && _871;
    float _903 = fma(_891, -2.0, _893);
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _907 = _863 > 0.5;
    bool _909 = _907 && _875;
    float _911 = -_879;
    float _913 = fma(_897, 2.0, _911);
    int _915 = _828 + 1;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _919 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[78].w, _905);
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _923 = _707 + _921;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _927 = _707 + _925;
    float _929 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[78].z, _917);
    float _931 = -_717;
    float _933 = _931 + 1.0;
    float _935 = _923 * _895;
    float _937 = _927 * _877;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _939;
    float _943 = _901 ? _933 : _717;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _945;
    bool _949 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _951 = isnan(_707);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _957 = _953 || _955;
    float _959 = float(_957);
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _961;
    float _965 = fma(_941, _937, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _967 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _969 = isnan(_707);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    float _979 = fma(_947, _937, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _981 = -_959;
    float _983 = _981 + 1.0;
    float _985 = fma(_963, _937, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _987 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _989 = isnan(_707);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1001 = _999 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1005 = _1003 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1007 = _977 * _983;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1011 = _1009 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1013 = _859 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1015 = -_977;
    float _1017 = _1015 + 1.0;
    float _1019 = _883 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1021 = fma(_1001, _935, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1023 = fma(_1013, _943, -0.5);
    float _1025 = _997 * _1017;
    float _1027 = _1019 * _171;
    float _1029 = -_997;
    float _1031 = _1029 + 1.0;
    float _1033 = _881 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1035 = _979 * _1025;
    float _1037 = _1027;
    if (_909)
    {
        float _1039 = -_1027;
        float _1041 = _1039 + 1.0;
        _1037 = _1041;
    }
    float _1043 = _1037;
    float _1045 = _985 * _1025;
    float _1047 = _965 * _1025;
    float _1049 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1035);
    float _1051 = fma(_1033, _1043, -0.5);
    float _1053 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1045);
    float _1055 = fma(_1005, _935, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1057 = fma(_1021, _1007, _1049);
    float _1059 = fma(_1011, _935, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1061 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1047);
    float _1063 = fma(_1055, _1007, _1053);
    float _1065 = fma(_1059, _1007, _1061);
    float _1067 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1057);
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1071 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1063);
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1075 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1065);
    float _1077 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1079 = -_149;
    float _1081 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[76].x, _913);
    float _1083 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1085 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _929);
    int _1087 = abs(_915);
    float _1089 = _673 * _853;
    float _1091 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _919);
    float _1093 = fma(_1085, _1023, _1081);
    float _1095 = float(uint(_1087));
    float _1097 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _903);
    float _1099 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1101 = _1075 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1103 = as_type<float>(_764) * _1095;
    float _1105 = -_1097;
    float _1107 = fma(_1091, _1051, _1105);
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1111 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1113 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _1115 = uint(int(uint(_915) >> uint(31)));
    float _1117 = trunc(_1103);
    float _1119 = precise::max(_1117, 0.0);
    uint _1121 = uint(_1119);
    float _1123 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1125 = _1071 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1127 = ~int(_1115);
    int _1129 = _1127 + 1;
    float _1131 = _1093 + 0.5;
    float _1133 = _1107 + 0.5;
    out.m_61.x = _1077;
    out.m_61.y = _1123;
    out.m_61.z = _1083;
    float _1135 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _1111;
    out.m_63.y = _1135;
    out.m_63.z = _1113;
    int _1137 = ~int(_1121);
    int _1139 = _1137 + 1;
    int _1141 = _1139 * _739;
    int _1143 = _1141 + _1087;
    float _1145 = float(uint(_1143));
    float _1147 = as_type<float>(_764) * _1145;
    float _1149 = trunc(_1147);
    float _1151 = precise::max(_1149, 0.0);
    uint _1153 = uint(_1151);
    int _1155 = int(_1121) + int(_1153);
    int _1157 = ~_1155;
    int _1159 = _1157 + 1;
    int _1161 = _1159 * _739;
    int _1163 = _1161 + _1087;
    bool _1165 = uint(_1163) >= uint(_739);
    bool _1167 = !_1165;
    int _1169 = _1167 ? 0 : (-1);
    int _1171 = ~_1155;
    int _1173 = _1171 + _1169;
    int _1175 = _1173 + 1;
    int _1177 = _1175 * _739;
    int _1179 = _1177 + _1087;
    int _1181 = _1179 ^ _1129;
    int _1183 = ~_1129;
    int _1185 = _1183 + _1181;
    int _1187 = _1185 + 1;
    bool _1189 = !_741;
    int _1191 = _1189 ? _1187 : (-1);
    uint _1193 = as_type<uint>(half2(float2(_851, 0.0)));
    uint _1195 = extract_bits(_1193, 0u, 8u);
    int _1197 = int(_1195) & 255;
    uint _1199 = extract_bits(_1193, 8u, 8u);
    int _1201 = int(_1199) & 255;
    int _1203 = _1201 << 8;
    int _1205 = _1197 | _1203;
    bool _1207 = _1205 >= 32768;
    int _1209 = _1205 + (-1024);
    int _1211 = _1209;
    if (_1207)
    {
        int _1213 = ~_1205;
        int _1215 = _1213 + 33792;
        int _1217 = _1215 + 1;
        _1211 = _1217;
    }
    int _1219 = _1211;
    int _1221 = _1219 + 30719;
    float _1223 = float(_1221);
    float _1225 = fma(_1223, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1227 = abs(_1225);
    float _1229 = -_1227;
    float _1231 = _1229 + 1.0;
    bool _1233 = _1225 < 0.0;
    float _1235 = float(_1233);
    float _1237 = abs(_1225);
    float _1239 = fma(_1237, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1241 = as_type<int>(_1231) + (-218103808);
    float _1243 = abs(_1225);
    float _1245 = fma(_1243, _1239, -0.212114393711090087890625);
    bool _1247 = uint(_1241) >= 1920991232u;
    float _1249 = abs(_1225);
    float _1251 = fma(_1249, _1245, 1.570728778839111328125);
    bool _1253 = !_1247;
    float _1275;
    if (!_1253)
    {
        int _1255 = as_type<int>(_1231);
        int _1257 = as_type<int>(_1111);
        int _1259 = _1169;
        int _1261 = 6272;
        int _1263;
        int _1265;
        int _1267;
        int _1269;
        int _1271;
        int _1273;
        _104(_1255, _1257, _1259, _1261, _1263, _1265, _1267, _1269, _1271, _1273, out.gl_Position, out.gl_PointSize);
        _1275 = as_type<float>(_1267);
        _1277 = true;
    }
    else
    {
        float _1279 = rsqrt(_1231);
        float _1281 = _1231 * _1279;
        float _1283 = _1279 * 0.5;
        float _1285 = -_1281;
        float _1287 = 0.0 + _1285;
        float _1289 = fma(_1283, _1287, 0.5);
        float _1291 = fma(_1281, _1289, _1281);
        float _1293 = -_1291;
        float _1295 = 0.0 + _1293;
        float _1297 = fma(_1291, _1295, _1231);
        float _1299 = fma(_1283, _1297, _1291);
        _1275 = _1299;
    }
    _1277 = false;
    float _1301 = _1275;
    int _1303 = _1191;
    int _1305 = 0;
    int _1307 = _107(_1303, _1305, (*spvDescriptorSet0.support_buffer));
    int _1309 = _729;
    int _1311 = 0;
    int _1313 = _107(_1309, _1311, (*spvDescriptorSet0.support_buffer));
    float4 _1315 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1307, _1313)), 0).xyzw;
    float _1317 = _1315.x;
    float _1319 = _1315.y;
    float _1321 = _1315.z;
    float _1323 = _1315.w;
    float _1325 = _1251 * _1301;
    float _1327 = _1235 * 2.0;
    float _1329 = floor(_743);
    float _1331 = _1223 * 3.883221149444580078125;
    float _1333 = -_1327;
    float _1335 = fma(_1325, _1333, _1325);
    float _1337 = _1331 * 0.15915493667125701904296875;
    float _1339 = fma(_1235, 3.1415927410125732421875, _1335);
    float _1341 = _1337 * 6.283185482025146484375;
    float _1343 = cos(_1341);
    float _1345 = _1339 * 0.15915493667125701904296875;
    float _1347 = -_1329;
    float _1349 = _743 + _1347;
    float _1351 = _1345 * 6.283185482025146484375;
    float _1353 = sin(_1351);
    float _1355 = _1337 * 6.283185482025146484375;
    float _1357 = sin(_1355);
    float _1359 = _1353 * _1343;
    float _1361 = _1353 * _1357;
    uint _1363 = as_type<uint>(half2(float2(_1323, 0.0)));
    float _1365 = -_845;
    float _1367 = _1365 + _1317;
    float _1369 = -_847;
    float _1371 = _1369 + _1319;
    uint _1373 = extract_bits(_1363, 0u, 8u);
    int _1375 = int(_1373) & 255;
    uint _1377 = extract_bits(_1363, 8u, 8u);
    int _1379 = int(_1377) & 255;
    int _1381 = _1379 << 8;
    int _1383 = _1375 | _1381;
    float _1385 = fma(_1349, _1367, _845);
    float _1387 = fma(_1349, _1371, _847);
    bool _1389 = _1383 >= 32768;
    int _1391 = _1383 + (-1024);
    int _1393 = _1391;
    float _1395 = _1387;
    if (_1389)
    {
        int _1397 = ~_1383;
        int _1399 = _1397 + 33792;
        int _1401 = _1399 + 1;
        _1393 = _1401;
    }
    int _1403 = _1393;
    int _1405 = _1403 + 30719;
    float _1407 = float(_1405);
    float _1409 = fma(_1407, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1411 = abs(_1409);
    float _1413 = -_1411;
    float _1415 = _1413 + 1.0;
    float _1417 = abs(_1409);
    float _1419 = fma(_1417, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1421 = as_type<int>(_1415) + (-218103808);
    bool _1423 = uint(_1421) >= 1920991232u;
    float _1425 = -_849;
    float _1427 = _1425 + _1321;
    float _1429 = abs(_1409);
    float _1431 = fma(_1429, _1419, -0.212114393711090087890625);
    bool _1433 = _1409 < 0.0;
    float _1435 = float(_1433);
    float _1437 = fma(_1349, _1427, _849);
    float _1439 = abs(_1409);
    float _1441 = fma(_1439, _1431, 1.570728778839111328125);
    bool _1443 = !_1423;
    float _1465;
    if (!_1443)
    {
        int _1445 = as_type<int>(_1415);
        int _1447 = as_type<int>(_1367);
        int _1449 = as_type<int>(_1319);
        int _1451 = 7184;
        int _1453;
        int _1455;
        int _1457;
        int _1459;
        int _1461;
        int _1463;
        _104(_1445, _1447, _1449, _1451, _1453, _1455, _1457, _1459, _1461, _1463, out.gl_Position, out.gl_PointSize);
        _1465 = as_type<float>(_1457);
        _1467 = true;
    }
    else
    {
        float _1469 = rsqrt(_1415);
        float _1471 = _1415 * _1469;
        float _1473 = _1469 * 0.5;
        float _1475 = -_1471;
        float _1477 = 0.0 + _1475;
        float _1479 = fma(_1473, _1477, 0.5);
        float _1481 = fma(_1471, _1479, _1471);
        float _1483 = -_1481;
        float _1485 = 0.0 + _1483;
        float _1487 = fma(_1481, _1485, _1415);
        float _1489 = fma(_1473, _1487, _1481);
        _1465 = _1489;
    }
    _1467 = false;
    float _1491 = _1465;
    float _1493 = in.m_53.x;
    float _1495 = in.m_53.y;
    float _1497 = _1441 * _1491;
    float _1499 = _1407 * 3.883221149444580078125;
    float _1501 = -_1225;
    float _1503 = _1501 + _1409;
    float _1505 = in.m_59.z;
    float _1507 = _1435 * 2.0;
    float _1509 = _149 * (-0.20000000298023223876953125);
    float _1511 = _1499 * 0.15915493667125701904296875;
    float _1513 = in.m_59.x;
    float _1515 = in.m_59.y;
    float _1517 = -_1507;
    float _1519 = fma(_1497, _1517, _1497);
    float _1521 = fma(_1349, _1503, _1225);
    float _1523 = _291 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1525 = _291 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1527 = _291 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1529 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1523);
    float _1531 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1525);
    float _1533 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1527);
    float _1535 = fma(_1435, 3.1415927410125732421875, _1519);
    float _1537 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1539 = log2(_1537);
    float _1541 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1543 = fma(_1495, 25.1327419281005859375, _1509);
    float _1545 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1547 = _1505 * 2.0;
    int _1549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1551 = _1549 != 0;
    int _1553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1555 = _1553 != 0;
    int _1557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1559 = _1557 != 0;
    float _1561 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1541);
    float _1563 = _1513 * 2.0;
    float _1565 = floor(_1547);
    float _1567 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1561);
    float _1569 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1571 = _1515 + _1505;
    float _1573 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1545);
    float _1575 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1531);
    float _1577 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1569);
    float _1579 = floor(_1563);
    float _1581 = _1571 + (-1.0);
    float _1583 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1529);
    float _1585 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1573);
    float _1587 = _1505 + _1513;
    float _1589 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1533);
    float _1591 = fma(_1581, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1593 = _1587 + (-1.0);
    float _1595 = _1515 + _1513;
    float _1597 = _1543 * 0.15915493667125701904296875;
    bool _1599 = _1565 > 0.0;
    float _1601 = _1595 + (-1.0);
    float _1603 = fma(_149, -0.007000000216066837310791015625, _1493);
    float _1605 = fma(_1593, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1607 = _1539 * _149;
    bool _1609 = _1565 >= 0.0;
    bool _1611 = isnan(_1565);
    bool _1613 = _1609 || _1611;
    bool _1615 = isnan(0.0);
    bool _1617 = _1613 || _1615;
    float _1619 = _1535 * 0.15915493667125701904296875;
    float _1621 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1623 = _1603 * 18.84955596923828125;
    float _1625 = fma(_149, -0.006000000052154064178466796875, _1493);
    float _1627 = _1511 * 6.283185482025146484375;
    float _1629 = cos(_1627);
    int _1631 = _1617 ? 0 : 1;
    float _1633 = _1515 * 2.0;
    float _1635 = _1575 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1637 = _1579 > 0.0;
    float _1639 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1577);
    bool _1641 = _1579 >= 0.0;
    bool _1643 = isnan(_1579);
    bool _1645 = _1641 || _1643;
    bool _1647 = isnan(0.0);
    bool _1649 = _1645 || _1647;
    float _1651 = _1511 * 6.283185482025146484375;
    float _1653 = sin(_1651);
    float _1655 = _1625 * 31.415927886962890625;
    int _1657 = ~_1631;
    int _1659 = _1657 + 1;
    int _1661 = _1659 + 1;
    float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1665 = 1.0 + _1663;
    int _1667 = _1661;
    float _1669 = _1521;
    if (!_1599)
    {
        int _1671 = ~_1631;
        int _1673 = _1671 + 1;
        _1667 = _1673;
    }
    int _1675 = _1667;
    float _1677 = _1655 * 0.15915493667125701904296875;
    float _1679 = _1583 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1681 = _1589 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1683 = exp2(_1607);
    float _1685 = _1623 * 0.15915493667125701904296875;
    float _1687 = fma(_149, 0.001000000047497451305389404296875, _1493);
    float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1691 = _1679 + _1689;
    bool _1693 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1695 = isnan(1.0);
    bool _1697 = _1693 || _1695;
    bool _1699 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1701 = _1697 || _1699;
    float _1703 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1705 = _1681 + _1703;
    float _1707 = _1687 * 43.9822998046875;
    float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1711 = _1635 + _1709;
    float _1713 = floor(_1633);
    bool _1715 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1717 = isnan(0.0);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1723 = _1719 || _1721;
    float _1725 = _1707 * 0.15915493667125701904296875;
    float _1727 = _1711 * _1711;
    float _1729 = _1513 * 6.283185482025146484375;
    bool _1731 = !_1551;
    int _1733 = _1731 ? 0 : 1;
    float _1735 = _1513 + (-0.5);
    float _1737 = fma(_1691, _1691, _1727);
    float _1739 = 1.0 / _1665;
    float _1741 = -_1683;
    float _1743 = _1741 + 1.0;
    float _1745 = _1515 * 6.283185482025146484375;
    int _1747 = _1649 ? 0 : 1;
    float _1749 = _1515 + (-0.5);
    int _1751 = abs(_1733);
    float _1753 = _1505 + (-0.5);
    float _1755 = _1723 ? _1743 : 0.0;
    float _1757 = _1685 * 6.283185482025146484375;
    float _1759 = sin(_1757);
    bool _1761 = _1713 > 0.0;
    float _1763 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1765 = _1713 >= 0.0;
    bool _1767 = isnan(_1713);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan(0.0);
    bool _1773 = _1769 || _1771;
    float _1775 = fma(_149, 0.070000000298023223876953125, _1729);
    float _1777 = float(_1675);
    int _1779 = _1773 ? 0 : 1;
    float _1781 = _1619 * 6.283185482025146484375;
    float _1783 = sin(_1781);
    float _1785 = fma(_1705, _1705, _1737);
    float _1787 = fma(_149, 0.12999999523162841796875, _1745);
    float _1789 = _1679;
    if (_1701)
    {
        float _1791 = _1755 * _1739;
        _151 = _1791;
    }
    float _1793 = _151;
    bool _1795 = !_1555;
    int _1797 = _1795 ? 0 : 1;
    float _1799 = in.m_65.x;
    float _1801 = in.m_65.y;
    float _1803 = in.m_65.z;
    float _1805 = _1787 * 0.15915493667125701904296875;
    float _1807 = rsqrt(_1785);
    int _1809 = abs(_1797);
    float _1811 = _1759 * 0.0500000007450580596923828125;
    int _1813 = ~_1747;
    int _1815 = _1813 + 1;
    int _1817 = _1815 + 1;
    int _1819 = _1817;
    if (!_1637)
    {
        int _1821 = ~_1747;
        int _1823 = _1821 + 1;
        _1819 = _1823;
    }
    int _1825 = _1819;
    float _1827 = float(_1809);
    float _1829 = _1597 * 6.283185482025146484375;
    float _1831 = sin(_1829);
    float _1833 = float(_1825);
    float _1835 = -_1361;
    float _1837 = fma(_1783, _1653, _1835);
    float _1839 = float(_1751);
    int _1841 = ~_1779;
    int _1843 = _1841 + 1;
    int _1845 = _1843 + 1;
    float _1847 = _1827 * _1833;
    int _1849 = _1845;
    if (!_1761)
    {
        int _1851 = ~_1779;
        int _1853 = _1851 + 1;
        _1849 = _1853;
    }
    int _1855 = _1849;
    float _1857 = _1711 * _1807;
    float _1859 = _1839 * _1777;
    float _1861 = _1691 * _1807;
    float _1863 = _1847 * (-2.0);
    float _1865 = -_1857;
    float _1867 = fma(_1865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1711);
    float _1869 = _1859 * (-2.0);
    float _1871 = -_1861;
    float _1873 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1691);
    float _1875 = fma(_1591, _1863, _1591);
    float _1877 = _1867 * _1867;
    float _1879 = fma(_1863, _1801, _1801);
    float _1881 = _1775 * 0.15915493667125701904296875;
    float _1883 = _1705 * _1807;
    float _1885 = fma(_1873, _1873, _1877);
    bool _1887 = !_1559;
    int _1889 = _1887 ? 0 : 1;
    float _1891 = in.m_67.x;
    float _1893 = in.m_67.y;
    float _1895 = -_1883;
    float _1897 = fma(_1895, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1705);
    float _1899 = _1725 * 6.283185482025146484375;
    float _1901 = sin(_1899);
    int _1903 = abs(_1889);
    float _1905 = fma(_1749, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1879);
    float _1907 = fma(_1897, _1897, _1885);
    float _1909 = fma(_1831, 0.0500000007450580596923828125, 0.0500000007450580596923828125);
    float _1911 = float(_1903);
    float _1913 = fma(_1875, _1793, _1905);
    float _1915 = float(_1855);
    float _1917 = fma(_1621, _1869, _1621);
    float _1919 = -_1359;
    float _1921 = fma(_1783, _1629, _1919);
    float _1923 = fma(_1869, _1799, _1799);
    float _1925 = _1677 * 6.283185482025146484375;
    float _1927 = sin(_1925);
    float _1929 = _1911 * _1915;
    float _1931 = _1913 * 0.15915493667125701904296875;
    float _1933 = fma(_1735, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1923);
    float _1935 = fma(_1349, _1921, _1359);
    float _1937 = _1929 * (-2.0);
    float _1939 = _1901 * 0.00999999977648258209228515625;
    float _1941 = fma(_1917, _1793, _1933);
    float _1943 = _1805 * 6.283185482025146484375;
    float _1945 = sin(_1943);
    float _1947 = fma(_1937, _1803, _1803);
    float _1949 = fma(_1605, _1937, _1605);
    float _1951 = precise::max(0.0, _1893);
    float _1953 = _1941 * 0.15915493667125701904296875;
    float _1955 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1947);
    float _1957 = precise::min(_1951, 0.5);
    float _1959 = sqrt(_1585);
    float _1961 = fma(_1349, _1837, _1361);
    float _1963 = fma(_1949, _1793, _1955);
    float _1965 = fma(_1927, 0.02999999932944774627685546875, _1939);
    float _1967 = _1957 * 2.0;
    float _1969 = fma(_1521, _1909, _1387);
    float _1971 = _1963 * 0.15915493667125701904296875;
    float _1973 = fma(_1961, _1909, _1437);
    float _1975 = _1881 * 6.283185482025146484375;
    float _1977 = sin(_1975);
    float _1979 = _1945 * 0.02300000004470348358154296875;
    float _1981 = _1811 * _1967;
    float _1983 = _1967 * _1891;
    float _1985 = fma(_1981, _1891, _1969);
    float _1987 = sqrt(_1639);
    float _1989 = _1959 * _1965;
    float _1991 = _1387 * _1989;
    float _1993 = sqrt(_1567);
    float _1995 = fma(_1977, 0.0900000035762786865234375, _1979);
    float _1997 = _1985 + _1995;
    float _1999 = sqrt(_1907);
    float _2001 = _1987 * _1965;
    float _2003 = fma(_1991, _1983, _1997);
    float _2005 = _1437 * _2001;
    float _2007 = _1931 * 6.283185482025146484375;
    float _2009 = sin(_2007);
    float _2011 = _1993 * _1965;
    float _2013 = fma(_1935, _1909, _1385);
    float _2015 = fma(_2005, _1983, _1973);
    float _2017 = _1385 * _2011;
    float _2019 = _1931 * 6.283185482025146484375;
    float _2021 = cos(_2019);
    float _2023 = _1807 * _1999;
    float _2025 = fma(_2017, _1983, _2013);
    float _2027 = _885 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2029 = _1019 * _2023;
    float _2031 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2025);
    float _2033 = _2023 * _1763;
    float _2035 = _1953 * 6.283185482025146484375;
    float _2037 = cos(_2035);
    float _2039 = _2023 * _2027;
    float _2041 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2015);
    float _2043 = _2041 * _2039;
    float _2045 = _1971 * 6.283185482025146484375;
    float _2047 = cos(_2045);
    float _2049 = _1953 * 6.283185482025146484375;
    float _2051 = sin(_2049);
    float _2053 = _2037 * _2021;
    float _2055 = _2037 * _2009;
    float _2057 = _1971 * 6.283185482025146484375;
    float _2059 = sin(_2057);
    float _2061 = _2037 * _2047;
    float _2063 = _2051 * _2021;
    float _2065 = _2051 * _2009;
    float _2067 = _2021 * _2047;
    float _2069 = _2051 * _2047;
    float _2071 = _2009 * _2047;
    float _2073 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2003);
    float _2075 = fma(_2059, _2053, _2065);
    float _2077 = _2073 * _2029;
    float _2079 = _2031 * _2033;
    float _2081 = -_2063;
    float _2083 = fma(_2059, _2055, _2081);
    float _2085 = -_2055;
    float _2087 = fma(_2059, _2063, _2085);
    float _2089 = _2061 * _2077;
    float _2091 = -_2077;
    float _2093 = _2059 * _2091;
    float _2095 = _2069 * _2077;
    float _2097 = fma(_2059, _2065, _2053);
    float _2099 = fma(_2075, _2079, _2089);
    float _2101 = fma(_2067, _2079, _2093);
    float _2103 = fma(_2087, _2079, _2095);
    float _2105 = fma(_2083, _2043, _2099);
    float _2107 = fma(_2071, _2043, _2101);
    float _2109 = fma(_2097, _2043, _2103);
    float _2111 = _2105 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2113 = _2105 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2115 = fma(_2107, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2111);
    float _2117 = fma(_2107, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2113);
    float _2119 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2115);
    float _2121 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2117);
    float _2123 = _1681 + _2119;
    float _2125 = _1679 + _2121;
    float _2127 = _2105 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2129 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2131 = _2123 + _2129;
    float _2133 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2135 = _2125 + _2133;
    float _2137 = fma(_2107, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2127);
    float _2139 = _2131 * _2131;
    float _2141 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2137);
    float _2143 = fma(_2135, _2135, _2139);
    float _2145 = _1635 + _2141;
    float _2147 = sqrt(_2143);
    bool _2149 = _2147 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2151 = _2141;
    float _2153 = _2137;
    float _2155 = _2125;
    float _2157 = _2145;
    float _2159 = _1935;
    float _2161 = _1961;
    if (!_2149)
    {
        _2151 = _2123;
    }
    float _2163 = _2151;
    float _2165 = _2163;
    if (!_2149)
    {
        _2153 = _2145;
    }
    float _2167 = _2153;
    bool _2169 = !_2149;
    float _2171 = _2167;
    if (!_2169)
    {
        float _2173 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2177 = _2147 + _2175;
        float _2179 = _2145 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2181 = rsqrt(_2143);
        float _2183 = _2177 * _2173;
        float _2185 = _2183 * 0.15915493667125701904296875;
        float _2187 = _2185 * 6.283185482025146484375;
        float _2189 = cos(_2187);
        float _2191 = _2185 * 6.283185482025146484375;
        float _2193 = sin(_2191);
        float _2195 = _2189 + (-1.0);
        float _2197 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2199 = fma(_2193, _2179, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2201 = fma(_2145, _2189, _2197);
        float _2203 = _2181 * _2199;
        float _2205 = fma(_2135, _2203, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2207 = fma(_2131, _2203, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2171 = _2201;
        _2155 = _2205;
        _2165 = _2207;
    }
    float _2209 = _2171;
    float _2211 = _2155;
    float _2213 = _2165;
    float _2215 = -_1857;
    float _2217 = fma(_2215, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2209);
    float _2219 = -_1861;
    float _2221 = fma(_2219, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2211);
    float _2223 = -_1883;
    float _2225 = fma(_2223, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2213);
    float _2227 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2229 = _2217 + _2227;
    float _2231 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2233 = _2221 + _2231;
    float _2235 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2237 = _2225 + _2235;
    float _2239 = _2229 * _2229;
    float _2241 = fma(_2233, _2233, _2239);
    float _2243 = fma(_2237, _2237, _2241);
    float _2245 = rsqrt(_2243);
    float _2247 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2249 = _2233 * _2247;
    float _2251 = _2237 * _2247;
    float _2253 = _2249 * _2249;
    float _2255 = _2251 * _2251;
    float _2257 = _2253 + _2255;
    float _2259 = sqrt(_2257);
    bool _2261 = _2259 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2265 = _2259 + _2263;
    float _2267 = _2237;
    float _2269 = _2245;
    float _2271 = _2265;
    float _2273 = _2229;
    float _2275 = _2249;
    if (_2261)
    {
        float _2277 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2267 = _2277;
    }
    float _2279 = _2267;
    if (_2261)
    {
        float _2281 = rsqrt(_2257);
        _2269 = _2281;
    }
    float _2283 = _2269;
    float _2285 = _2283;
    if (_2261)
    {
        float _2287 = _2265 * _2279;
        _2271 = _2287;
    }
    float _2289 = _2271;
    if (_2261)
    {
        float _2291 = _2289 * 0.15915493667125701904296875;
        _2157 = _2291;
    }
    float _2293 = _2157;
    float _2295 = _2279;
    if (_2261)
    {
        float _2297 = _2293 * 6.283185482025146484375;
        float _2299 = sin(_2297);
        _2295 = _2299;
    }
    float _2301 = _2295;
    float _2303 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2305 = precise::max(0.0, _2303);
    float _2307 = _2131;
    float _2309 = _2305;
    if (_2261)
    {
        float _2311 = _2293 * 6.283185482025146484375;
        float _2313 = cos(_2311);
        _2307 = _2313;
    }
    float _2315 = _2307;
    float _2317 = -_2247;
    float _2319 = -_2305;
    float _2321 = fma(_2229, _2317, _2319);
    if (_2261)
    {
        float _2323 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2309 = _2323;
    }
    float _2325 = _2309;
    float _2327 = _2325;
    if (_2261)
    {
        float _2329 = fma(_2301, _2325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2273 = _2329;
    }
    float _2331 = _2273;
    float _2333 = sqrt(_2243);
    float _2335 = _2331;
    float _2337 = _2315;
    if (_2261)
    {
        float _2339 = _2315 + (-1.0);
        _2327 = _2339;
    }
    float _2341 = _2327;
    float _2343 = _2341;
    if (_2261)
    {
        float _2345 = _2283 * _2331;
        _1395 = _2345;
    }
    float _2347 = _1395;
    if (!_2261)
    {
        _2285 = _2321;
    }
    float _2349 = _2285;
    float _2351 = _2349;
    if (_2261)
    {
        float _2353 = _2341 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1789 = _2353;
    }
    float _2355 = _1789;
    if (_2261)
    {
        float _2357 = _2249 * _2347;
        _2275 = _2357;
    }
    float _2359 = _2275;
    if (!_2261)
    {
        _2343 = _2251;
    }
    float _2361 = _2343;
    float _2363 = _2361;
    if (_2261)
    {
        float _2365 = _2251 * _2347;
        _2363 = _2365;
    }
    float _2367 = _2363;
    if (!_2261)
    {
        _2335 = _2253;
    }
    float _2369 = _2335;
    float _2371 = _2369;
    if (_2261)
    {
        float _2373 = fma(_2321, _2315, _2355);
        _2351 = _2373;
    }
    float _2375 = _2351;
    if (_2261)
    {
        float _2377 = _2359 * _2359;
        _2371 = _2377;
    }
    float _2379 = _2371;
    if (!_2261)
    {
        _2337 = _2255;
    }
    float _2381 = _2337;
    float _2383 = _2381;
    if (_2261)
    {
        float _2385 = _2367 * _2367;
        _2383 = _2385;
    }
    float _2387 = _2383;
    float _2389 = fma(_2375, _2375, _2379);
    float _2391 = _2217 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2393 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2395 = _2389 + _2387;
    float _2397 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2399 = fma(_2333, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2397);
    float _2401 = precise::clamp(_2399, 0.0, 1.0);
    float _2403 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2391);
    float _2405 = _2217 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2407 = rsqrt(_2395);
    float _2409 = -_2401;
    float _2411 = _2409 + 1.0;
    float _2413 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2403);
    float _2415 = _2217 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2417 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2405);
    float _2419 = _2217 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2421 = _2413 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2423 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2415);
    float _2425 = abs(_2411);
    float _2427 = log2(_2425);
    float _2429 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2417);
    float _2431 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2419);
    float _2433 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2423);
    float _2435 = _2421 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2437 = _2429 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2439 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2431);
    float _2441 = _2433 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2443 = _2407 * _2359;
    float _2445 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2447 = _2407 * _2375;
    float _2449 = _2407 * _2367;
    float _2451 = _2443 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2453 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2445);
    float _2455 = -_2435;
    float _2457 = fma(_2455, _2393, 1.0);
    float _2459 = _2439 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2461 = -_2451;
    float _2463 = fma(_2447, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2461);
    float _2465 = _2427 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2467 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2453);
    float _2469 = log2(_2457);
    float _2471 = -_2449;
    float _2473 = fma(_2471, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2463);
    float _2475 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2477 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2467);
    float _2479 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2481 = _2447 + 1.0;
    float _2483 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2475);
    float _2485 = exp2(_2465);
    float _2487 = fma(_2473, -0.5, 0.5);
    float _2489 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2479);
    float _2491 = fma(_2473, 0.5, 0.5);
    float _2493 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2483);
    float _2495 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2489);
    float _2497 = 1.0 / _2477;
    float _2499 = fma(_2491, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2501 = fma(_2491, _2499, -0.212114393711090087890625);
    float _2503 = sqrt(_2487);
    float _2505 = -_2447;
    float _2507 = fma(_2485, _2481, _2505);
    float _2509 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2493);
    float _2511 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2495);
    float _2513 = _2469 * 0.693147182464599609375;
    float _2515 = fma(_2491, _2501, 1.570728778839111328125);
    float _2517 = fma(_2507, 0.5, 0.5);
    float _2519 = _2509 * _2497;
    float _2521 = _2511 * _2497;
    float _2523 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2525 = fma(_2519, 0.5, 0.5);
    float _2527 = fma(_2521, -0.5, 0.5);
    float _2529 = _2503 * 0.636619746685028076171875;
    float3 _6812 = float3(_2525, _2527, _2523);
    float _2531 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6812, float3(0.0), isnan(_6812)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6812, float3(0.0), isnan(_6812)), level(0.0)).x;
    float3 _6823 = float3(_2525, _2527, _2523);
    float4 _2533 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6823, float3(0.0), isnan(_6823)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6823, float3(0.0), isnan(_6823)), level(0.0)).xyzw;
    float _2535 = _2533.x;
    float _2537 = _2533.y;
    float _2539 = _2533.z;
    float _2541 = _2533.w;
    float _2543 = -_2515;
    float _2545 = fma(_2529, _2543, 1.0);
    float2 _6844 = float2(_2545, _2517);
    float3 _2549 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6844, float2(0.0), isnan(_6844)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6844, float2(0.0), isnan(_6844)), level(0.0)).xyz;
    float _2551 = _2549.x;
    float _2553 = _2549.y;
    float _2555 = _2549.z;
    float _2557 = in.m_69.x;
    float _2559 = in.m_69.y;
    float _2561 = in.m_69.z;
    float _2563 = in.m_69.w;
    bool _2565 = _2003 != 0.0;
    bool _2567 = isnan(_2003);
    bool _2569 = _2565 || _2567;
    bool _2571 = isnan(0.0);
    bool _2573 = _2569 || _2571;
    float _2575 = _2427 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_71.x = _1131;
    out.m_71.y = _1133;
    bool _2577 = _2025 == 0.0;
    bool _2579 = !_2573;
    bool _2581 = _2577 && _2579;
    out.m_73.x = _1891;
    bool _2583 = _2015 == 0.0;
    bool _2585 = _2583 && _2581;
    float _2587 = exp2(_2575);
    out.m_75.x = _2221;
    out.m_75.y = _2217;
    out.m_75.z = _2225;
    float _2589 = _1935 * _2561;
    float _2591 = _1521 * _2557;
    float _2593 = _1961 * _2559;
    float _2595 = -_2587;
    float _2597 = _2595 + 1.0;
    float _2599 = -_2589;
    float _2601 = fma(_1961, _2557, _2599);
    float _2603 = -_2591;
    float _2605 = fma(_1935, _2559, _2603);
    float _2607 = -_2593;
    float _2609 = fma(_1521, _2561, _2607);
    if (!_2585)
    {
        float _2611 = fma(_2003, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1521);
        _1669 = _2611;
    }
    float _2613 = _1669;
    float _2615 = _2601 * _2563;
    float _2617 = _2605 * _2563;
    float _2619 = _2609 * _2563;
    if (!_2585)
    {
        float _2621 = fma(_2025, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1935);
        _2159 = _2621;
    }
    float _2623 = _2159;
    float _2625 = -_2613;
    float _2627 = _2059 * _2625;
    float _2629 = -_2559;
    float _2631 = _2059 * _2629;
    float _2633 = -_2615;
    float _2635 = _2059 * _2633;
    float _2637 = _2061 * _2613;
    float _2639 = fma(_2067, _2623, _2627);
    float _2641 = fma(_2067, _2557, _2631);
    float _2643 = fma(_2067, _2619, _2635);
    float _2645 = _2061 * _2559;
    float _2647 = _2069 * _2559;
    float _2649 = _2069 * _2613;
    if (!_2585)
    {
        float _2651 = fma(_2015, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1961);
        _2161 = _2651;
    }
    float _2653 = _2161;
    float _2655 = _2061 * _2615;
    float _2657 = fma(_2075, _2623, _2637);
    float _2659 = _2069 * _2615;
    float _2661 = fma(_2075, _2557, _2645);
    float _2663 = fma(_2087, _2557, _2647);
    float _2665 = fma(_2075, _2619, _2655);
    float _2667 = fma(_2083, _2653, _2657);
    float _2669 = fma(_2087, _2619, _2659);
    float _2671 = fma(_2071, _2561, _2641);
    float _2673 = fma(_2083, _2561, _2661);
    float _2675 = fma(_2097, _2561, _2663);
    float _2677 = fma(_2071, _2653, _2639);
    float _2679 = _2667 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2681 = _2667 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2683 = _2667 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2685 = fma(_2083, _2617, _2665);
    float _2687 = fma(_2071, _2617, _2643);
    float _2689 = fma(_2097, _2617, _2669);
    float _2691 = fma(_2677, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2679);
    float _2693 = fma(_2677, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2681);
    float _2695 = fma(_2677, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2683);
    float _2697 = fma(_2087, _2623, _2649);
    float _2699 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2701 = _2685 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2703 = _2685 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2705 = _2685 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2707 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2699);
    float _2709 = fma(_2687, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2701);
    float _2711 = fma(_2687, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2703);
    float _2713 = fma(_2687, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2705);
    float _2715 = _2673 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2717 = _2673 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2719 = _2673 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2721 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2707);
    float _2723 = _2597 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2725 = fma(_2671, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2715);
    float _2727 = fma(_2671, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2717);
    float _2729 = fma(_2671, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2719);
    float _2731 = fma(_2097, _2653, _2697);
    float _2733 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2721);
    float _2735 = fma(_2675, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2725);
    float _2737 = fma(_2675, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2727);
    float _2739 = fma(_2675, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2729);
    float _2741 = fma(_2731, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2691);
    float _2743 = fma(_2731, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2693);
    float _2745 = fma(_2731, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2695);
    float _2747 = _2733 + _2477;
    float _2749 = fma(_2689, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2711);
    out.m_77.x = _2735;
    out.m_77.y = _2737;
    out.m_77.z = _2739;
    float _2751 = _2747 * 0.5;
    bool _2753 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2755 = isnan(_2333);
    bool _2757 = _2753 || _2755;
    bool _2759 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2761 = _2757 || _2759;
    out.gl_Position.x = _2509;
    out.gl_Position.y = _2511;
    out.gl_Position.z = _2733;
    out.gl_Position.w = _2477;
    float _2763 = fma(_2689, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2709);
    float _2765 = fma(_2689, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2713);
    out.m_79.z = _2751;
    out.m_79.w = _2477;
    out.m_81.x = _2741;
    out.m_81.y = _2743;
    out.m_81.z = _2745;
    out.m_83.x = _2763;
    out.m_83.y = _2749;
    out.m_83.z = _2765;
    float _2767 = _2747;
    float _2769 = _2765;
    float _2771 = _2749;
    float _2773 = _2763;
    if (!_2761)
    {
        _2767 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2775 = _2767;
    float _2777 = _2775;
    float _2779 = _2775;
    if (!_2761)
    {
        _2769 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2781 = _2769;
    float _2783 = _2781;
    float _2785 = _2781;
    if (!_2761)
    {
        _2771 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2787 = _2771;
    float _2789 = _2787;
    float _2791 = _2787;
    if (!_2761)
    {
        _2773 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2793 = _2773;
    float _2795 = _2723 * _2531;
    float _2797 = -_2723;
    float _2799 = _2797 + 1.0;
    float _2801 = _2541 * _2795;
    float _2803 = _2541 * _2799;
    float _2805 = _2555 * _2795;
    float _2807 = fma(_2551, _2801, _2535);
    float _2809 = fma(_2553, _2801, _2537);
    float _2811 = _2535;
    float _2813 = _2801;
    float _2815 = _2793;
    float _2817 = _2793;
    if (!_2761)
    {
        _2811 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2819 = _2811;
    float _2821 = fma(_2541, _2805, _2539);
    float _2823 = _2819;
    float _2825 = _2819;
    if (!_2761)
    {
        _2813 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2827 = _2813;
    out.m_85.x = _2807;
    out.m_85.y = _2809;
    out.m_85.z = _2821;
    out.m_85.w = _2803;
    bool _2829 = !_2761;
    float _2831 = _2827;
    float _2833 = _2827;
    if (!_2829)
    {
        bool _2835 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2837 = isnan(_2333);
        bool _2839 = _2835 || _2837;
        bool _2841 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2843 = _2839 || _2841;
        if (!_2843)
        {
            float _2845 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2847 = _2333 + _2845;
            float _2849 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2851 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2849;
            float _2853 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2855 = _2853 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2857 = 1.0 / _2851;
            float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2863 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2865 = _2863 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2867 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2869 = _2867 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2871 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2873 = _2871 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2875 = _2847 * _2857;
            float _2877 = precise::clamp(_2875, 0.0, 1.0);
            float _2879 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2881 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2883 = fma(_2877, _2855, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2885 = fma(_2877, _2881, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2887 = fma(_2877, _2861, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2889 = fma(_2877, _2865, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2891 = fma(_2877, _2869, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2893 = fma(_2877, _2873, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2825 = _2887;
            _2791 = _2891;
            _2779 = _2883;
            _2785 = _2889;
            _2833 = _2885;
            _2817 = _2893;
            _2895 = true;
        }
        else
        {
            bool _2897 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2899 = isnan(_2333);
            bool _2901 = _2897 || _2899;
            bool _2903 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2905 = _2901 || _2903;
            if (!_2905)
            {
                _2777 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2907 = _2777;
            _2779 = _2907;
            if (!_2905)
            {
                _2823 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2909 = _2823;
            _2825 = _2909;
            if (!_2905)
            {
                _2831 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2911 = _2831;
            _2833 = _2911;
            if (!_2905)
            {
                _2783 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2913 = _2783;
            _2785 = _2913;
            if (!_2905)
            {
                _2789 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2915 = _2789;
            _2791 = _2915;
            if (!_2905)
            {
                _2815 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2917 = _2815;
            bool _2919 = !_2905;
            _2817 = _2917;
            if (!_2919)
            {
                bool _2921 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2923 = isnan(_2333);
                bool _2925 = _2921 || _2923;
                bool _2927 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2929 = _2925 || _2927;
                if (!_2929)
                {
                    float _2931 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2933 = _2333 + _2931;
                    float _2935 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2937 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2935;
                    float _2939 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2941 = _2939 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2943 = 1.0 / _2937;
                    float _2945 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2947 = _2945 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2949 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2951 = _2949 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2961 = _2933 * _2943;
                    float _2963 = precise::clamp(_2961, 0.0, 1.0);
                    float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2967 = _2965 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2969 = fma(_2963, _2941, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2971 = fma(_2963, _2967, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2973 = fma(_2963, _2947, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2975 = fma(_2963, _2951, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2977 = fma(_2963, _2955, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2979 = fma(_2963, _2959, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2825 = _2973;
                    _2791 = _2977;
                    _2779 = _2969;
                    _2785 = _2975;
                    _2833 = _2971;
                    _2817 = _2979;
                    _2895 = true;
                }
                else
                {
                    _2825 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2791 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2779 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2785 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2833 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2817 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2895 = false;
    float _2981 = _2825;
    float _2983 = _2791;
    float _2985 = _2779;
    float _2987 = _2785;
    float _2989 = _2833;
    float _2991 = _2817;
    float _2993 = fma(_2743, -0.5, 0.5);
    float _2995 = precise::clamp(_2993, 0.0, 1.0);
    float _2997 = -_2981;
    float _2999 = _2997 + _2983;
    float _3001 = -_2985;
    float _3003 = _3001 + _2987;
    float _3005 = -_2989;
    float _3007 = _3005 + _2991;
    bool _3009 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3011 = fma(_2995, _2999, _2981);
    float _3013 = fma(_2995, _3003, _2985);
    float _3015 = fma(_2995, _3007, _2989);
    float _3017 = _3011 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _3019 = fma(_3013, 0.298911988735198974609375, _3017);
    out.m_87.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3021 = fma(_3015, 0.114477999508380889892578125, _3019);
    out.m_89.x = 0.0;
    float _3023 = -_3021;
    float _3025 = _3013 + _3023;
    float _3027 = -_3021;
    float _3029 = _3011 + _3027;
    float _3031 = -_3021;
    float _3033 = _3015 + _3031;
    float _3035 = fma(_3025, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3021);
    float _3037 = fma(_3029, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3021);
    float _3039 = fma(_3033, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3021);
    out.m_91.x = _3035;
    out.m_91.y = _3037;
    out.m_91.z = _3039;
    if (!_3009)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3041 = -_2217;
    float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3045 = -_2221;
    float _3047 = _3045 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3049 = -_2225;
    float _3051 = _3049 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3053 = _3043 * _3043;
    float _3055 = fma(_3047, _3047, _3053);
    float _3057 = fma(_3051, _3051, _3055);
    float _3059 = sqrt(_3057);
    float _3061 = rsqrt(_3057);
    float _3063 = -_3059;
    float _3065 = _3063 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3067 = _3065 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3069 = precise::clamp(_3067, 0.0, 1.0);
    float _3071 = _3047 * _3061;
    float _3073 = _3043 * _3061;
    float _3075 = abs(_3069);
    float _3077 = log2(_3075);
    float _3079 = _3051 * _3061;
    float _3081 = _3071 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3083 = _2743 * _3073;
    float _3085 = -_3073;
    float _3087 = -_3081;
    float _3089 = fma(_3085, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3087);
    float _3091 = fma(_2741, _3071, _3083);
    float _3093 = -_3079;
    float _3095 = fma(_3093, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3089);
    float _3097 = fma(_2745, _3079, _3091);
    float _3099 = precise::clamp(_3097, 0.0, 1.0);
    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3103 = _3095 + _3101;
    float _3105 = _3077 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3107 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3109 = precise::clamp(_3107, 0.0, 1.0);
    float _3111 = exp2(_3105);
    float _3113 = _3111 * _3109;
    float _3115 = _3099 * _3113;
    float _3117 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3119 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3121 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _3117;
    out.m_89.y = _3119;
    out.m_89.z = _3121;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2895 = false;
    bool _1467 = false;
    bool _1277 = false;
    bool _699 = false;
    bool _315 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = trunc(_111);
    int _115 = int(_113);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_49.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3178 = as_type<float>(_131);
        out.gl_Position.z = _3178;
    }
    if (!_119)
    {
        return out;
    }
    float _135 = in.m_51.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = _149;
    if (_145)
    {
        float _153 = float(_115);
        _125 = _153;
    }
    float _155 = _125;
    bool _157 = _149 >= _155;
    bool _159 = !_145;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_49.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3248 = as_type<float>(_169);
        out.gl_Position.z = _3248;
    }
    if (_161)
    {
        return out;
    }
    float _171 = in.m_53.y;
    float _173 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = in.m_55.w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = in.m_51.x;
    float _189 = in.m_51.y;
    float _191 = in.m_51.z;
    float _193 = in.m_46.x;
    float _195 = in.m_46.y;
    float _197 = in.m_46.z;
    float _199 = 0.0;
    float _201 = _173;
    if (!_185)
    {
        float _203 = _173 * _173;
        float _205 = _203 * 0.5;
        _199 = _205;
    }
    float _207 = _199;
    float _209 = _207;
    if (!_185)
    {
        float _211 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _211;
    }
    float _213 = _209;
    out.m_57.y = _171;
    bool _215 = !_185;
    float _217 = _213;
    if (!_215)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _173 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _173);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _247;
    }
    float _249 = _217;
    bool _251 = !_185;
    if (!_251)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _173 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _201 = _271;
    }
    float _273 = _201;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _277 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _279 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _281 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _283 = fma(_273, _187, _277);
    float _285 = fma(_273, _189, _279);
    float _287 = fma(_273, _191, _281);
    float _289 = fma(_283, _175, _193);
    float _291 = fma(_285, _175, _195);
    float _293 = fma(_287, _175, _197);
    bool _295 = !_275;
    float _313;
    if (!_295)
    {
        float _297 = in.m_59.x;
        float _299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _301 = _297 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _305 = _303 * _299;
        float _307 = floor(_305);
        float _309 = -_307;
        float _311 = _305 + _309;
        _313 = _311;
        _315 = true;
    }
    else
    {
        float _317 = float(_115);
        float _319 = 1.0 / _317;
        float _321 = _149 * _319;
        _313 = _321;
    }
    _315 = false;
    float _323 = _313;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _341 = 1.0 / _327;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _351 = 1.0 / _331;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _355 = _323 + _353;
    bool _357 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _359 = isnan(_323);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_367;
    float _371 = _369 + 1.0;
    float _373 = 1.0 / _335;
    float _375 = _355 * _341;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _379 = _323 + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = _323 + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _387 = _323 + _385;
    bool _389 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _391 = 1.0 / _345;
    float _393 = _379 * _351;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _397 = _323 + _395;
    bool _399 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _401 = isnan(_323);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _413 = _323 + _411;
    float _415 = 1.0 / _339;
    float _417 = _383 * _373;
    bool _419 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _421 = isnan(_323);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    float _431 = -_409;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _435;
    float _439 = 1.0 / _349;
    float _441 = _397 * _391;
    float _443 = -_429;
    float _445 = _443 + 1.0;
    bool _447 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _449 = isnan(_323);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = fma(_437, _375, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _461 = _409 * _445;
    float _463 = _387 * _415;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _469;
    float _473 = fma(_467, _375, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _475 = _457 * _433;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _481 = _413 * _439;
    float _483 = fma(_471, _375, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _485 = -_457;
    float _487 = _485 + 1.0;
    bool _489 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _491 = isnan(_323);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _505 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _507 = isnan(_323);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _521 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _523 = isnan(_323);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = fma(_503, _393, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _535 = fma(_479, _393, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _537 = fma(_519, _393, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _539 = _499 * _371;
    float _541 = -_499;
    float _543 = _541 + 1.0;
    float _545 = -_531;
    float _547 = _545 + 1.0;
    float _549 = _367 * _487;
    float _551 = _531 * _543;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _553;
    float _557 = _515 * _547;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _559;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _563;
    float _567 = fma(_555, _417, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _569 = _459 * _557;
    float _571 = fma(_561, _417, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _573 = fma(_565, _417, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _575 = -_515;
    float _577 = _575 + 1.0;
    float _579 = _473 * _557;
    float _581 = _483 * _557;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _595 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[143].z, _569);
    float _597 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[143].x, _579);
    float _599 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[143].y, _581);
    float _601 = fma(_585, _463, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _603 = fma(_589, _463, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _605 = fma(_593, _463, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _607 = fma(_537, _551, _595);
    float _609 = fma(_533, _551, _597);
    float _611 = fma(_535, _551, _599);
    float _613 = fma(_571, _539, _609);
    float _615 = fma(_573, _539, _607);
    float _617 = fma(_567, _539, _611);
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _619;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _627;
    float _631 = fma(_601, _549, _613);
    float _633 = fma(_605, _549, _615);
    float _635 = fma(_621, _441, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _637 = fma(_625, _441, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _639 = fma(_603, _549, _617);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _649 = fma(_629, _441, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _655 = fma(_643, _481, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _657 = fma(_647, _481, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _659 = fma(_635, _475, _631);
    float _661 = fma(_653, _481, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _663 = fma(_637, _475, _639);
    float _665 = fma(_649, _475, _633);
    float _667 = fma(_655, _461, _659);
    float _669 = fma(_657, _461, _663);
    float _671 = fma(_661, _461, _665);
    float _673 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[149].x, _667);
    float _675 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[149].y, _669);
    float _677 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[149].z, _671);
    bool _679 = !_389;
    float _697;
    if (!_679)
    {
        float _681 = in.m_59.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[11].x, _149);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _697 = _695;
        _699 = true;
    }
    else
    {
        float _701 = float(_115);
        float _703 = 1.0 / _701;
        float _705 = _149 * _703;
        _697 = _705;
    }
    _699 = false;
    float _707 = _697;
    int _709 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _711 = _709;
    int _713 = 0;
    int _715 = _106(_711, _713, (*spvDescriptorSet0.support_buffer));
    float _717 = in.m_53.x;
    float _719 = _149 * 0.0500000007450580596923828125;
    float _721 = in.m_53.z;
    float _723 = fma(_717, 18.84955596923828125, _719);
    float _725 = _723 * 0.15915493667125701904296875;
    float _727 = trunc(_721);
    int _729 = int(_727);
    float _731 = _725 * 6.283185482025146484375;
    float _733 = sin(_731);
    float _735 = fma(_733, 0.5, 0.5);
    float _737 = float(_715);
    int _739 = abs(_715);
    bool _741 = _715 == 0;
    float _743 = _735 * _737;
    float _745 = float(uint(_739));
    float _747 = trunc(_743);
    int _749 = int(_747);
    float _751 = 1.0 / _745;
    int _753 = abs(_749);
    uint _756 = uint(int(uint(_749) >> uint(31)));
    float _758 = float(uint(_753));
    int _760 = ~int(_756);
    int _762 = _760 + 1;
    int _764 = as_type<int>(_751) + (-2);
    float _766 = as_type<float>(_764) * _758;
    float _768 = trunc(_766);
    float _770 = precise::max(_768, 0.0);
    uint _772 = uint(_770);
    int _774 = ~int(_772);
    int _776 = _774 + 1;
    int _778 = _776 * _739;
    int _780 = _778 + _753;
    float _782 = float(uint(_780));
    float _784 = as_type<float>(_764) * _782;
    float _786 = trunc(_784);
    float _788 = precise::max(_786, 0.0);
    uint _790 = uint(_788);
    int _792 = int(_772) + int(_790);
    int _794 = ~_792;
    int _796 = _794 + 1;
    int _798 = _796 * _739;
    int _800 = _798 + _753;
    bool _802 = uint(_800) >= uint(_739);
    bool _804 = !_802;
    int _806 = _804 ? 0 : (-1);
    int _808 = ~_792;
    int _810 = _808 + _806;
    int _812 = _810 + 1;
    int _814 = _812 * _739;
    int _816 = _814 + _753;
    int _818 = _816 ^ _762;
    int _820 = ~_762;
    int _822 = _820 + _818;
    int _824 = _822 + 1;
    bool _826 = !_741;
    int _828 = _826 ? _824 : (-1);
    int _830 = _828;
    int _832 = 0;
    int _834 = _107(_830, _832, (*spvDescriptorSet0.support_buffer));
    int _836 = _729;
    int _838 = 0;
    int _840 = _107(_836, _838, (*spvDescriptorSet0.support_buffer));
    float4 _843 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_834, _840)), 0).xyzw;
    float _845 = _843.x;
    float _847 = _843.y;
    float _849 = _843.z;
    float _851 = _843.w;
    float _853 = in.m_55.x;
    float _855 = in.m_55.y;
    float _857 = in.m_55.z;
    float _859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _861 = in.m_59.x;
    float _863 = in.m_59.y;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _865;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _871 = _869 != 0;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _875 = _873 != 0;
    float _877 = 1.0 / _867;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _881 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _883 = _675 * _855;
    float _885 = _677 * _857;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _891 = _863 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _895 = 1.0 / _889;
    float _897 = _861 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _899 = _861 > 0.5;
    bool _901 = _899 && _871;
    float _903 = fma(_891, -2.0, _893);
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _907 = _863 > 0.5;
    bool _909 = _907 && _875;
    float _911 = -_879;
    float _913 = fma(_897, 2.0, _911);
    int _915 = _828 + 1;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _919 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[78].w, _905);
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _923 = _707 + _921;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _927 = _707 + _925;
    float _929 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[78].z, _917);
    float _931 = -_717;
    float _933 = _931 + 1.0;
    float _935 = _923 * _895;
    float _937 = _927 * _877;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _939;
    float _943 = _901 ? _933 : _717;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _945;
    bool _949 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _951 = isnan(_707);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _957 = _953 || _955;
    float _959 = float(_957);
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _961;
    float _965 = fma(_941, _937, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _967 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _969 = isnan(_707);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    float _979 = fma(_947, _937, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _981 = -_959;
    float _983 = _981 + 1.0;
    float _985 = fma(_963, _937, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _987 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _989 = isnan(_707);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1001 = _999 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1005 = _1003 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1007 = _977 * _983;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1011 = _1009 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1013 = _859 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1015 = -_977;
    float _1017 = _1015 + 1.0;
    float _1019 = _883 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1021 = fma(_1001, _935, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1023 = fma(_1013, _943, -0.5);
    float _1025 = _997 * _1017;
    float _1027 = _1019 * _171;
    float _1029 = -_997;
    float _1031 = _1029 + 1.0;
    float _1033 = _881 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1035 = _979 * _1025;
    float _1037 = _1027;
    if (_909)
    {
        float _1039 = -_1027;
        float _1041 = _1039 + 1.0;
        _1037 = _1041;
    }
    float _1043 = _1037;
    float _1045 = _985 * _1025;
    float _1047 = _965 * _1025;
    float _1049 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1035);
    float _1051 = fma(_1033, _1043, -0.5);
    float _1053 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1045);
    float _1055 = fma(_1005, _935, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1057 = fma(_1021, _1007, _1049);
    float _1059 = fma(_1011, _935, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1061 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1047);
    float _1063 = fma(_1055, _1007, _1053);
    float _1065 = fma(_1059, _1007, _1061);
    float _1067 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1057);
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1071 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1063);
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1075 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1065);
    float _1077 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1079 = -_149;
    float _1081 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[76].x, _913);
    float _1083 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1085 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _929);
    int _1087 = abs(_915);
    float _1089 = _673 * _853;
    float _1091 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _919);
    float _1093 = fma(_1085, _1023, _1081);
    float _1095 = float(uint(_1087));
    float _1097 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _903);
    float _1099 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1101 = _1075 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1103 = as_type<float>(_764) * _1095;
    float _1105 = -_1097;
    float _1107 = fma(_1091, _1051, _1105);
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1111 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1113 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _1115 = uint(int(uint(_915) >> uint(31)));
    float _1117 = trunc(_1103);
    float _1119 = precise::max(_1117, 0.0);
    uint _1121 = uint(_1119);
    float _1123 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1125 = _1071 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1127 = ~int(_1115);
    int _1129 = _1127 + 1;
    float _1131 = _1093 + 0.5;
    float _1133 = _1107 + 0.5;
    out.m_61.x = _1077;
    out.m_61.y = _1123;
    out.m_61.z = _1083;
    float _1135 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _1111;
    out.m_63.y = _1135;
    out.m_63.z = _1113;
    int _1137 = ~int(_1121);
    int _1139 = _1137 + 1;
    int _1141 = _1139 * _739;
    int _1143 = _1141 + _1087;
    float _1145 = float(uint(_1143));
    float _1147 = as_type<float>(_764) * _1145;
    float _1149 = trunc(_1147);
    float _1151 = precise::max(_1149, 0.0);
    uint _1153 = uint(_1151);
    int _1155 = int(_1121) + int(_1153);
    int _1157 = ~_1155;
    int _1159 = _1157 + 1;
    int _1161 = _1159 * _739;
    int _1163 = _1161 + _1087;
    bool _1165 = uint(_1163) >= uint(_739);
    bool _1167 = !_1165;
    int _1169 = _1167 ? 0 : (-1);
    int _1171 = ~_1155;
    int _1173 = _1171 + _1169;
    int _1175 = _1173 + 1;
    int _1177 = _1175 * _739;
    int _1179 = _1177 + _1087;
    int _1181 = _1179 ^ _1129;
    int _1183 = ~_1129;
    int _1185 = _1183 + _1181;
    int _1187 = _1185 + 1;
    bool _1189 = !_741;
    int _1191 = _1189 ? _1187 : (-1);
    uint _1193 = as_type<uint>(half2(float2(_851, 0.0)));
    uint _1195 = extract_bits(_1193, 0u, 8u);
    int _1197 = int(_1195) & 255;
    uint _1199 = extract_bits(_1193, 8u, 8u);
    int _1201 = int(_1199) & 255;
    int _1203 = _1201 << 8;
    int _1205 = _1197 | _1203;
    bool _1207 = _1205 >= 32768;
    int _1209 = _1205 + (-1024);
    int _1211 = _1209;
    if (_1207)
    {
        int _1213 = ~_1205;
        int _1215 = _1213 + 33792;
        int _1217 = _1215 + 1;
        _1211 = _1217;
    }
    int _1219 = _1211;
    int _1221 = _1219 + 30719;
    float _1223 = float(_1221);
    float _1225 = fma(_1223, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1227 = abs(_1225);
    float _1229 = -_1227;
    float _1231 = _1229 + 1.0;
    bool _1233 = _1225 < 0.0;
    float _1235 = float(_1233);
    float _1237 = abs(_1225);
    float _1239 = fma(_1237, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1241 = as_type<int>(_1231) + (-218103808);
    float _1243 = abs(_1225);
    float _1245 = fma(_1243, _1239, -0.212114393711090087890625);
    bool _1247 = uint(_1241) >= 1920991232u;
    float _1249 = abs(_1225);
    float _1251 = fma(_1249, _1245, 1.570728778839111328125);
    bool _1253 = !_1247;
    float _1275;
    if (!_1253)
    {
        int _1255 = as_type<int>(_1231);
        int _1257 = as_type<int>(_1111);
        int _1259 = _1169;
        int _1261 = 6272;
        int _1263;
        int _1265;
        int _1267;
        int _1269;
        int _1271;
        int _1273;
        _104(_1255, _1257, _1259, _1261, _1263, _1265, _1267, _1269, _1271, _1273, out.gl_Position, out.gl_PointSize);
        _1275 = as_type<float>(_1267);
        _1277 = true;
    }
    else
    {
        float _1279 = rsqrt(_1231);
        float _1281 = _1231 * _1279;
        float _1283 = _1279 * 0.5;
        float _1285 = -_1281;
        float _1287 = 0.0 + _1285;
        float _1289 = fma(_1283, _1287, 0.5);
        float _1291 = fma(_1281, _1289, _1281);
        float _1293 = -_1291;
        float _1295 = 0.0 + _1293;
        float _1297 = fma(_1291, _1295, _1231);
        float _1299 = fma(_1283, _1297, _1291);
        _1275 = _1299;
    }
    _1277 = false;
    float _1301 = _1275;
    int _1303 = _1191;
    int _1305 = 0;
    int _1307 = _107(_1303, _1305, (*spvDescriptorSet0.support_buffer));
    int _1309 = _729;
    int _1311 = 0;
    int _1313 = _107(_1309, _1311, (*spvDescriptorSet0.support_buffer));
    float4 _1315 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1307, _1313)), 0).xyzw;
    float _1317 = _1315.x;
    float _1319 = _1315.y;
    float _1321 = _1315.z;
    float _1323 = _1315.w;
    float _1325 = _1251 * _1301;
    float _1327 = _1235 * 2.0;
    float _1329 = floor(_743);
    float _1331 = _1223 * 3.883221149444580078125;
    float _1333 = -_1327;
    float _1335 = fma(_1325, _1333, _1325);
    float _1337 = _1331 * 0.15915493667125701904296875;
    float _1339 = fma(_1235, 3.1415927410125732421875, _1335);
    float _1341 = _1337 * 6.283185482025146484375;
    float _1343 = cos(_1341);
    float _1345 = _1339 * 0.15915493667125701904296875;
    float _1347 = -_1329;
    float _1349 = _743 + _1347;
    float _1351 = _1345 * 6.283185482025146484375;
    float _1353 = sin(_1351);
    float _1355 = _1337 * 6.283185482025146484375;
    float _1357 = sin(_1355);
    float _1359 = _1353 * _1343;
    float _1361 = _1353 * _1357;
    uint _1363 = as_type<uint>(half2(float2(_1323, 0.0)));
    float _1365 = -_845;
    float _1367 = _1365 + _1317;
    float _1369 = -_847;
    float _1371 = _1369 + _1319;
    uint _1373 = extract_bits(_1363, 0u, 8u);
    int _1375 = int(_1373) & 255;
    uint _1377 = extract_bits(_1363, 8u, 8u);
    int _1379 = int(_1377) & 255;
    int _1381 = _1379 << 8;
    int _1383 = _1375 | _1381;
    float _1385 = fma(_1349, _1367, _845);
    float _1387 = fma(_1349, _1371, _847);
    bool _1389 = _1383 >= 32768;
    int _1391 = _1383 + (-1024);
    int _1393 = _1391;
    float _1395 = _1387;
    if (_1389)
    {
        int _1397 = ~_1383;
        int _1399 = _1397 + 33792;
        int _1401 = _1399 + 1;
        _1393 = _1401;
    }
    int _1403 = _1393;
    int _1405 = _1403 + 30719;
    float _1407 = float(_1405);
    float _1409 = fma(_1407, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1411 = abs(_1409);
    float _1413 = -_1411;
    float _1415 = _1413 + 1.0;
    float _1417 = abs(_1409);
    float _1419 = fma(_1417, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1421 = as_type<int>(_1415) + (-218103808);
    bool _1423 = uint(_1421) >= 1920991232u;
    float _1425 = -_849;
    float _1427 = _1425 + _1321;
    float _1429 = abs(_1409);
    float _1431 = fma(_1429, _1419, -0.212114393711090087890625);
    bool _1433 = _1409 < 0.0;
    float _1435 = float(_1433);
    float _1437 = fma(_1349, _1427, _849);
    float _1439 = abs(_1409);
    float _1441 = fma(_1439, _1431, 1.570728778839111328125);
    bool _1443 = !_1423;
    float _1465;
    if (!_1443)
    {
        int _1445 = as_type<int>(_1415);
        int _1447 = as_type<int>(_1367);
        int _1449 = as_type<int>(_1319);
        int _1451 = 7184;
        int _1453;
        int _1455;
        int _1457;
        int _1459;
        int _1461;
        int _1463;
        _104(_1445, _1447, _1449, _1451, _1453, _1455, _1457, _1459, _1461, _1463, out.gl_Position, out.gl_PointSize);
        _1465 = as_type<float>(_1457);
        _1467 = true;
    }
    else
    {
        float _1469 = rsqrt(_1415);
        float _1471 = _1415 * _1469;
        float _1473 = _1469 * 0.5;
        float _1475 = -_1471;
        float _1477 = 0.0 + _1475;
        float _1479 = fma(_1473, _1477, 0.5);
        float _1481 = fma(_1471, _1479, _1471);
        float _1483 = -_1481;
        float _1485 = 0.0 + _1483;
        float _1487 = fma(_1481, _1485, _1415);
        float _1489 = fma(_1473, _1487, _1481);
        _1465 = _1489;
    }
    _1467 = false;
    float _1491 = _1465;
    float _1493 = in.m_53.x;
    float _1495 = in.m_53.y;
    float _1497 = _1441 * _1491;
    float _1499 = _1407 * 3.883221149444580078125;
    float _1501 = -_1225;
    float _1503 = _1501 + _1409;
    float _1505 = in.m_59.z;
    float _1507 = _1435 * 2.0;
    float _1509 = _149 * (-0.20000000298023223876953125);
    float _1511 = _1499 * 0.15915493667125701904296875;
    float _1513 = in.m_59.x;
    float _1515 = in.m_59.y;
    float _1517 = -_1507;
    float _1519 = fma(_1497, _1517, _1497);
    float _1521 = fma(_1349, _1503, _1225);
    float _1523 = _291 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1525 = _291 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1527 = _291 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1529 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1523);
    float _1531 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1525);
    float _1533 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1527);
    float _1535 = fma(_1435, 3.1415927410125732421875, _1519);
    float _1537 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1539 = log2(_1537);
    float _1541 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1543 = fma(_1495, 25.1327419281005859375, _1509);
    float _1545 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1547 = _1505 * 2.0;
    int _1549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1551 = _1549 != 0;
    int _1553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1555 = _1553 != 0;
    int _1557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1559 = _1557 != 0;
    float _1561 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1541);
    float _1563 = _1513 * 2.0;
    float _1565 = floor(_1547);
    float _1567 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1561);
    float _1569 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1571 = _1515 + _1505;
    float _1573 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1545);
    float _1575 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1531);
    float _1577 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1569);
    float _1579 = floor(_1563);
    float _1581 = _1571 + (-1.0);
    float _1583 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1529);
    float _1585 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1573);
    float _1587 = _1505 + _1513;
    float _1589 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1533);
    float _1591 = fma(_1581, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1593 = _1587 + (-1.0);
    float _1595 = _1515 + _1513;
    float _1597 = _1543 * 0.15915493667125701904296875;
    bool _1599 = _1565 > 0.0;
    float _1601 = _1595 + (-1.0);
    float _1603 = fma(_149, -0.007000000216066837310791015625, _1493);
    float _1605 = fma(_1593, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1607 = _1539 * _149;
    bool _1609 = _1565 >= 0.0;
    bool _1611 = isnan(_1565);
    bool _1613 = _1609 || _1611;
    bool _1615 = isnan(0.0);
    bool _1617 = _1613 || _1615;
    float _1619 = _1535 * 0.15915493667125701904296875;
    float _1621 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1623 = _1603 * 18.84955596923828125;
    float _1625 = fma(_149, -0.006000000052154064178466796875, _1493);
    float _1627 = _1511 * 6.283185482025146484375;
    float _1629 = cos(_1627);
    int _1631 = _1617 ? 0 : 1;
    float _1633 = _1515 * 2.0;
    float _1635 = _1575 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1637 = _1579 > 0.0;
    float _1639 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1577);
    bool _1641 = _1579 >= 0.0;
    bool _1643 = isnan(_1579);
    bool _1645 = _1641 || _1643;
    bool _1647 = isnan(0.0);
    bool _1649 = _1645 || _1647;
    float _1651 = _1511 * 6.283185482025146484375;
    float _1653 = sin(_1651);
    float _1655 = _1625 * 31.415927886962890625;
    int _1657 = ~_1631;
    int _1659 = _1657 + 1;
    int _1661 = _1659 + 1;
    float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1665 = 1.0 + _1663;
    int _1667 = _1661;
    float _1669 = _1521;
    if (!_1599)
    {
        int _1671 = ~_1631;
        int _1673 = _1671 + 1;
        _1667 = _1673;
    }
    int _1675 = _1667;
    float _1677 = _1655 * 0.15915493667125701904296875;
    float _1679 = _1583 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1681 = _1589 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1683 = exp2(_1607);
    float _1685 = _1623 * 0.15915493667125701904296875;
    float _1687 = fma(_149, 0.001000000047497451305389404296875, _1493);
    float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1691 = _1679 + _1689;
    bool _1693 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1695 = isnan(1.0);
    bool _1697 = _1693 || _1695;
    bool _1699 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1701 = _1697 || _1699;
    float _1703 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1705 = _1681 + _1703;
    float _1707 = _1687 * 43.9822998046875;
    float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1711 = _1635 + _1709;
    float _1713 = floor(_1633);
    bool _1715 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1717 = isnan(0.0);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1723 = _1719 || _1721;
    float _1725 = _1707 * 0.15915493667125701904296875;
    float _1727 = _1711 * _1711;
    float _1729 = _1513 * 6.283185482025146484375;
    bool _1731 = !_1551;
    int _1733 = _1731 ? 0 : 1;
    float _1735 = _1513 + (-0.5);
    float _1737 = fma(_1691, _1691, _1727);
    float _1739 = 1.0 / _1665;
    float _1741 = -_1683;
    float _1743 = _1741 + 1.0;
    float _1745 = _1515 * 6.283185482025146484375;
    int _1747 = _1649 ? 0 : 1;
    float _1749 = _1515 + (-0.5);
    int _1751 = abs(_1733);
    float _1753 = _1505 + (-0.5);
    float _1755 = _1723 ? _1743 : 0.0;
    float _1757 = _1685 * 6.283185482025146484375;
    float _1759 = sin(_1757);
    bool _1761 = _1713 > 0.0;
    float _1763 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1765 = _1713 >= 0.0;
    bool _1767 = isnan(_1713);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan(0.0);
    bool _1773 = _1769 || _1771;
    float _1775 = fma(_149, 0.070000000298023223876953125, _1729);
    float _1777 = float(_1675);
    int _1779 = _1773 ? 0 : 1;
    float _1781 = _1619 * 6.283185482025146484375;
    float _1783 = sin(_1781);
    float _1785 = fma(_1705, _1705, _1737);
    float _1787 = fma(_149, 0.12999999523162841796875, _1745);
    float _1789 = _1679;
    if (_1701)
    {
        float _1791 = _1755 * _1739;
        _151 = _1791;
    }
    float _1793 = _151;
    bool _1795 = !_1555;
    int _1797 = _1795 ? 0 : 1;
    float _1799 = in.m_65.x;
    float _1801 = in.m_65.y;
    float _1803 = in.m_65.z;
    float _1805 = _1787 * 0.15915493667125701904296875;
    float _1807 = rsqrt(_1785);
    int _1809 = abs(_1797);
    float _1811 = _1759 * 0.0500000007450580596923828125;
    int _1813 = ~_1747;
    int _1815 = _1813 + 1;
    int _1817 = _1815 + 1;
    int _1819 = _1817;
    if (!_1637)
    {
        int _1821 = ~_1747;
        int _1823 = _1821 + 1;
        _1819 = _1823;
    }
    int _1825 = _1819;
    float _1827 = float(_1809);
    float _1829 = _1597 * 6.283185482025146484375;
    float _1831 = sin(_1829);
    float _1833 = float(_1825);
    float _1835 = -_1361;
    float _1837 = fma(_1783, _1653, _1835);
    float _1839 = float(_1751);
    int _1841 = ~_1779;
    int _1843 = _1841 + 1;
    int _1845 = _1843 + 1;
    float _1847 = _1827 * _1833;
    int _1849 = _1845;
    if (!_1761)
    {
        int _1851 = ~_1779;
        int _1853 = _1851 + 1;
        _1849 = _1853;
    }
    int _1855 = _1849;
    float _1857 = _1711 * _1807;
    float _1859 = _1839 * _1777;
    float _1861 = _1691 * _1807;
    float _1863 = _1847 * (-2.0);
    float _1865 = -_1857;
    float _1867 = fma(_1865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1711);
    float _1869 = _1859 * (-2.0);
    float _1871 = -_1861;
    float _1873 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1691);
    float _1875 = fma(_1591, _1863, _1591);
    float _1877 = _1867 * _1867;
    float _1879 = fma(_1863, _1801, _1801);
    float _1881 = _1775 * 0.15915493667125701904296875;
    float _1883 = _1705 * _1807;
    float _1885 = fma(_1873, _1873, _1877);
    bool _1887 = !_1559;
    int _1889 = _1887 ? 0 : 1;
    float _1891 = in.m_67.x;
    float _1893 = in.m_67.y;
    float _1895 = -_1883;
    float _1897 = fma(_1895, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1705);
    float _1899 = _1725 * 6.283185482025146484375;
    float _1901 = sin(_1899);
    int _1903 = abs(_1889);
    float _1905 = fma(_1749, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1879);
    float _1907 = fma(_1897, _1897, _1885);
    float _1909 = fma(_1831, 0.0500000007450580596923828125, 0.0500000007450580596923828125);
    float _1911 = float(_1903);
    float _1913 = fma(_1875, _1793, _1905);
    float _1915 = float(_1855);
    float _1917 = fma(_1621, _1869, _1621);
    float _1919 = -_1359;
    float _1921 = fma(_1783, _1629, _1919);
    float _1923 = fma(_1869, _1799, _1799);
    float _1925 = _1677 * 6.283185482025146484375;
    float _1927 = sin(_1925);
    float _1929 = _1911 * _1915;
    float _1931 = _1913 * 0.15915493667125701904296875;
    float _1933 = fma(_1735, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1923);
    float _1935 = fma(_1349, _1921, _1359);
    float _1937 = _1929 * (-2.0);
    float _1939 = _1901 * 0.00999999977648258209228515625;
    float _1941 = fma(_1917, _1793, _1933);
    float _1943 = _1805 * 6.283185482025146484375;
    float _1945 = sin(_1943);
    float _1947 = fma(_1937, _1803, _1803);
    float _1949 = fma(_1605, _1937, _1605);
    float _1951 = precise::max(0.0, _1893);
    float _1953 = _1941 * 0.15915493667125701904296875;
    float _1955 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1947);
    float _1957 = precise::min(_1951, 0.5);
    float _1959 = sqrt(_1585);
    float _1961 = fma(_1349, _1837, _1361);
    float _1963 = fma(_1949, _1793, _1955);
    float _1965 = fma(_1927, 0.02999999932944774627685546875, _1939);
    float _1967 = _1957 * 2.0;
    float _1969 = fma(_1521, _1909, _1387);
    float _1971 = _1963 * 0.15915493667125701904296875;
    float _1973 = fma(_1961, _1909, _1437);
    float _1975 = _1881 * 6.283185482025146484375;
    float _1977 = sin(_1975);
    float _1979 = _1945 * 0.02300000004470348358154296875;
    float _1981 = _1811 * _1967;
    float _1983 = _1967 * _1891;
    float _1985 = fma(_1981, _1891, _1969);
    float _1987 = sqrt(_1639);
    float _1989 = _1959 * _1965;
    float _1991 = _1387 * _1989;
    float _1993 = sqrt(_1567);
    float _1995 = fma(_1977, 0.0900000035762786865234375, _1979);
    float _1997 = _1985 + _1995;
    float _1999 = sqrt(_1907);
    float _2001 = _1987 * _1965;
    float _2003 = fma(_1991, _1983, _1997);
    float _2005 = _1437 * _2001;
    float _2007 = _1931 * 6.283185482025146484375;
    float _2009 = sin(_2007);
    float _2011 = _1993 * _1965;
    float _2013 = fma(_1935, _1909, _1385);
    float _2015 = fma(_2005, _1983, _1973);
    float _2017 = _1385 * _2011;
    float _2019 = _1931 * 6.283185482025146484375;
    float _2021 = cos(_2019);
    float _2023 = _1807 * _1999;
    float _2025 = fma(_2017, _1983, _2013);
    float _2027 = _885 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2029 = _1019 * _2023;
    float _2031 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2025);
    float _2033 = _2023 * _1763;
    float _2035 = _1953 * 6.283185482025146484375;
    float _2037 = cos(_2035);
    float _2039 = _2023 * _2027;
    float _2041 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2015);
    float _2043 = _2041 * _2039;
    float _2045 = _1971 * 6.283185482025146484375;
    float _2047 = cos(_2045);
    float _2049 = _1953 * 6.283185482025146484375;
    float _2051 = sin(_2049);
    float _2053 = _2037 * _2021;
    float _2055 = _2037 * _2009;
    float _2057 = _1971 * 6.283185482025146484375;
    float _2059 = sin(_2057);
    float _2061 = _2037 * _2047;
    float _2063 = _2051 * _2021;
    float _2065 = _2051 * _2009;
    float _2067 = _2021 * _2047;
    float _2069 = _2051 * _2047;
    float _2071 = _2009 * _2047;
    float _2073 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2003);
    float _2075 = fma(_2059, _2053, _2065);
    float _2077 = _2073 * _2029;
    float _2079 = _2031 * _2033;
    float _2081 = -_2063;
    float _2083 = fma(_2059, _2055, _2081);
    float _2085 = -_2055;
    float _2087 = fma(_2059, _2063, _2085);
    float _2089 = _2061 * _2077;
    float _2091 = -_2077;
    float _2093 = _2059 * _2091;
    float _2095 = _2069 * _2077;
    float _2097 = fma(_2059, _2065, _2053);
    float _2099 = fma(_2075, _2079, _2089);
    float _2101 = fma(_2067, _2079, _2093);
    float _2103 = fma(_2087, _2079, _2095);
    float _2105 = fma(_2083, _2043, _2099);
    float _2107 = fma(_2071, _2043, _2101);
    float _2109 = fma(_2097, _2043, _2103);
    float _2111 = _2105 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2113 = _2105 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2115 = fma(_2107, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2111);
    float _2117 = fma(_2107, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2113);
    float _2119 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2115);
    float _2121 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2117);
    float _2123 = _1681 + _2119;
    float _2125 = _1679 + _2121;
    float _2127 = _2105 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2129 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2131 = _2123 + _2129;
    float _2133 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2135 = _2125 + _2133;
    float _2137 = fma(_2107, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2127);
    float _2139 = _2131 * _2131;
    float _2141 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2137);
    float _2143 = fma(_2135, _2135, _2139);
    float _2145 = _1635 + _2141;
    float _2147 = sqrt(_2143);
    bool _2149 = _2147 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2151 = _2141;
    float _2153 = _2137;
    float _2155 = _2125;
    float _2157 = _2145;
    float _2159 = _1935;
    float _2161 = _1961;
    if (!_2149)
    {
        _2151 = _2123;
    }
    float _2163 = _2151;
    float _2165 = _2163;
    if (!_2149)
    {
        _2153 = _2145;
    }
    float _2167 = _2153;
    bool _2169 = !_2149;
    float _2171 = _2167;
    if (!_2169)
    {
        float _2173 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2177 = _2147 + _2175;
        float _2179 = _2145 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2181 = rsqrt(_2143);
        float _2183 = _2177 * _2173;
        float _2185 = _2183 * 0.15915493667125701904296875;
        float _2187 = _2185 * 6.283185482025146484375;
        float _2189 = cos(_2187);
        float _2191 = _2185 * 6.283185482025146484375;
        float _2193 = sin(_2191);
        float _2195 = _2189 + (-1.0);
        float _2197 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2199 = fma(_2193, _2179, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2201 = fma(_2145, _2189, _2197);
        float _2203 = _2181 * _2199;
        float _2205 = fma(_2135, _2203, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2207 = fma(_2131, _2203, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2171 = _2201;
        _2155 = _2205;
        _2165 = _2207;
    }
    float _2209 = _2171;
    float _2211 = _2155;
    float _2213 = _2165;
    float _2215 = -_1857;
    float _2217 = fma(_2215, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2209);
    float _2219 = -_1861;
    float _2221 = fma(_2219, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2211);
    float _2223 = -_1883;
    float _2225 = fma(_2223, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2213);
    float _2227 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2229 = _2217 + _2227;
    float _2231 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2233 = _2221 + _2231;
    float _2235 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2237 = _2225 + _2235;
    float _2239 = _2229 * _2229;
    float _2241 = fma(_2233, _2233, _2239);
    float _2243 = fma(_2237, _2237, _2241);
    float _2245 = rsqrt(_2243);
    float _2247 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2249 = _2233 * _2247;
    float _2251 = _2237 * _2247;
    float _2253 = _2249 * _2249;
    float _2255 = _2251 * _2251;
    float _2257 = _2253 + _2255;
    float _2259 = sqrt(_2257);
    bool _2261 = _2259 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2265 = _2259 + _2263;
    float _2267 = _2237;
    float _2269 = _2245;
    float _2271 = _2265;
    float _2273 = _2229;
    float _2275 = _2249;
    if (_2261)
    {
        float _2277 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2267 = _2277;
    }
    float _2279 = _2267;
    if (_2261)
    {
        float _2281 = rsqrt(_2257);
        _2269 = _2281;
    }
    float _2283 = _2269;
    float _2285 = _2283;
    if (_2261)
    {
        float _2287 = _2265 * _2279;
        _2271 = _2287;
    }
    float _2289 = _2271;
    if (_2261)
    {
        float _2291 = _2289 * 0.15915493667125701904296875;
        _2157 = _2291;
    }
    float _2293 = _2157;
    float _2295 = _2279;
    if (_2261)
    {
        float _2297 = _2293 * 6.283185482025146484375;
        float _2299 = sin(_2297);
        _2295 = _2299;
    }
    float _2301 = _2295;
    float _2303 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2305 = precise::max(0.0, _2303);
    float _2307 = _2131;
    float _2309 = _2305;
    if (_2261)
    {
        float _2311 = _2293 * 6.283185482025146484375;
        float _2313 = cos(_2311);
        _2307 = _2313;
    }
    float _2315 = _2307;
    float _2317 = -_2247;
    float _2319 = -_2305;
    float _2321 = fma(_2229, _2317, _2319);
    if (_2261)
    {
        float _2323 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2309 = _2323;
    }
    float _2325 = _2309;
    float _2327 = _2325;
    if (_2261)
    {
        float _2329 = fma(_2301, _2325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2273 = _2329;
    }
    float _2331 = _2273;
    float _2333 = sqrt(_2243);
    float _2335 = _2331;
    float _2337 = _2315;
    if (_2261)
    {
        float _2339 = _2315 + (-1.0);
        _2327 = _2339;
    }
    float _2341 = _2327;
    float _2343 = _2341;
    if (_2261)
    {
        float _2345 = _2283 * _2331;
        _1395 = _2345;
    }
    float _2347 = _1395;
    if (!_2261)
    {
        _2285 = _2321;
    }
    float _2349 = _2285;
    float _2351 = _2349;
    if (_2261)
    {
        float _2353 = _2341 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1789 = _2353;
    }
    float _2355 = _1789;
    if (_2261)
    {
        float _2357 = _2249 * _2347;
        _2275 = _2357;
    }
    float _2359 = _2275;
    if (!_2261)
    {
        _2343 = _2251;
    }
    float _2361 = _2343;
    float _2363 = _2361;
    if (_2261)
    {
        float _2365 = _2251 * _2347;
        _2363 = _2365;
    }
    float _2367 = _2363;
    if (!_2261)
    {
        _2335 = _2253;
    }
    float _2369 = _2335;
    float _2371 = _2369;
    if (_2261)
    {
        float _2373 = fma(_2321, _2315, _2355);
        _2351 = _2373;
    }
    float _2375 = _2351;
    if (_2261)
    {
        float _2377 = _2359 * _2359;
        _2371 = _2377;
    }
    float _2379 = _2371;
    if (!_2261)
    {
        _2337 = _2255;
    }
    float _2381 = _2337;
    float _2383 = _2381;
    if (_2261)
    {
        float _2385 = _2367 * _2367;
        _2383 = _2385;
    }
    float _2387 = _2383;
    float _2389 = fma(_2375, _2375, _2379);
    float _2391 = _2217 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2393 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2395 = _2389 + _2387;
    float _2397 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2399 = fma(_2333, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2397);
    float _2401 = precise::clamp(_2399, 0.0, 1.0);
    float _2403 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2391);
    float _2405 = _2217 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2407 = rsqrt(_2395);
    float _2409 = -_2401;
    float _2411 = _2409 + 1.0;
    float _2413 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2403);
    float _2415 = _2217 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2417 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2405);
    float _2419 = _2217 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2421 = _2413 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2423 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2415);
    float _2425 = abs(_2411);
    float _2427 = log2(_2425);
    float _2429 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2417);
    float _2431 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2419);
    float _2433 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2423);
    float _2435 = _2421 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2437 = _2429 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2439 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2431);
    float _2441 = _2433 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2443 = _2407 * _2359;
    float _2445 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2447 = _2407 * _2375;
    float _2449 = _2407 * _2367;
    float _2451 = _2443 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2453 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2445);
    float _2455 = -_2435;
    float _2457 = fma(_2455, _2393, 1.0);
    float _2459 = _2439 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2461 = -_2451;
    float _2463 = fma(_2447, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2461);
    float _2465 = _2427 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2467 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2453);
    float _2469 = log2(_2457);
    float _2471 = -_2449;
    float _2473 = fma(_2471, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2463);
    float _2475 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2477 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2467);
    float _2479 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2481 = _2447 + 1.0;
    float _2483 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2475);
    float _2485 = exp2(_2465);
    float _2487 = fma(_2473, -0.5, 0.5);
    float _2489 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2479);
    float _2491 = fma(_2473, 0.5, 0.5);
    float _2493 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2483);
    float _2495 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2489);
    float _2497 = 1.0 / _2477;
    float _2499 = fma(_2491, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2501 = fma(_2491, _2499, -0.212114393711090087890625);
    float _2503 = sqrt(_2487);
    float _2505 = -_2447;
    float _2507 = fma(_2485, _2481, _2505);
    float _2509 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2493);
    float _2511 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2495);
    float _2513 = _2469 * 0.693147182464599609375;
    float _2515 = fma(_2491, _2501, 1.570728778839111328125);
    float _2517 = fma(_2507, 0.5, 0.5);
    float _2519 = _2509 * _2497;
    float _2521 = _2511 * _2497;
    float _2523 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2525 = fma(_2519, 0.5, 0.5);
    float _2527 = fma(_2521, -0.5, 0.5);
    float _2529 = _2503 * 0.636619746685028076171875;
    float3 _6812 = float3(_2525, _2527, _2523);
    float _2531 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6812, float3(0.0), isnan(_6812)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6812, float3(0.0), isnan(_6812)), level(0.0)).x;
    float3 _6823 = float3(_2525, _2527, _2523);
    float4 _2533 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6823, float3(0.0), isnan(_6823)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6823, float3(0.0), isnan(_6823)), level(0.0)).xyzw;
    float _2535 = _2533.x;
    float _2537 = _2533.y;
    float _2539 = _2533.z;
    float _2541 = _2533.w;
    float _2543 = -_2515;
    float _2545 = fma(_2529, _2543, 1.0);
    float2 _6844 = float2(_2545, _2517);
    float3 _2549 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6844, float2(0.0), isnan(_6844)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6844, float2(0.0), isnan(_6844)), level(0.0)).xyz;
    float _2551 = _2549.x;
    float _2553 = _2549.y;
    float _2555 = _2549.z;
    float _2557 = in.m_69.x;
    float _2559 = in.m_69.y;
    float _2561 = in.m_69.z;
    float _2563 = in.m_69.w;
    bool _2565 = _2003 != 0.0;
    bool _2567 = isnan(_2003);
    bool _2569 = _2565 || _2567;
    bool _2571 = isnan(0.0);
    bool _2573 = _2569 || _2571;
    float _2575 = _2427 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_71.x = _1131;
    out.m_71.y = _1133;
    bool _2577 = _2025 == 0.0;
    bool _2579 = !_2573;
    bool _2581 = _2577 && _2579;
    out.m_73.x = _1891;
    bool _2583 = _2015 == 0.0;
    bool _2585 = _2583 && _2581;
    float _2587 = exp2(_2575);
    out.m_75.x = _2221;
    out.m_75.y = _2217;
    out.m_75.z = _2225;
    float _2589 = _1935 * _2561;
    float _2591 = _1521 * _2557;
    float _2593 = _1961 * _2559;
    float _2595 = -_2587;
    float _2597 = _2595 + 1.0;
    float _2599 = -_2589;
    float _2601 = fma(_1961, _2557, _2599);
    float _2603 = -_2591;
    float _2605 = fma(_1935, _2559, _2603);
    float _2607 = -_2593;
    float _2609 = fma(_1521, _2561, _2607);
    if (!_2585)
    {
        float _2611 = fma(_2003, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1521);
        _1669 = _2611;
    }
    float _2613 = _1669;
    float _2615 = _2601 * _2563;
    float _2617 = _2605 * _2563;
    float _2619 = _2609 * _2563;
    if (!_2585)
    {
        float _2621 = fma(_2025, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1935);
        _2159 = _2621;
    }
    float _2623 = _2159;
    float _2625 = -_2613;
    float _2627 = _2059 * _2625;
    float _2629 = -_2559;
    float _2631 = _2059 * _2629;
    float _2633 = -_2615;
    float _2635 = _2059 * _2633;
    float _2637 = _2061 * _2613;
    float _2639 = fma(_2067, _2623, _2627);
    float _2641 = fma(_2067, _2557, _2631);
    float _2643 = fma(_2067, _2619, _2635);
    float _2645 = _2061 * _2559;
    float _2647 = _2069 * _2559;
    float _2649 = _2069 * _2613;
    if (!_2585)
    {
        float _2651 = fma(_2015, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1961);
        _2161 = _2651;
    }
    float _2653 = _2161;
    float _2655 = _2061 * _2615;
    float _2657 = fma(_2075, _2623, _2637);
    float _2659 = _2069 * _2615;
    float _2661 = fma(_2075, _2557, _2645);
    float _2663 = fma(_2087, _2557, _2647);
    float _2665 = fma(_2075, _2619, _2655);
    float _2667 = fma(_2083, _2653, _2657);
    float _2669 = fma(_2087, _2619, _2659);
    float _2671 = fma(_2071, _2561, _2641);
    float _2673 = fma(_2083, _2561, _2661);
    float _2675 = fma(_2097, _2561, _2663);
    float _2677 = fma(_2071, _2653, _2639);
    float _2679 = _2667 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2681 = _2667 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2683 = _2667 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2685 = fma(_2083, _2617, _2665);
    float _2687 = fma(_2071, _2617, _2643);
    float _2689 = fma(_2097, _2617, _2669);
    float _2691 = fma(_2677, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2679);
    float _2693 = fma(_2677, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2681);
    float _2695 = fma(_2677, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2683);
    float _2697 = fma(_2087, _2623, _2649);
    float _2699 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2701 = _2685 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2703 = _2685 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2705 = _2685 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2707 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2699);
    float _2709 = fma(_2687, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2701);
    float _2711 = fma(_2687, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2703);
    float _2713 = fma(_2687, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2705);
    float _2715 = _2673 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2717 = _2673 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2719 = _2673 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2721 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2707);
    float _2723 = _2597 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2725 = fma(_2671, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2715);
    float _2727 = fma(_2671, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2717);
    float _2729 = fma(_2671, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2719);
    float _2731 = fma(_2097, _2653, _2697);
    float _2733 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2721);
    float _2735 = fma(_2675, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2725);
    float _2737 = fma(_2675, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2727);
    float _2739 = fma(_2675, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2729);
    float _2741 = fma(_2731, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2691);
    float _2743 = fma(_2731, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2693);
    float _2745 = fma(_2731, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2695);
    float _2747 = _2733 + _2477;
    float _2749 = fma(_2689, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2711);
    out.m_77.x = _2735;
    out.m_77.y = _2737;
    out.m_77.z = _2739;
    float _2751 = _2747 * 0.5;
    bool _2753 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2755 = isnan(_2333);
    bool _2757 = _2753 || _2755;
    bool _2759 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2761 = _2757 || _2759;
    out.gl_Position.x = _2509;
    out.gl_Position.y = _2511;
    out.gl_Position.z = _2733;
    out.gl_Position.w = _2477;
    float _2763 = fma(_2689, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2709);
    float _2765 = fma(_2689, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2713);
    out.m_79.z = _2751;
    out.m_79.w = _2477;
    out.m_81.x = _2741;
    out.m_81.y = _2743;
    out.m_81.z = _2745;
    out.m_83.x = _2763;
    out.m_83.y = _2749;
    out.m_83.z = _2765;
    float _2767 = _2747;
    float _2769 = _2765;
    float _2771 = _2749;
    float _2773 = _2763;
    if (!_2761)
    {
        _2767 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2775 = _2767;
    float _2777 = _2775;
    float _2779 = _2775;
    if (!_2761)
    {
        _2769 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2781 = _2769;
    float _2783 = _2781;
    float _2785 = _2781;
    if (!_2761)
    {
        _2771 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2787 = _2771;
    float _2789 = _2787;
    float _2791 = _2787;
    if (!_2761)
    {
        _2773 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2793 = _2773;
    float _2795 = _2723 * _2531;
    float _2797 = -_2723;
    float _2799 = _2797 + 1.0;
    float _2801 = _2541 * _2795;
    float _2803 = _2541 * _2799;
    float _2805 = _2555 * _2795;
    float _2807 = fma(_2551, _2801, _2535);
    float _2809 = fma(_2553, _2801, _2537);
    float _2811 = _2535;
    float _2813 = _2801;
    float _2815 = _2793;
    float _2817 = _2793;
    if (!_2761)
    {
        _2811 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2819 = _2811;
    float _2821 = fma(_2541, _2805, _2539);
    float _2823 = _2819;
    float _2825 = _2819;
    if (!_2761)
    {
        _2813 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2827 = _2813;
    out.m_85.x = _2807;
    out.m_85.y = _2809;
    out.m_85.z = _2821;
    out.m_85.w = _2803;
    bool _2829 = !_2761;
    float _2831 = _2827;
    float _2833 = _2827;
    if (!_2829)
    {
        bool _2835 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2837 = isnan(_2333);
        bool _2839 = _2835 || _2837;
        bool _2841 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2843 = _2839 || _2841;
        if (!_2843)
        {
            float _2845 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2847 = _2333 + _2845;
            float _2849 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2851 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2849;
            float _2853 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2855 = _2853 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2857 = 1.0 / _2851;
            float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2863 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2865 = _2863 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2867 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2869 = _2867 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2871 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2873 = _2871 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2875 = _2847 * _2857;
            float _2877 = precise::clamp(_2875, 0.0, 1.0);
            float _2879 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2881 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2883 = fma(_2877, _2855, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2885 = fma(_2877, _2881, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2887 = fma(_2877, _2861, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2889 = fma(_2877, _2865, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2891 = fma(_2877, _2869, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2893 = fma(_2877, _2873, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2825 = _2887;
            _2791 = _2891;
            _2779 = _2883;
            _2785 = _2889;
            _2833 = _2885;
            _2817 = _2893;
            _2895 = true;
        }
        else
        {
            bool _2897 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2899 = isnan(_2333);
            bool _2901 = _2897 || _2899;
            bool _2903 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2905 = _2901 || _2903;
            if (!_2905)
            {
                _2777 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2907 = _2777;
            _2779 = _2907;
            if (!_2905)
            {
                _2823 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2909 = _2823;
            _2825 = _2909;
            if (!_2905)
            {
                _2831 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2911 = _2831;
            _2833 = _2911;
            if (!_2905)
            {
                _2783 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2913 = _2783;
            _2785 = _2913;
            if (!_2905)
            {
                _2789 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2915 = _2789;
            _2791 = _2915;
            if (!_2905)
            {
                _2815 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2917 = _2815;
            bool _2919 = !_2905;
            _2817 = _2917;
            if (!_2919)
            {
                bool _2921 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2923 = isnan(_2333);
                bool _2925 = _2921 || _2923;
                bool _2927 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2929 = _2925 || _2927;
                if (!_2929)
                {
                    float _2931 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2933 = _2333 + _2931;
                    float _2935 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2937 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2935;
                    float _2939 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2941 = _2939 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2943 = 1.0 / _2937;
                    float _2945 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2947 = _2945 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2949 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2951 = _2949 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2961 = _2933 * _2943;
                    float _2963 = precise::clamp(_2961, 0.0, 1.0);
                    float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2967 = _2965 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2969 = fma(_2963, _2941, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2971 = fma(_2963, _2967, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2973 = fma(_2963, _2947, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2975 = fma(_2963, _2951, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2977 = fma(_2963, _2955, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2979 = fma(_2963, _2959, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2825 = _2973;
                    _2791 = _2977;
                    _2779 = _2969;
                    _2785 = _2975;
                    _2833 = _2971;
                    _2817 = _2979;
                    _2895 = true;
                }
                else
                {
                    _2825 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2791 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2779 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2785 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2833 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2817 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2895 = false;
    float _2981 = _2825;
    float _2983 = _2791;
    float _2985 = _2779;
    float _2987 = _2785;
    float _2989 = _2833;
    float _2991 = _2817;
    float _2993 = fma(_2743, -0.5, 0.5);
    float _2995 = precise::clamp(_2993, 0.0, 1.0);
    float _2997 = -_2981;
    float _2999 = _2997 + _2983;
    float _3001 = -_2985;
    float _3003 = _3001 + _2987;
    float _3005 = -_2989;
    float _3007 = _3005 + _2991;
    bool _3009 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3011 = fma(_2995, _2999, _2981);
    float _3013 = fma(_2995, _3003, _2985);
    float _3015 = fma(_2995, _3007, _2989);
    float _3017 = _3011 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _3019 = fma(_3013, 0.298911988735198974609375, _3017);
    out.m_87.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3021 = fma(_3015, 0.114477999508380889892578125, _3019);
    out.m_89.x = 0.0;
    float _3023 = -_3021;
    float _3025 = _3013 + _3023;
    float _3027 = -_3021;
    float _3029 = _3011 + _3027;
    float _3031 = -_3021;
    float _3033 = _3015 + _3031;
    float _3035 = fma(_3025, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3021);
    float _3037 = fma(_3029, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3021);
    float _3039 = fma(_3033, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3021);
    out.m_91.x = _3035;
    out.m_91.y = _3037;
    out.m_91.z = _3039;
    if (!_3009)
    {
        return out;
    }
    float _3041 = -_2217;
    float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3045 = -_2221;
    float _3047 = _3045 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3049 = -_2225;
    float _3051 = _3049 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3053 = _3043 * _3043;
    float _3055 = fma(_3047, _3047, _3053);
    float _3057 = fma(_3051, _3051, _3055);
    float _3059 = sqrt(_3057);
    float _3061 = rsqrt(_3057);
    float _3063 = -_3059;
    float _3065 = _3063 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3067 = _3065 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3069 = precise::clamp(_3067, 0.0, 1.0);
    float _3071 = _3047 * _3061;
    float _3073 = _3043 * _3061;
    float _3075 = abs(_3069);
    float _3077 = log2(_3075);
    float _3079 = _3051 * _3061;
    float _3081 = _3071 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3083 = _2743 * _3073;
    float _3085 = -_3073;
    float _3087 = -_3081;
    float _3089 = fma(_3085, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3087);
    float _3091 = fma(_2741, _3071, _3083);
    float _3093 = -_3079;
    float _3095 = fma(_3093, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3089);
    float _3097 = fma(_2745, _3079, _3091);
    float _3099 = precise::clamp(_3097, 0.0, 1.0);
    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3103 = _3095 + _3101;
    float _3105 = _3077 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3107 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3109 = precise::clamp(_3107, 0.0, 1.0);
    float _3111 = exp2(_3105);
    float _3113 = _3111 * _3109;
    float _3115 = _3099 * _3113;
    float _3117 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3119 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3121 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _3117;
    out.m_89.y = _3119;
    out.m_89.z = _3121;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2895 = false;
    bool _1467 = false;
    bool _1277 = false;
    bool _699 = false;
    bool _315 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = trunc(_111);
    int _115 = int(_113);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_49.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3178 = as_type<float>(_131);
        out.gl_Position.z = _3178;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_51.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = _149;
    if (_145)
    {
        float _153 = float(_115);
        _125 = _153;
    }
    float _155 = _125;
    bool _157 = _149 >= _155;
    bool _159 = !_145;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_49.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3248 = as_type<float>(_169);
        out.gl_Position.z = _3248;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = in.m_53.y;
    float _173 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = in.m_55.w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = in.m_51.x;
    float _189 = in.m_51.y;
    float _191 = in.m_51.z;
    float _193 = in.m_46.x;
    float _195 = in.m_46.y;
    float _197 = in.m_46.z;
    float _199 = 0.0;
    float _201 = _173;
    if (!_185)
    {
        float _203 = _173 * _173;
        float _205 = _203 * 0.5;
        _199 = _205;
    }
    float _207 = _199;
    float _209 = _207;
    if (!_185)
    {
        float _211 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _211;
    }
    float _213 = _209;
    out.m_57.y = _171;
    bool _215 = !_185;
    float _217 = _213;
    if (!_215)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _173 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _173);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _247;
    }
    float _249 = _217;
    bool _251 = !_185;
    if (!_251)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _173 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _201 = _271;
    }
    float _273 = _201;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _277 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _279 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _281 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _283 = fma(_273, _187, _277);
    float _285 = fma(_273, _189, _279);
    float _287 = fma(_273, _191, _281);
    float _289 = fma(_283, _175, _193);
    float _291 = fma(_285, _175, _195);
    float _293 = fma(_287, _175, _197);
    bool _295 = !_275;
    float _313;
    if (!_295)
    {
        float _297 = in.m_59.x;
        float _299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _301 = _297 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _305 = _303 * _299;
        float _307 = floor(_305);
        float _309 = -_307;
        float _311 = _305 + _309;
        _313 = _311;
        _315 = true;
    }
    else
    {
        float _317 = float(_115);
        float _319 = 1.0 / _317;
        float _321 = _149 * _319;
        _313 = _321;
    }
    _315 = false;
    float _323 = _313;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _341 = 1.0 / _327;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _351 = 1.0 / _331;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _355 = _323 + _353;
    bool _357 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _359 = isnan(_323);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_367;
    float _371 = _369 + 1.0;
    float _373 = 1.0 / _335;
    float _375 = _355 * _341;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _379 = _323 + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = _323 + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _387 = _323 + _385;
    bool _389 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _391 = 1.0 / _345;
    float _393 = _379 * _351;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _397 = _323 + _395;
    bool _399 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _401 = isnan(_323);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _413 = _323 + _411;
    float _415 = 1.0 / _339;
    float _417 = _383 * _373;
    bool _419 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _421 = isnan(_323);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    float _431 = -_409;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _435;
    float _439 = 1.0 / _349;
    float _441 = _397 * _391;
    float _443 = -_429;
    float _445 = _443 + 1.0;
    bool _447 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _449 = isnan(_323);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = fma(_437, _375, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _461 = _409 * _445;
    float _463 = _387 * _415;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _469;
    float _473 = fma(_467, _375, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _475 = _457 * _433;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _481 = _413 * _439;
    float _483 = fma(_471, _375, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _485 = -_457;
    float _487 = _485 + 1.0;
    bool _489 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _491 = isnan(_323);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _505 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _507 = isnan(_323);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _521 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _523 = isnan(_323);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = fma(_503, _393, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _535 = fma(_479, _393, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _537 = fma(_519, _393, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _539 = _499 * _371;
    float _541 = -_499;
    float _543 = _541 + 1.0;
    float _545 = -_531;
    float _547 = _545 + 1.0;
    float _549 = _367 * _487;
    float _551 = _531 * _543;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _553;
    float _557 = _515 * _547;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _559;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _563;
    float _567 = fma(_555, _417, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _569 = _459 * _557;
    float _571 = fma(_561, _417, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _573 = fma(_565, _417, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _575 = -_515;
    float _577 = _575 + 1.0;
    float _579 = _473 * _557;
    float _581 = _483 * _557;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _595 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[143].z, _569);
    float _597 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[143].x, _579);
    float _599 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[143].y, _581);
    float _601 = fma(_585, _463, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _603 = fma(_589, _463, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _605 = fma(_593, _463, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _607 = fma(_537, _551, _595);
    float _609 = fma(_533, _551, _597);
    float _611 = fma(_535, _551, _599);
    float _613 = fma(_571, _539, _609);
    float _615 = fma(_573, _539, _607);
    float _617 = fma(_567, _539, _611);
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _619;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _627;
    float _631 = fma(_601, _549, _613);
    float _633 = fma(_605, _549, _615);
    float _635 = fma(_621, _441, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _637 = fma(_625, _441, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _639 = fma(_603, _549, _617);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _649 = fma(_629, _441, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _655 = fma(_643, _481, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _657 = fma(_647, _481, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _659 = fma(_635, _475, _631);
    float _661 = fma(_653, _481, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _663 = fma(_637, _475, _639);
    float _665 = fma(_649, _475, _633);
    float _667 = fma(_655, _461, _659);
    float _669 = fma(_657, _461, _663);
    float _671 = fma(_661, _461, _665);
    float _673 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[149].x, _667);
    float _675 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[149].y, _669);
    float _677 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[149].z, _671);
    bool _679 = !_389;
    float _697;
    if (!_679)
    {
        float _681 = in.m_59.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[11].x, _149);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _697 = _695;
        _699 = true;
    }
    else
    {
        float _701 = float(_115);
        float _703 = 1.0 / _701;
        float _705 = _149 * _703;
        _697 = _705;
    }
    _699 = false;
    float _707 = _697;
    int _709 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _711 = _709;
    int _713 = 0;
    int _715 = _106(_711, _713, (*spvDescriptorSet0.support_buffer));
    float _717 = in.m_53.x;
    float _719 = _149 * 0.0500000007450580596923828125;
    float _721 = in.m_53.z;
    float _723 = fma(_717, 18.84955596923828125, _719);
    float _725 = _723 * 0.15915493667125701904296875;
    float _727 = trunc(_721);
    int _729 = int(_727);
    float _731 = _725 * 6.283185482025146484375;
    float _733 = sin(_731);
    float _735 = fma(_733, 0.5, 0.5);
    float _737 = float(_715);
    int _739 = abs(_715);
    bool _741 = _715 == 0;
    float _743 = _735 * _737;
    float _745 = float(uint(_739));
    float _747 = trunc(_743);
    int _749 = int(_747);
    float _751 = 1.0 / _745;
    int _753 = abs(_749);
    uint _756 = uint(int(uint(_749) >> uint(31)));
    float _758 = float(uint(_753));
    int _760 = ~int(_756);
    int _762 = _760 + 1;
    int _764 = as_type<int>(_751) + (-2);
    float _766 = as_type<float>(_764) * _758;
    float _768 = trunc(_766);
    float _770 = precise::max(_768, 0.0);
    uint _772 = uint(_770);
    int _774 = ~int(_772);
    int _776 = _774 + 1;
    int _778 = _776 * _739;
    int _780 = _778 + _753;
    float _782 = float(uint(_780));
    float _784 = as_type<float>(_764) * _782;
    float _786 = trunc(_784);
    float _788 = precise::max(_786, 0.0);
    uint _790 = uint(_788);
    int _792 = int(_772) + int(_790);
    int _794 = ~_792;
    int _796 = _794 + 1;
    int _798 = _796 * _739;
    int _800 = _798 + _753;
    bool _802 = uint(_800) >= uint(_739);
    bool _804 = !_802;
    int _806 = _804 ? 0 : (-1);
    int _808 = ~_792;
    int _810 = _808 + _806;
    int _812 = _810 + 1;
    int _814 = _812 * _739;
    int _816 = _814 + _753;
    int _818 = _816 ^ _762;
    int _820 = ~_762;
    int _822 = _820 + _818;
    int _824 = _822 + 1;
    bool _826 = !_741;
    int _828 = _826 ? _824 : (-1);
    int _830 = _828;
    int _832 = 0;
    int _834 = _107(_830, _832, (*spvDescriptorSet0.support_buffer));
    int _836 = _729;
    int _838 = 0;
    int _840 = _107(_836, _838, (*spvDescriptorSet0.support_buffer));
    float4 _843 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_834, _840)), 0).xyzw;
    float _845 = _843.x;
    float _847 = _843.y;
    float _849 = _843.z;
    float _851 = _843.w;
    float _853 = in.m_55.x;
    float _855 = in.m_55.y;
    float _857 = in.m_55.z;
    float _859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _861 = in.m_59.x;
    float _863 = in.m_59.y;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _865;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _871 = _869 != 0;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _875 = _873 != 0;
    float _877 = 1.0 / _867;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _881 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _883 = _675 * _855;
    float _885 = _677 * _857;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _891 = _863 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _895 = 1.0 / _889;
    float _897 = _861 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _899 = _861 > 0.5;
    bool _901 = _899 && _871;
    float _903 = fma(_891, -2.0, _893);
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _907 = _863 > 0.5;
    bool _909 = _907 && _875;
    float _911 = -_879;
    float _913 = fma(_897, 2.0, _911);
    int _915 = _828 + 1;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _919 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[78].w, _905);
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _923 = _707 + _921;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _927 = _707 + _925;
    float _929 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[78].z, _917);
    float _931 = -_717;
    float _933 = _931 + 1.0;
    float _935 = _923 * _895;
    float _937 = _927 * _877;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _939;
    float _943 = _901 ? _933 : _717;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _945;
    bool _949 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _951 = isnan(_707);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _957 = _953 || _955;
    float _959 = float(_957);
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _961;
    float _965 = fma(_941, _937, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _967 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _969 = isnan(_707);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    float _979 = fma(_947, _937, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _981 = -_959;
    float _983 = _981 + 1.0;
    float _985 = fma(_963, _937, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _987 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _989 = isnan(_707);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1001 = _999 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1005 = _1003 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1007 = _977 * _983;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1011 = _1009 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1013 = _859 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1015 = -_977;
    float _1017 = _1015 + 1.0;
    float _1019 = _883 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1021 = fma(_1001, _935, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1023 = fma(_1013, _943, -0.5);
    float _1025 = _997 * _1017;
    float _1027 = _1019 * _171;
    float _1029 = -_997;
    float _1031 = _1029 + 1.0;
    float _1033 = _881 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1035 = _979 * _1025;
    float _1037 = _1027;
    if (_909)
    {
        float _1039 = -_1027;
        float _1041 = _1039 + 1.0;
        _1037 = _1041;
    }
    float _1043 = _1037;
    float _1045 = _985 * _1025;
    float _1047 = _965 * _1025;
    float _1049 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1035);
    float _1051 = fma(_1033, _1043, -0.5);
    float _1053 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1045);
    float _1055 = fma(_1005, _935, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1057 = fma(_1021, _1007, _1049);
    float _1059 = fma(_1011, _935, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1061 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1047);
    float _1063 = fma(_1055, _1007, _1053);
    float _1065 = fma(_1059, _1007, _1061);
    float _1067 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1057);
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1071 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1063);
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1075 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1065);
    float _1077 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1079 = -_149;
    float _1081 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[76].x, _913);
    float _1083 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1085 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _929);
    int _1087 = abs(_915);
    float _1089 = _673 * _853;
    float _1091 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _919);
    float _1093 = fma(_1085, _1023, _1081);
    float _1095 = float(uint(_1087));
    float _1097 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _903);
    float _1099 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1101 = _1075 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1103 = as_type<float>(_764) * _1095;
    float _1105 = -_1097;
    float _1107 = fma(_1091, _1051, _1105);
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1111 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1113 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _1115 = uint(int(uint(_915) >> uint(31)));
    float _1117 = trunc(_1103);
    float _1119 = precise::max(_1117, 0.0);
    uint _1121 = uint(_1119);
    float _1123 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1125 = _1071 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1127 = ~int(_1115);
    int _1129 = _1127 + 1;
    float _1131 = _1093 + 0.5;
    float _1133 = _1107 + 0.5;
    out.m_61.x = _1077;
    out.m_61.y = _1123;
    out.m_61.z = _1083;
    float _1135 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _1111;
    out.m_63.y = _1135;
    out.m_63.z = _1113;
    int _1137 = ~int(_1121);
    int _1139 = _1137 + 1;
    int _1141 = _1139 * _739;
    int _1143 = _1141 + _1087;
    float _1145 = float(uint(_1143));
    float _1147 = as_type<float>(_764) * _1145;
    float _1149 = trunc(_1147);
    float _1151 = precise::max(_1149, 0.0);
    uint _1153 = uint(_1151);
    int _1155 = int(_1121) + int(_1153);
    int _1157 = ~_1155;
    int _1159 = _1157 + 1;
    int _1161 = _1159 * _739;
    int _1163 = _1161 + _1087;
    bool _1165 = uint(_1163) >= uint(_739);
    bool _1167 = !_1165;
    int _1169 = _1167 ? 0 : (-1);
    int _1171 = ~_1155;
    int _1173 = _1171 + _1169;
    int _1175 = _1173 + 1;
    int _1177 = _1175 * _739;
    int _1179 = _1177 + _1087;
    int _1181 = _1179 ^ _1129;
    int _1183 = ~_1129;
    int _1185 = _1183 + _1181;
    int _1187 = _1185 + 1;
    bool _1189 = !_741;
    int _1191 = _1189 ? _1187 : (-1);
    uint _1193 = as_type<uint>(half2(float2(_851, 0.0)));
    uint _1195 = extract_bits(_1193, 0u, 8u);
    int _1197 = int(_1195) & 255;
    uint _1199 = extract_bits(_1193, 8u, 8u);
    int _1201 = int(_1199) & 255;
    int _1203 = _1201 << 8;
    int _1205 = _1197 | _1203;
    bool _1207 = _1205 >= 32768;
    int _1209 = _1205 + (-1024);
    int _1211 = _1209;
    if (_1207)
    {
        int _1213 = ~_1205;
        int _1215 = _1213 + 33792;
        int _1217 = _1215 + 1;
        _1211 = _1217;
    }
    int _1219 = _1211;
    int _1221 = _1219 + 30719;
    float _1223 = float(_1221);
    float _1225 = fma(_1223, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1227 = abs(_1225);
    float _1229 = -_1227;
    float _1231 = _1229 + 1.0;
    bool _1233 = _1225 < 0.0;
    float _1235 = float(_1233);
    float _1237 = abs(_1225);
    float _1239 = fma(_1237, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1241 = as_type<int>(_1231) + (-218103808);
    float _1243 = abs(_1225);
    float _1245 = fma(_1243, _1239, -0.212114393711090087890625);
    bool _1247 = uint(_1241) >= 1920991232u;
    float _1249 = abs(_1225);
    float _1251 = fma(_1249, _1245, 1.570728778839111328125);
    bool _1253 = !_1247;
    float _1275;
    if (!_1253)
    {
        int _1255 = as_type<int>(_1231);
        int _1257 = as_type<int>(_1111);
        int _1259 = _1169;
        int _1261 = 6272;
        int _1263;
        int _1265;
        int _1267;
        int _1269;
        int _1271;
        int _1273;
        _104(_1255, _1257, _1259, _1261, _1263, _1265, _1267, _1269, _1271, _1273, out.gl_Position, out.gl_PointSize);
        _1275 = as_type<float>(_1267);
        _1277 = true;
    }
    else
    {
        float _1279 = rsqrt(_1231);
        float _1281 = _1231 * _1279;
        float _1283 = _1279 * 0.5;
        float _1285 = -_1281;
        float _1287 = 0.0 + _1285;
        float _1289 = fma(_1283, _1287, 0.5);
        float _1291 = fma(_1281, _1289, _1281);
        float _1293 = -_1291;
        float _1295 = 0.0 + _1293;
        float _1297 = fma(_1291, _1295, _1231);
        float _1299 = fma(_1283, _1297, _1291);
        _1275 = _1299;
    }
    _1277 = false;
    float _1301 = _1275;
    int _1303 = _1191;
    int _1305 = 0;
    int _1307 = _107(_1303, _1305, (*spvDescriptorSet0.support_buffer));
    int _1309 = _729;
    int _1311 = 0;
    int _1313 = _107(_1309, _1311, (*spvDescriptorSet0.support_buffer));
    float4 _1315 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1307, _1313)), 0).xyzw;
    float _1317 = _1315.x;
    float _1319 = _1315.y;
    float _1321 = _1315.z;
    float _1323 = _1315.w;
    float _1325 = _1251 * _1301;
    float _1327 = _1235 * 2.0;
    float _1329 = floor(_743);
    float _1331 = _1223 * 3.883221149444580078125;
    float _1333 = -_1327;
    float _1335 = fma(_1325, _1333, _1325);
    float _1337 = _1331 * 0.15915493667125701904296875;
    float _1339 = fma(_1235, 3.1415927410125732421875, _1335);
    float _1341 = _1337 * 6.283185482025146484375;
    float _1343 = cos(_1341);
    float _1345 = _1339 * 0.15915493667125701904296875;
    float _1347 = -_1329;
    float _1349 = _743 + _1347;
    float _1351 = _1345 * 6.283185482025146484375;
    float _1353 = sin(_1351);
    float _1355 = _1337 * 6.283185482025146484375;
    float _1357 = sin(_1355);
    float _1359 = _1353 * _1343;
    float _1361 = _1353 * _1357;
    uint _1363 = as_type<uint>(half2(float2(_1323, 0.0)));
    float _1365 = -_845;
    float _1367 = _1365 + _1317;
    float _1369 = -_847;
    float _1371 = _1369 + _1319;
    uint _1373 = extract_bits(_1363, 0u, 8u);
    int _1375 = int(_1373) & 255;
    uint _1377 = extract_bits(_1363, 8u, 8u);
    int _1379 = int(_1377) & 255;
    int _1381 = _1379 << 8;
    int _1383 = _1375 | _1381;
    float _1385 = fma(_1349, _1367, _845);
    float _1387 = fma(_1349, _1371, _847);
    bool _1389 = _1383 >= 32768;
    int _1391 = _1383 + (-1024);
    int _1393 = _1391;
    float _1395 = _1387;
    if (_1389)
    {
        int _1397 = ~_1383;
        int _1399 = _1397 + 33792;
        int _1401 = _1399 + 1;
        _1393 = _1401;
    }
    int _1403 = _1393;
    int _1405 = _1403 + 30719;
    float _1407 = float(_1405);
    float _1409 = fma(_1407, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1411 = abs(_1409);
    float _1413 = -_1411;
    float _1415 = _1413 + 1.0;
    float _1417 = abs(_1409);
    float _1419 = fma(_1417, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1421 = as_type<int>(_1415) + (-218103808);
    bool _1423 = uint(_1421) >= 1920991232u;
    float _1425 = -_849;
    float _1427 = _1425 + _1321;
    float _1429 = abs(_1409);
    float _1431 = fma(_1429, _1419, -0.212114393711090087890625);
    bool _1433 = _1409 < 0.0;
    float _1435 = float(_1433);
    float _1437 = fma(_1349, _1427, _849);
    float _1439 = abs(_1409);
    float _1441 = fma(_1439, _1431, 1.570728778839111328125);
    bool _1443 = !_1423;
    float _1465;
    if (!_1443)
    {
        int _1445 = as_type<int>(_1415);
        int _1447 = as_type<int>(_1367);
        int _1449 = as_type<int>(_1319);
        int _1451 = 7184;
        int _1453;
        int _1455;
        int _1457;
        int _1459;
        int _1461;
        int _1463;
        _104(_1445, _1447, _1449, _1451, _1453, _1455, _1457, _1459, _1461, _1463, out.gl_Position, out.gl_PointSize);
        _1465 = as_type<float>(_1457);
        _1467 = true;
    }
    else
    {
        float _1469 = rsqrt(_1415);
        float _1471 = _1415 * _1469;
        float _1473 = _1469 * 0.5;
        float _1475 = -_1471;
        float _1477 = 0.0 + _1475;
        float _1479 = fma(_1473, _1477, 0.5);
        float _1481 = fma(_1471, _1479, _1471);
        float _1483 = -_1481;
        float _1485 = 0.0 + _1483;
        float _1487 = fma(_1481, _1485, _1415);
        float _1489 = fma(_1473, _1487, _1481);
        _1465 = _1489;
    }
    _1467 = false;
    float _1491 = _1465;
    float _1493 = in.m_53.x;
    float _1495 = in.m_53.y;
    float _1497 = _1441 * _1491;
    float _1499 = _1407 * 3.883221149444580078125;
    float _1501 = -_1225;
    float _1503 = _1501 + _1409;
    float _1505 = in.m_59.z;
    float _1507 = _1435 * 2.0;
    float _1509 = _149 * (-0.20000000298023223876953125);
    float _1511 = _1499 * 0.15915493667125701904296875;
    float _1513 = in.m_59.x;
    float _1515 = in.m_59.y;
    float _1517 = -_1507;
    float _1519 = fma(_1497, _1517, _1497);
    float _1521 = fma(_1349, _1503, _1225);
    float _1523 = _291 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1525 = _291 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1527 = _291 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1529 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1523);
    float _1531 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1525);
    float _1533 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1527);
    float _1535 = fma(_1435, 3.1415927410125732421875, _1519);
    float _1537 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1539 = log2(_1537);
    float _1541 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1543 = fma(_1495, 25.1327419281005859375, _1509);
    float _1545 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1547 = _1505 * 2.0;
    int _1549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1551 = _1549 != 0;
    int _1553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1555 = _1553 != 0;
    int _1557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1559 = _1557 != 0;
    float _1561 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1541);
    float _1563 = _1513 * 2.0;
    float _1565 = floor(_1547);
    float _1567 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1561);
    float _1569 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1571 = _1515 + _1505;
    float _1573 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1545);
    float _1575 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1531);
    float _1577 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1569);
    float _1579 = floor(_1563);
    float _1581 = _1571 + (-1.0);
    float _1583 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1529);
    float _1585 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1573);
    float _1587 = _1505 + _1513;
    float _1589 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1533);
    float _1591 = fma(_1581, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1593 = _1587 + (-1.0);
    float _1595 = _1515 + _1513;
    float _1597 = _1543 * 0.15915493667125701904296875;
    bool _1599 = _1565 > 0.0;
    float _1601 = _1595 + (-1.0);
    float _1603 = fma(_149, -0.007000000216066837310791015625, _1493);
    float _1605 = fma(_1593, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1607 = _1539 * _149;
    bool _1609 = _1565 >= 0.0;
    bool _1611 = isnan(_1565);
    bool _1613 = _1609 || _1611;
    bool _1615 = isnan(0.0);
    bool _1617 = _1613 || _1615;
    float _1619 = _1535 * 0.15915493667125701904296875;
    float _1621 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1623 = _1603 * 18.84955596923828125;
    float _1625 = fma(_149, -0.006000000052154064178466796875, _1493);
    float _1627 = _1511 * 6.283185482025146484375;
    float _1629 = cos(_1627);
    int _1631 = _1617 ? 0 : 1;
    float _1633 = _1515 * 2.0;
    float _1635 = _1575 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1637 = _1579 > 0.0;
    float _1639 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1577);
    bool _1641 = _1579 >= 0.0;
    bool _1643 = isnan(_1579);
    bool _1645 = _1641 || _1643;
    bool _1647 = isnan(0.0);
    bool _1649 = _1645 || _1647;
    float _1651 = _1511 * 6.283185482025146484375;
    float _1653 = sin(_1651);
    float _1655 = _1625 * 31.415927886962890625;
    int _1657 = ~_1631;
    int _1659 = _1657 + 1;
    int _1661 = _1659 + 1;
    float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1665 = 1.0 + _1663;
    int _1667 = _1661;
    float _1669 = _1521;
    if (!_1599)
    {
        int _1671 = ~_1631;
        int _1673 = _1671 + 1;
        _1667 = _1673;
    }
    int _1675 = _1667;
    float _1677 = _1655 * 0.15915493667125701904296875;
    float _1679 = _1583 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1681 = _1589 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1683 = exp2(_1607);
    float _1685 = _1623 * 0.15915493667125701904296875;
    float _1687 = fma(_149, 0.001000000047497451305389404296875, _1493);
    float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1691 = _1679 + _1689;
    bool _1693 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1695 = isnan(1.0);
    bool _1697 = _1693 || _1695;
    bool _1699 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1701 = _1697 || _1699;
    float _1703 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1705 = _1681 + _1703;
    float _1707 = _1687 * 43.9822998046875;
    float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1711 = _1635 + _1709;
    float _1713 = floor(_1633);
    bool _1715 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1717 = isnan(0.0);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1723 = _1719 || _1721;
    float _1725 = _1707 * 0.15915493667125701904296875;
    float _1727 = _1711 * _1711;
    float _1729 = _1513 * 6.283185482025146484375;
    bool _1731 = !_1551;
    int _1733 = _1731 ? 0 : 1;
    float _1735 = _1513 + (-0.5);
    float _1737 = fma(_1691, _1691, _1727);
    float _1739 = 1.0 / _1665;
    float _1741 = -_1683;
    float _1743 = _1741 + 1.0;
    float _1745 = _1515 * 6.283185482025146484375;
    int _1747 = _1649 ? 0 : 1;
    float _1749 = _1515 + (-0.5);
    int _1751 = abs(_1733);
    float _1753 = _1505 + (-0.5);
    float _1755 = _1723 ? _1743 : 0.0;
    float _1757 = _1685 * 6.283185482025146484375;
    float _1759 = sin(_1757);
    bool _1761 = _1713 > 0.0;
    float _1763 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1765 = _1713 >= 0.0;
    bool _1767 = isnan(_1713);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan(0.0);
    bool _1773 = _1769 || _1771;
    float _1775 = fma(_149, 0.070000000298023223876953125, _1729);
    float _1777 = float(_1675);
    int _1779 = _1773 ? 0 : 1;
    float _1781 = _1619 * 6.283185482025146484375;
    float _1783 = sin(_1781);
    float _1785 = fma(_1705, _1705, _1737);
    float _1787 = fma(_149, 0.12999999523162841796875, _1745);
    float _1789 = _1679;
    if (_1701)
    {
        float _1791 = _1755 * _1739;
        _151 = _1791;
    }
    float _1793 = _151;
    bool _1795 = !_1555;
    int _1797 = _1795 ? 0 : 1;
    float _1799 = in.m_65.x;
    float _1801 = in.m_65.y;
    float _1803 = in.m_65.z;
    float _1805 = _1787 * 0.15915493667125701904296875;
    float _1807 = rsqrt(_1785);
    int _1809 = abs(_1797);
    float _1811 = _1759 * 0.0500000007450580596923828125;
    int _1813 = ~_1747;
    int _1815 = _1813 + 1;
    int _1817 = _1815 + 1;
    int _1819 = _1817;
    if (!_1637)
    {
        int _1821 = ~_1747;
        int _1823 = _1821 + 1;
        _1819 = _1823;
    }
    int _1825 = _1819;
    float _1827 = float(_1809);
    float _1829 = _1597 * 6.283185482025146484375;
    float _1831 = sin(_1829);
    float _1833 = float(_1825);
    float _1835 = -_1361;
    float _1837 = fma(_1783, _1653, _1835);
    float _1839 = float(_1751);
    int _1841 = ~_1779;
    int _1843 = _1841 + 1;
    int _1845 = _1843 + 1;
    float _1847 = _1827 * _1833;
    int _1849 = _1845;
    if (!_1761)
    {
        int _1851 = ~_1779;
        int _1853 = _1851 + 1;
        _1849 = _1853;
    }
    int _1855 = _1849;
    float _1857 = _1711 * _1807;
    float _1859 = _1839 * _1777;
    float _1861 = _1691 * _1807;
    float _1863 = _1847 * (-2.0);
    float _1865 = -_1857;
    float _1867 = fma(_1865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1711);
    float _1869 = _1859 * (-2.0);
    float _1871 = -_1861;
    float _1873 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1691);
    float _1875 = fma(_1591, _1863, _1591);
    float _1877 = _1867 * _1867;
    float _1879 = fma(_1863, _1801, _1801);
    float _1881 = _1775 * 0.15915493667125701904296875;
    float _1883 = _1705 * _1807;
    float _1885 = fma(_1873, _1873, _1877);
    bool _1887 = !_1559;
    int _1889 = _1887 ? 0 : 1;
    float _1891 = in.m_67.x;
    float _1893 = in.m_67.y;
    float _1895 = -_1883;
    float _1897 = fma(_1895, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1705);
    float _1899 = _1725 * 6.283185482025146484375;
    float _1901 = sin(_1899);
    int _1903 = abs(_1889);
    float _1905 = fma(_1749, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1879);
    float _1907 = fma(_1897, _1897, _1885);
    float _1909 = fma(_1831, 0.0500000007450580596923828125, 0.0500000007450580596923828125);
    float _1911 = float(_1903);
    float _1913 = fma(_1875, _1793, _1905);
    float _1915 = float(_1855);
    float _1917 = fma(_1621, _1869, _1621);
    float _1919 = -_1359;
    float _1921 = fma(_1783, _1629, _1919);
    float _1923 = fma(_1869, _1799, _1799);
    float _1925 = _1677 * 6.283185482025146484375;
    float _1927 = sin(_1925);
    float _1929 = _1911 * _1915;
    float _1931 = _1913 * 0.15915493667125701904296875;
    float _1933 = fma(_1735, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1923);
    float _1935 = fma(_1349, _1921, _1359);
    float _1937 = _1929 * (-2.0);
    float _1939 = _1901 * 0.00999999977648258209228515625;
    float _1941 = fma(_1917, _1793, _1933);
    float _1943 = _1805 * 6.283185482025146484375;
    float _1945 = sin(_1943);
    float _1947 = fma(_1937, _1803, _1803);
    float _1949 = fma(_1605, _1937, _1605);
    float _1951 = precise::max(0.0, _1893);
    float _1953 = _1941 * 0.15915493667125701904296875;
    float _1955 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1947);
    float _1957 = precise::min(_1951, 0.5);
    float _1959 = sqrt(_1585);
    float _1961 = fma(_1349, _1837, _1361);
    float _1963 = fma(_1949, _1793, _1955);
    float _1965 = fma(_1927, 0.02999999932944774627685546875, _1939);
    float _1967 = _1957 * 2.0;
    float _1969 = fma(_1521, _1909, _1387);
    float _1971 = _1963 * 0.15915493667125701904296875;
    float _1973 = fma(_1961, _1909, _1437);
    float _1975 = _1881 * 6.283185482025146484375;
    float _1977 = sin(_1975);
    float _1979 = _1945 * 0.02300000004470348358154296875;
    float _1981 = _1811 * _1967;
    float _1983 = _1967 * _1891;
    float _1985 = fma(_1981, _1891, _1969);
    float _1987 = sqrt(_1639);
    float _1989 = _1959 * _1965;
    float _1991 = _1387 * _1989;
    float _1993 = sqrt(_1567);
    float _1995 = fma(_1977, 0.0900000035762786865234375, _1979);
    float _1997 = _1985 + _1995;
    float _1999 = sqrt(_1907);
    float _2001 = _1987 * _1965;
    float _2003 = fma(_1991, _1983, _1997);
    float _2005 = _1437 * _2001;
    float _2007 = _1931 * 6.283185482025146484375;
    float _2009 = sin(_2007);
    float _2011 = _1993 * _1965;
    float _2013 = fma(_1935, _1909, _1385);
    float _2015 = fma(_2005, _1983, _1973);
    float _2017 = _1385 * _2011;
    float _2019 = _1931 * 6.283185482025146484375;
    float _2021 = cos(_2019);
    float _2023 = _1807 * _1999;
    float _2025 = fma(_2017, _1983, _2013);
    float _2027 = _885 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2029 = _1019 * _2023;
    float _2031 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2025);
    float _2033 = _2023 * _1763;
    float _2035 = _1953 * 6.283185482025146484375;
    float _2037 = cos(_2035);
    float _2039 = _2023 * _2027;
    float _2041 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2015);
    float _2043 = _2041 * _2039;
    float _2045 = _1971 * 6.283185482025146484375;
    float _2047 = cos(_2045);
    float _2049 = _1953 * 6.283185482025146484375;
    float _2051 = sin(_2049);
    float _2053 = _2037 * _2021;
    float _2055 = _2037 * _2009;
    float _2057 = _1971 * 6.283185482025146484375;
    float _2059 = sin(_2057);
    float _2061 = _2037 * _2047;
    float _2063 = _2051 * _2021;
    float _2065 = _2051 * _2009;
    float _2067 = _2021 * _2047;
    float _2069 = _2051 * _2047;
    float _2071 = _2009 * _2047;
    float _2073 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2003);
    float _2075 = fma(_2059, _2053, _2065);
    float _2077 = _2073 * _2029;
    float _2079 = _2031 * _2033;
    float _2081 = -_2063;
    float _2083 = fma(_2059, _2055, _2081);
    float _2085 = -_2055;
    float _2087 = fma(_2059, _2063, _2085);
    float _2089 = _2061 * _2077;
    float _2091 = -_2077;
    float _2093 = _2059 * _2091;
    float _2095 = _2069 * _2077;
    float _2097 = fma(_2059, _2065, _2053);
    float _2099 = fma(_2075, _2079, _2089);
    float _2101 = fma(_2067, _2079, _2093);
    float _2103 = fma(_2087, _2079, _2095);
    float _2105 = fma(_2083, _2043, _2099);
    float _2107 = fma(_2071, _2043, _2101);
    float _2109 = fma(_2097, _2043, _2103);
    float _2111 = _2105 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2113 = _2105 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2115 = fma(_2107, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2111);
    float _2117 = fma(_2107, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2113);
    float _2119 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2115);
    float _2121 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2117);
    float _2123 = _1681 + _2119;
    float _2125 = _1679 + _2121;
    float _2127 = _2105 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2129 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2131 = _2123 + _2129;
    float _2133 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2135 = _2125 + _2133;
    float _2137 = fma(_2107, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2127);
    float _2139 = _2131 * _2131;
    float _2141 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2137);
    float _2143 = fma(_2135, _2135, _2139);
    float _2145 = _1635 + _2141;
    float _2147 = sqrt(_2143);
    bool _2149 = _2147 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2151 = _2141;
    float _2153 = _2137;
    float _2155 = _2125;
    float _2157 = _2145;
    float _2159 = _1935;
    float _2161 = _1961;
    if (!_2149)
    {
        _2151 = _2123;
    }
    float _2163 = _2151;
    float _2165 = _2163;
    if (!_2149)
    {
        _2153 = _2145;
    }
    float _2167 = _2153;
    bool _2169 = !_2149;
    float _2171 = _2167;
    if (!_2169)
    {
        float _2173 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2177 = _2147 + _2175;
        float _2179 = _2145 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2181 = rsqrt(_2143);
        float _2183 = _2177 * _2173;
        float _2185 = _2183 * 0.15915493667125701904296875;
        float _2187 = _2185 * 6.283185482025146484375;
        float _2189 = cos(_2187);
        float _2191 = _2185 * 6.283185482025146484375;
        float _2193 = sin(_2191);
        float _2195 = _2189 + (-1.0);
        float _2197 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2199 = fma(_2193, _2179, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2201 = fma(_2145, _2189, _2197);
        float _2203 = _2181 * _2199;
        float _2205 = fma(_2135, _2203, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2207 = fma(_2131, _2203, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2171 = _2201;
        _2155 = _2205;
        _2165 = _2207;
    }
    float _2209 = _2171;
    float _2211 = _2155;
    float _2213 = _2165;
    float _2215 = -_1857;
    float _2217 = fma(_2215, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2209);
    float _2219 = -_1861;
    float _2221 = fma(_2219, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2211);
    float _2223 = -_1883;
    float _2225 = fma(_2223, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2213);
    float _2227 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2229 = _2217 + _2227;
    float _2231 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2233 = _2221 + _2231;
    float _2235 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2237 = _2225 + _2235;
    float _2239 = _2229 * _2229;
    float _2241 = fma(_2233, _2233, _2239);
    float _2243 = fma(_2237, _2237, _2241);
    float _2245 = rsqrt(_2243);
    float _2247 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2249 = _2233 * _2247;
    float _2251 = _2237 * _2247;
    float _2253 = _2249 * _2249;
    float _2255 = _2251 * _2251;
    float _2257 = _2253 + _2255;
    float _2259 = sqrt(_2257);
    bool _2261 = _2259 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2265 = _2259 + _2263;
    float _2267 = _2237;
    float _2269 = _2245;
    float _2271 = _2265;
    float _2273 = _2229;
    float _2275 = _2249;
    if (_2261)
    {
        float _2277 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2267 = _2277;
    }
    float _2279 = _2267;
    if (_2261)
    {
        float _2281 = rsqrt(_2257);
        _2269 = _2281;
    }
    float _2283 = _2269;
    float _2285 = _2283;
    if (_2261)
    {
        float _2287 = _2265 * _2279;
        _2271 = _2287;
    }
    float _2289 = _2271;
    if (_2261)
    {
        float _2291 = _2289 * 0.15915493667125701904296875;
        _2157 = _2291;
    }
    float _2293 = _2157;
    float _2295 = _2279;
    if (_2261)
    {
        float _2297 = _2293 * 6.283185482025146484375;
        float _2299 = sin(_2297);
        _2295 = _2299;
    }
    float _2301 = _2295;
    float _2303 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2305 = precise::max(0.0, _2303);
    float _2307 = _2131;
    float _2309 = _2305;
    if (_2261)
    {
        float _2311 = _2293 * 6.283185482025146484375;
        float _2313 = cos(_2311);
        _2307 = _2313;
    }
    float _2315 = _2307;
    float _2317 = -_2247;
    float _2319 = -_2305;
    float _2321 = fma(_2229, _2317, _2319);
    if (_2261)
    {
        float _2323 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2309 = _2323;
    }
    float _2325 = _2309;
    float _2327 = _2325;
    if (_2261)
    {
        float _2329 = fma(_2301, _2325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2273 = _2329;
    }
    float _2331 = _2273;
    float _2333 = sqrt(_2243);
    float _2335 = _2331;
    float _2337 = _2315;
    if (_2261)
    {
        float _2339 = _2315 + (-1.0);
        _2327 = _2339;
    }
    float _2341 = _2327;
    float _2343 = _2341;
    if (_2261)
    {
        float _2345 = _2283 * _2331;
        _1395 = _2345;
    }
    float _2347 = _1395;
    if (!_2261)
    {
        _2285 = _2321;
    }
    float _2349 = _2285;
    float _2351 = _2349;
    if (_2261)
    {
        float _2353 = _2341 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1789 = _2353;
    }
    float _2355 = _1789;
    if (_2261)
    {
        float _2357 = _2249 * _2347;
        _2275 = _2357;
    }
    float _2359 = _2275;
    if (!_2261)
    {
        _2343 = _2251;
    }
    float _2361 = _2343;
    float _2363 = _2361;
    if (_2261)
    {
        float _2365 = _2251 * _2347;
        _2363 = _2365;
    }
    float _2367 = _2363;
    if (!_2261)
    {
        _2335 = _2253;
    }
    float _2369 = _2335;
    float _2371 = _2369;
    if (_2261)
    {
        float _2373 = fma(_2321, _2315, _2355);
        _2351 = _2373;
    }
    float _2375 = _2351;
    if (_2261)
    {
        float _2377 = _2359 * _2359;
        _2371 = _2377;
    }
    float _2379 = _2371;
    if (!_2261)
    {
        _2337 = _2255;
    }
    float _2381 = _2337;
    float _2383 = _2381;
    if (_2261)
    {
        float _2385 = _2367 * _2367;
        _2383 = _2385;
    }
    float _2387 = _2383;
    float _2389 = fma(_2375, _2375, _2379);
    float _2391 = _2217 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2393 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2395 = _2389 + _2387;
    float _2397 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2399 = fma(_2333, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2397);
    float _2401 = precise::clamp(_2399, 0.0, 1.0);
    float _2403 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2391);
    float _2405 = _2217 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2407 = rsqrt(_2395);
    float _2409 = -_2401;
    float _2411 = _2409 + 1.0;
    float _2413 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2403);
    float _2415 = _2217 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2417 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2405);
    float _2419 = _2217 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2421 = _2413 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2423 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2415);
    float _2425 = abs(_2411);
    float _2427 = log2(_2425);
    float _2429 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2417);
    float _2431 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2419);
    float _2433 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2423);
    float _2435 = _2421 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2437 = _2429 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2439 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2431);
    float _2441 = _2433 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2443 = _2407 * _2359;
    float _2445 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2447 = _2407 * _2375;
    float _2449 = _2407 * _2367;
    float _2451 = _2443 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2453 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2445);
    float _2455 = -_2435;
    float _2457 = fma(_2455, _2393, 1.0);
    float _2459 = _2439 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2461 = -_2451;
    float _2463 = fma(_2447, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2461);
    float _2465 = _2427 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2467 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2453);
    float _2469 = log2(_2457);
    float _2471 = -_2449;
    float _2473 = fma(_2471, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2463);
    float _2475 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2477 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2467);
    float _2479 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2481 = _2447 + 1.0;
    float _2483 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2475);
    float _2485 = exp2(_2465);
    float _2487 = fma(_2473, -0.5, 0.5);
    float _2489 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2479);
    float _2491 = fma(_2473, 0.5, 0.5);
    float _2493 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2483);
    float _2495 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2489);
    float _2497 = 1.0 / _2477;
    float _2499 = fma(_2491, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2501 = fma(_2491, _2499, -0.212114393711090087890625);
    float _2503 = sqrt(_2487);
    float _2505 = -_2447;
    float _2507 = fma(_2485, _2481, _2505);
    float _2509 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2493);
    float _2511 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2495);
    float _2513 = _2469 * 0.693147182464599609375;
    float _2515 = fma(_2491, _2501, 1.570728778839111328125);
    float _2517 = fma(_2507, 0.5, 0.5);
    float _2519 = _2509 * _2497;
    float _2521 = _2511 * _2497;
    float _2523 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2525 = fma(_2519, 0.5, 0.5);
    float _2527 = fma(_2521, -0.5, 0.5);
    float _2529 = _2503 * 0.636619746685028076171875;
    float3 _6812 = float3(_2525, _2527, _2523);
    float _2531 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6812, float3(0.0), isnan(_6812)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6812, float3(0.0), isnan(_6812)), level(0.0)).x;
    float3 _6823 = float3(_2525, _2527, _2523);
    float4 _2533 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6823, float3(0.0), isnan(_6823)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6823, float3(0.0), isnan(_6823)), level(0.0)).xyzw;
    float _2535 = _2533.x;
    float _2537 = _2533.y;
    float _2539 = _2533.z;
    float _2541 = _2533.w;
    float _2543 = -_2515;
    float _2545 = fma(_2529, _2543, 1.0);
    float2 _6844 = float2(_2545, _2517);
    float3 _2549 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6844, float2(0.0), isnan(_6844)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6844, float2(0.0), isnan(_6844)), level(0.0)).xyz;
    float _2551 = _2549.x;
    float _2553 = _2549.y;
    float _2555 = _2549.z;
    float _2557 = in.m_69.x;
    float _2559 = in.m_69.y;
    float _2561 = in.m_69.z;
    float _2563 = in.m_69.w;
    bool _2565 = _2003 != 0.0;
    bool _2567 = isnan(_2003);
    bool _2569 = _2565 || _2567;
    bool _2571 = isnan(0.0);
    bool _2573 = _2569 || _2571;
    float _2575 = _2427 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_71.x = _1131;
    out.m_71.y = _1133;
    bool _2577 = _2025 == 0.0;
    bool _2579 = !_2573;
    bool _2581 = _2577 && _2579;
    out.m_73.x = _1891;
    bool _2583 = _2015 == 0.0;
    bool _2585 = _2583 && _2581;
    float _2587 = exp2(_2575);
    out.m_75.x = _2221;
    out.m_75.y = _2217;
    out.m_75.z = _2225;
    float _2589 = _1935 * _2561;
    float _2591 = _1521 * _2557;
    float _2593 = _1961 * _2559;
    float _2595 = -_2587;
    float _2597 = _2595 + 1.0;
    float _2599 = -_2589;
    float _2601 = fma(_1961, _2557, _2599);
    float _2603 = -_2591;
    float _2605 = fma(_1935, _2559, _2603);
    float _2607 = -_2593;
    float _2609 = fma(_1521, _2561, _2607);
    if (!_2585)
    {
        float _2611 = fma(_2003, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1521);
        _1669 = _2611;
    }
    float _2613 = _1669;
    float _2615 = _2601 * _2563;
    float _2617 = _2605 * _2563;
    float _2619 = _2609 * _2563;
    if (!_2585)
    {
        float _2621 = fma(_2025, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1935);
        _2159 = _2621;
    }
    float _2623 = _2159;
    float _2625 = -_2613;
    float _2627 = _2059 * _2625;
    float _2629 = -_2559;
    float _2631 = _2059 * _2629;
    float _2633 = -_2615;
    float _2635 = _2059 * _2633;
    float _2637 = _2061 * _2613;
    float _2639 = fma(_2067, _2623, _2627);
    float _2641 = fma(_2067, _2557, _2631);
    float _2643 = fma(_2067, _2619, _2635);
    float _2645 = _2061 * _2559;
    float _2647 = _2069 * _2559;
    float _2649 = _2069 * _2613;
    if (!_2585)
    {
        float _2651 = fma(_2015, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1961);
        _2161 = _2651;
    }
    float _2653 = _2161;
    float _2655 = _2061 * _2615;
    float _2657 = fma(_2075, _2623, _2637);
    float _2659 = _2069 * _2615;
    float _2661 = fma(_2075, _2557, _2645);
    float _2663 = fma(_2087, _2557, _2647);
    float _2665 = fma(_2075, _2619, _2655);
    float _2667 = fma(_2083, _2653, _2657);
    float _2669 = fma(_2087, _2619, _2659);
    float _2671 = fma(_2071, _2561, _2641);
    float _2673 = fma(_2083, _2561, _2661);
    float _2675 = fma(_2097, _2561, _2663);
    float _2677 = fma(_2071, _2653, _2639);
    float _2679 = _2667 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2681 = _2667 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2683 = _2667 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2685 = fma(_2083, _2617, _2665);
    float _2687 = fma(_2071, _2617, _2643);
    float _2689 = fma(_2097, _2617, _2669);
    float _2691 = fma(_2677, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2679);
    float _2693 = fma(_2677, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2681);
    float _2695 = fma(_2677, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2683);
    float _2697 = fma(_2087, _2623, _2649);
    float _2699 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2701 = _2685 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2703 = _2685 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2705 = _2685 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2707 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2699);
    float _2709 = fma(_2687, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2701);
    float _2711 = fma(_2687, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2703);
    float _2713 = fma(_2687, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2705);
    float _2715 = _2673 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2717 = _2673 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2719 = _2673 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2721 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2707);
    float _2723 = _2597 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2725 = fma(_2671, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2715);
    float _2727 = fma(_2671, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2717);
    float _2729 = fma(_2671, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2719);
    float _2731 = fma(_2097, _2653, _2697);
    float _2733 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2721);
    float _2735 = fma(_2675, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2725);
    float _2737 = fma(_2675, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2727);
    float _2739 = fma(_2675, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2729);
    float _2741 = fma(_2731, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2691);
    float _2743 = fma(_2731, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2693);
    float _2745 = fma(_2731, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2695);
    float _2747 = _2733 + _2477;
    float _2749 = fma(_2689, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2711);
    out.m_77.x = _2735;
    out.m_77.y = _2737;
    out.m_77.z = _2739;
    float _2751 = _2747 * 0.5;
    bool _2753 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2755 = isnan(_2333);
    bool _2757 = _2753 || _2755;
    bool _2759 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2761 = _2757 || _2759;
    out.gl_Position.x = _2509;
    out.gl_Position.y = _2511;
    out.gl_Position.z = _2733;
    out.gl_Position.w = _2477;
    float _2763 = fma(_2689, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2709);
    float _2765 = fma(_2689, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2713);
    out.m_79.z = _2751;
    out.m_79.w = _2477;
    out.m_81.x = _2741;
    out.m_81.y = _2743;
    out.m_81.z = _2745;
    out.m_83.x = _2763;
    out.m_83.y = _2749;
    out.m_83.z = _2765;
    float _2767 = _2747;
    float _2769 = _2765;
    float _2771 = _2749;
    float _2773 = _2763;
    if (!_2761)
    {
        _2767 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2775 = _2767;
    float _2777 = _2775;
    float _2779 = _2775;
    if (!_2761)
    {
        _2769 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2781 = _2769;
    float _2783 = _2781;
    float _2785 = _2781;
    if (!_2761)
    {
        _2771 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2787 = _2771;
    float _2789 = _2787;
    float _2791 = _2787;
    if (!_2761)
    {
        _2773 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2793 = _2773;
    float _2795 = _2723 * _2531;
    float _2797 = -_2723;
    float _2799 = _2797 + 1.0;
    float _2801 = _2541 * _2795;
    float _2803 = _2541 * _2799;
    float _2805 = _2555 * _2795;
    float _2807 = fma(_2551, _2801, _2535);
    float _2809 = fma(_2553, _2801, _2537);
    float _2811 = _2535;
    float _2813 = _2801;
    float _2815 = _2793;
    float _2817 = _2793;
    if (!_2761)
    {
        _2811 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2819 = _2811;
    float _2821 = fma(_2541, _2805, _2539);
    float _2823 = _2819;
    float _2825 = _2819;
    if (!_2761)
    {
        _2813 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2827 = _2813;
    out.m_85.x = _2807;
    out.m_85.y = _2809;
    out.m_85.z = _2821;
    out.m_85.w = _2803;
    bool _2829 = !_2761;
    float _2831 = _2827;
    float _2833 = _2827;
    if (!_2829)
    {
        bool _2835 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2837 = isnan(_2333);
        bool _2839 = _2835 || _2837;
        bool _2841 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2843 = _2839 || _2841;
        if (!_2843)
        {
            float _2845 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2847 = _2333 + _2845;
            float _2849 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2851 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2849;
            float _2853 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2855 = _2853 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2857 = 1.0 / _2851;
            float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2863 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2865 = _2863 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2867 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2869 = _2867 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2871 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2873 = _2871 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2875 = _2847 * _2857;
            float _2877 = precise::clamp(_2875, 0.0, 1.0);
            float _2879 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2881 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2883 = fma(_2877, _2855, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2885 = fma(_2877, _2881, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2887 = fma(_2877, _2861, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2889 = fma(_2877, _2865, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2891 = fma(_2877, _2869, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2893 = fma(_2877, _2873, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2825 = _2887;
            _2791 = _2891;
            _2779 = _2883;
            _2785 = _2889;
            _2833 = _2885;
            _2817 = _2893;
            _2895 = true;
        }
        else
        {
            bool _2897 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2899 = isnan(_2333);
            bool _2901 = _2897 || _2899;
            bool _2903 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2905 = _2901 || _2903;
            if (!_2905)
            {
                _2777 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2907 = _2777;
            _2779 = _2907;
            if (!_2905)
            {
                _2823 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2909 = _2823;
            _2825 = _2909;
            if (!_2905)
            {
                _2831 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2911 = _2831;
            _2833 = _2911;
            if (!_2905)
            {
                _2783 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2913 = _2783;
            _2785 = _2913;
            if (!_2905)
            {
                _2789 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2915 = _2789;
            _2791 = _2915;
            if (!_2905)
            {
                _2815 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2917 = _2815;
            bool _2919 = !_2905;
            _2817 = _2917;
            if (!_2919)
            {
                bool _2921 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2923 = isnan(_2333);
                bool _2925 = _2921 || _2923;
                bool _2927 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2929 = _2925 || _2927;
                if (!_2929)
                {
                    float _2931 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2933 = _2333 + _2931;
                    float _2935 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2937 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2935;
                    float _2939 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2941 = _2939 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2943 = 1.0 / _2937;
                    float _2945 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2947 = _2945 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2949 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2951 = _2949 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2961 = _2933 * _2943;
                    float _2963 = precise::clamp(_2961, 0.0, 1.0);
                    float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2967 = _2965 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2969 = fma(_2963, _2941, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2971 = fma(_2963, _2967, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2973 = fma(_2963, _2947, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2975 = fma(_2963, _2951, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2977 = fma(_2963, _2955, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2979 = fma(_2963, _2959, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2825 = _2973;
                    _2791 = _2977;
                    _2779 = _2969;
                    _2785 = _2975;
                    _2833 = _2971;
                    _2817 = _2979;
                    _2895 = true;
                }
                else
                {
                    _2825 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2791 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2779 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2785 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2833 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2817 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2895 = false;
    float _2981 = _2825;
    float _2983 = _2791;
    float _2985 = _2779;
    float _2987 = _2785;
    float _2989 = _2833;
    float _2991 = _2817;
    float _2993 = fma(_2743, -0.5, 0.5);
    float _2995 = precise::clamp(_2993, 0.0, 1.0);
    float _2997 = -_2981;
    float _2999 = _2997 + _2983;
    float _3001 = -_2985;
    float _3003 = _3001 + _2987;
    float _3005 = -_2989;
    float _3007 = _3005 + _2991;
    bool _3009 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3011 = fma(_2995, _2999, _2981);
    float _3013 = fma(_2995, _3003, _2985);
    float _3015 = fma(_2995, _3007, _2989);
    float _3017 = _3011 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _3019 = fma(_3013, 0.298911988735198974609375, _3017);
    out.m_87.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3021 = fma(_3015, 0.114477999508380889892578125, _3019);
    out.m_89.x = 0.0;
    float _3023 = -_3021;
    float _3025 = _3013 + _3023;
    float _3027 = -_3021;
    float _3029 = _3011 + _3027;
    float _3031 = -_3021;
    float _3033 = _3015 + _3031;
    float _3035 = fma(_3025, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3021);
    float _3037 = fma(_3029, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3021);
    float _3039 = fma(_3033, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3021);
    out.m_91.x = _3035;
    out.m_91.y = _3037;
    out.m_91.z = _3039;
    if (!_3009)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3041 = -_2217;
    float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3045 = -_2221;
    float _3047 = _3045 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3049 = -_2225;
    float _3051 = _3049 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3053 = _3043 * _3043;
    float _3055 = fma(_3047, _3047, _3053);
    float _3057 = fma(_3051, _3051, _3055);
    float _3059 = sqrt(_3057);
    float _3061 = rsqrt(_3057);
    float _3063 = -_3059;
    float _3065 = _3063 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3067 = _3065 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3069 = precise::clamp(_3067, 0.0, 1.0);
    float _3071 = _3047 * _3061;
    float _3073 = _3043 * _3061;
    float _3075 = abs(_3069);
    float _3077 = log2(_3075);
    float _3079 = _3051 * _3061;
    float _3081 = _3071 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3083 = _2743 * _3073;
    float _3085 = -_3073;
    float _3087 = -_3081;
    float _3089 = fma(_3085, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3087);
    float _3091 = fma(_2741, _3071, _3083);
    float _3093 = -_3079;
    float _3095 = fma(_3093, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3089);
    float _3097 = fma(_2745, _3079, _3091);
    float _3099 = precise::clamp(_3097, 0.0, 1.0);
    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3103 = _3095 + _3101;
    float _3105 = _3077 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3107 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3109 = precise::clamp(_3107, 0.0, 1.0);
    float _3111 = exp2(_3105);
    float _3113 = _3111 * _3109;
    float _3115 = _3099 * _3113;
    float _3117 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3119 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3121 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _3117;
    out.m_89.y = _3119;
    out.m_89.z = _3121;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

