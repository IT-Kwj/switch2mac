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
    float4 m_75 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_69 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_55 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
};

static inline __attribute__((always_inline))
int _96(thread const int& _9265, thread const int& _9266, constant _10& support_buffer)
{
    float _9269 = as_type<float>(support_buffer._m4);
    int _9271 = _9266 + as_type<int>(_9269);
    int _9273 = 1 + _9271;
    float _9275 = support_buffer._m5[_9273].x;
    float _9277 = abs(_9275);
    bool _9279 = _9277 == 1.0;
    if (_9279)
    {
        return _9265;
    }
    float _9281 = float(_9265);
    float _9283 = _9281 / _9277;
    int _9285 = int(_9283);
    return _9285;
}

static inline __attribute__((always_inline))
int _97(thread const int& _9315, thread const int& _9316, constant _10& support_buffer)
{
    float _9319 = as_type<float>(support_buffer._m4);
    int _9321 = _9316 + as_type<int>(_9319);
    int _9323 = 1 + _9321;
    float _9325 = support_buffer._m5[_9323].x;
    bool _9327 = _9325 == 1.0;
    if (_9327)
    {
        return _9315;
    }
    float _9329 = float(_9315);
    float _9331 = _9329 * _9325;
    int _9333 = int(_9331);
    return _9333;
}

static inline __attribute__((always_inline))
void _94(thread const int& _8960, thread const int& _8961, thread const int& _8962, thread const int& _8963, thread int& _8964, thread int& _8965, thread int& _8966, thread int& _8967, thread int& _8968, thread int& _8969, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _8972 = _8961;
    int _8974 = _8962;
    float _8976 = 0.0 + as_type<float>(_8960);
    bool _8978 = _8976 != 0.0;
    bool _8980 = isnan(_8976);
    bool _8982 = _8978 || _8980;
    bool _8984 = isnan(0.0);
    bool _8986 = _8982 || _8984;
    int _8988 = as_type<int>(_8976);
    int _8990 = _8986 ? (-1) : 0;
    if (!_8986)
    {
        float _8992 = as_type<float>(_8960) * 1.0;
        _8972 = as_type<int>(_8992);
    }
    int _8994 = _8972;
    bool _8996 = !_8986;
    int _8998 = _8994;
    int _9000 = _8994;
    if (!_8996)
    {
        bool _9002 = _8976 >= 0.0;
        bool _9004 = isnan(_8976);
        bool _9006 = _9002 || _9004;
        bool _9008 = isnan(0.0);
        bool _9010 = _9006 || _9008;
        _8990 = _9010 ? (-1) : 0;
        if (!_9010)
        {
            _8998 = 2147483647;
        }
        int _9012 = _8998;
        bool _9014 = !_9010;
        int _9016 = _9012;
        _9000 = _9012;
        if (!_9014)
        {
            float _9018 = abs(as_type<float>(_8960));
            float _9020 = 0.0 + _9018;
            bool _9022 = _9020 > as_type<float>(0x7f800000u /* inf */);
            bool _9024 = isnan(_9020);
            bool _9026 = _9022 || _9024;
            bool _9028 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _9030 = _9026 || _9028;
            _8988 = as_type<int>(_9020);
            _8990 = _9030 ? (-1) : 0;
            if (_9030)
            {
                float _9032 = as_type<float>(_8960) + 1.0;
                _9016 = as_type<int>(_9032);
            }
            int _9034 = _9016;
            int _9036 = _9034;
            _9000 = _9034;
            if (!_9030)
            {
                bool _9038 = _9020 != as_type<float>(0x7f800000u /* inf */);
                bool _9040 = isnan(_9020);
                bool _9042 = _9038 || _9040;
                bool _9044 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _9046 = _9042 || _9044;
                _8990 = _9046 ? (-1) : 0;
                if (!_9046)
                {
                    _9036 = _8960;
                }
                int _9048 = _9036;
                bool _9050 = !_9046;
                _9000 = _9048;
                if (!_9050)
                {
                    float _9052 = as_type<float>(_8960) * 18446744073709551616.0;
                    float _9054 = rsqrt(_9052);
                    float _9056 = _9052 * _9054;
                    float _9058 = _9054 * 0.5;
                    float _9060 = -_9056;
                    float _9062 = 0.0 + _9060;
                    float _9064 = fma(_9058, _9062, 0.5);
                    float _9066 = fma(_9056, _9064, _9056);
                    float _9068 = -_9066;
                    float _9070 = 0.0 + _9068;
                    float _9072 = fma(_9066, _9070, _9052);
                    float _9074 = fma(_9058, _9072, _9066);
                    float _9076 = _9074 * 2.3283064365386962890625e-10;
                    _9000 = as_type<int>(_9076);
                    _8974 = as_type<int>(_9062);
                    _8988 = as_type<int>(_9066);
                }
            }
        }
    }
    int _9078 = _9000;
    int _9080 = _8974;
    int _9082 = _8988;
    int _9084 = _8990;
    _8964 = _9078;
    _8965 = _8963;
    _8966 = 0;
    _8967 = _9080;
    _8968 = _9082;
    _8969 = _9084;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3133 = false;
    bool _2305 = false;
    bool _2115 = false;
    bool _1553 = false;
    bool _1233 = false;
    bool _1103 = false;
    bool _909 = false;
    bool _633 = false;
    bool _483 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _105 = int(_103);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3612 = as_type<float>(_121);
        out.gl_Position.z = _3612;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = 0.0;
    float _145 = _139;
    if (_135)
    {
        float _147 = float(_105);
        _115 = _147;
    }
    float _149 = _115;
    bool _151 = _139 >= _149;
    bool _153 = !_135;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_49.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _123 = as_type<int>(_161);
    }
    int _163 = _123;
    float _165 = as_type<float>(_163);
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3684 = as_type<float>(_163);
        out.gl_Position.z = _3684;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = in.m_51.x;
    float _169 = in.m_51.y;
    float _171 = in.m_51.z;
    float _173 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _175 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _177 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _179 = _175 || _177;
    bool _181 = isnan(1.0);
    bool _183 = _179 || _181;
    float _185 = _173;
    if (!_183)
    {
        float _187 = _173 * _173;
        float _189 = _187 * 0.5;
        _165 = _189;
    }
    float _191 = _165;
    float _193 = 0.0;
    float _195 = _191;
    if (!_183)
    {
        float _197 = _139 * _139;
        float _199 = _197 * 0.5;
        _193 = _199;
    }
    float _201 = _193;
    if (!_183)
    {
        float _203 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _203;
    }
    float _205 = _195;
    bool _207 = !_183;
    float _209 = _205;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _173 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _173);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _141 = _225;
        _209 = _239;
        _143 = _227;
    }
    float _241 = _141;
    float _243 = _209;
    float _245 = _143;
    bool _247 = !_183;
    float _249 = _241;
    float _251 = _245;
    if (!_247)
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
        _249 = _265;
        _251 = _259;
        _185 = _271;
    }
    float _273 = _249;
    float _275 = _251;
    float _277 = _185;
    float _279 = _275;
    float _281 = _273;
    if (!_183)
    {
        _279 = _139;
    }
    float _283 = _279;
    float _285 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _287 = _283;
    if (!_183)
    {
        float _289 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _281 = _289;
    }
    float _291 = _281;
    bool _293 = !_183;
    float _295 = _291;
    if (!_293)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = _139 * _299;
        float _305 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _307 = _305 + 1.0;
        float _309 = 1.0 / _307;
        float _311 = _301 * 0.693147182464599609375;
        float _313 = exp2(_303);
        float _315 = 1.0 / _311;
        float _317 = _313 + (-1.0);
        float _319 = -_317;
        float _321 = fma(_319, _315, _139);
        float _323 = _321 * _309;
        float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _325;
    }
    float _327 = _295;
    bool _329 = !_183;
    if (!_329)
    {
        float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = log2(_331);
        float _335 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _337 = _335 + 1.0;
        float _339 = 1.0 / _337;
        float _341 = _139 * _333;
        float _343 = exp2(_341);
        float _345 = -_343;
        float _347 = _345 + 1.0;
        float _349 = _347 * _339;
        _287 = _349;
    }
    float _351 = _287;
    float _353 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _355 = fma(_277, _169, _285);
    float _357 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _359 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _361 = fma(_351, _169, _353);
    float _363 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _365 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _367 = fma(_277, _167, _357);
    float _369 = fma(_351, _167, _359);
    float _371 = -_361;
    float _373 = _355 + _371;
    float _375 = fma(_277, _171, _363);
    float _377 = fma(_351, _171, _365);
    float _379 = -_369;
    float _381 = _367 + _379;
    float _383 = _373 * _373;
    float _385 = in.m_53.w;
    float _387 = -_377;
    float _389 = _375 + _387;
    float _391 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _393 = fma(_381, _381, _383);
    float _395 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _397 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _399 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].x, _391);
    float _401 = fma(_389, _389, _393);
    float _403 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].x, _395);
    float _405 = in.m_46.x;
    float _407 = in.m_46.y;
    float _409 = in.m_46.z;
    float _411 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].x, _397);
    float _413 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].z, _399);
    float _415 = sqrt(_401);
    float _417 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].z, _403);
    float _419 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].z, _411);
    bool _421 = _415 >= 9.9999999747524270787835121154785e-07;
    bool _423 = isnan(_415);
    bool _425 = _421 || _423;
    bool _427 = isnan(9.9999999747524270787835121154785e-07);
    bool _429 = _425 || _427;
    float _431 = fma(_367, _385, _405);
    float _433 = fma(_355, _385, _407);
    float _435 = fma(_375, _385, _409);
    float _437 = _417;
    float _439 = _413;
    float _441 = _419;
    float _443 = _435;
    if (!_429)
    {
        bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _447 = !_445;
        if (!_447)
        {
            float _449 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _451 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _453 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _453);
            float _461 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _455);
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _457);
            float _465 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _459);
            float _467 = _461 * _461;
            float _469 = fma(_463, _463, _467);
            float _471 = fma(_465, _465, _469);
            float _473 = rsqrt(_471);
            float _475 = _473 * 9.9999999747524270787835121154785e-07;
            float _477 = _463 * _475;
            float _479 = _461 * _475;
            float _481 = _465 * _475;
            _437 = _479;
            _439 = _477;
            _441 = _481;
            _483 = true;
        }
        else
        {
            float _485 = _169 * _169;
            float _487 = fma(_167, _167, _485);
            float _489 = fma(_171, _171, _487);
            float _491 = sqrt(_489);
            bool _493 = _491 >= 9.9999999747524270787835121154785e-07;
            bool _495 = isnan(_491);
            bool _497 = _493 || _495;
            bool _499 = isnan(9.9999999747524270787835121154785e-07);
            bool _501 = _497 || _499;
            if (!_501)
            {
                float _503 = _407 * _407;
                float _505 = fma(_405, _405, _503);
                float _507 = fma(_409, _409, _505);
                float _509 = sqrt(_507);
                bool _511 = _509 >= 9.9999999747524270787835121154785e-07;
                bool _513 = isnan(_509);
                bool _515 = _511 || _513;
                bool _517 = isnan(9.9999999747524270787835121154785e-07);
                bool _519 = _515 || _517;
                if (!_519)
                {
                    float _521 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _523 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _521);
                    float _525 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _523);
                    float _527 = rsqrt(_525);
                    float _529 = _527 * 9.9999999747524270787835121154785e-07;
                    float _531 = _529 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _533 = _529 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _535 = _529 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _437 = _533;
                    _439 = _531;
                    _441 = _535;
                    _483 = true;
                }
                else
                {
                    float _537 = _407 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _539 = _407 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _541 = _407 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _543 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].x, _537);
                    float _545 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].x, _539);
                    float _547 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].x, _541);
                    float _549 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].z, _543);
                    float _551 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].z, _545);
                    float _553 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].z, _547);
                    float _555 = _549 * _549;
                    float _557 = fma(_551, _551, _555);
                    float _559 = fma(_553, _553, _557);
                    float _561 = rsqrt(_559);
                    float _563 = _561 * 9.9999999747524270787835121154785e-07;
                    float _565 = _551 * _563;
                    float _567 = _549 * _563;
                    float _569 = _553 * _563;
                    _437 = _567;
                    _439 = _565;
                    _441 = _569;
                    _483 = true;
                }
            }
            else
            {
                float _571 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _573 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _575 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _577 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _571);
                float _579 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _573);
                float _581 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _575);
                float _583 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _577);
                float _585 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _579);
                float _587 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _581);
                float _589 = _583 * _583;
                float _591 = fma(_585, _585, _589);
                float _593 = fma(_587, _587, _591);
                float _595 = rsqrt(_593);
                float _597 = _595 * 9.9999999747524270787835121154785e-07;
                float _599 = _585 * _597;
                float _601 = _583 * _597;
                float _603 = _587 * _597;
                _437 = _601;
                _439 = _599;
                _441 = _603;
            }
        }
    }
    _483 = false;
    float _605 = _437;
    float _607 = _439;
    float _609 = _441;
    bool _611 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _613 = !_611;
    float _631;
    if (!_613)
    {
        float _615 = in.m_55.x;
        float _617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _619 = _615 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _621 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _623 = _621 * _617;
        float _625 = floor(_623);
        float _627 = -_625;
        float _629 = _623 + _627;
        _631 = _629;
        _633 = true;
    }
    else
    {
        float _635 = float(_105);
        float _637 = 1.0 / _635;
        float _639 = _139 * _637;
        _631 = _639;
    }
    _633 = false;
    float _641 = _631;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _645 = _641 + _643;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _649 = _641 + _647;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _653 = _641 + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _655;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _671 = 1.0 / _657;
    bool _673 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _675 = isnan(_641);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = 1.0 / _661;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _689 = _641 + _687;
    bool _691 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _693 = 1.0 / _669;
    float _695 = _649 * _671;
    float _697 = 1.0 / _665;
    float _699 = _645 * _685;
    bool _701 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _703 = isnan(_641);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _713;
    float _717 = fma(_715, _695, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _719 = _689 * _693;
    bool _721 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _723 = isnan(_641);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    bool _733 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _735 = isnan(_641);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = -_731;
    float _747 = _745 + 1.0;
    float _749 = _653 * _697;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _755;
    float _759 = _743 * _747;
    float _761 = -_743;
    float _763 = _761 + 1.0;
    float _765 = fma(_753, _695, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _767 = fma(_757, _695, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _769 = -_711;
    float _771 = _769 + 1.0;
    float _773 = _711 * _763;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _777 = _775 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _779 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _781 = isnan(_641);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = _683 * _771;
    float _793 = -_683;
    float _795 = _793 + 1.0;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _805 = fma(_777, _699, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _807 = _789 * _795;
    float _809 = -_789;
    float _811 = _809 + 1.0;
    float _813 = fma(_799, _699, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _815 = fma(_803, _699, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _817 = _717 * _807;
    float _819 = _765 * _807;
    float _821 = _767 * _807;
    float _823 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[143].x, _817);
    float _825 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[143].y, _819);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _827;
    float _831 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[143].z, _821);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _833;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _837;
    float _841 = fma(_829, _749, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _843 = fma(_813, _791, _823);
    float _845 = fma(_805, _791, _831);
    float _847 = fma(_815, _791, _825);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _857 = fma(_835, _749, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _859 = fma(_839, _749, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _865 = fma(_841, _773, _843);
    float _867 = fma(_851, _719, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _869 = fma(_855, _719, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _871 = fma(_863, _719, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _873 = fma(_857, _773, _847);
    float _875 = fma(_859, _773, _845);
    float _877 = fma(_867, _759, _865);
    float _879 = fma(_869, _759, _873);
    float _881 = fma(_871, _759, _875);
    float _883 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[147].x, _877);
    float _885 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[147].y, _879);
    float _887 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[147].z, _881);
    bool _889 = !_691;
    float _907;
    if (!_889)
    {
        float _891 = in.m_55.x;
        float _893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _895 = _891 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _897 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[11].x, _139);
        float _899 = _897 * _893;
        float _901 = floor(_899);
        float _903 = -_901;
        float _905 = _899 + _903;
        _907 = _905;
        _909 = true;
    }
    else
    {
        float _911 = float(_105);
        float _913 = 1.0 / _911;
        float _915 = _139 * _913;
        _907 = _915;
    }
    _909 = false;
    float _917 = _907;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _921 = _917 + _919;
    bool _923 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _925 = isnan(_917);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _931 = _927 || _929;
    float _933 = float(_931);
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _937 = _917 + _935;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _939;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _947 = -_933;
    float _949 = _947 + 1.0;
    float _951 = 1.0 / _941;
    bool _953 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _955 = 1.0 / _945;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _957;
    float _961 = _921 * _951;
    bool _963 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _965 = isnan(_917);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _975;
    bool _979 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _981 = isnan(_917);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _987 = _983 || _985;
    float _989 = float(_987);
    float _991 = fma(_959, _961, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _993 = fma(_977, _961, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _995 = _989 * _949;
    float _997 = -_989;
    float _999 = _997 + 1.0;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1001;
    float _1005 = _937 * _955;
    float _1007 = _973 * _999;
    float _1009 = fma(_1003, _961, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1011 = -_973;
    float _1013 = _1011 + 1.0;
    float _1015 = _991 * _1007;
    float _1017 = _1009 * _1007;
    float _1019 = _993 * _1007;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1027 = _1025 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1033 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1017);
    float _1035 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1015);
    float _1037 = fma(_1023, _1005, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1039 = fma(_1027, _1005, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1041 = fma(_1031, _1005, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1043 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1019);
    float _1045 = fma(_1037, _995, _1033);
    float _1047 = fma(_1039, _995, _1035);
    float _1049 = fma(_1041, _995, _1043);
    float _1051 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1045);
    float _1053 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1047);
    float _1055 = in.m_53.x;
    float _1057 = in.m_53.y;
    float _1059 = in.m_53.z;
    float _1061 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1049);
    float _1063 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1065 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1069 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1071 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1073 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1075 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _1071;
    out.m_57.y = _1073;
    out.m_57.z = _1075;
    out.m_57.w = _1067;
    float _1077 = _887 * _1059;
    float _1079 = _885 * _1057;
    float _1081 = _883 * _1055;
    bool _1083 = !_953;
    float _1101;
    if (!_1083)
    {
        float _1085 = in.m_55.x;
        float _1087 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1089 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1091 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _1093 = _1091 * _1087;
        float _1095 = floor(_1093);
        float _1097 = -_1095;
        float _1099 = _1093 + _1097;
        _1101 = _1099;
        _1103 = true;
    }
    else
    {
        float _1105 = float(_105);
        float _1107 = 1.0 / _1105;
        float _1109 = _139 * _1107;
        _1101 = _1109;
    }
    _1103 = false;
    float _1111 = _1101;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1115 = _1111 + _1113;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1121 = _1111 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1123 = isnan(_1111);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1129 = _1125 || _1127;
    float _1131 = float(_1129);
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1135 = _1133 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1137 = _1111 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1139 = isnan(_1111);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1145 = _1141 || _1143;
    float _1147 = float(_1145);
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1149;
    bool _1153 = _1111 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1155 = isnan(_1111);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1161 = _1157 || _1159;
    float _1163 = float(_1161);
    float _1165 = 1.0 / _1119;
    float _1167 = -_1131;
    float _1169 = _1167 + 1.0;
    bool _1171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1173 = 1.0 / _1135;
    float _1175 = _1151 * _1165;
    float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1179 = _1177 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1181 = -_1163;
    float _1183 = _1181 + 1.0;
    float _1185 = fma(_1175, _1115, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1187 = _1147 * _1169;
    float _1189 = -_1147;
    float _1191 = _1189 + 1.0;
    float _1193 = _1131 * _1183;
    float _1195 = _1179 * _1173;
    float _1197 = _1185 * _1187;
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1201 = _1111 + _1199;
    float _1203 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1197);
    float _1205 = fma(_1195, _1201, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1207 = fma(_1205, _1193, _1203);
    float _1209 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1207);
    float _1211 = _1209 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.w = _1211;
    bool _1213 = !_1171;
    float _1231;
    if (!_1213)
    {
        float _1215 = in.m_55.x;
        float _1217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1219 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1221 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[14].x, _139);
        float _1223 = _1221 * _1217;
        float _1225 = floor(_1223);
        float _1227 = -_1225;
        float _1229 = _1223 + _1227;
        _1231 = _1229;
        _1233 = true;
    }
    else
    {
        float _1235 = float(_105);
        float _1237 = 1.0 / _1235;
        float _1239 = _139 * _1237;
        _1231 = _1239;
    }
    _1233 = false;
    float _1241 = _1231;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1245 = _1241 + _1243;
    bool _1247 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1249 = isnan(_1241);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1255 = _1251 || _1253;
    float _1257 = float(_1255);
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1261 = _1259 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1263 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1265 = isnan(_1241);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1271 = _1267 || _1269;
    float _1273 = float(_1271);
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1275;
    bool _1279 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1281 = isnan(_1241);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1287 = _1283 || _1285;
    float _1289 = float(_1287);
    float _1291 = -_1257;
    float _1293 = _1291 + 1.0;
    float _1295 = 1.0 / _1261;
    bool _1297 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1299 = isnan(_1241);
    bool _1301 = _1297 || _1299;
    bool _1303 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1305 = _1301 || _1303;
    float _1307 = float(_1305);
    float _1309 = -_1289;
    float _1311 = _1309 + 1.0;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1315 = _1313 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1319 = 1.0 / _1315;
    float _1321 = _1277 * _1295;
    float _1323 = -_1273;
    float _1325 = _1323 + 1.0;
    float _1327 = _1273 * _1293;
    bool _1329 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1331 = isnan(_1241);
    bool _1333 = _1329 || _1331;
    bool _1335 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1337 = _1333 || _1335;
    float _1339 = float(_1337);
    float _1341 = fma(_1321, _1245, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1343 = _1289 * _1325;
    float _1345 = _1307 * _1311;
    float _1347 = -_1307;
    float _1349 = _1347 + 1.0;
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1353 = _1351 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1355 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1357 = isnan(_1241);
    bool _1359 = _1355 || _1357;
    bool _1361 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1363 = _1359 || _1361;
    float _1365 = float(_1363);
    float _1367 = _1339 * _1349;
    float _1369 = -_1339;
    float _1371 = _1369 + 1.0;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1375 = _1373 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1377 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1379 = isnan(_1241);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1385 = _1381 || _1383;
    float _1387 = float(_1385);
    float _1389 = 1.0 / _1353;
    float _1391 = _1365 * _1371;
    float _1393 = -_1365;
    float _1395 = _1393 + 1.0;
    float _1397 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1399 = _1397 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1401 = _1387 * _1395;
    float _1403 = 1.0 / _1375;
    float _1405 = _1399 * _1319;
    float _1407 = -_1387;
    float _1409 = _1407 + 1.0;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1413 = _1411 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1415;
    float _1419 = 1.0 / _1413;
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1423 = _1421 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1425 = _1341 * _1401;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1429 = _1241 + _1427;
    float _1431 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1425);
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1435 = _1433 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1437 = 1.0 / _1423;
    float _1439 = _1417 * _1403;
    float _1441 = fma(_1405, _1429, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1445 = _1241 + _1443;
    float _1447 = fma(_1441, _1391, _1431);
    float _1449 = fma(_1439, _1445, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1451 = 1.0 / _1435;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1455 = _1453 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1457 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1457;
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1463 = _1241 + _1461;
    float _1465 = _1455 * _1389;
    float _1467 = fma(_1449, _1367, _1447);
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1473 = _1459 * _1437;
    float _1475 = fma(_1465, _1463, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1479 = _1241 + _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1481;
    bool _1485 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1487 = isnan(_1241);
    bool _1489 = _1485 || _1487;
    bool _1491 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1493 = _1489 || _1491;
    float _1495 = float(_1493);
    float _1497 = _1471 * _1419;
    float _1499 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1501 = _1241 + _1499;
    float _1503 = fma(_1473, _1479, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1505 = fma(_1475, _1345, _1467);
    float _1507 = _1483 * _1451;
    float _1509 = fma(_1497, _1501, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1511 = -_1495;
    float _1513 = _1511 + 1.0;
    float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1517 = _1241 + _1515;
    float _1519 = fma(_1503, _1343, _1505);
    float _1521 = _1257 * _1513;
    float _1523 = fma(_1507, _1517, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1525 = fma(_1509, _1327, _1519);
    float _1527 = fma(_1523, _1521, _1525);
    float _1529 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1527);
    float _1531 = precise::clamp(_1529, 0.0, 1.0);
    bool _1533 = !_1317;
    float _1551;
    if (!_1533)
    {
        float _1535 = in.m_55.x;
        float _1537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1539 = _1535 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1541 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[14].z, _139);
        float _1543 = _1541 * _1537;
        float _1545 = floor(_1543);
        float _1547 = -_1545;
        float _1549 = _1543 + _1547;
        _1551 = _1549;
        _1553 = true;
    }
    else
    {
        float _1555 = float(_105);
        float _1557 = 1.0 / _1555;
        float _1559 = _139 * _1557;
        _1551 = _1559;
    }
    _1553 = false;
    float _1561 = _1551;
    int _1563 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1565 = _1563;
    int _1567 = 0;
    int _1569 = _96(_1565, _1567, (*spvDescriptorSet0.support_buffer));
    float _1571 = in.m_61.z;
    float _1573 = trunc(_1571);
    int _1575 = int(_1573);
    int _1577 = _1569 + (-1);
    float _1579 = float(_1577);
    float _1581 = _1531 * _1579;
    float _1583 = trunc(_1581);
    int _1585 = int(_1583);
    int _1587 = _1585;
    int _1589 = 0;
    int _1591 = _97(_1587, _1589, (*spvDescriptorSet0.support_buffer));
    int _1593 = _1575;
    int _1595 = 0;
    int _1597 = _97(_1593, _1595, (*spvDescriptorSet0.support_buffer));
    float4 _1600 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1591, _1597)), 0).xyzw;
    float _1602 = _1600.x;
    float _1604 = _1600.y;
    float _1606 = _1600.z;
    float _1608 = _1600.w;
    float _1610 = in.m_55.w;
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1614 = _1612 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1618 = _1616 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1622 = _1620 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1624 = 1.0 / _1614;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1628 = _1626 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1632 = _1630 != 0;
    float _1634 = 1.0 / _1618;
    bool _1636 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1638 = isnan(_1561);
    bool _1640 = _1636 || _1638;
    bool _1642 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1644 = _1640 || _1642;
    float _1646 = float(_1644);
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1650 = _1648 != 0;
    int _1652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1654 = _1652 != 0;
    float _1656 = -_1646;
    float _1658 = _1656 + 1.0;
    int _1660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1662 = _1660 != 0;
    float _1664 = 1.0 / _1622;
    bool _1666 = _1610 > 0.5;
    bool _1668 = _1666 && _1632;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1670;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    bool _1678 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1680 = isnan(_1561);
    bool _1682 = _1678 || _1680;
    bool _1684 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1686 = _1682 || _1684;
    float _1688 = float(_1686);
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1690;
    float _1694 = _1672 * _1624;
    float _1696 = 1.0 / _1628;
    bool _1698 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1700 = isnan(_1561);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1706 = _1702 || _1704;
    float _1708 = float(_1706);
    float _1710 = _1676 * _1634;
    float _1712 = _1688 * _1658;
    float _1714 = -_1688;
    float _1716 = _1714 + 1.0;
    bool _1718 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1720 = isnan(_1561);
    bool _1722 = _1718 || _1720;
    bool _1724 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1726 = _1722 || _1724;
    float _1728 = float(_1726);
    float _1730 = -_1708;
    float _1732 = _1730 + 1.0;
    bool _1734 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1736 = isnan(_1561);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1742 = _1738 || _1740;
    float _1744 = float(_1742);
    float _1746 = _1692 * _1664;
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1750 = _1748 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1752 = _1708 * _1716;
    float _1754 = _1728 * _1732;
    float _1756 = -_1728;
    float _1758 = _1756 + 1.0;
    float _1760 = -_1744;
    float _1762 = _1760 + 1.0;
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1766 = _1764 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1768 = _1750 * _1696;
    bool _1770 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1772 = isnan(_1561);
    bool _1774 = _1770 || _1772;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1778 = _1774 || _1776;
    float _1780 = float(_1778);
    float _1782 = _1744 * _1758;
    float _1784 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1786 = _1561 + _1784;
    bool _1788 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1790 = isnan(_1561);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1796 = _1792 || _1794;
    float _1798 = float(_1796);
    float _1800 = _1780 * _1762;
    float _1802 = -_1780;
    float _1804 = _1802 + 1.0;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1808 = _1806 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1810 = fma(_1694, _1786, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1812 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1814 = _1561 + _1812;
    float _1816 = _1798 * _1804;
    float _1818 = 1.0 / _1808;
    float _1820 = fma(_1710, _1814, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1822 = _1810 * _1816;
    float _1824 = -_1798;
    float _1826 = _1824 + 1.0;
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1830 = _1828 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1832 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1834 = _1832 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1836 = in.m_61.x;
    float _1838 = 1.0 / _1766;
    float _1840 = fma(_1826, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1822);
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1844 = _1561 + _1842;
    float _1846 = in.m_61.y;
    float _1848 = fma(_1746, _1844, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1850 = fma(_1820, _1800, _1840);
    float _1852 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1854 = _1561 + _1852;
    float _1856 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1856;
    float _1860 = 1.0 / _1830;
    float _1862 = _1834 * _1818;
    float _1864 = fma(_1768, _1854, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1866 = _1818;
    float _1868 = _1646;
    float _1870 = _1712;
    int _1872 = as_type<int>(_1561);
    int _1874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[182].x);
    if (_1650)
    {
        float _1876 = in.m_55.x;
        _1866 = _1876;
    }
    float _1878 = _1866;
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1880;
    float _1884 = fma(_1848, _1782, _1850);
    float _1886 = _1858 * _1838;
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1890 = _1561 + _1888;
    float _1892 = _1840;
    if (_1654)
    {
        float _1894 = in.m_55.z;
        _1892 = _1894;
    }
    float _1896 = _1892;
    bool _1898 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1900 = isnan(_1561);
    bool _1902 = _1898 || _1900;
    bool _1904 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1906 = _1902 || _1904;
    float _1908 = float(_1906);
    float _1910 = fma(_1864, _1754, _1884);
    float _1912 = fma(_1886, _1890, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1914 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1916 = _1561 + _1914;
    float _1918 = in.m_55.y;
    float _1920 = -_1908;
    float _1922 = _1920 + 1.0;
    float _1924 = fma(_1912, _1752, _1910);
    float _1926 = _1882 * _1860;
    float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1930 = _1561 + _1928;
    float _1932 = _1646 * _1922;
    int _1934 = as_type<int>(_1924);
    if (!_1650)
    {
        _1868 = _1836;
    }
    float _1936 = _1868;
    float _1938 = -_1846;
    float _1940 = _1938 + 1.0;
    float _1942 = fma(_1862, _1930, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1944 = fma(_1926, _1916, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1948 = fma(_1942, _1712, _1924);
    float _1950 = _1936;
    if (!_1650)
    {
        _1870 = _1936;
    }
    float _1952 = _1870;
    float _1954 = _1952;
    if (_1650)
    {
        _1950 = _1836;
    }
    float _1956 = _1950;
    float _1958 = fma(_1944, _1932, _1948);
    float _1960 = _1668 ? _1940 : _1846;
    bool _1962 = false;
    float _1964 = _1956;
    if (_1650)
    {
        bool _1966 = _1878 > 0.5;
        _1962 = _1966;
    }
    bool _1968 = _1962;
    if (_1650)
    {
        float _1970 = -_1956;
        float _1972 = _1970 + 1.0;
        _1872 = as_type<int>(_1972);
    }
    int _1974 = _1872;
    if (_1654)
    {
        float _1976 = -_1956;
        float _1978 = _1976 + 1.0;
        _1934 = as_type<int>(_1978);
    }
    int _1980 = _1934;
    bool _1982 = false;
    if (_1654)
    {
        bool _1984 = _1896 > 0.5;
        _1982 = _1984;
    }
    bool _1986 = _1982;
    float _1988 = fma(_1908, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1958);
    bool _1990 = _1918 > 0.5;
    bool _1992 = _1990 && _1662;
    float _1994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1650)
    {
        float _1996 = _1968 ? as_type<float>(_1974) : _1956;
        _1954 = _1996;
    }
    float _1998 = _1954;
    float _2000 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2002 = _1585 + 1;
    out.m_63.x = _1988;
    if (_1654)
    {
        float _2004 = _1986 ? as_type<float>(_1980) : _1956;
        _1964 = _2004;
    }
    float _2006 = _1964;
    int _2008 = min(_1577, _2002);
    float _2010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2012 = _1992 ? _1940 : _1846;
    float _2014 = _2012 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2016 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2018 = _2014 * _2010;
    float _2020 = _2006 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2022 = _2020 * _1994;
    float _2024 = _2000 * _2016;
    uint _2027 = as_type<uint>(half2(float2(_1608, 0.0)));
    uint _2029 = extract_bits(_2027, 0u, 8u);
    int _2031 = int(_2029) & 255;
    uint _2033 = extract_bits(_2027, 8u, 8u);
    int _2035 = int(_2033) & 255;
    int _2037 = _2035 << 8;
    int _2039 = _2031 | _2037;
    bool _2041 = _2039 >= 32768;
    int _2043 = _2039 + (-1024);
    int _2045 = _2043;
    if (_2041)
    {
        int _2047 = ~_2039;
        int _2049 = _2047 + 33792;
        int _2051 = _2049 + 1;
        _2045 = _2051;
    }
    int _2053 = _2045;
    int _2055 = _2053 + 30719;
    float _2057 = float(_2055);
    float _2059 = fma(_2057, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2061 = abs(_2059);
    float _2063 = -_2061;
    float _2065 = _2063 + 1.0;
    float _2067 = abs(_2059);
    float _2069 = fma(_2067, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2071 = as_type<int>(_2065) + (-218103808);
    float _2073 = abs(_2059);
    float _2075 = fma(_2073, _2069, -0.212114393711090087890625);
    bool _2077 = uint(_2071) >= 1920991232u;
    float _2079 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2081 = _2059 < 0.0;
    float _2083 = float(_2081);
    float _2085 = abs(_2059);
    float _2087 = fma(_2085, _2075, 1.570728778839111328125);
    float _2089 = _2079 * _1946;
    bool _2091 = !_2077;
    float _2113;
    if (!_2091)
    {
        int _2093 = as_type<int>(_2065);
        int _2095 = as_type<int>(_1932);
        int _2097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[182].x);
        int _2099 = 10608;
        int _2101;
        int _2103;
        int _2105;
        int _2107;
        int _2109;
        int _2111;
        _94(_2093, _2095, _2097, _2099, _2101, _2103, _2105, _2107, _2109, _2111, out.gl_Position, out.gl_PointSize);
        _2113 = as_type<float>(_2101);
        _1874 = _2107;
        _2115 = true;
    }
    else
    {
        float _2117 = rsqrt(_2065);
        float _2119 = _2065 * _2117;
        float _2121 = _2117 * 0.5;
        float _2123 = -_2119;
        float _2125 = 0.0 + _2123;
        float _2127 = fma(_2121, _2125, 0.5);
        float _2129 = fma(_2119, _2127, _2119);
        float _2131 = -_2129;
        float _2133 = 0.0 + _2131;
        float _2135 = fma(_2129, _2133, _2065);
        float _2137 = fma(_2121, _2135, _2129);
        _2113 = _2137;
    }
    _2115 = false;
    float _2139 = _2113;
    int _2141 = _1874;
    int _2143 = _2008;
    int _2145 = 0;
    int _2147 = _97(_2143, _2145, (*spvDescriptorSet0.support_buffer));
    int _2149 = _1575;
    int _2151 = 0;
    int _2153 = _97(_2149, _2151, (*spvDescriptorSet0.support_buffer));
    float4 _2155 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2147, _2153)), 0).xyzw;
    float _2157 = _2155.x;
    float _2159 = _2155.y;
    float _2161 = _2155.z;
    float _2163 = _2155.w;
    float _2165 = _2087 * _2139;
    float _2167 = _2083 * 2.0;
    float _2169 = _2057 * 3.883221149444580078125;
    float _2171 = floor(_1581);
    float _2173 = -_2167;
    float _2175 = fma(_2165, _2173, _2165);
    float _2177 = _2169 * 0.15915493667125701904296875;
    float _2179 = fma(_2083, 3.1415927410125732421875, _2175);
    float _2181 = _2177 * 6.283185482025146484375;
    float _2183 = cos(_2181);
    float _2185 = _2179 * 0.15915493667125701904296875;
    float _2187 = _2185 * 6.283185482025146484375;
    float _2189 = sin(_2187);
    float _2191 = -_2171;
    float _2193 = _1581 + _2191;
    float _2195 = _2177 * 6.283185482025146484375;
    float _2197 = sin(_2195);
    float _2199 = _2189 * _2183;
    float _2201 = _2189 * _2197;
    uint _2203 = as_type<uint>(half2(float2(_2163, 0.0)));
    float _2205 = -_1602;
    float _2207 = _2205 + _2157;
    float _2209 = -_1606;
    float _2211 = _2209 + _2161;
    uint _2213 = extract_bits(_2203, 0u, 8u);
    int _2215 = int(_2213) & 255;
    uint _2217 = extract_bits(_2203, 8u, 8u);
    int _2219 = int(_2217) & 255;
    int _2221 = _2219 << 8;
    int _2223 = _2215 | _2221;
    float _2225 = fma(_2193, _2207, _1602);
    float _2227 = fma(_2193, _2211, _1606);
    bool _2229 = _2223 >= 32768;
    int _2231 = _2223 + (-1024);
    int _2233 = _2231;
    if (_2229)
    {
        int _2235 = ~_2223;
        int _2237 = _2235 + 33792;
        int _2239 = _2237 + 1;
        _2233 = _2239;
    }
    int _2241 = _2233;
    int _2243 = _2241 + 30719;
    float _2245 = float(_2243);
    float _2247 = fma(_2245, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2249 = abs(_2247);
    float _2251 = -_2249;
    float _2253 = _2251 + 1.0;
    bool _2255 = _2247 < 0.0;
    float _2257 = float(_2255);
    float _2259 = abs(_2247);
    float _2261 = fma(_2259, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _2263 = -_1604;
    float _2265 = _2263 + _2159;
    int _2267 = as_type<int>(_2253) + (-218103808);
    float _2269 = abs(_2247);
    float _2271 = fma(_2269, _2261, -0.212114393711090087890625);
    float _2273 = fma(_2193, _2265, _1604);
    bool _2275 = uint(_2267) >= 1920991232u;
    float _2277 = abs(_2247);
    float _2279 = fma(_2277, _2271, 1.570728778839111328125);
    bool _2281 = !_2275;
    float _2303;
    if (!_2281)
    {
        int _2283 = as_type<int>(_2253);
        int _2285 = as_type<int>(_2261);
        int _2287 = _2141;
        int _2289 = 11504;
        int _2291;
        int _2293;
        int _2295;
        int _2297;
        int _2299;
        int _2301;
        _94(_2283, _2285, _2287, _2289, _2291, _2293, _2295, _2297, _2299, _2301, out.gl_Position, out.gl_PointSize);
        _2303 = as_type<float>(_2291);
        _2305 = true;
    }
    else
    {
        float _2307 = rsqrt(_2253);
        float _2309 = _2253 * _2307;
        float _2311 = _2307 * 0.5;
        float _2313 = -_2309;
        float _2315 = 0.0 + _2313;
        float _2317 = fma(_2311, _2315, 0.5);
        float _2319 = fma(_2309, _2317, _2309);
        float _2321 = -_2319;
        float _2323 = 0.0 + _2321;
        float _2325 = fma(_2319, _2323, _2253);
        float _2327 = fma(_2311, _2325, _2319);
        _2303 = _2327;
    }
    _2305 = false;
    float _2329 = _2303;
    float _2331 = in.m_55.x;
    float _2333 = in.m_55.y;
    float _2335 = in.m_55.z;
    float _2337 = _605 * _605;
    float _2339 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2341 = log2(_2339);
    float _2343 = _2279 * _2329;
    float _2345 = fma(_607, _607, _2337);
    float _2347 = _1077 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _2349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2351 = _2349 != 0;
    int _2353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2355 = _2353 != 0;
    int _2357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2359 = _2357 != 0;
    float _2361 = fma(_609, _609, _2345);
    float _2363 = _2245 * 3.883221149444580078125;
    float _2365 = _433 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2367 = -_2059;
    float _2369 = _2367 + _2247;
    float _2371 = rsqrt(_2361);
    float _2373 = _2363 * 0.15915493667125701904296875;
    float _2375 = _433 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2377 = _2335 * 2.0;
    float _2379 = _2331 * 2.0;
    float _2381 = _2333 * 2.0;
    float _2383 = floor(_2379);
    float _2385 = floor(_2377);
    float _2387 = _2331 + _2335;
    float _2389 = _2387 + (-1.0);
    float _2391 = floor(_2381);
    bool _2393 = _2383 >= 0.0;
    bool _2395 = isnan(_2383);
    bool _2397 = _2393 || _2395;
    bool _2399 = isnan(0.0);
    bool _2401 = _2397 || _2399;
    bool _2403 = _2385 > 0.0;
    float _2405 = _2341 * _139;
    bool _2407 = _2385 >= 0.0;
    bool _2409 = isnan(_2385);
    bool _2411 = _2407 || _2409;
    bool _2413 = isnan(0.0);
    bool _2415 = _2411 || _2413;
    float _2417 = _2333 + _2331;
    float _2419 = fma(_2389, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2421 = _2371 * _605;
    int _2423 = _2415 ? 0 : 1;
    float _2425 = _2417 + (-1.0);
    bool _2427 = _2383 > 0.0;
    int _2429 = ~_2423;
    int _2431 = _2429 + 1;
    int _2433 = _2431 + 1;
    float _2435 = fma(_2425, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2437 = exp2(_2405);
    int _2439 = _2433;
    if (!_2403)
    {
        int _2441 = ~_2423;
        int _2443 = _2441 + 1;
        _2439 = _2443;
    }
    int _2445 = _2439;
    bool _2447 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2449 = isnan(1.0);
    bool _2451 = _2447 || _2449;
    bool _2453 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2455 = _2451 || _2453;
    float _2457 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2459 = 1.0 + _2457;
    float _2461 = _2371 * _607;
    bool _2463 = !_2351;
    int _2465 = _2463 ? 0 : 1;
    float _2467 = 1.0 / _2459;
    float _2469 = _2371 * _609;
    int _2471 = abs(_2465);
    float _2473 = in.m_65.x;
    float _2475 = in.m_65.y;
    float _2477 = in.m_65.z;
    bool _2479 = _2391 > 0.0;
    float _2481 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2483 = _2461 * _2481;
    float _2485 = float(_2471);
    float _2487 = float(_2445);
    float _2489 = -_2437;
    float _2491 = _2489 + 1.0;
    bool _2493 = _2391 >= 0.0;
    bool _2495 = isnan(_2391);
    bool _2497 = _2493 || _2495;
    bool _2499 = isnan(0.0);
    bool _2501 = _2497 || _2499;
    int _2503 = _2401 ? 0 : 1;
    float _2505 = _2485 * _2487;
    bool _2507 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2509 = isnan(0.0);
    bool _2511 = _2507 || _2509;
    bool _2513 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2515 = _2511 || _2513;
    float _2517 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2519 = _2421 * _2517;
    int _2521 = _2501 ? 0 : 1;
    float _2523 = _2505 * (-2.0);
    bool _2525 = !_2359;
    int _2527 = _2525 ? 0 : 1;
    float _2529 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2531 = -_2519;
    float _2533 = fma(_2469, _2529, _2531);
    float _2535 = _2515 ? _2491 : 0.0;
    int _2537 = ~_2503;
    int _2539 = _2537 + 1;
    int _2541 = _2539 + 1;
    int _2543 = ~_2521;
    int _2545 = _2543 + 1;
    int _2547 = _2545 + 1;
    int _2549 = _2541;
    int _2551 = _2547;
    if (_2455)
    {
        float _2553 = _2535 * _2467;
        _145 = _2553;
    }
    float _2555 = _145;
    if (!_2427)
    {
        int _2557 = ~_2503;
        int _2559 = _2557 + 1;
        _2549 = _2559;
    }
    int _2561 = _2549;
    float _2563 = _2331 + (-0.5);
    if (!_2479)
    {
        int _2565 = ~_2521;
        int _2567 = _2565 + 1;
        _2551 = _2567;
    }
    int _2569 = _2551;
    float _2571 = fma(_2523, _2473, _2473);
    int _2573 = abs(_2527);
    float _2575 = fma(_2435, _2523, _2435);
    float _2577 = float(_2569);
    float _2579 = fma(_2563, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2571);
    float _2581 = float(_2573);
    float _2583 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2585 = _2469 * _2583;
    bool _2587 = !_2355;
    int _2589 = _2587 ? 0 : 1;
    float _2591 = fma(_2575, _2555, _2579);
    float _2593 = _2335 + (-0.5);
    float _2595 = _2581 * _2577;
    int _2597 = abs(_2589);
    float _2599 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2601 = -_2585;
    float _2603 = fma(_2461, _2599, _2601);
    float _2605 = float(_2561);
    float _2607 = _2595 * (-2.0);
    float _2609 = _2591 * 0.15915493667125701904296875;
    float _2611 = float(_2597);
    float _2613 = _2603 * _2603;
    float _2615 = fma(_2607, _2477, _2477);
    float _2617 = fma(_2419, _2607, _2419);
    float _2619 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2621 = -_2483;
    float _2623 = fma(_2421, _2619, _2621);
    float _2625 = _2611 * _2605;
    float _2627 = fma(_2593, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2615);
    float _2629 = _2333 + _2335;
    float _2631 = _2625 * (-2.0);
    float _2633 = _2333 + (-0.5);
    float _2635 = _2629 + (-1.0);
    float _2637 = fma(_2533, _2533, _2613);
    float _2639 = fma(_2631, _2475, _2475);
    float _2641 = fma(_2617, _2555, _2627);
    float _2643 = fma(_2635, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2645 = fma(_2623, _2623, _2637);
    float _2647 = fma(_2633, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2639);
    float _2649 = _2641 * 0.15915493667125701904296875;
    float _2651 = fma(_2643, _2631, _2643);
    float _2653 = _2609 * 6.283185482025146484375;
    float _2655 = sin(_2653);
    float _2657 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2273);
    bool _2659 = _2273 != 0.0;
    bool _2661 = isnan(_2273);
    bool _2663 = _2659 || _2661;
    bool _2665 = isnan(0.0);
    bool _2667 = _2663 || _2665;
    float _2669 = fma(_2651, _2555, _2647);
    float _2671 = _1079 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2673 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2227);
    float _2675 = _2257 * 2.0;
    float _2677 = _2669 * 0.15915493667125701904296875;
    float _2679 = rsqrt(_2645);
    float _2681 = _1081 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2683 = _2347 * _2673;
    float _2685 = -_2675;
    float _2687 = fma(_2343, _2685, _2343);
    float _2689 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2225);
    float _2691 = _2671 * _2657;
    bool _2693 = _2225 == 0.0;
    bool _2695 = !_2667;
    bool _2697 = _2693 && _2695;
    float _2699 = fma(_2257, 3.1415927410125732421875, _2687);
    float _2701 = _2609 * 6.283185482025146484375;
    float _2703 = cos(_2701);
    float _2705 = _2681 * _2689;
    bool _2707 = _2227 == 0.0;
    bool _2709 = _2707 && _2697;
    float _2711 = _2649 * 6.283185482025146484375;
    float _2713 = sin(_2711);
    float _2715 = _2603 * _2679;
    float _2717 = _2623 * _2679;
    float _2719 = _2533 * _2679;
    float _2721 = _433 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2723 = _2649 * 6.283185482025146484375;
    float _2725 = cos(_2723);
    float _2727 = _2677 * 6.283185482025146484375;
    float _2729 = sin(_2727);
    float _2731 = _2703 * _2713;
    float _2733 = _2655 * _2713;
    float _2735 = _2677 * 6.283185482025146484375;
    float _2737 = cos(_2735);
    float _2739 = _2703 * _2725;
    float _2741 = _2655 * _2725;
    float _2743 = -_2731;
    float _2745 = fma(_2729, _2741, _2743);
    float _2747 = fma(_2729, _2733, _2739);
    float _2749 = -_2741;
    float _2751 = fma(_2729, _2731, _2749);
    float _2753 = fma(_2729, _2739, _2733);
    float _2755 = _2421 * _2717;
    float _2757 = _2747 * _2461;
    float _2759 = _2751 * _2461;
    float _2761 = _2747 * _2469;
    float _2763 = _2737 * _2713;
    float _2765 = _2703 * _2737;
    float _2767 = _2737 * _2725;
    float _2769 = _2655 * _2737;
    float _2771 = _2763 * _2461;
    float _2773 = -_2755;
    float _2775 = fma(_2469, _2715, _2773);
    float _2777 = fma(_2745, _2719, _2757);
    float _2779 = fma(_2753, _2719, _2759);
    float _2781 = fma(_2767, _2719, _2771);
    float _2783 = _2751 * _2469;
    float _2785 = fma(_2769, _2775, _2777);
    float _2787 = fma(_2765, _2775, _2779);
    float _2789 = -_2729;
    float _2791 = fma(_2789, _2775, _2781);
    float _2793 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2365);
    float _2795 = _2461 * _2715;
    float _2797 = _2763 * _2469;
    float _2799 = fma(_2753, _2717, _2783);
    float _2801 = _2699 * 0.15915493667125701904296875;
    float _2803 = -_2795;
    float _2805 = fma(_2421, _2719, _2803);
    float _2807 = fma(_2745, _2717, _2761);
    float _2809 = fma(_2767, _2717, _2797);
    float _2811 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2721);
    float _2813 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2793);
    float _2815 = fma(_2769, _2805, _2807);
    float _2817 = fma(_2765, _2805, _2799);
    float _2819 = -_2729;
    float _2821 = fma(_2819, _2805, _2809);
    float _2823 = _2691 * _2785;
    float _2825 = _2691 * _2815;
    float _2827 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2811);
    float _2829 = _2373 * 6.283185482025146484375;
    float _2831 = sin(_2829);
    float _2833 = fma(_2705, _2791, _2823);
    float _2835 = fma(_2705, _2821, _2825);
    float _2837 = _2813 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2839 = _2827 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2841 = fma(_2683, _2787, _2833);
    float _2843 = fma(_2683, _2817, _2835);
    float _2845 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2375);
    float _2847 = _2801 * 6.283185482025146484375;
    float _2849 = sin(_2847);
    float _2851 = _2837 + _2841;
    float _2853 = _2839 + _2843;
    float _2855 = _2469 * _2719;
    float _2857 = _2747 * _2421;
    float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2861 = _2851 + _2859;
    float _2863 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2865 = _2853 + _2863;
    float _2867 = _2763 * _2421;
    float _2869 = -_2855;
    float _2871 = fma(_2461, _2717, _2869);
    float _2873 = _2861 * _2861;
    float _2875 = _2865 * _2865;
    float _2877 = fma(_2745, _2715, _2857);
    float _2879 = fma(_2767, _2715, _2867);
    float _2881 = _2751 * _2421;
    float _2883 = _2873 + _2875;
    float _2885 = fma(_2769, _2871, _2877);
    float _2887 = -_2201;
    float _2889 = fma(_2849, _2831, _2887);
    float _2891 = fma(_2193, _2369, _2059);
    float _2893 = _2373 * 6.283185482025146484375;
    float _2895 = cos(_2893);
    float _2897 = fma(_2753, _2715, _2881);
    float _2899 = fma(_2193, _2889, _2201);
    float _2901 = fma(_2273, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2891);
    float _2903 = -_2729;
    float _2905 = fma(_2903, _2871, _2879);
    float _2907 = _2691 * _2885;
    float _2909 = fma(_2227, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2899);
    float _2911 = fma(_2765, _2871, _2897);
    float _2913 = sqrt(_2883);
    float _2915 = _2709 ? _2891 : _2901;
    float _2917 = fma(_2705, _2905, _2907);
    float _2919 = _2709 ? _2899 : _2909;
    float _2921 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2845);
    float _2923 = _2915 * _2915;
    float _2925 = fma(_2683, _2911, _2917);
    float _2927 = _2921 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2929 = -_2199;
    float _2931 = fma(_2849, _2895, _2929);
    float _2933 = fma(_2919, _2919, _2923);
    float _2935 = _2927 + _2925;
    float _2937 = fma(_2193, _2931, _2199);
    float _2939 = rsqrt(_2933);
    bool _2941 = _2913 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2943 = _2873;
    float _2945 = _2875;
    float _2947 = _2883;
    float _2949 = _2851;
    float _2951 = _2853;
    float _2953 = _2891;
    float _2955 = _2937;
    if (!_2941)
    {
        _443 = _2935;
    }
    float _2957 = _443;
    bool _2959 = !_2941;
    float _2961 = _2957;
    if (!_2959)
    {
        float _2963 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2967 = _2913 + _2965;
        float _2969 = rsqrt(_2883);
        float _2971 = _2967 * _2963;
        float _2973 = _2935 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2975 = _2971 * 0.15915493667125701904296875;
        float _2977 = _2975 * 6.283185482025146484375;
        float _2979 = sin(_2977);
        float _2981 = _2975 * 6.283185482025146484375;
        float _2983 = cos(_2981);
        float _2985 = fma(_2979, _2973, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2987 = _2969 * _2985;
        float _2989 = _2983 + (-1.0);
        float _2991 = _2861 * _2987;
        float _2993 = _2865 * _2987;
        float _2995 = _2989 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2997 = _2991 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2999 = _2991 * _2991;
        float _3001 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3003 = fma(_2935, _2983, _2995);
        float _3005 = _2993 * _2993;
        _2961 = _3003;
        _2943 = _2999;
        _2945 = _3005;
        _2947 = _2969;
        _2949 = _2997;
        _2951 = _3001;
    }
    float _3007 = _2961;
    float _3009 = _2943;
    float _3011 = _2945;
    float _3013 = _2947;
    float _3015 = _2949;
    float _3017 = _2951;
    float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3021 = _3007 + _3019;
    float _3023 = _3013;
    if (!_2709)
    {
        _2953 = _2901;
    }
    float _3025 = _2953;
    if (!_2709)
    {
        float _3027 = fma(_2225, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2937);
        _2955 = _3027;
    }
    float _3029 = _2955;
    if (_2709)
    {
        _3023 = _2899;
    }
    float _3031 = _3023;
    float _3033 = fma(_3021, _3021, _3009);
    float _3035 = _2915 * _2939;
    float _3037 = _3031;
    if (!_2709)
    {
        _3037 = _2909;
    }
    float _3039 = _3037;
    float _3041 = _2885 * _3025;
    float _3043 = _3033 + _3011;
    float _3045 = _2785 * _3025;
    float _3047 = _2815 * _3025;
    float _3049 = _2919 * _2939;
    float _3051 = -_3035;
    float _3053 = _2817 * _3051;
    float _3055 = fma(_2905, _3029, _3041);
    float _3057 = sqrt(_3043);
    float _3059 = -_3035;
    float _3061 = _2787 * _3059;
    float _3063 = -_3035;
    float _3065 = _2911 * _3063;
    float _3067 = fma(_2791, _3029, _3045);
    float _3069 = fma(_2821, _3029, _3047);
    float _3071 = fma(_2815, _3049, _3053);
    float _3073 = fma(_2911, _3039, _3055);
    float _3075 = fma(_2785, _3049, _3061);
    float _3077 = fma(_2885, _3049, _3065);
    float _3079 = fma(_2787, _3039, _3067);
    float _3081 = fma(_2817, _3039, _3069);
    out.m_67.x = _2089;
    out.m_67.y = _2018;
    out.m_67.z = _2022;
    out.m_67.w = _2024;
    out.m_69.x = _2791;
    out.m_69.y = _2905;
    out.m_69.z = _2821;
    bool _3083 = _3057 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3085 = isnan(_3057);
    bool _3087 = _3083 || _3085;
    bool _3089 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3091 = _3087 || _3089;
    out.m_71.x = _3075;
    out.m_71.y = _3077;
    out.m_71.z = _3071;
    out.m_73.x = _3079;
    out.m_73.y = _3073;
    out.m_73.z = _3081;
    float _3093 = _3049;
    float _3095 = _3075;
    float _3097 = _3079;
    if (!_3091)
    {
        _3093 = 1.0;
    }
    float _3099 = _3093;
    bool _3101 = !_3091;
    float _3103 = _3099;
    if (!_3101)
    {
        bool _3105 = _3057 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3107 = isnan(_3057);
        bool _3109 = _3105 || _3107;
        bool _3111 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3113 = _3109 || _3111;
        if (!_3113)
        {
            float _3115 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3117 = _3057 + _3115;
            float _3119 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3121 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3119;
            float _3123 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3125 = _3123 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3127 = 1.0 / _3121;
            float _3129 = _3117 * _3127;
            float _3131 = fma(_3129, _3125, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3103 = _3131;
            _3133 = true;
        }
        else
        {
            bool _3135 = _3057 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3137 = isnan(_3057);
            bool _3139 = _3135 || _3137;
            bool _3141 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3143 = _3139 || _3141;
            if (!_3143)
            {
                float _3145 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3147 = _3057 + _3145;
                float _3149 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3151 = _3149 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3153 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3155 = _3153 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3157 = 1.0 / _3151;
                float _3159 = _3147 * _3157;
                float _3161 = fma(_3159, _3155, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3103 = _3161;
                _3133 = true;
            }
            else
            {
                _3103 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3133 = false;
    float _3163 = _3103;
    float _3165 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3167 = _3007 + _3165;
    float _3169 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3171 = _3015 + _3169;
    float _3173 = fma(_3167, _3163, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3175 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3177 = _3017 + _3175;
    float _3179 = fma(_3171, _3163, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3181 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3183 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3185 = _3173 + _3183;
    float _3187 = fma(_3177, _3163, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3189 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3191 = _3179 + _3189;
    float _3193 = _3185 * _3185;
    float _3195 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3197 = _3187 + _3195;
    float _3199 = fma(_3191, _3191, _3193);
    float _3201 = fma(_3197, _3197, _3199);
    float _3203 = rsqrt(_3201);
    float _3205 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3207 = _3191 * _3205;
    float _3209 = _3197 * _3205;
    float _3211 = _3207 * _3207;
    float _3213 = _3209 * _3209;
    float _3215 = _3211 + _3213;
    float _3217 = sqrt(_3215);
    bool _3219 = _3217 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3223 = _3217 + _3221;
    float _3225 = _3197;
    float _3227 = _3163;
    float _3229 = _3223;
    float _3231 = _3207;
    if (_3219)
    {
        float _3233 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3225 = _3233;
    }
    float _3235 = _3225;
    if (_3219)
    {
        float _3237 = rsqrt(_3215);
        _3227 = _3237;
    }
    float _3239 = _3227;
    float _3241 = _3239;
    if (_3219)
    {
        float _3243 = _3223 * _3235;
        _3229 = _3243;
    }
    float _3245 = _3229;
    float _3247 = _3173 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_3219)
    {
        float _3249 = _3245 * 0.15915493667125701904296875;
        _3095 = _3249;
    }
    float _3251 = _3095;
    float _3253 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3247);
    float _3255 = _3203;
    if (_3219)
    {
        float _3257 = _3251 * 6.283185482025146484375;
        float _3259 = sin(_3257);
        _3255 = _3259;
    }
    float _3261 = _3255;
    float _3263 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3265 = precise::max(0.0, _3263);
    float _3267 = _3193;
    float _3269 = _3265;
    float _3271 = _3263;
    if (_3219)
    {
        float _3273 = _3251 * 6.283185482025146484375;
        float _3275 = cos(_3273);
        _3267 = _3275;
    }
    float _3277 = _3267;
    float _3279 = -_3205;
    float _3281 = -_3265;
    float _3283 = fma(_3185, _3279, _3281);
    if (_3219)
    {
        float _3285 = _3283 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3269 = _3285;
    }
    float _3287 = _3269;
    float _3289 = sqrt(_3201);
    float _3291 = _3287;
    float _3293 = _3261;
    if (_3219)
    {
        float _3295 = fma(_3261, _3287, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3291 = _3295;
    }
    float _3297 = _3291;
    float _3299 = _3297;
    if (!_3219)
    {
        _3293 = _3209;
    }
    float _3301 = _3293;
    float _3303 = _3301;
    if (_3219)
    {
        float _3305 = _3277 + (-1.0);
        _3271 = _3305;
    }
    float _3307 = _3271;
    float _3309 = _3307;
    if (_3219)
    {
        float _3311 = _3239 * _3297;
        _3097 = _3311;
    }
    float _3313 = _3097;
    if (!_3219)
    {
        _3241 = _3283;
    }
    float _3315 = _3241;
    float _3317 = _3315;
    if (_3219)
    {
        float _3319 = _3307 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3309 = _3319;
    }
    float _3321 = _3309;
    float _3323 = _3321;
    if (_3219)
    {
        float _3325 = _3207 * _3313;
        _3231 = _3325;
    }
    float _3327 = _3231;
    if (!_3219)
    {
        _3299 = _3211;
    }
    float _3329 = _3299;
    float _3331 = _3329;
    if (_3219)
    {
        float _3333 = _3209 * _3313;
        _3303 = _3333;
    }
    float _3335 = _3303;
    if (_3219)
    {
        float _3337 = fma(_3283, _3277, _3321);
        _3317 = _3337;
    }
    float _3339 = _3317;
    if (_3219)
    {
        float _3341 = _3327 * _3327;
        _3331 = _3341;
    }
    float _3343 = _3331;
    if (!_3219)
    {
        _3323 = _3213;
    }
    float _3345 = _3323;
    float _3347 = _3345;
    if (_3219)
    {
        float _3349 = _3335 * _3335;
        _3347 = _3349;
    }
    float _3351 = _3347;
    float _3353 = fma(_3339, _3339, _3343);
    float _3355 = _3173 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3357 = _3353 + _3351;
    float _3359 = _3173 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3361 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3363 = fma(_3289, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3361);
    float _3365 = precise::clamp(_3363, 0.0, 1.0);
    float _3367 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3355);
    float _3369 = rsqrt(_3357);
    float _3371 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3359);
    float _3373 = _3173 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3375 = -_3365;
    float _3377 = _3375 + 1.0;
    float _3379 = fma(_3187, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3367);
    float _3381 = fma(_3187, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3371);
    float _3383 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3373);
    float _3385 = _3379 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3387 = _3381 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3389 = fma(_3187, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3383);
    float _3391 = abs(_3377);
    float _3393 = log2(_3391);
    float _3395 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3397 = _3389 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3399 = _3369 * _3327;
    float _3401 = _3369 * _3339;
    float _3403 = _3397 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3405 = -_3395;
    float _3407 = fma(_3405, _3181, 1.0);
    float _3409 = _3399 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3411 = fma(_3187, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3253);
    float _3413 = fma(_3385, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3403);
    float _3415 = _3369 * _3335;
    float _3417 = -_3409;
    float _3419 = fma(_3401, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3417);
    float _3421 = _3411 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3423 = fma(_3387, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3413);
    float _3425 = _3393 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3427 = -_3415;
    float _3429 = fma(_3427, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3419);
    float _3431 = _3397 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3433 = fma(_3421, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3423);
    float _3435 = exp2(_3425);
    float _3437 = fma(_3429, -0.5, 0.5);
    float _3439 = _3397 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3441 = fma(_3385, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3431);
    float _3443 = fma(_3429, 0.5, 0.5);
    float _3445 = fma(_3385, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3439);
    float _3447 = _3401 + 1.0;
    float _3449 = log2(_3407);
    float _3451 = fma(_3387, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3441);
    float _3453 = fma(_3387, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3445);
    float _3455 = fma(_3443, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3457 = fma(_3443, _3455, -0.212114393711090087890625);
    float _3459 = 1.0 / _3433;
    float _3461 = -_3401;
    float _3463 = fma(_3435, _3447, _3461);
    float _3465 = fma(_3421, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3451);
    float _3467 = fma(_3421, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3453);
    float _3469 = fma(_3443, _3457, 1.570728778839111328125);
    float _3471 = fma(_3463, 0.5, 0.5);
    float _3473 = sqrt(_3437);
    float _3475 = _3449 * 0.693147182464599609375;
    float _3477 = _3475 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3479 = _3465 * _3459;
    float _3481 = _3467 * _3459;
    float _3483 = fma(_3479, 0.5, 0.5);
    float _3485 = fma(_3481, -0.5, 0.5);
    float _3487 = _3473 * 0.636619746685028076171875;
    float3 _8810 = float3(_3483, _3485, _3477);
    float _3489 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8810, float3(0.0), isnan(_8810)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8810, float3(0.0), isnan(_8810)), level(0.0)).x;
    float3 _8821 = float3(_3483, _3485, _3477);
    float4 _3491 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8821, float3(0.0), isnan(_8821)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8821, float3(0.0), isnan(_8821)), level(0.0)).xyzw;
    float _3493 = _3491.x;
    float _3495 = _3491.y;
    float _3497 = _3491.z;
    float _3499 = _3491.w;
    float _3501 = -_3469;
    float _3503 = fma(_3487, _3501, 1.0);
    float2 _8842 = float2(_3503, _3471);
    float3 _3507 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8842, float2(0.0), isnan(_8842)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8842, float2(0.0), isnan(_8842)), level(0.0)).xyz;
    float _3509 = _3507.x;
    float _3511 = _3507.y;
    float _3513 = _3507.z;
    float _3515 = _3393 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3517 = _3397 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2837;
    out.m_75.y = _2927;
    out.m_75.z = _2839;
    float _3519 = fma(_3385, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3517);
    float _3521 = exp2(_3515);
    out.m_77.x = _3179;
    out.m_77.y = _3173;
    out.m_77.z = _3187;
    float _3523 = fma(_3387, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3519);
    float _3525 = fma(_3421, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3523);
    float _3527 = _3525 + _3433;
    out.gl_Position.x = _3465;
    out.gl_Position.y = _3467;
    out.gl_Position.z = _3525;
    out.gl_Position.w = _3433;
    float _3529 = -_3521;
    float _3531 = _3529 + 1.0;
    float _3533 = _3527 * 0.5;
    float _3535 = _3531 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3537 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3539 = -_3535;
    float _3541 = _3539 + 1.0;
    out.m_79.z = _3533;
    out.m_79.w = _3433;
    out.m_49.x = _3537;
    float _3543 = _3535 * _3489;
    float _3545 = _3499 * _3543;
    float _3547 = _3513 * _3543;
    float _3549 = fma(_3509, _3545, _3493);
    float _3551 = fma(_3511, _3545, _3495);
    float _3553 = _3499 * _3541;
    float _3555 = fma(_3499, _3547, _3497);
    out.m_81.x = _3549;
    out.m_81.y = _3551;
    out.m_81.z = _3555;
    out.m_81.w = _3553;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3133 = false;
    bool _2305 = false;
    bool _2115 = false;
    bool _1553 = false;
    bool _1233 = false;
    bool _1103 = false;
    bool _909 = false;
    bool _633 = false;
    bool _483 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _105 = int(_103);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3612 = as_type<float>(_121);
        out.gl_Position.z = _3612;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = 0.0;
    float _145 = _139;
    if (_135)
    {
        float _147 = float(_105);
        _115 = _147;
    }
    float _149 = _115;
    bool _151 = _139 >= _149;
    bool _153 = !_135;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_49.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _123 = as_type<int>(_161);
    }
    int _163 = _123;
    float _165 = as_type<float>(_163);
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3684 = as_type<float>(_163);
        out.gl_Position.z = _3684;
    }
    if (_155)
    {
        return out;
    }
    float _167 = in.m_51.x;
    float _169 = in.m_51.y;
    float _171 = in.m_51.z;
    float _173 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _175 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _177 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _179 = _175 || _177;
    bool _181 = isnan(1.0);
    bool _183 = _179 || _181;
    float _185 = _173;
    if (!_183)
    {
        float _187 = _173 * _173;
        float _189 = _187 * 0.5;
        _165 = _189;
    }
    float _191 = _165;
    float _193 = 0.0;
    float _195 = _191;
    if (!_183)
    {
        float _197 = _139 * _139;
        float _199 = _197 * 0.5;
        _193 = _199;
    }
    float _201 = _193;
    if (!_183)
    {
        float _203 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _203;
    }
    float _205 = _195;
    bool _207 = !_183;
    float _209 = _205;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _173 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _173);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _141 = _225;
        _209 = _239;
        _143 = _227;
    }
    float _241 = _141;
    float _243 = _209;
    float _245 = _143;
    bool _247 = !_183;
    float _249 = _241;
    float _251 = _245;
    if (!_247)
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
        _249 = _265;
        _251 = _259;
        _185 = _271;
    }
    float _273 = _249;
    float _275 = _251;
    float _277 = _185;
    float _279 = _275;
    float _281 = _273;
    if (!_183)
    {
        _279 = _139;
    }
    float _283 = _279;
    float _285 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _287 = _283;
    if (!_183)
    {
        float _289 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _281 = _289;
    }
    float _291 = _281;
    bool _293 = !_183;
    float _295 = _291;
    if (!_293)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = _139 * _299;
        float _305 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _307 = _305 + 1.0;
        float _309 = 1.0 / _307;
        float _311 = _301 * 0.693147182464599609375;
        float _313 = exp2(_303);
        float _315 = 1.0 / _311;
        float _317 = _313 + (-1.0);
        float _319 = -_317;
        float _321 = fma(_319, _315, _139);
        float _323 = _321 * _309;
        float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _325;
    }
    float _327 = _295;
    bool _329 = !_183;
    if (!_329)
    {
        float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = log2(_331);
        float _335 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _337 = _335 + 1.0;
        float _339 = 1.0 / _337;
        float _341 = _139 * _333;
        float _343 = exp2(_341);
        float _345 = -_343;
        float _347 = _345 + 1.0;
        float _349 = _347 * _339;
        _287 = _349;
    }
    float _351 = _287;
    float _353 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _355 = fma(_277, _169, _285);
    float _357 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _359 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _361 = fma(_351, _169, _353);
    float _363 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _365 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _367 = fma(_277, _167, _357);
    float _369 = fma(_351, _167, _359);
    float _371 = -_361;
    float _373 = _355 + _371;
    float _375 = fma(_277, _171, _363);
    float _377 = fma(_351, _171, _365);
    float _379 = -_369;
    float _381 = _367 + _379;
    float _383 = _373 * _373;
    float _385 = in.m_53.w;
    float _387 = -_377;
    float _389 = _375 + _387;
    float _391 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _393 = fma(_381, _381, _383);
    float _395 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _397 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _399 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].x, _391);
    float _401 = fma(_389, _389, _393);
    float _403 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].x, _395);
    float _405 = in.m_46.x;
    float _407 = in.m_46.y;
    float _409 = in.m_46.z;
    float _411 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].x, _397);
    float _413 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].z, _399);
    float _415 = sqrt(_401);
    float _417 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].z, _403);
    float _419 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].z, _411);
    bool _421 = _415 >= 9.9999999747524270787835121154785e-07;
    bool _423 = isnan(_415);
    bool _425 = _421 || _423;
    bool _427 = isnan(9.9999999747524270787835121154785e-07);
    bool _429 = _425 || _427;
    float _431 = fma(_367, _385, _405);
    float _433 = fma(_355, _385, _407);
    float _435 = fma(_375, _385, _409);
    float _437 = _417;
    float _439 = _413;
    float _441 = _419;
    float _443 = _435;
    if (!_429)
    {
        bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _447 = !_445;
        if (!_447)
        {
            float _449 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _451 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _453 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _453);
            float _461 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _455);
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _457);
            float _465 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _459);
            float _467 = _461 * _461;
            float _469 = fma(_463, _463, _467);
            float _471 = fma(_465, _465, _469);
            float _473 = rsqrt(_471);
            float _475 = _473 * 9.9999999747524270787835121154785e-07;
            float _477 = _463 * _475;
            float _479 = _461 * _475;
            float _481 = _465 * _475;
            _437 = _479;
            _439 = _477;
            _441 = _481;
            _483 = true;
        }
        else
        {
            float _485 = _169 * _169;
            float _487 = fma(_167, _167, _485);
            float _489 = fma(_171, _171, _487);
            float _491 = sqrt(_489);
            bool _493 = _491 >= 9.9999999747524270787835121154785e-07;
            bool _495 = isnan(_491);
            bool _497 = _493 || _495;
            bool _499 = isnan(9.9999999747524270787835121154785e-07);
            bool _501 = _497 || _499;
            if (!_501)
            {
                float _503 = _407 * _407;
                float _505 = fma(_405, _405, _503);
                float _507 = fma(_409, _409, _505);
                float _509 = sqrt(_507);
                bool _511 = _509 >= 9.9999999747524270787835121154785e-07;
                bool _513 = isnan(_509);
                bool _515 = _511 || _513;
                bool _517 = isnan(9.9999999747524270787835121154785e-07);
                bool _519 = _515 || _517;
                if (!_519)
                {
                    float _521 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _523 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _521);
                    float _525 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _523);
                    float _527 = rsqrt(_525);
                    float _529 = _527 * 9.9999999747524270787835121154785e-07;
                    float _531 = _529 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _533 = _529 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _535 = _529 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _437 = _533;
                    _439 = _531;
                    _441 = _535;
                    _483 = true;
                }
                else
                {
                    float _537 = _407 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _539 = _407 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _541 = _407 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _543 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].x, _537);
                    float _545 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].x, _539);
                    float _547 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].x, _541);
                    float _549 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].z, _543);
                    float _551 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].z, _545);
                    float _553 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].z, _547);
                    float _555 = _549 * _549;
                    float _557 = fma(_551, _551, _555);
                    float _559 = fma(_553, _553, _557);
                    float _561 = rsqrt(_559);
                    float _563 = _561 * 9.9999999747524270787835121154785e-07;
                    float _565 = _551 * _563;
                    float _567 = _549 * _563;
                    float _569 = _553 * _563;
                    _437 = _567;
                    _439 = _565;
                    _441 = _569;
                    _483 = true;
                }
            }
            else
            {
                float _571 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _573 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _575 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _577 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _571);
                float _579 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _573);
                float _581 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _575);
                float _583 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _577);
                float _585 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _579);
                float _587 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _581);
                float _589 = _583 * _583;
                float _591 = fma(_585, _585, _589);
                float _593 = fma(_587, _587, _591);
                float _595 = rsqrt(_593);
                float _597 = _595 * 9.9999999747524270787835121154785e-07;
                float _599 = _585 * _597;
                float _601 = _583 * _597;
                float _603 = _587 * _597;
                _437 = _601;
                _439 = _599;
                _441 = _603;
            }
        }
    }
    _483 = false;
    float _605 = _437;
    float _607 = _439;
    float _609 = _441;
    bool _611 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _613 = !_611;
    float _631;
    if (!_613)
    {
        float _615 = in.m_55.x;
        float _617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _619 = _615 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _621 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _623 = _621 * _617;
        float _625 = floor(_623);
        float _627 = -_625;
        float _629 = _623 + _627;
        _631 = _629;
        _633 = true;
    }
    else
    {
        float _635 = float(_105);
        float _637 = 1.0 / _635;
        float _639 = _139 * _637;
        _631 = _639;
    }
    _633 = false;
    float _641 = _631;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _645 = _641 + _643;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _649 = _641 + _647;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _653 = _641 + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _655;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _671 = 1.0 / _657;
    bool _673 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _675 = isnan(_641);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = 1.0 / _661;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _689 = _641 + _687;
    bool _691 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _693 = 1.0 / _669;
    float _695 = _649 * _671;
    float _697 = 1.0 / _665;
    float _699 = _645 * _685;
    bool _701 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _703 = isnan(_641);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _713;
    float _717 = fma(_715, _695, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _719 = _689 * _693;
    bool _721 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _723 = isnan(_641);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    bool _733 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _735 = isnan(_641);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = -_731;
    float _747 = _745 + 1.0;
    float _749 = _653 * _697;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _755;
    float _759 = _743 * _747;
    float _761 = -_743;
    float _763 = _761 + 1.0;
    float _765 = fma(_753, _695, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _767 = fma(_757, _695, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _769 = -_711;
    float _771 = _769 + 1.0;
    float _773 = _711 * _763;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _777 = _775 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _779 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _781 = isnan(_641);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = _683 * _771;
    float _793 = -_683;
    float _795 = _793 + 1.0;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _805 = fma(_777, _699, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _807 = _789 * _795;
    float _809 = -_789;
    float _811 = _809 + 1.0;
    float _813 = fma(_799, _699, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _815 = fma(_803, _699, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _817 = _717 * _807;
    float _819 = _765 * _807;
    float _821 = _767 * _807;
    float _823 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[143].x, _817);
    float _825 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[143].y, _819);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _827;
    float _831 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[143].z, _821);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _833;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _837;
    float _841 = fma(_829, _749, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _843 = fma(_813, _791, _823);
    float _845 = fma(_805, _791, _831);
    float _847 = fma(_815, _791, _825);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _857 = fma(_835, _749, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _859 = fma(_839, _749, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _865 = fma(_841, _773, _843);
    float _867 = fma(_851, _719, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _869 = fma(_855, _719, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _871 = fma(_863, _719, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _873 = fma(_857, _773, _847);
    float _875 = fma(_859, _773, _845);
    float _877 = fma(_867, _759, _865);
    float _879 = fma(_869, _759, _873);
    float _881 = fma(_871, _759, _875);
    float _883 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[147].x, _877);
    float _885 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[147].y, _879);
    float _887 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[147].z, _881);
    bool _889 = !_691;
    float _907;
    if (!_889)
    {
        float _891 = in.m_55.x;
        float _893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _895 = _891 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _897 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[11].x, _139);
        float _899 = _897 * _893;
        float _901 = floor(_899);
        float _903 = -_901;
        float _905 = _899 + _903;
        _907 = _905;
        _909 = true;
    }
    else
    {
        float _911 = float(_105);
        float _913 = 1.0 / _911;
        float _915 = _139 * _913;
        _907 = _915;
    }
    _909 = false;
    float _917 = _907;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _921 = _917 + _919;
    bool _923 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _925 = isnan(_917);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _931 = _927 || _929;
    float _933 = float(_931);
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _937 = _917 + _935;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _939;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _947 = -_933;
    float _949 = _947 + 1.0;
    float _951 = 1.0 / _941;
    bool _953 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _955 = 1.0 / _945;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _957;
    float _961 = _921 * _951;
    bool _963 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _965 = isnan(_917);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _975;
    bool _979 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _981 = isnan(_917);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _987 = _983 || _985;
    float _989 = float(_987);
    float _991 = fma(_959, _961, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _993 = fma(_977, _961, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _995 = _989 * _949;
    float _997 = -_989;
    float _999 = _997 + 1.0;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1001;
    float _1005 = _937 * _955;
    float _1007 = _973 * _999;
    float _1009 = fma(_1003, _961, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1011 = -_973;
    float _1013 = _1011 + 1.0;
    float _1015 = _991 * _1007;
    float _1017 = _1009 * _1007;
    float _1019 = _993 * _1007;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1027 = _1025 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1033 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1017);
    float _1035 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1015);
    float _1037 = fma(_1023, _1005, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1039 = fma(_1027, _1005, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1041 = fma(_1031, _1005, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1043 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1019);
    float _1045 = fma(_1037, _995, _1033);
    float _1047 = fma(_1039, _995, _1035);
    float _1049 = fma(_1041, _995, _1043);
    float _1051 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1045);
    float _1053 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1047);
    float _1055 = in.m_53.x;
    float _1057 = in.m_53.y;
    float _1059 = in.m_53.z;
    float _1061 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1049);
    float _1063 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1065 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1069 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1071 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1073 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1075 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _1071;
    out.m_57.y = _1073;
    out.m_57.z = _1075;
    out.m_57.w = _1067;
    float _1077 = _887 * _1059;
    float _1079 = _885 * _1057;
    float _1081 = _883 * _1055;
    bool _1083 = !_953;
    float _1101;
    if (!_1083)
    {
        float _1085 = in.m_55.x;
        float _1087 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1089 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1091 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _1093 = _1091 * _1087;
        float _1095 = floor(_1093);
        float _1097 = -_1095;
        float _1099 = _1093 + _1097;
        _1101 = _1099;
        _1103 = true;
    }
    else
    {
        float _1105 = float(_105);
        float _1107 = 1.0 / _1105;
        float _1109 = _139 * _1107;
        _1101 = _1109;
    }
    _1103 = false;
    float _1111 = _1101;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1115 = _1111 + _1113;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1121 = _1111 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1123 = isnan(_1111);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1129 = _1125 || _1127;
    float _1131 = float(_1129);
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1135 = _1133 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1137 = _1111 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1139 = isnan(_1111);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1145 = _1141 || _1143;
    float _1147 = float(_1145);
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1149;
    bool _1153 = _1111 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1155 = isnan(_1111);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1161 = _1157 || _1159;
    float _1163 = float(_1161);
    float _1165 = 1.0 / _1119;
    float _1167 = -_1131;
    float _1169 = _1167 + 1.0;
    bool _1171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1173 = 1.0 / _1135;
    float _1175 = _1151 * _1165;
    float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1179 = _1177 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1181 = -_1163;
    float _1183 = _1181 + 1.0;
    float _1185 = fma(_1175, _1115, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1187 = _1147 * _1169;
    float _1189 = -_1147;
    float _1191 = _1189 + 1.0;
    float _1193 = _1131 * _1183;
    float _1195 = _1179 * _1173;
    float _1197 = _1185 * _1187;
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1201 = _1111 + _1199;
    float _1203 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1197);
    float _1205 = fma(_1195, _1201, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1207 = fma(_1205, _1193, _1203);
    float _1209 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1207);
    float _1211 = _1209 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.w = _1211;
    bool _1213 = !_1171;
    float _1231;
    if (!_1213)
    {
        float _1215 = in.m_55.x;
        float _1217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1219 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1221 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[14].x, _139);
        float _1223 = _1221 * _1217;
        float _1225 = floor(_1223);
        float _1227 = -_1225;
        float _1229 = _1223 + _1227;
        _1231 = _1229;
        _1233 = true;
    }
    else
    {
        float _1235 = float(_105);
        float _1237 = 1.0 / _1235;
        float _1239 = _139 * _1237;
        _1231 = _1239;
    }
    _1233 = false;
    float _1241 = _1231;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1245 = _1241 + _1243;
    bool _1247 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1249 = isnan(_1241);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1255 = _1251 || _1253;
    float _1257 = float(_1255);
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1261 = _1259 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1263 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1265 = isnan(_1241);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1271 = _1267 || _1269;
    float _1273 = float(_1271);
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1275;
    bool _1279 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1281 = isnan(_1241);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1287 = _1283 || _1285;
    float _1289 = float(_1287);
    float _1291 = -_1257;
    float _1293 = _1291 + 1.0;
    float _1295 = 1.0 / _1261;
    bool _1297 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1299 = isnan(_1241);
    bool _1301 = _1297 || _1299;
    bool _1303 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1305 = _1301 || _1303;
    float _1307 = float(_1305);
    float _1309 = -_1289;
    float _1311 = _1309 + 1.0;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1315 = _1313 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1319 = 1.0 / _1315;
    float _1321 = _1277 * _1295;
    float _1323 = -_1273;
    float _1325 = _1323 + 1.0;
    float _1327 = _1273 * _1293;
    bool _1329 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1331 = isnan(_1241);
    bool _1333 = _1329 || _1331;
    bool _1335 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1337 = _1333 || _1335;
    float _1339 = float(_1337);
    float _1341 = fma(_1321, _1245, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1343 = _1289 * _1325;
    float _1345 = _1307 * _1311;
    float _1347 = -_1307;
    float _1349 = _1347 + 1.0;
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1353 = _1351 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1355 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1357 = isnan(_1241);
    bool _1359 = _1355 || _1357;
    bool _1361 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1363 = _1359 || _1361;
    float _1365 = float(_1363);
    float _1367 = _1339 * _1349;
    float _1369 = -_1339;
    float _1371 = _1369 + 1.0;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1375 = _1373 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1377 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1379 = isnan(_1241);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1385 = _1381 || _1383;
    float _1387 = float(_1385);
    float _1389 = 1.0 / _1353;
    float _1391 = _1365 * _1371;
    float _1393 = -_1365;
    float _1395 = _1393 + 1.0;
    float _1397 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1399 = _1397 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1401 = _1387 * _1395;
    float _1403 = 1.0 / _1375;
    float _1405 = _1399 * _1319;
    float _1407 = -_1387;
    float _1409 = _1407 + 1.0;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1413 = _1411 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1415;
    float _1419 = 1.0 / _1413;
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1423 = _1421 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1425 = _1341 * _1401;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1429 = _1241 + _1427;
    float _1431 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1425);
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1435 = _1433 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1437 = 1.0 / _1423;
    float _1439 = _1417 * _1403;
    float _1441 = fma(_1405, _1429, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1445 = _1241 + _1443;
    float _1447 = fma(_1441, _1391, _1431);
    float _1449 = fma(_1439, _1445, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1451 = 1.0 / _1435;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1455 = _1453 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1457 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1457;
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1463 = _1241 + _1461;
    float _1465 = _1455 * _1389;
    float _1467 = fma(_1449, _1367, _1447);
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1473 = _1459 * _1437;
    float _1475 = fma(_1465, _1463, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1479 = _1241 + _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1481;
    bool _1485 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1487 = isnan(_1241);
    bool _1489 = _1485 || _1487;
    bool _1491 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1493 = _1489 || _1491;
    float _1495 = float(_1493);
    float _1497 = _1471 * _1419;
    float _1499 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1501 = _1241 + _1499;
    float _1503 = fma(_1473, _1479, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1505 = fma(_1475, _1345, _1467);
    float _1507 = _1483 * _1451;
    float _1509 = fma(_1497, _1501, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1511 = -_1495;
    float _1513 = _1511 + 1.0;
    float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1517 = _1241 + _1515;
    float _1519 = fma(_1503, _1343, _1505);
    float _1521 = _1257 * _1513;
    float _1523 = fma(_1507, _1517, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1525 = fma(_1509, _1327, _1519);
    float _1527 = fma(_1523, _1521, _1525);
    float _1529 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1527);
    float _1531 = precise::clamp(_1529, 0.0, 1.0);
    bool _1533 = !_1317;
    float _1551;
    if (!_1533)
    {
        float _1535 = in.m_55.x;
        float _1537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1539 = _1535 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1541 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[14].z, _139);
        float _1543 = _1541 * _1537;
        float _1545 = floor(_1543);
        float _1547 = -_1545;
        float _1549 = _1543 + _1547;
        _1551 = _1549;
        _1553 = true;
    }
    else
    {
        float _1555 = float(_105);
        float _1557 = 1.0 / _1555;
        float _1559 = _139 * _1557;
        _1551 = _1559;
    }
    _1553 = false;
    float _1561 = _1551;
    int _1563 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1565 = _1563;
    int _1567 = 0;
    int _1569 = _96(_1565, _1567, (*spvDescriptorSet0.support_buffer));
    float _1571 = in.m_61.z;
    float _1573 = trunc(_1571);
    int _1575 = int(_1573);
    int _1577 = _1569 + (-1);
    float _1579 = float(_1577);
    float _1581 = _1531 * _1579;
    float _1583 = trunc(_1581);
    int _1585 = int(_1583);
    int _1587 = _1585;
    int _1589 = 0;
    int _1591 = _97(_1587, _1589, (*spvDescriptorSet0.support_buffer));
    int _1593 = _1575;
    int _1595 = 0;
    int _1597 = _97(_1593, _1595, (*spvDescriptorSet0.support_buffer));
    float4 _1600 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1591, _1597)), 0).xyzw;
    float _1602 = _1600.x;
    float _1604 = _1600.y;
    float _1606 = _1600.z;
    float _1608 = _1600.w;
    float _1610 = in.m_55.w;
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1614 = _1612 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1618 = _1616 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1622 = _1620 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1624 = 1.0 / _1614;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1628 = _1626 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1632 = _1630 != 0;
    float _1634 = 1.0 / _1618;
    bool _1636 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1638 = isnan(_1561);
    bool _1640 = _1636 || _1638;
    bool _1642 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1644 = _1640 || _1642;
    float _1646 = float(_1644);
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1650 = _1648 != 0;
    int _1652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1654 = _1652 != 0;
    float _1656 = -_1646;
    float _1658 = _1656 + 1.0;
    int _1660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1662 = _1660 != 0;
    float _1664 = 1.0 / _1622;
    bool _1666 = _1610 > 0.5;
    bool _1668 = _1666 && _1632;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1670;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    bool _1678 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1680 = isnan(_1561);
    bool _1682 = _1678 || _1680;
    bool _1684 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1686 = _1682 || _1684;
    float _1688 = float(_1686);
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1690;
    float _1694 = _1672 * _1624;
    float _1696 = 1.0 / _1628;
    bool _1698 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1700 = isnan(_1561);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1706 = _1702 || _1704;
    float _1708 = float(_1706);
    float _1710 = _1676 * _1634;
    float _1712 = _1688 * _1658;
    float _1714 = -_1688;
    float _1716 = _1714 + 1.0;
    bool _1718 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1720 = isnan(_1561);
    bool _1722 = _1718 || _1720;
    bool _1724 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1726 = _1722 || _1724;
    float _1728 = float(_1726);
    float _1730 = -_1708;
    float _1732 = _1730 + 1.0;
    bool _1734 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1736 = isnan(_1561);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1742 = _1738 || _1740;
    float _1744 = float(_1742);
    float _1746 = _1692 * _1664;
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1750 = _1748 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1752 = _1708 * _1716;
    float _1754 = _1728 * _1732;
    float _1756 = -_1728;
    float _1758 = _1756 + 1.0;
    float _1760 = -_1744;
    float _1762 = _1760 + 1.0;
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1766 = _1764 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1768 = _1750 * _1696;
    bool _1770 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1772 = isnan(_1561);
    bool _1774 = _1770 || _1772;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1778 = _1774 || _1776;
    float _1780 = float(_1778);
    float _1782 = _1744 * _1758;
    float _1784 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1786 = _1561 + _1784;
    bool _1788 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1790 = isnan(_1561);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1796 = _1792 || _1794;
    float _1798 = float(_1796);
    float _1800 = _1780 * _1762;
    float _1802 = -_1780;
    float _1804 = _1802 + 1.0;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1808 = _1806 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1810 = fma(_1694, _1786, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1812 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1814 = _1561 + _1812;
    float _1816 = _1798 * _1804;
    float _1818 = 1.0 / _1808;
    float _1820 = fma(_1710, _1814, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1822 = _1810 * _1816;
    float _1824 = -_1798;
    float _1826 = _1824 + 1.0;
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1830 = _1828 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1832 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1834 = _1832 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1836 = in.m_61.x;
    float _1838 = 1.0 / _1766;
    float _1840 = fma(_1826, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1822);
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1844 = _1561 + _1842;
    float _1846 = in.m_61.y;
    float _1848 = fma(_1746, _1844, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1850 = fma(_1820, _1800, _1840);
    float _1852 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1854 = _1561 + _1852;
    float _1856 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1856;
    float _1860 = 1.0 / _1830;
    float _1862 = _1834 * _1818;
    float _1864 = fma(_1768, _1854, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1866 = _1818;
    float _1868 = _1646;
    float _1870 = _1712;
    int _1872 = as_type<int>(_1561);
    int _1874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[182].x);
    if (_1650)
    {
        float _1876 = in.m_55.x;
        _1866 = _1876;
    }
    float _1878 = _1866;
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1880;
    float _1884 = fma(_1848, _1782, _1850);
    float _1886 = _1858 * _1838;
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1890 = _1561 + _1888;
    float _1892 = _1840;
    if (_1654)
    {
        float _1894 = in.m_55.z;
        _1892 = _1894;
    }
    float _1896 = _1892;
    bool _1898 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1900 = isnan(_1561);
    bool _1902 = _1898 || _1900;
    bool _1904 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1906 = _1902 || _1904;
    float _1908 = float(_1906);
    float _1910 = fma(_1864, _1754, _1884);
    float _1912 = fma(_1886, _1890, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1914 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1916 = _1561 + _1914;
    float _1918 = in.m_55.y;
    float _1920 = -_1908;
    float _1922 = _1920 + 1.0;
    float _1924 = fma(_1912, _1752, _1910);
    float _1926 = _1882 * _1860;
    float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1930 = _1561 + _1928;
    float _1932 = _1646 * _1922;
    int _1934 = as_type<int>(_1924);
    if (!_1650)
    {
        _1868 = _1836;
    }
    float _1936 = _1868;
    float _1938 = -_1846;
    float _1940 = _1938 + 1.0;
    float _1942 = fma(_1862, _1930, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1944 = fma(_1926, _1916, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1948 = fma(_1942, _1712, _1924);
    float _1950 = _1936;
    if (!_1650)
    {
        _1870 = _1936;
    }
    float _1952 = _1870;
    float _1954 = _1952;
    if (_1650)
    {
        _1950 = _1836;
    }
    float _1956 = _1950;
    float _1958 = fma(_1944, _1932, _1948);
    float _1960 = _1668 ? _1940 : _1846;
    bool _1962 = false;
    float _1964 = _1956;
    if (_1650)
    {
        bool _1966 = _1878 > 0.5;
        _1962 = _1966;
    }
    bool _1968 = _1962;
    if (_1650)
    {
        float _1970 = -_1956;
        float _1972 = _1970 + 1.0;
        _1872 = as_type<int>(_1972);
    }
    int _1974 = _1872;
    if (_1654)
    {
        float _1976 = -_1956;
        float _1978 = _1976 + 1.0;
        _1934 = as_type<int>(_1978);
    }
    int _1980 = _1934;
    bool _1982 = false;
    if (_1654)
    {
        bool _1984 = _1896 > 0.5;
        _1982 = _1984;
    }
    bool _1986 = _1982;
    float _1988 = fma(_1908, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1958);
    bool _1990 = _1918 > 0.5;
    bool _1992 = _1990 && _1662;
    float _1994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1650)
    {
        float _1996 = _1968 ? as_type<float>(_1974) : _1956;
        _1954 = _1996;
    }
    float _1998 = _1954;
    float _2000 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2002 = _1585 + 1;
    out.m_63.x = _1988;
    if (_1654)
    {
        float _2004 = _1986 ? as_type<float>(_1980) : _1956;
        _1964 = _2004;
    }
    float _2006 = _1964;
    int _2008 = min(_1577, _2002);
    float _2010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2012 = _1992 ? _1940 : _1846;
    float _2014 = _2012 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2016 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2018 = _2014 * _2010;
    float _2020 = _2006 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2022 = _2020 * _1994;
    float _2024 = _2000 * _2016;
    uint _2027 = as_type<uint>(half2(float2(_1608, 0.0)));
    uint _2029 = extract_bits(_2027, 0u, 8u);
    int _2031 = int(_2029) & 255;
    uint _2033 = extract_bits(_2027, 8u, 8u);
    int _2035 = int(_2033) & 255;
    int _2037 = _2035 << 8;
    int _2039 = _2031 | _2037;
    bool _2041 = _2039 >= 32768;
    int _2043 = _2039 + (-1024);
    int _2045 = _2043;
    if (_2041)
    {
        int _2047 = ~_2039;
        int _2049 = _2047 + 33792;
        int _2051 = _2049 + 1;
        _2045 = _2051;
    }
    int _2053 = _2045;
    int _2055 = _2053 + 30719;
    float _2057 = float(_2055);
    float _2059 = fma(_2057, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2061 = abs(_2059);
    float _2063 = -_2061;
    float _2065 = _2063 + 1.0;
    float _2067 = abs(_2059);
    float _2069 = fma(_2067, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2071 = as_type<int>(_2065) + (-218103808);
    float _2073 = abs(_2059);
    float _2075 = fma(_2073, _2069, -0.212114393711090087890625);
    bool _2077 = uint(_2071) >= 1920991232u;
    float _2079 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2081 = _2059 < 0.0;
    float _2083 = float(_2081);
    float _2085 = abs(_2059);
    float _2087 = fma(_2085, _2075, 1.570728778839111328125);
    float _2089 = _2079 * _1946;
    bool _2091 = !_2077;
    float _2113;
    if (!_2091)
    {
        int _2093 = as_type<int>(_2065);
        int _2095 = as_type<int>(_1932);
        int _2097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[182].x);
        int _2099 = 10608;
        int _2101;
        int _2103;
        int _2105;
        int _2107;
        int _2109;
        int _2111;
        _94(_2093, _2095, _2097, _2099, _2101, _2103, _2105, _2107, _2109, _2111, out.gl_Position, out.gl_PointSize);
        _2113 = as_type<float>(_2101);
        _1874 = _2107;
        _2115 = true;
    }
    else
    {
        float _2117 = rsqrt(_2065);
        float _2119 = _2065 * _2117;
        float _2121 = _2117 * 0.5;
        float _2123 = -_2119;
        float _2125 = 0.0 + _2123;
        float _2127 = fma(_2121, _2125, 0.5);
        float _2129 = fma(_2119, _2127, _2119);
        float _2131 = -_2129;
        float _2133 = 0.0 + _2131;
        float _2135 = fma(_2129, _2133, _2065);
        float _2137 = fma(_2121, _2135, _2129);
        _2113 = _2137;
    }
    _2115 = false;
    float _2139 = _2113;
    int _2141 = _1874;
    int _2143 = _2008;
    int _2145 = 0;
    int _2147 = _97(_2143, _2145, (*spvDescriptorSet0.support_buffer));
    int _2149 = _1575;
    int _2151 = 0;
    int _2153 = _97(_2149, _2151, (*spvDescriptorSet0.support_buffer));
    float4 _2155 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2147, _2153)), 0).xyzw;
    float _2157 = _2155.x;
    float _2159 = _2155.y;
    float _2161 = _2155.z;
    float _2163 = _2155.w;
    float _2165 = _2087 * _2139;
    float _2167 = _2083 * 2.0;
    float _2169 = _2057 * 3.883221149444580078125;
    float _2171 = floor(_1581);
    float _2173 = -_2167;
    float _2175 = fma(_2165, _2173, _2165);
    float _2177 = _2169 * 0.15915493667125701904296875;
    float _2179 = fma(_2083, 3.1415927410125732421875, _2175);
    float _2181 = _2177 * 6.283185482025146484375;
    float _2183 = cos(_2181);
    float _2185 = _2179 * 0.15915493667125701904296875;
    float _2187 = _2185 * 6.283185482025146484375;
    float _2189 = sin(_2187);
    float _2191 = -_2171;
    float _2193 = _1581 + _2191;
    float _2195 = _2177 * 6.283185482025146484375;
    float _2197 = sin(_2195);
    float _2199 = _2189 * _2183;
    float _2201 = _2189 * _2197;
    uint _2203 = as_type<uint>(half2(float2(_2163, 0.0)));
    float _2205 = -_1602;
    float _2207 = _2205 + _2157;
    float _2209 = -_1606;
    float _2211 = _2209 + _2161;
    uint _2213 = extract_bits(_2203, 0u, 8u);
    int _2215 = int(_2213) & 255;
    uint _2217 = extract_bits(_2203, 8u, 8u);
    int _2219 = int(_2217) & 255;
    int _2221 = _2219 << 8;
    int _2223 = _2215 | _2221;
    float _2225 = fma(_2193, _2207, _1602);
    float _2227 = fma(_2193, _2211, _1606);
    bool _2229 = _2223 >= 32768;
    int _2231 = _2223 + (-1024);
    int _2233 = _2231;
    if (_2229)
    {
        int _2235 = ~_2223;
        int _2237 = _2235 + 33792;
        int _2239 = _2237 + 1;
        _2233 = _2239;
    }
    int _2241 = _2233;
    int _2243 = _2241 + 30719;
    float _2245 = float(_2243);
    float _2247 = fma(_2245, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2249 = abs(_2247);
    float _2251 = -_2249;
    float _2253 = _2251 + 1.0;
    bool _2255 = _2247 < 0.0;
    float _2257 = float(_2255);
    float _2259 = abs(_2247);
    float _2261 = fma(_2259, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _2263 = -_1604;
    float _2265 = _2263 + _2159;
    int _2267 = as_type<int>(_2253) + (-218103808);
    float _2269 = abs(_2247);
    float _2271 = fma(_2269, _2261, -0.212114393711090087890625);
    float _2273 = fma(_2193, _2265, _1604);
    bool _2275 = uint(_2267) >= 1920991232u;
    float _2277 = abs(_2247);
    float _2279 = fma(_2277, _2271, 1.570728778839111328125);
    bool _2281 = !_2275;
    float _2303;
    if (!_2281)
    {
        int _2283 = as_type<int>(_2253);
        int _2285 = as_type<int>(_2261);
        int _2287 = _2141;
        int _2289 = 11504;
        int _2291;
        int _2293;
        int _2295;
        int _2297;
        int _2299;
        int _2301;
        _94(_2283, _2285, _2287, _2289, _2291, _2293, _2295, _2297, _2299, _2301, out.gl_Position, out.gl_PointSize);
        _2303 = as_type<float>(_2291);
        _2305 = true;
    }
    else
    {
        float _2307 = rsqrt(_2253);
        float _2309 = _2253 * _2307;
        float _2311 = _2307 * 0.5;
        float _2313 = -_2309;
        float _2315 = 0.0 + _2313;
        float _2317 = fma(_2311, _2315, 0.5);
        float _2319 = fma(_2309, _2317, _2309);
        float _2321 = -_2319;
        float _2323 = 0.0 + _2321;
        float _2325 = fma(_2319, _2323, _2253);
        float _2327 = fma(_2311, _2325, _2319);
        _2303 = _2327;
    }
    _2305 = false;
    float _2329 = _2303;
    float _2331 = in.m_55.x;
    float _2333 = in.m_55.y;
    float _2335 = in.m_55.z;
    float _2337 = _605 * _605;
    float _2339 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2341 = log2(_2339);
    float _2343 = _2279 * _2329;
    float _2345 = fma(_607, _607, _2337);
    float _2347 = _1077 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _2349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2351 = _2349 != 0;
    int _2353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2355 = _2353 != 0;
    int _2357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2359 = _2357 != 0;
    float _2361 = fma(_609, _609, _2345);
    float _2363 = _2245 * 3.883221149444580078125;
    float _2365 = _433 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2367 = -_2059;
    float _2369 = _2367 + _2247;
    float _2371 = rsqrt(_2361);
    float _2373 = _2363 * 0.15915493667125701904296875;
    float _2375 = _433 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2377 = _2335 * 2.0;
    float _2379 = _2331 * 2.0;
    float _2381 = _2333 * 2.0;
    float _2383 = floor(_2379);
    float _2385 = floor(_2377);
    float _2387 = _2331 + _2335;
    float _2389 = _2387 + (-1.0);
    float _2391 = floor(_2381);
    bool _2393 = _2383 >= 0.0;
    bool _2395 = isnan(_2383);
    bool _2397 = _2393 || _2395;
    bool _2399 = isnan(0.0);
    bool _2401 = _2397 || _2399;
    bool _2403 = _2385 > 0.0;
    float _2405 = _2341 * _139;
    bool _2407 = _2385 >= 0.0;
    bool _2409 = isnan(_2385);
    bool _2411 = _2407 || _2409;
    bool _2413 = isnan(0.0);
    bool _2415 = _2411 || _2413;
    float _2417 = _2333 + _2331;
    float _2419 = fma(_2389, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2421 = _2371 * _605;
    int _2423 = _2415 ? 0 : 1;
    float _2425 = _2417 + (-1.0);
    bool _2427 = _2383 > 0.0;
    int _2429 = ~_2423;
    int _2431 = _2429 + 1;
    int _2433 = _2431 + 1;
    float _2435 = fma(_2425, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2437 = exp2(_2405);
    int _2439 = _2433;
    if (!_2403)
    {
        int _2441 = ~_2423;
        int _2443 = _2441 + 1;
        _2439 = _2443;
    }
    int _2445 = _2439;
    bool _2447 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2449 = isnan(1.0);
    bool _2451 = _2447 || _2449;
    bool _2453 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2455 = _2451 || _2453;
    float _2457 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2459 = 1.0 + _2457;
    float _2461 = _2371 * _607;
    bool _2463 = !_2351;
    int _2465 = _2463 ? 0 : 1;
    float _2467 = 1.0 / _2459;
    float _2469 = _2371 * _609;
    int _2471 = abs(_2465);
    float _2473 = in.m_65.x;
    float _2475 = in.m_65.y;
    float _2477 = in.m_65.z;
    bool _2479 = _2391 > 0.0;
    float _2481 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2483 = _2461 * _2481;
    float _2485 = float(_2471);
    float _2487 = float(_2445);
    float _2489 = -_2437;
    float _2491 = _2489 + 1.0;
    bool _2493 = _2391 >= 0.0;
    bool _2495 = isnan(_2391);
    bool _2497 = _2493 || _2495;
    bool _2499 = isnan(0.0);
    bool _2501 = _2497 || _2499;
    int _2503 = _2401 ? 0 : 1;
    float _2505 = _2485 * _2487;
    bool _2507 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2509 = isnan(0.0);
    bool _2511 = _2507 || _2509;
    bool _2513 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2515 = _2511 || _2513;
    float _2517 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2519 = _2421 * _2517;
    int _2521 = _2501 ? 0 : 1;
    float _2523 = _2505 * (-2.0);
    bool _2525 = !_2359;
    int _2527 = _2525 ? 0 : 1;
    float _2529 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2531 = -_2519;
    float _2533 = fma(_2469, _2529, _2531);
    float _2535 = _2515 ? _2491 : 0.0;
    int _2537 = ~_2503;
    int _2539 = _2537 + 1;
    int _2541 = _2539 + 1;
    int _2543 = ~_2521;
    int _2545 = _2543 + 1;
    int _2547 = _2545 + 1;
    int _2549 = _2541;
    int _2551 = _2547;
    if (_2455)
    {
        float _2553 = _2535 * _2467;
        _145 = _2553;
    }
    float _2555 = _145;
    if (!_2427)
    {
        int _2557 = ~_2503;
        int _2559 = _2557 + 1;
        _2549 = _2559;
    }
    int _2561 = _2549;
    float _2563 = _2331 + (-0.5);
    if (!_2479)
    {
        int _2565 = ~_2521;
        int _2567 = _2565 + 1;
        _2551 = _2567;
    }
    int _2569 = _2551;
    float _2571 = fma(_2523, _2473, _2473);
    int _2573 = abs(_2527);
    float _2575 = fma(_2435, _2523, _2435);
    float _2577 = float(_2569);
    float _2579 = fma(_2563, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2571);
    float _2581 = float(_2573);
    float _2583 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2585 = _2469 * _2583;
    bool _2587 = !_2355;
    int _2589 = _2587 ? 0 : 1;
    float _2591 = fma(_2575, _2555, _2579);
    float _2593 = _2335 + (-0.5);
    float _2595 = _2581 * _2577;
    int _2597 = abs(_2589);
    float _2599 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2601 = -_2585;
    float _2603 = fma(_2461, _2599, _2601);
    float _2605 = float(_2561);
    float _2607 = _2595 * (-2.0);
    float _2609 = _2591 * 0.15915493667125701904296875;
    float _2611 = float(_2597);
    float _2613 = _2603 * _2603;
    float _2615 = fma(_2607, _2477, _2477);
    float _2617 = fma(_2419, _2607, _2419);
    float _2619 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2621 = -_2483;
    float _2623 = fma(_2421, _2619, _2621);
    float _2625 = _2611 * _2605;
    float _2627 = fma(_2593, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2615);
    float _2629 = _2333 + _2335;
    float _2631 = _2625 * (-2.0);
    float _2633 = _2333 + (-0.5);
    float _2635 = _2629 + (-1.0);
    float _2637 = fma(_2533, _2533, _2613);
    float _2639 = fma(_2631, _2475, _2475);
    float _2641 = fma(_2617, _2555, _2627);
    float _2643 = fma(_2635, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2645 = fma(_2623, _2623, _2637);
    float _2647 = fma(_2633, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2639);
    float _2649 = _2641 * 0.15915493667125701904296875;
    float _2651 = fma(_2643, _2631, _2643);
    float _2653 = _2609 * 6.283185482025146484375;
    float _2655 = sin(_2653);
    float _2657 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2273);
    bool _2659 = _2273 != 0.0;
    bool _2661 = isnan(_2273);
    bool _2663 = _2659 || _2661;
    bool _2665 = isnan(0.0);
    bool _2667 = _2663 || _2665;
    float _2669 = fma(_2651, _2555, _2647);
    float _2671 = _1079 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2673 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2227);
    float _2675 = _2257 * 2.0;
    float _2677 = _2669 * 0.15915493667125701904296875;
    float _2679 = rsqrt(_2645);
    float _2681 = _1081 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2683 = _2347 * _2673;
    float _2685 = -_2675;
    float _2687 = fma(_2343, _2685, _2343);
    float _2689 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2225);
    float _2691 = _2671 * _2657;
    bool _2693 = _2225 == 0.0;
    bool _2695 = !_2667;
    bool _2697 = _2693 && _2695;
    float _2699 = fma(_2257, 3.1415927410125732421875, _2687);
    float _2701 = _2609 * 6.283185482025146484375;
    float _2703 = cos(_2701);
    float _2705 = _2681 * _2689;
    bool _2707 = _2227 == 0.0;
    bool _2709 = _2707 && _2697;
    float _2711 = _2649 * 6.283185482025146484375;
    float _2713 = sin(_2711);
    float _2715 = _2603 * _2679;
    float _2717 = _2623 * _2679;
    float _2719 = _2533 * _2679;
    float _2721 = _433 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2723 = _2649 * 6.283185482025146484375;
    float _2725 = cos(_2723);
    float _2727 = _2677 * 6.283185482025146484375;
    float _2729 = sin(_2727);
    float _2731 = _2703 * _2713;
    float _2733 = _2655 * _2713;
    float _2735 = _2677 * 6.283185482025146484375;
    float _2737 = cos(_2735);
    float _2739 = _2703 * _2725;
    float _2741 = _2655 * _2725;
    float _2743 = -_2731;
    float _2745 = fma(_2729, _2741, _2743);
    float _2747 = fma(_2729, _2733, _2739);
    float _2749 = -_2741;
    float _2751 = fma(_2729, _2731, _2749);
    float _2753 = fma(_2729, _2739, _2733);
    float _2755 = _2421 * _2717;
    float _2757 = _2747 * _2461;
    float _2759 = _2751 * _2461;
    float _2761 = _2747 * _2469;
    float _2763 = _2737 * _2713;
    float _2765 = _2703 * _2737;
    float _2767 = _2737 * _2725;
    float _2769 = _2655 * _2737;
    float _2771 = _2763 * _2461;
    float _2773 = -_2755;
    float _2775 = fma(_2469, _2715, _2773);
    float _2777 = fma(_2745, _2719, _2757);
    float _2779 = fma(_2753, _2719, _2759);
    float _2781 = fma(_2767, _2719, _2771);
    float _2783 = _2751 * _2469;
    float _2785 = fma(_2769, _2775, _2777);
    float _2787 = fma(_2765, _2775, _2779);
    float _2789 = -_2729;
    float _2791 = fma(_2789, _2775, _2781);
    float _2793 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2365);
    float _2795 = _2461 * _2715;
    float _2797 = _2763 * _2469;
    float _2799 = fma(_2753, _2717, _2783);
    float _2801 = _2699 * 0.15915493667125701904296875;
    float _2803 = -_2795;
    float _2805 = fma(_2421, _2719, _2803);
    float _2807 = fma(_2745, _2717, _2761);
    float _2809 = fma(_2767, _2717, _2797);
    float _2811 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2721);
    float _2813 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2793);
    float _2815 = fma(_2769, _2805, _2807);
    float _2817 = fma(_2765, _2805, _2799);
    float _2819 = -_2729;
    float _2821 = fma(_2819, _2805, _2809);
    float _2823 = _2691 * _2785;
    float _2825 = _2691 * _2815;
    float _2827 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2811);
    float _2829 = _2373 * 6.283185482025146484375;
    float _2831 = sin(_2829);
    float _2833 = fma(_2705, _2791, _2823);
    float _2835 = fma(_2705, _2821, _2825);
    float _2837 = _2813 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2839 = _2827 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2841 = fma(_2683, _2787, _2833);
    float _2843 = fma(_2683, _2817, _2835);
    float _2845 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2375);
    float _2847 = _2801 * 6.283185482025146484375;
    float _2849 = sin(_2847);
    float _2851 = _2837 + _2841;
    float _2853 = _2839 + _2843;
    float _2855 = _2469 * _2719;
    float _2857 = _2747 * _2421;
    float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2861 = _2851 + _2859;
    float _2863 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2865 = _2853 + _2863;
    float _2867 = _2763 * _2421;
    float _2869 = -_2855;
    float _2871 = fma(_2461, _2717, _2869);
    float _2873 = _2861 * _2861;
    float _2875 = _2865 * _2865;
    float _2877 = fma(_2745, _2715, _2857);
    float _2879 = fma(_2767, _2715, _2867);
    float _2881 = _2751 * _2421;
    float _2883 = _2873 + _2875;
    float _2885 = fma(_2769, _2871, _2877);
    float _2887 = -_2201;
    float _2889 = fma(_2849, _2831, _2887);
    float _2891 = fma(_2193, _2369, _2059);
    float _2893 = _2373 * 6.283185482025146484375;
    float _2895 = cos(_2893);
    float _2897 = fma(_2753, _2715, _2881);
    float _2899 = fma(_2193, _2889, _2201);
    float _2901 = fma(_2273, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2891);
    float _2903 = -_2729;
    float _2905 = fma(_2903, _2871, _2879);
    float _2907 = _2691 * _2885;
    float _2909 = fma(_2227, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2899);
    float _2911 = fma(_2765, _2871, _2897);
    float _2913 = sqrt(_2883);
    float _2915 = _2709 ? _2891 : _2901;
    float _2917 = fma(_2705, _2905, _2907);
    float _2919 = _2709 ? _2899 : _2909;
    float _2921 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2845);
    float _2923 = _2915 * _2915;
    float _2925 = fma(_2683, _2911, _2917);
    float _2927 = _2921 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2929 = -_2199;
    float _2931 = fma(_2849, _2895, _2929);
    float _2933 = fma(_2919, _2919, _2923);
    float _2935 = _2927 + _2925;
    float _2937 = fma(_2193, _2931, _2199);
    float _2939 = rsqrt(_2933);
    bool _2941 = _2913 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2943 = _2873;
    float _2945 = _2875;
    float _2947 = _2883;
    float _2949 = _2851;
    float _2951 = _2853;
    float _2953 = _2891;
    float _2955 = _2937;
    if (!_2941)
    {
        _443 = _2935;
    }
    float _2957 = _443;
    bool _2959 = !_2941;
    float _2961 = _2957;
    if (!_2959)
    {
        float _2963 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2967 = _2913 + _2965;
        float _2969 = rsqrt(_2883);
        float _2971 = _2967 * _2963;
        float _2973 = _2935 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2975 = _2971 * 0.15915493667125701904296875;
        float _2977 = _2975 * 6.283185482025146484375;
        float _2979 = sin(_2977);
        float _2981 = _2975 * 6.283185482025146484375;
        float _2983 = cos(_2981);
        float _2985 = fma(_2979, _2973, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2987 = _2969 * _2985;
        float _2989 = _2983 + (-1.0);
        float _2991 = _2861 * _2987;
        float _2993 = _2865 * _2987;
        float _2995 = _2989 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2997 = _2991 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2999 = _2991 * _2991;
        float _3001 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3003 = fma(_2935, _2983, _2995);
        float _3005 = _2993 * _2993;
        _2961 = _3003;
        _2943 = _2999;
        _2945 = _3005;
        _2947 = _2969;
        _2949 = _2997;
        _2951 = _3001;
    }
    float _3007 = _2961;
    float _3009 = _2943;
    float _3011 = _2945;
    float _3013 = _2947;
    float _3015 = _2949;
    float _3017 = _2951;
    float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3021 = _3007 + _3019;
    float _3023 = _3013;
    if (!_2709)
    {
        _2953 = _2901;
    }
    float _3025 = _2953;
    if (!_2709)
    {
        float _3027 = fma(_2225, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2937);
        _2955 = _3027;
    }
    float _3029 = _2955;
    if (_2709)
    {
        _3023 = _2899;
    }
    float _3031 = _3023;
    float _3033 = fma(_3021, _3021, _3009);
    float _3035 = _2915 * _2939;
    float _3037 = _3031;
    if (!_2709)
    {
        _3037 = _2909;
    }
    float _3039 = _3037;
    float _3041 = _2885 * _3025;
    float _3043 = _3033 + _3011;
    float _3045 = _2785 * _3025;
    float _3047 = _2815 * _3025;
    float _3049 = _2919 * _2939;
    float _3051 = -_3035;
    float _3053 = _2817 * _3051;
    float _3055 = fma(_2905, _3029, _3041);
    float _3057 = sqrt(_3043);
    float _3059 = -_3035;
    float _3061 = _2787 * _3059;
    float _3063 = -_3035;
    float _3065 = _2911 * _3063;
    float _3067 = fma(_2791, _3029, _3045);
    float _3069 = fma(_2821, _3029, _3047);
    float _3071 = fma(_2815, _3049, _3053);
    float _3073 = fma(_2911, _3039, _3055);
    float _3075 = fma(_2785, _3049, _3061);
    float _3077 = fma(_2885, _3049, _3065);
    float _3079 = fma(_2787, _3039, _3067);
    float _3081 = fma(_2817, _3039, _3069);
    out.m_67.x = _2089;
    out.m_67.y = _2018;
    out.m_67.z = _2022;
    out.m_67.w = _2024;
    out.m_69.x = _2791;
    out.m_69.y = _2905;
    out.m_69.z = _2821;
    bool _3083 = _3057 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3085 = isnan(_3057);
    bool _3087 = _3083 || _3085;
    bool _3089 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3091 = _3087 || _3089;
    out.m_71.x = _3075;
    out.m_71.y = _3077;
    out.m_71.z = _3071;
    out.m_73.x = _3079;
    out.m_73.y = _3073;
    out.m_73.z = _3081;
    float _3093 = _3049;
    float _3095 = _3075;
    float _3097 = _3079;
    if (!_3091)
    {
        _3093 = 1.0;
    }
    float _3099 = _3093;
    bool _3101 = !_3091;
    float _3103 = _3099;
    if (!_3101)
    {
        bool _3105 = _3057 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3107 = isnan(_3057);
        bool _3109 = _3105 || _3107;
        bool _3111 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3113 = _3109 || _3111;
        if (!_3113)
        {
            float _3115 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3117 = _3057 + _3115;
            float _3119 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3121 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3119;
            float _3123 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3125 = _3123 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3127 = 1.0 / _3121;
            float _3129 = _3117 * _3127;
            float _3131 = fma(_3129, _3125, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3103 = _3131;
            _3133 = true;
        }
        else
        {
            bool _3135 = _3057 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3137 = isnan(_3057);
            bool _3139 = _3135 || _3137;
            bool _3141 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3143 = _3139 || _3141;
            if (!_3143)
            {
                float _3145 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3147 = _3057 + _3145;
                float _3149 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3151 = _3149 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3153 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3155 = _3153 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3157 = 1.0 / _3151;
                float _3159 = _3147 * _3157;
                float _3161 = fma(_3159, _3155, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3103 = _3161;
                _3133 = true;
            }
            else
            {
                _3103 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3133 = false;
    float _3163 = _3103;
    float _3165 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3167 = _3007 + _3165;
    float _3169 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3171 = _3015 + _3169;
    float _3173 = fma(_3167, _3163, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3175 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3177 = _3017 + _3175;
    float _3179 = fma(_3171, _3163, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3181 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3183 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3185 = _3173 + _3183;
    float _3187 = fma(_3177, _3163, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3189 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3191 = _3179 + _3189;
    float _3193 = _3185 * _3185;
    float _3195 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3197 = _3187 + _3195;
    float _3199 = fma(_3191, _3191, _3193);
    float _3201 = fma(_3197, _3197, _3199);
    float _3203 = rsqrt(_3201);
    float _3205 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3207 = _3191 * _3205;
    float _3209 = _3197 * _3205;
    float _3211 = _3207 * _3207;
    float _3213 = _3209 * _3209;
    float _3215 = _3211 + _3213;
    float _3217 = sqrt(_3215);
    bool _3219 = _3217 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3223 = _3217 + _3221;
    float _3225 = _3197;
    float _3227 = _3163;
    float _3229 = _3223;
    float _3231 = _3207;
    if (_3219)
    {
        float _3233 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3225 = _3233;
    }
    float _3235 = _3225;
    if (_3219)
    {
        float _3237 = rsqrt(_3215);
        _3227 = _3237;
    }
    float _3239 = _3227;
    float _3241 = _3239;
    if (_3219)
    {
        float _3243 = _3223 * _3235;
        _3229 = _3243;
    }
    float _3245 = _3229;
    float _3247 = _3173 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_3219)
    {
        float _3249 = _3245 * 0.15915493667125701904296875;
        _3095 = _3249;
    }
    float _3251 = _3095;
    float _3253 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3247);
    float _3255 = _3203;
    if (_3219)
    {
        float _3257 = _3251 * 6.283185482025146484375;
        float _3259 = sin(_3257);
        _3255 = _3259;
    }
    float _3261 = _3255;
    float _3263 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3265 = precise::max(0.0, _3263);
    float _3267 = _3193;
    float _3269 = _3265;
    float _3271 = _3263;
    if (_3219)
    {
        float _3273 = _3251 * 6.283185482025146484375;
        float _3275 = cos(_3273);
        _3267 = _3275;
    }
    float _3277 = _3267;
    float _3279 = -_3205;
    float _3281 = -_3265;
    float _3283 = fma(_3185, _3279, _3281);
    if (_3219)
    {
        float _3285 = _3283 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3269 = _3285;
    }
    float _3287 = _3269;
    float _3289 = sqrt(_3201);
    float _3291 = _3287;
    float _3293 = _3261;
    if (_3219)
    {
        float _3295 = fma(_3261, _3287, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3291 = _3295;
    }
    float _3297 = _3291;
    float _3299 = _3297;
    if (!_3219)
    {
        _3293 = _3209;
    }
    float _3301 = _3293;
    float _3303 = _3301;
    if (_3219)
    {
        float _3305 = _3277 + (-1.0);
        _3271 = _3305;
    }
    float _3307 = _3271;
    float _3309 = _3307;
    if (_3219)
    {
        float _3311 = _3239 * _3297;
        _3097 = _3311;
    }
    float _3313 = _3097;
    if (!_3219)
    {
        _3241 = _3283;
    }
    float _3315 = _3241;
    float _3317 = _3315;
    if (_3219)
    {
        float _3319 = _3307 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3309 = _3319;
    }
    float _3321 = _3309;
    float _3323 = _3321;
    if (_3219)
    {
        float _3325 = _3207 * _3313;
        _3231 = _3325;
    }
    float _3327 = _3231;
    if (!_3219)
    {
        _3299 = _3211;
    }
    float _3329 = _3299;
    float _3331 = _3329;
    if (_3219)
    {
        float _3333 = _3209 * _3313;
        _3303 = _3333;
    }
    float _3335 = _3303;
    if (_3219)
    {
        float _3337 = fma(_3283, _3277, _3321);
        _3317 = _3337;
    }
    float _3339 = _3317;
    if (_3219)
    {
        float _3341 = _3327 * _3327;
        _3331 = _3341;
    }
    float _3343 = _3331;
    if (!_3219)
    {
        _3323 = _3213;
    }
    float _3345 = _3323;
    float _3347 = _3345;
    if (_3219)
    {
        float _3349 = _3335 * _3335;
        _3347 = _3349;
    }
    float _3351 = _3347;
    float _3353 = fma(_3339, _3339, _3343);
    float _3355 = _3173 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3357 = _3353 + _3351;
    float _3359 = _3173 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3361 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3363 = fma(_3289, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3361);
    float _3365 = precise::clamp(_3363, 0.0, 1.0);
    float _3367 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3355);
    float _3369 = rsqrt(_3357);
    float _3371 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3359);
    float _3373 = _3173 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3375 = -_3365;
    float _3377 = _3375 + 1.0;
    float _3379 = fma(_3187, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3367);
    float _3381 = fma(_3187, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3371);
    float _3383 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3373);
    float _3385 = _3379 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3387 = _3381 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3389 = fma(_3187, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3383);
    float _3391 = abs(_3377);
    float _3393 = log2(_3391);
    float _3395 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3397 = _3389 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3399 = _3369 * _3327;
    float _3401 = _3369 * _3339;
    float _3403 = _3397 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3405 = -_3395;
    float _3407 = fma(_3405, _3181, 1.0);
    float _3409 = _3399 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3411 = fma(_3187, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3253);
    float _3413 = fma(_3385, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3403);
    float _3415 = _3369 * _3335;
    float _3417 = -_3409;
    float _3419 = fma(_3401, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3417);
    float _3421 = _3411 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3423 = fma(_3387, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3413);
    float _3425 = _3393 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3427 = -_3415;
    float _3429 = fma(_3427, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3419);
    float _3431 = _3397 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3433 = fma(_3421, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3423);
    float _3435 = exp2(_3425);
    float _3437 = fma(_3429, -0.5, 0.5);
    float _3439 = _3397 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3441 = fma(_3385, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3431);
    float _3443 = fma(_3429, 0.5, 0.5);
    float _3445 = fma(_3385, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3439);
    float _3447 = _3401 + 1.0;
    float _3449 = log2(_3407);
    float _3451 = fma(_3387, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3441);
    float _3453 = fma(_3387, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3445);
    float _3455 = fma(_3443, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3457 = fma(_3443, _3455, -0.212114393711090087890625);
    float _3459 = 1.0 / _3433;
    float _3461 = -_3401;
    float _3463 = fma(_3435, _3447, _3461);
    float _3465 = fma(_3421, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3451);
    float _3467 = fma(_3421, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3453);
    float _3469 = fma(_3443, _3457, 1.570728778839111328125);
    float _3471 = fma(_3463, 0.5, 0.5);
    float _3473 = sqrt(_3437);
    float _3475 = _3449 * 0.693147182464599609375;
    float _3477 = _3475 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3479 = _3465 * _3459;
    float _3481 = _3467 * _3459;
    float _3483 = fma(_3479, 0.5, 0.5);
    float _3485 = fma(_3481, -0.5, 0.5);
    float _3487 = _3473 * 0.636619746685028076171875;
    float3 _8810 = float3(_3483, _3485, _3477);
    float _3489 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8810, float3(0.0), isnan(_8810)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8810, float3(0.0), isnan(_8810)), level(0.0)).x;
    float3 _8821 = float3(_3483, _3485, _3477);
    float4 _3491 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8821, float3(0.0), isnan(_8821)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8821, float3(0.0), isnan(_8821)), level(0.0)).xyzw;
    float _3493 = _3491.x;
    float _3495 = _3491.y;
    float _3497 = _3491.z;
    float _3499 = _3491.w;
    float _3501 = -_3469;
    float _3503 = fma(_3487, _3501, 1.0);
    float2 _8842 = float2(_3503, _3471);
    float3 _3507 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8842, float2(0.0), isnan(_8842)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8842, float2(0.0), isnan(_8842)), level(0.0)).xyz;
    float _3509 = _3507.x;
    float _3511 = _3507.y;
    float _3513 = _3507.z;
    float _3515 = _3393 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3517 = _3397 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2837;
    out.m_75.y = _2927;
    out.m_75.z = _2839;
    float _3519 = fma(_3385, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3517);
    float _3521 = exp2(_3515);
    out.m_77.x = _3179;
    out.m_77.y = _3173;
    out.m_77.z = _3187;
    float _3523 = fma(_3387, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3519);
    float _3525 = fma(_3421, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3523);
    float _3527 = _3525 + _3433;
    out.gl_Position.x = _3465;
    out.gl_Position.y = _3467;
    out.gl_Position.z = _3525;
    out.gl_Position.w = _3433;
    float _3529 = -_3521;
    float _3531 = _3529 + 1.0;
    float _3533 = _3527 * 0.5;
    float _3535 = _3531 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3537 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3539 = -_3535;
    float _3541 = _3539 + 1.0;
    out.m_79.z = _3533;
    out.m_79.w = _3433;
    out.m_49.x = _3537;
    float _3543 = _3535 * _3489;
    float _3545 = _3499 * _3543;
    float _3547 = _3513 * _3543;
    float _3549 = fma(_3509, _3545, _3493);
    float _3551 = fma(_3511, _3545, _3495);
    float _3553 = _3499 * _3541;
    float _3555 = fma(_3499, _3547, _3497);
    out.m_81.x = _3549;
    out.m_81.y = _3551;
    out.m_81.z = _3555;
    out.m_81.w = _3553;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3133 = false;
    bool _2305 = false;
    bool _2115 = false;
    bool _1553 = false;
    bool _1233 = false;
    bool _1103 = false;
    bool _909 = false;
    bool _633 = false;
    bool _483 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _105 = int(_103);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3612 = as_type<float>(_121);
        out.gl_Position.z = _3612;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = 0.0;
    float _145 = _139;
    if (_135)
    {
        float _147 = float(_105);
        _115 = _147;
    }
    float _149 = _115;
    bool _151 = _139 >= _149;
    bool _153 = !_135;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_49.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _123 = as_type<int>(_161);
    }
    int _163 = _123;
    float _165 = as_type<float>(_163);
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3684 = as_type<float>(_163);
        out.gl_Position.z = _3684;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = in.m_51.x;
    float _169 = in.m_51.y;
    float _171 = in.m_51.z;
    float _173 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _175 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _177 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _179 = _175 || _177;
    bool _181 = isnan(1.0);
    bool _183 = _179 || _181;
    float _185 = _173;
    if (!_183)
    {
        float _187 = _173 * _173;
        float _189 = _187 * 0.5;
        _165 = _189;
    }
    float _191 = _165;
    float _193 = 0.0;
    float _195 = _191;
    if (!_183)
    {
        float _197 = _139 * _139;
        float _199 = _197 * 0.5;
        _193 = _199;
    }
    float _201 = _193;
    if (!_183)
    {
        float _203 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _203;
    }
    float _205 = _195;
    bool _207 = !_183;
    float _209 = _205;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _173 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _173);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _141 = _225;
        _209 = _239;
        _143 = _227;
    }
    float _241 = _141;
    float _243 = _209;
    float _245 = _143;
    bool _247 = !_183;
    float _249 = _241;
    float _251 = _245;
    if (!_247)
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
        _249 = _265;
        _251 = _259;
        _185 = _271;
    }
    float _273 = _249;
    float _275 = _251;
    float _277 = _185;
    float _279 = _275;
    float _281 = _273;
    if (!_183)
    {
        _279 = _139;
    }
    float _283 = _279;
    float _285 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _287 = _283;
    if (!_183)
    {
        float _289 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _281 = _289;
    }
    float _291 = _281;
    bool _293 = !_183;
    float _295 = _291;
    if (!_293)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = _139 * _299;
        float _305 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _307 = _305 + 1.0;
        float _309 = 1.0 / _307;
        float _311 = _301 * 0.693147182464599609375;
        float _313 = exp2(_303);
        float _315 = 1.0 / _311;
        float _317 = _313 + (-1.0);
        float _319 = -_317;
        float _321 = fma(_319, _315, _139);
        float _323 = _321 * _309;
        float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _325;
    }
    float _327 = _295;
    bool _329 = !_183;
    if (!_329)
    {
        float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = log2(_331);
        float _335 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _337 = _335 + 1.0;
        float _339 = 1.0 / _337;
        float _341 = _139 * _333;
        float _343 = exp2(_341);
        float _345 = -_343;
        float _347 = _345 + 1.0;
        float _349 = _347 * _339;
        _287 = _349;
    }
    float _351 = _287;
    float _353 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _355 = fma(_277, _169, _285);
    float _357 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _359 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _361 = fma(_351, _169, _353);
    float _363 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _365 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _367 = fma(_277, _167, _357);
    float _369 = fma(_351, _167, _359);
    float _371 = -_361;
    float _373 = _355 + _371;
    float _375 = fma(_277, _171, _363);
    float _377 = fma(_351, _171, _365);
    float _379 = -_369;
    float _381 = _367 + _379;
    float _383 = _373 * _373;
    float _385 = in.m_53.w;
    float _387 = -_377;
    float _389 = _375 + _387;
    float _391 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _393 = fma(_381, _381, _383);
    float _395 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _397 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _399 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].x, _391);
    float _401 = fma(_389, _389, _393);
    float _403 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].x, _395);
    float _405 = in.m_46.x;
    float _407 = in.m_46.y;
    float _409 = in.m_46.z;
    float _411 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].x, _397);
    float _413 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].z, _399);
    float _415 = sqrt(_401);
    float _417 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].z, _403);
    float _419 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].z, _411);
    bool _421 = _415 >= 9.9999999747524270787835121154785e-07;
    bool _423 = isnan(_415);
    bool _425 = _421 || _423;
    bool _427 = isnan(9.9999999747524270787835121154785e-07);
    bool _429 = _425 || _427;
    float _431 = fma(_367, _385, _405);
    float _433 = fma(_355, _385, _407);
    float _435 = fma(_375, _385, _409);
    float _437 = _417;
    float _439 = _413;
    float _441 = _419;
    float _443 = _435;
    if (!_429)
    {
        bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _447 = !_445;
        if (!_447)
        {
            float _449 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _451 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _453 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _453);
            float _461 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _455);
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _457);
            float _465 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _459);
            float _467 = _461 * _461;
            float _469 = fma(_463, _463, _467);
            float _471 = fma(_465, _465, _469);
            float _473 = rsqrt(_471);
            float _475 = _473 * 9.9999999747524270787835121154785e-07;
            float _477 = _463 * _475;
            float _479 = _461 * _475;
            float _481 = _465 * _475;
            _437 = _479;
            _439 = _477;
            _441 = _481;
            _483 = true;
        }
        else
        {
            float _485 = _169 * _169;
            float _487 = fma(_167, _167, _485);
            float _489 = fma(_171, _171, _487);
            float _491 = sqrt(_489);
            bool _493 = _491 >= 9.9999999747524270787835121154785e-07;
            bool _495 = isnan(_491);
            bool _497 = _493 || _495;
            bool _499 = isnan(9.9999999747524270787835121154785e-07);
            bool _501 = _497 || _499;
            if (!_501)
            {
                float _503 = _407 * _407;
                float _505 = fma(_405, _405, _503);
                float _507 = fma(_409, _409, _505);
                float _509 = sqrt(_507);
                bool _511 = _509 >= 9.9999999747524270787835121154785e-07;
                bool _513 = isnan(_509);
                bool _515 = _511 || _513;
                bool _517 = isnan(9.9999999747524270787835121154785e-07);
                bool _519 = _515 || _517;
                if (!_519)
                {
                    float _521 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _523 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _521);
                    float _525 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _523);
                    float _527 = rsqrt(_525);
                    float _529 = _527 * 9.9999999747524270787835121154785e-07;
                    float _531 = _529 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _533 = _529 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _535 = _529 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _437 = _533;
                    _439 = _531;
                    _441 = _535;
                    _483 = true;
                }
                else
                {
                    float _537 = _407 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _539 = _407 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _541 = _407 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _543 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].x, _537);
                    float _545 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].x, _539);
                    float _547 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].x, _541);
                    float _549 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].z, _543);
                    float _551 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].z, _545);
                    float _553 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].z, _547);
                    float _555 = _549 * _549;
                    float _557 = fma(_551, _551, _555);
                    float _559 = fma(_553, _553, _557);
                    float _561 = rsqrt(_559);
                    float _563 = _561 * 9.9999999747524270787835121154785e-07;
                    float _565 = _551 * _563;
                    float _567 = _549 * _563;
                    float _569 = _553 * _563;
                    _437 = _567;
                    _439 = _565;
                    _441 = _569;
                    _483 = true;
                }
            }
            else
            {
                float _571 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _573 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _575 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _577 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _571);
                float _579 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _573);
                float _581 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _575);
                float _583 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _577);
                float _585 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _579);
                float _587 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _581);
                float _589 = _583 * _583;
                float _591 = fma(_585, _585, _589);
                float _593 = fma(_587, _587, _591);
                float _595 = rsqrt(_593);
                float _597 = _595 * 9.9999999747524270787835121154785e-07;
                float _599 = _585 * _597;
                float _601 = _583 * _597;
                float _603 = _587 * _597;
                _437 = _601;
                _439 = _599;
                _441 = _603;
            }
        }
    }
    _483 = false;
    float _605 = _437;
    float _607 = _439;
    float _609 = _441;
    bool _611 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _613 = !_611;
    float _631;
    if (!_613)
    {
        float _615 = in.m_55.x;
        float _617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _619 = _615 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _621 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _623 = _621 * _617;
        float _625 = floor(_623);
        float _627 = -_625;
        float _629 = _623 + _627;
        _631 = _629;
        _633 = true;
    }
    else
    {
        float _635 = float(_105);
        float _637 = 1.0 / _635;
        float _639 = _139 * _637;
        _631 = _639;
    }
    _633 = false;
    float _641 = _631;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _645 = _641 + _643;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _649 = _641 + _647;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _653 = _641 + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _655;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _671 = 1.0 / _657;
    bool _673 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _675 = isnan(_641);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = 1.0 / _661;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _689 = _641 + _687;
    bool _691 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _693 = 1.0 / _669;
    float _695 = _649 * _671;
    float _697 = 1.0 / _665;
    float _699 = _645 * _685;
    bool _701 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _703 = isnan(_641);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _713;
    float _717 = fma(_715, _695, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _719 = _689 * _693;
    bool _721 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _723 = isnan(_641);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    bool _733 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _735 = isnan(_641);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = -_731;
    float _747 = _745 + 1.0;
    float _749 = _653 * _697;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _755;
    float _759 = _743 * _747;
    float _761 = -_743;
    float _763 = _761 + 1.0;
    float _765 = fma(_753, _695, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _767 = fma(_757, _695, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _769 = -_711;
    float _771 = _769 + 1.0;
    float _773 = _711 * _763;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _777 = _775 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _779 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _781 = isnan(_641);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = _683 * _771;
    float _793 = -_683;
    float _795 = _793 + 1.0;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _805 = fma(_777, _699, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _807 = _789 * _795;
    float _809 = -_789;
    float _811 = _809 + 1.0;
    float _813 = fma(_799, _699, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _815 = fma(_803, _699, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _817 = _717 * _807;
    float _819 = _765 * _807;
    float _821 = _767 * _807;
    float _823 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[143].x, _817);
    float _825 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[143].y, _819);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _827;
    float _831 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[143].z, _821);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _833;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _837;
    float _841 = fma(_829, _749, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _843 = fma(_813, _791, _823);
    float _845 = fma(_805, _791, _831);
    float _847 = fma(_815, _791, _825);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _857 = fma(_835, _749, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _859 = fma(_839, _749, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _865 = fma(_841, _773, _843);
    float _867 = fma(_851, _719, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _869 = fma(_855, _719, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _871 = fma(_863, _719, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _873 = fma(_857, _773, _847);
    float _875 = fma(_859, _773, _845);
    float _877 = fma(_867, _759, _865);
    float _879 = fma(_869, _759, _873);
    float _881 = fma(_871, _759, _875);
    float _883 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[147].x, _877);
    float _885 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[147].y, _879);
    float _887 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[147].z, _881);
    bool _889 = !_691;
    float _907;
    if (!_889)
    {
        float _891 = in.m_55.x;
        float _893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _895 = _891 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _897 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[11].x, _139);
        float _899 = _897 * _893;
        float _901 = floor(_899);
        float _903 = -_901;
        float _905 = _899 + _903;
        _907 = _905;
        _909 = true;
    }
    else
    {
        float _911 = float(_105);
        float _913 = 1.0 / _911;
        float _915 = _139 * _913;
        _907 = _915;
    }
    _909 = false;
    float _917 = _907;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _921 = _917 + _919;
    bool _923 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _925 = isnan(_917);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _931 = _927 || _929;
    float _933 = float(_931);
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _937 = _917 + _935;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _939;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _947 = -_933;
    float _949 = _947 + 1.0;
    float _951 = 1.0 / _941;
    bool _953 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _955 = 1.0 / _945;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _957;
    float _961 = _921 * _951;
    bool _963 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _965 = isnan(_917);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _975;
    bool _979 = _917 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _981 = isnan(_917);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _987 = _983 || _985;
    float _989 = float(_987);
    float _991 = fma(_959, _961, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _993 = fma(_977, _961, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _995 = _989 * _949;
    float _997 = -_989;
    float _999 = _997 + 1.0;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1001;
    float _1005 = _937 * _955;
    float _1007 = _973 * _999;
    float _1009 = fma(_1003, _961, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1011 = -_973;
    float _1013 = _1011 + 1.0;
    float _1015 = _991 * _1007;
    float _1017 = _1009 * _1007;
    float _1019 = _993 * _1007;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1027 = _1025 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1033 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1017);
    float _1035 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1015);
    float _1037 = fma(_1023, _1005, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1039 = fma(_1027, _1005, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1041 = fma(_1031, _1005, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1043 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1019);
    float _1045 = fma(_1037, _995, _1033);
    float _1047 = fma(_1039, _995, _1035);
    float _1049 = fma(_1041, _995, _1043);
    float _1051 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1045);
    float _1053 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1047);
    float _1055 = in.m_53.x;
    float _1057 = in.m_53.y;
    float _1059 = in.m_53.z;
    float _1061 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1049);
    float _1063 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1065 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1069 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1071 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1073 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1075 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _1071;
    out.m_57.y = _1073;
    out.m_57.z = _1075;
    out.m_57.w = _1067;
    float _1077 = _887 * _1059;
    float _1079 = _885 * _1057;
    float _1081 = _883 * _1055;
    bool _1083 = !_953;
    float _1101;
    if (!_1083)
    {
        float _1085 = in.m_55.x;
        float _1087 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1089 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1091 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _1093 = _1091 * _1087;
        float _1095 = floor(_1093);
        float _1097 = -_1095;
        float _1099 = _1093 + _1097;
        _1101 = _1099;
        _1103 = true;
    }
    else
    {
        float _1105 = float(_105);
        float _1107 = 1.0 / _1105;
        float _1109 = _139 * _1107;
        _1101 = _1109;
    }
    _1103 = false;
    float _1111 = _1101;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1115 = _1111 + _1113;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1121 = _1111 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1123 = isnan(_1111);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1129 = _1125 || _1127;
    float _1131 = float(_1129);
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1135 = _1133 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1137 = _1111 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1139 = isnan(_1111);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1145 = _1141 || _1143;
    float _1147 = float(_1145);
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1149;
    bool _1153 = _1111 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1155 = isnan(_1111);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1161 = _1157 || _1159;
    float _1163 = float(_1161);
    float _1165 = 1.0 / _1119;
    float _1167 = -_1131;
    float _1169 = _1167 + 1.0;
    bool _1171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1173 = 1.0 / _1135;
    float _1175 = _1151 * _1165;
    float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1179 = _1177 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1181 = -_1163;
    float _1183 = _1181 + 1.0;
    float _1185 = fma(_1175, _1115, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1187 = _1147 * _1169;
    float _1189 = -_1147;
    float _1191 = _1189 + 1.0;
    float _1193 = _1131 * _1183;
    float _1195 = _1179 * _1173;
    float _1197 = _1185 * _1187;
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1201 = _1111 + _1199;
    float _1203 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1197);
    float _1205 = fma(_1195, _1201, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1207 = fma(_1205, _1193, _1203);
    float _1209 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1207);
    float _1211 = _1209 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.w = _1211;
    bool _1213 = !_1171;
    float _1231;
    if (!_1213)
    {
        float _1215 = in.m_55.x;
        float _1217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1219 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1221 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[14].x, _139);
        float _1223 = _1221 * _1217;
        float _1225 = floor(_1223);
        float _1227 = -_1225;
        float _1229 = _1223 + _1227;
        _1231 = _1229;
        _1233 = true;
    }
    else
    {
        float _1235 = float(_105);
        float _1237 = 1.0 / _1235;
        float _1239 = _139 * _1237;
        _1231 = _1239;
    }
    _1233 = false;
    float _1241 = _1231;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1245 = _1241 + _1243;
    bool _1247 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1249 = isnan(_1241);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1255 = _1251 || _1253;
    float _1257 = float(_1255);
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1261 = _1259 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1263 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1265 = isnan(_1241);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1271 = _1267 || _1269;
    float _1273 = float(_1271);
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1275;
    bool _1279 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1281 = isnan(_1241);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1287 = _1283 || _1285;
    float _1289 = float(_1287);
    float _1291 = -_1257;
    float _1293 = _1291 + 1.0;
    float _1295 = 1.0 / _1261;
    bool _1297 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1299 = isnan(_1241);
    bool _1301 = _1297 || _1299;
    bool _1303 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1305 = _1301 || _1303;
    float _1307 = float(_1305);
    float _1309 = -_1289;
    float _1311 = _1309 + 1.0;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1315 = _1313 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1319 = 1.0 / _1315;
    float _1321 = _1277 * _1295;
    float _1323 = -_1273;
    float _1325 = _1323 + 1.0;
    float _1327 = _1273 * _1293;
    bool _1329 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1331 = isnan(_1241);
    bool _1333 = _1329 || _1331;
    bool _1335 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1337 = _1333 || _1335;
    float _1339 = float(_1337);
    float _1341 = fma(_1321, _1245, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1343 = _1289 * _1325;
    float _1345 = _1307 * _1311;
    float _1347 = -_1307;
    float _1349 = _1347 + 1.0;
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1353 = _1351 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1355 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1357 = isnan(_1241);
    bool _1359 = _1355 || _1357;
    bool _1361 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1363 = _1359 || _1361;
    float _1365 = float(_1363);
    float _1367 = _1339 * _1349;
    float _1369 = -_1339;
    float _1371 = _1369 + 1.0;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1375 = _1373 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1377 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1379 = isnan(_1241);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1385 = _1381 || _1383;
    float _1387 = float(_1385);
    float _1389 = 1.0 / _1353;
    float _1391 = _1365 * _1371;
    float _1393 = -_1365;
    float _1395 = _1393 + 1.0;
    float _1397 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1399 = _1397 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1401 = _1387 * _1395;
    float _1403 = 1.0 / _1375;
    float _1405 = _1399 * _1319;
    float _1407 = -_1387;
    float _1409 = _1407 + 1.0;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1413 = _1411 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1415;
    float _1419 = 1.0 / _1413;
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1423 = _1421 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1425 = _1341 * _1401;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1429 = _1241 + _1427;
    float _1431 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1425);
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1435 = _1433 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1437 = 1.0 / _1423;
    float _1439 = _1417 * _1403;
    float _1441 = fma(_1405, _1429, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1445 = _1241 + _1443;
    float _1447 = fma(_1441, _1391, _1431);
    float _1449 = fma(_1439, _1445, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1451 = 1.0 / _1435;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1455 = _1453 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1457 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1457;
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1463 = _1241 + _1461;
    float _1465 = _1455 * _1389;
    float _1467 = fma(_1449, _1367, _1447);
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1473 = _1459 * _1437;
    float _1475 = fma(_1465, _1463, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1479 = _1241 + _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1481;
    bool _1485 = _1241 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1487 = isnan(_1241);
    bool _1489 = _1485 || _1487;
    bool _1491 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1493 = _1489 || _1491;
    float _1495 = float(_1493);
    float _1497 = _1471 * _1419;
    float _1499 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1501 = _1241 + _1499;
    float _1503 = fma(_1473, _1479, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1505 = fma(_1475, _1345, _1467);
    float _1507 = _1483 * _1451;
    float _1509 = fma(_1497, _1501, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1511 = -_1495;
    float _1513 = _1511 + 1.0;
    float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1517 = _1241 + _1515;
    float _1519 = fma(_1503, _1343, _1505);
    float _1521 = _1257 * _1513;
    float _1523 = fma(_1507, _1517, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1525 = fma(_1509, _1327, _1519);
    float _1527 = fma(_1523, _1521, _1525);
    float _1529 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1527);
    float _1531 = precise::clamp(_1529, 0.0, 1.0);
    bool _1533 = !_1317;
    float _1551;
    if (!_1533)
    {
        float _1535 = in.m_55.x;
        float _1537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1539 = _1535 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1541 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[14].z, _139);
        float _1543 = _1541 * _1537;
        float _1545 = floor(_1543);
        float _1547 = -_1545;
        float _1549 = _1543 + _1547;
        _1551 = _1549;
        _1553 = true;
    }
    else
    {
        float _1555 = float(_105);
        float _1557 = 1.0 / _1555;
        float _1559 = _139 * _1557;
        _1551 = _1559;
    }
    _1553 = false;
    float _1561 = _1551;
    int _1563 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1565 = _1563;
    int _1567 = 0;
    int _1569 = _96(_1565, _1567, (*spvDescriptorSet0.support_buffer));
    float _1571 = in.m_61.z;
    float _1573 = trunc(_1571);
    int _1575 = int(_1573);
    int _1577 = _1569 + (-1);
    float _1579 = float(_1577);
    float _1581 = _1531 * _1579;
    float _1583 = trunc(_1581);
    int _1585 = int(_1583);
    int _1587 = _1585;
    int _1589 = 0;
    int _1591 = _97(_1587, _1589, (*spvDescriptorSet0.support_buffer));
    int _1593 = _1575;
    int _1595 = 0;
    int _1597 = _97(_1593, _1595, (*spvDescriptorSet0.support_buffer));
    float4 _1600 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1591, _1597)), 0).xyzw;
    float _1602 = _1600.x;
    float _1604 = _1600.y;
    float _1606 = _1600.z;
    float _1608 = _1600.w;
    float _1610 = in.m_55.w;
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1614 = _1612 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1618 = _1616 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1622 = _1620 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1624 = 1.0 / _1614;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1628 = _1626 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1632 = _1630 != 0;
    float _1634 = 1.0 / _1618;
    bool _1636 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1638 = isnan(_1561);
    bool _1640 = _1636 || _1638;
    bool _1642 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1644 = _1640 || _1642;
    float _1646 = float(_1644);
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1650 = _1648 != 0;
    int _1652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1654 = _1652 != 0;
    float _1656 = -_1646;
    float _1658 = _1656 + 1.0;
    int _1660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1662 = _1660 != 0;
    float _1664 = 1.0 / _1622;
    bool _1666 = _1610 > 0.5;
    bool _1668 = _1666 && _1632;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1670;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    bool _1678 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1680 = isnan(_1561);
    bool _1682 = _1678 || _1680;
    bool _1684 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1686 = _1682 || _1684;
    float _1688 = float(_1686);
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1690;
    float _1694 = _1672 * _1624;
    float _1696 = 1.0 / _1628;
    bool _1698 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1700 = isnan(_1561);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1706 = _1702 || _1704;
    float _1708 = float(_1706);
    float _1710 = _1676 * _1634;
    float _1712 = _1688 * _1658;
    float _1714 = -_1688;
    float _1716 = _1714 + 1.0;
    bool _1718 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1720 = isnan(_1561);
    bool _1722 = _1718 || _1720;
    bool _1724 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1726 = _1722 || _1724;
    float _1728 = float(_1726);
    float _1730 = -_1708;
    float _1732 = _1730 + 1.0;
    bool _1734 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1736 = isnan(_1561);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1742 = _1738 || _1740;
    float _1744 = float(_1742);
    float _1746 = _1692 * _1664;
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1750 = _1748 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1752 = _1708 * _1716;
    float _1754 = _1728 * _1732;
    float _1756 = -_1728;
    float _1758 = _1756 + 1.0;
    float _1760 = -_1744;
    float _1762 = _1760 + 1.0;
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1766 = _1764 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1768 = _1750 * _1696;
    bool _1770 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1772 = isnan(_1561);
    bool _1774 = _1770 || _1772;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1778 = _1774 || _1776;
    float _1780 = float(_1778);
    float _1782 = _1744 * _1758;
    float _1784 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1786 = _1561 + _1784;
    bool _1788 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1790 = isnan(_1561);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1796 = _1792 || _1794;
    float _1798 = float(_1796);
    float _1800 = _1780 * _1762;
    float _1802 = -_1780;
    float _1804 = _1802 + 1.0;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1808 = _1806 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1810 = fma(_1694, _1786, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1812 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1814 = _1561 + _1812;
    float _1816 = _1798 * _1804;
    float _1818 = 1.0 / _1808;
    float _1820 = fma(_1710, _1814, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1822 = _1810 * _1816;
    float _1824 = -_1798;
    float _1826 = _1824 + 1.0;
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1830 = _1828 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1832 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1834 = _1832 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1836 = in.m_61.x;
    float _1838 = 1.0 / _1766;
    float _1840 = fma(_1826, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1822);
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1844 = _1561 + _1842;
    float _1846 = in.m_61.y;
    float _1848 = fma(_1746, _1844, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1850 = fma(_1820, _1800, _1840);
    float _1852 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1854 = _1561 + _1852;
    float _1856 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1856;
    float _1860 = 1.0 / _1830;
    float _1862 = _1834 * _1818;
    float _1864 = fma(_1768, _1854, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1866 = _1818;
    float _1868 = _1646;
    float _1870 = _1712;
    int _1872 = as_type<int>(_1561);
    int _1874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[182].x);
    if (_1650)
    {
        float _1876 = in.m_55.x;
        _1866 = _1876;
    }
    float _1878 = _1866;
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1880;
    float _1884 = fma(_1848, _1782, _1850);
    float _1886 = _1858 * _1838;
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1890 = _1561 + _1888;
    float _1892 = _1840;
    if (_1654)
    {
        float _1894 = in.m_55.z;
        _1892 = _1894;
    }
    float _1896 = _1892;
    bool _1898 = _1561 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1900 = isnan(_1561);
    bool _1902 = _1898 || _1900;
    bool _1904 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1906 = _1902 || _1904;
    float _1908 = float(_1906);
    float _1910 = fma(_1864, _1754, _1884);
    float _1912 = fma(_1886, _1890, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1914 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1916 = _1561 + _1914;
    float _1918 = in.m_55.y;
    float _1920 = -_1908;
    float _1922 = _1920 + 1.0;
    float _1924 = fma(_1912, _1752, _1910);
    float _1926 = _1882 * _1860;
    float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1930 = _1561 + _1928;
    float _1932 = _1646 * _1922;
    int _1934 = as_type<int>(_1924);
    if (!_1650)
    {
        _1868 = _1836;
    }
    float _1936 = _1868;
    float _1938 = -_1846;
    float _1940 = _1938 + 1.0;
    float _1942 = fma(_1862, _1930, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1944 = fma(_1926, _1916, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1948 = fma(_1942, _1712, _1924);
    float _1950 = _1936;
    if (!_1650)
    {
        _1870 = _1936;
    }
    float _1952 = _1870;
    float _1954 = _1952;
    if (_1650)
    {
        _1950 = _1836;
    }
    float _1956 = _1950;
    float _1958 = fma(_1944, _1932, _1948);
    float _1960 = _1668 ? _1940 : _1846;
    bool _1962 = false;
    float _1964 = _1956;
    if (_1650)
    {
        bool _1966 = _1878 > 0.5;
        _1962 = _1966;
    }
    bool _1968 = _1962;
    if (_1650)
    {
        float _1970 = -_1956;
        float _1972 = _1970 + 1.0;
        _1872 = as_type<int>(_1972);
    }
    int _1974 = _1872;
    if (_1654)
    {
        float _1976 = -_1956;
        float _1978 = _1976 + 1.0;
        _1934 = as_type<int>(_1978);
    }
    int _1980 = _1934;
    bool _1982 = false;
    if (_1654)
    {
        bool _1984 = _1896 > 0.5;
        _1982 = _1984;
    }
    bool _1986 = _1982;
    float _1988 = fma(_1908, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1958);
    bool _1990 = _1918 > 0.5;
    bool _1992 = _1990 && _1662;
    float _1994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1650)
    {
        float _1996 = _1968 ? as_type<float>(_1974) : _1956;
        _1954 = _1996;
    }
    float _1998 = _1954;
    float _2000 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2002 = _1585 + 1;
    out.m_63.x = _1988;
    if (_1654)
    {
        float _2004 = _1986 ? as_type<float>(_1980) : _1956;
        _1964 = _2004;
    }
    float _2006 = _1964;
    int _2008 = min(_1577, _2002);
    float _2010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2012 = _1992 ? _1940 : _1846;
    float _2014 = _2012 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2016 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2018 = _2014 * _2010;
    float _2020 = _2006 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2022 = _2020 * _1994;
    float _2024 = _2000 * _2016;
    uint _2027 = as_type<uint>(half2(float2(_1608, 0.0)));
    uint _2029 = extract_bits(_2027, 0u, 8u);
    int _2031 = int(_2029) & 255;
    uint _2033 = extract_bits(_2027, 8u, 8u);
    int _2035 = int(_2033) & 255;
    int _2037 = _2035 << 8;
    int _2039 = _2031 | _2037;
    bool _2041 = _2039 >= 32768;
    int _2043 = _2039 + (-1024);
    int _2045 = _2043;
    if (_2041)
    {
        int _2047 = ~_2039;
        int _2049 = _2047 + 33792;
        int _2051 = _2049 + 1;
        _2045 = _2051;
    }
    int _2053 = _2045;
    int _2055 = _2053 + 30719;
    float _2057 = float(_2055);
    float _2059 = fma(_2057, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2061 = abs(_2059);
    float _2063 = -_2061;
    float _2065 = _2063 + 1.0;
    float _2067 = abs(_2059);
    float _2069 = fma(_2067, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2071 = as_type<int>(_2065) + (-218103808);
    float _2073 = abs(_2059);
    float _2075 = fma(_2073, _2069, -0.212114393711090087890625);
    bool _2077 = uint(_2071) >= 1920991232u;
    float _2079 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2081 = _2059 < 0.0;
    float _2083 = float(_2081);
    float _2085 = abs(_2059);
    float _2087 = fma(_2085, _2075, 1.570728778839111328125);
    float _2089 = _2079 * _1946;
    bool _2091 = !_2077;
    float _2113;
    if (!_2091)
    {
        int _2093 = as_type<int>(_2065);
        int _2095 = as_type<int>(_1932);
        int _2097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[182].x);
        int _2099 = 10608;
        int _2101;
        int _2103;
        int _2105;
        int _2107;
        int _2109;
        int _2111;
        _94(_2093, _2095, _2097, _2099, _2101, _2103, _2105, _2107, _2109, _2111, out.gl_Position, out.gl_PointSize);
        _2113 = as_type<float>(_2101);
        _1874 = _2107;
        _2115 = true;
    }
    else
    {
        float _2117 = rsqrt(_2065);
        float _2119 = _2065 * _2117;
        float _2121 = _2117 * 0.5;
        float _2123 = -_2119;
        float _2125 = 0.0 + _2123;
        float _2127 = fma(_2121, _2125, 0.5);
        float _2129 = fma(_2119, _2127, _2119);
        float _2131 = -_2129;
        float _2133 = 0.0 + _2131;
        float _2135 = fma(_2129, _2133, _2065);
        float _2137 = fma(_2121, _2135, _2129);
        _2113 = _2137;
    }
    _2115 = false;
    float _2139 = _2113;
    int _2141 = _1874;
    int _2143 = _2008;
    int _2145 = 0;
    int _2147 = _97(_2143, _2145, (*spvDescriptorSet0.support_buffer));
    int _2149 = _1575;
    int _2151 = 0;
    int _2153 = _97(_2149, _2151, (*spvDescriptorSet0.support_buffer));
    float4 _2155 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2147, _2153)), 0).xyzw;
    float _2157 = _2155.x;
    float _2159 = _2155.y;
    float _2161 = _2155.z;
    float _2163 = _2155.w;
    float _2165 = _2087 * _2139;
    float _2167 = _2083 * 2.0;
    float _2169 = _2057 * 3.883221149444580078125;
    float _2171 = floor(_1581);
    float _2173 = -_2167;
    float _2175 = fma(_2165, _2173, _2165);
    float _2177 = _2169 * 0.15915493667125701904296875;
    float _2179 = fma(_2083, 3.1415927410125732421875, _2175);
    float _2181 = _2177 * 6.283185482025146484375;
    float _2183 = cos(_2181);
    float _2185 = _2179 * 0.15915493667125701904296875;
    float _2187 = _2185 * 6.283185482025146484375;
    float _2189 = sin(_2187);
    float _2191 = -_2171;
    float _2193 = _1581 + _2191;
    float _2195 = _2177 * 6.283185482025146484375;
    float _2197 = sin(_2195);
    float _2199 = _2189 * _2183;
    float _2201 = _2189 * _2197;
    uint _2203 = as_type<uint>(half2(float2(_2163, 0.0)));
    float _2205 = -_1602;
    float _2207 = _2205 + _2157;
    float _2209 = -_1606;
    float _2211 = _2209 + _2161;
    uint _2213 = extract_bits(_2203, 0u, 8u);
    int _2215 = int(_2213) & 255;
    uint _2217 = extract_bits(_2203, 8u, 8u);
    int _2219 = int(_2217) & 255;
    int _2221 = _2219 << 8;
    int _2223 = _2215 | _2221;
    float _2225 = fma(_2193, _2207, _1602);
    float _2227 = fma(_2193, _2211, _1606);
    bool _2229 = _2223 >= 32768;
    int _2231 = _2223 + (-1024);
    int _2233 = _2231;
    if (_2229)
    {
        int _2235 = ~_2223;
        int _2237 = _2235 + 33792;
        int _2239 = _2237 + 1;
        _2233 = _2239;
    }
    int _2241 = _2233;
    int _2243 = _2241 + 30719;
    float _2245 = float(_2243);
    float _2247 = fma(_2245, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2249 = abs(_2247);
    float _2251 = -_2249;
    float _2253 = _2251 + 1.0;
    bool _2255 = _2247 < 0.0;
    float _2257 = float(_2255);
    float _2259 = abs(_2247);
    float _2261 = fma(_2259, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _2263 = -_1604;
    float _2265 = _2263 + _2159;
    int _2267 = as_type<int>(_2253) + (-218103808);
    float _2269 = abs(_2247);
    float _2271 = fma(_2269, _2261, -0.212114393711090087890625);
    float _2273 = fma(_2193, _2265, _1604);
    bool _2275 = uint(_2267) >= 1920991232u;
    float _2277 = abs(_2247);
    float _2279 = fma(_2277, _2271, 1.570728778839111328125);
    bool _2281 = !_2275;
    float _2303;
    if (!_2281)
    {
        int _2283 = as_type<int>(_2253);
        int _2285 = as_type<int>(_2261);
        int _2287 = _2141;
        int _2289 = 11504;
        int _2291;
        int _2293;
        int _2295;
        int _2297;
        int _2299;
        int _2301;
        _94(_2283, _2285, _2287, _2289, _2291, _2293, _2295, _2297, _2299, _2301, out.gl_Position, out.gl_PointSize);
        _2303 = as_type<float>(_2291);
        _2305 = true;
    }
    else
    {
        float _2307 = rsqrt(_2253);
        float _2309 = _2253 * _2307;
        float _2311 = _2307 * 0.5;
        float _2313 = -_2309;
        float _2315 = 0.0 + _2313;
        float _2317 = fma(_2311, _2315, 0.5);
        float _2319 = fma(_2309, _2317, _2309);
        float _2321 = -_2319;
        float _2323 = 0.0 + _2321;
        float _2325 = fma(_2319, _2323, _2253);
        float _2327 = fma(_2311, _2325, _2319);
        _2303 = _2327;
    }
    _2305 = false;
    float _2329 = _2303;
    float _2331 = in.m_55.x;
    float _2333 = in.m_55.y;
    float _2335 = in.m_55.z;
    float _2337 = _605 * _605;
    float _2339 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2341 = log2(_2339);
    float _2343 = _2279 * _2329;
    float _2345 = fma(_607, _607, _2337);
    float _2347 = _1077 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _2349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2351 = _2349 != 0;
    int _2353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2355 = _2353 != 0;
    int _2357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2359 = _2357 != 0;
    float _2361 = fma(_609, _609, _2345);
    float _2363 = _2245 * 3.883221149444580078125;
    float _2365 = _433 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2367 = -_2059;
    float _2369 = _2367 + _2247;
    float _2371 = rsqrt(_2361);
    float _2373 = _2363 * 0.15915493667125701904296875;
    float _2375 = _433 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2377 = _2335 * 2.0;
    float _2379 = _2331 * 2.0;
    float _2381 = _2333 * 2.0;
    float _2383 = floor(_2379);
    float _2385 = floor(_2377);
    float _2387 = _2331 + _2335;
    float _2389 = _2387 + (-1.0);
    float _2391 = floor(_2381);
    bool _2393 = _2383 >= 0.0;
    bool _2395 = isnan(_2383);
    bool _2397 = _2393 || _2395;
    bool _2399 = isnan(0.0);
    bool _2401 = _2397 || _2399;
    bool _2403 = _2385 > 0.0;
    float _2405 = _2341 * _139;
    bool _2407 = _2385 >= 0.0;
    bool _2409 = isnan(_2385);
    bool _2411 = _2407 || _2409;
    bool _2413 = isnan(0.0);
    bool _2415 = _2411 || _2413;
    float _2417 = _2333 + _2331;
    float _2419 = fma(_2389, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2421 = _2371 * _605;
    int _2423 = _2415 ? 0 : 1;
    float _2425 = _2417 + (-1.0);
    bool _2427 = _2383 > 0.0;
    int _2429 = ~_2423;
    int _2431 = _2429 + 1;
    int _2433 = _2431 + 1;
    float _2435 = fma(_2425, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2437 = exp2(_2405);
    int _2439 = _2433;
    if (!_2403)
    {
        int _2441 = ~_2423;
        int _2443 = _2441 + 1;
        _2439 = _2443;
    }
    int _2445 = _2439;
    bool _2447 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2449 = isnan(1.0);
    bool _2451 = _2447 || _2449;
    bool _2453 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2455 = _2451 || _2453;
    float _2457 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2459 = 1.0 + _2457;
    float _2461 = _2371 * _607;
    bool _2463 = !_2351;
    int _2465 = _2463 ? 0 : 1;
    float _2467 = 1.0 / _2459;
    float _2469 = _2371 * _609;
    int _2471 = abs(_2465);
    float _2473 = in.m_65.x;
    float _2475 = in.m_65.y;
    float _2477 = in.m_65.z;
    bool _2479 = _2391 > 0.0;
    float _2481 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2483 = _2461 * _2481;
    float _2485 = float(_2471);
    float _2487 = float(_2445);
    float _2489 = -_2437;
    float _2491 = _2489 + 1.0;
    bool _2493 = _2391 >= 0.0;
    bool _2495 = isnan(_2391);
    bool _2497 = _2493 || _2495;
    bool _2499 = isnan(0.0);
    bool _2501 = _2497 || _2499;
    int _2503 = _2401 ? 0 : 1;
    float _2505 = _2485 * _2487;
    bool _2507 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2509 = isnan(0.0);
    bool _2511 = _2507 || _2509;
    bool _2513 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2515 = _2511 || _2513;
    float _2517 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2519 = _2421 * _2517;
    int _2521 = _2501 ? 0 : 1;
    float _2523 = _2505 * (-2.0);
    bool _2525 = !_2359;
    int _2527 = _2525 ? 0 : 1;
    float _2529 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2531 = -_2519;
    float _2533 = fma(_2469, _2529, _2531);
    float _2535 = _2515 ? _2491 : 0.0;
    int _2537 = ~_2503;
    int _2539 = _2537 + 1;
    int _2541 = _2539 + 1;
    int _2543 = ~_2521;
    int _2545 = _2543 + 1;
    int _2547 = _2545 + 1;
    int _2549 = _2541;
    int _2551 = _2547;
    if (_2455)
    {
        float _2553 = _2535 * _2467;
        _145 = _2553;
    }
    float _2555 = _145;
    if (!_2427)
    {
        int _2557 = ~_2503;
        int _2559 = _2557 + 1;
        _2549 = _2559;
    }
    int _2561 = _2549;
    float _2563 = _2331 + (-0.5);
    if (!_2479)
    {
        int _2565 = ~_2521;
        int _2567 = _2565 + 1;
        _2551 = _2567;
    }
    int _2569 = _2551;
    float _2571 = fma(_2523, _2473, _2473);
    int _2573 = abs(_2527);
    float _2575 = fma(_2435, _2523, _2435);
    float _2577 = float(_2569);
    float _2579 = fma(_2563, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2571);
    float _2581 = float(_2573);
    float _2583 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2585 = _2469 * _2583;
    bool _2587 = !_2355;
    int _2589 = _2587 ? 0 : 1;
    float _2591 = fma(_2575, _2555, _2579);
    float _2593 = _2335 + (-0.5);
    float _2595 = _2581 * _2577;
    int _2597 = abs(_2589);
    float _2599 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2601 = -_2585;
    float _2603 = fma(_2461, _2599, _2601);
    float _2605 = float(_2561);
    float _2607 = _2595 * (-2.0);
    float _2609 = _2591 * 0.15915493667125701904296875;
    float _2611 = float(_2597);
    float _2613 = _2603 * _2603;
    float _2615 = fma(_2607, _2477, _2477);
    float _2617 = fma(_2419, _2607, _2419);
    float _2619 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2621 = -_2483;
    float _2623 = fma(_2421, _2619, _2621);
    float _2625 = _2611 * _2605;
    float _2627 = fma(_2593, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2615);
    float _2629 = _2333 + _2335;
    float _2631 = _2625 * (-2.0);
    float _2633 = _2333 + (-0.5);
    float _2635 = _2629 + (-1.0);
    float _2637 = fma(_2533, _2533, _2613);
    float _2639 = fma(_2631, _2475, _2475);
    float _2641 = fma(_2617, _2555, _2627);
    float _2643 = fma(_2635, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2645 = fma(_2623, _2623, _2637);
    float _2647 = fma(_2633, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2639);
    float _2649 = _2641 * 0.15915493667125701904296875;
    float _2651 = fma(_2643, _2631, _2643);
    float _2653 = _2609 * 6.283185482025146484375;
    float _2655 = sin(_2653);
    float _2657 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2273);
    bool _2659 = _2273 != 0.0;
    bool _2661 = isnan(_2273);
    bool _2663 = _2659 || _2661;
    bool _2665 = isnan(0.0);
    bool _2667 = _2663 || _2665;
    float _2669 = fma(_2651, _2555, _2647);
    float _2671 = _1079 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2673 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2227);
    float _2675 = _2257 * 2.0;
    float _2677 = _2669 * 0.15915493667125701904296875;
    float _2679 = rsqrt(_2645);
    float _2681 = _1081 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2683 = _2347 * _2673;
    float _2685 = -_2675;
    float _2687 = fma(_2343, _2685, _2343);
    float _2689 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2225);
    float _2691 = _2671 * _2657;
    bool _2693 = _2225 == 0.0;
    bool _2695 = !_2667;
    bool _2697 = _2693 && _2695;
    float _2699 = fma(_2257, 3.1415927410125732421875, _2687);
    float _2701 = _2609 * 6.283185482025146484375;
    float _2703 = cos(_2701);
    float _2705 = _2681 * _2689;
    bool _2707 = _2227 == 0.0;
    bool _2709 = _2707 && _2697;
    float _2711 = _2649 * 6.283185482025146484375;
    float _2713 = sin(_2711);
    float _2715 = _2603 * _2679;
    float _2717 = _2623 * _2679;
    float _2719 = _2533 * _2679;
    float _2721 = _433 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2723 = _2649 * 6.283185482025146484375;
    float _2725 = cos(_2723);
    float _2727 = _2677 * 6.283185482025146484375;
    float _2729 = sin(_2727);
    float _2731 = _2703 * _2713;
    float _2733 = _2655 * _2713;
    float _2735 = _2677 * 6.283185482025146484375;
    float _2737 = cos(_2735);
    float _2739 = _2703 * _2725;
    float _2741 = _2655 * _2725;
    float _2743 = -_2731;
    float _2745 = fma(_2729, _2741, _2743);
    float _2747 = fma(_2729, _2733, _2739);
    float _2749 = -_2741;
    float _2751 = fma(_2729, _2731, _2749);
    float _2753 = fma(_2729, _2739, _2733);
    float _2755 = _2421 * _2717;
    float _2757 = _2747 * _2461;
    float _2759 = _2751 * _2461;
    float _2761 = _2747 * _2469;
    float _2763 = _2737 * _2713;
    float _2765 = _2703 * _2737;
    float _2767 = _2737 * _2725;
    float _2769 = _2655 * _2737;
    float _2771 = _2763 * _2461;
    float _2773 = -_2755;
    float _2775 = fma(_2469, _2715, _2773);
    float _2777 = fma(_2745, _2719, _2757);
    float _2779 = fma(_2753, _2719, _2759);
    float _2781 = fma(_2767, _2719, _2771);
    float _2783 = _2751 * _2469;
    float _2785 = fma(_2769, _2775, _2777);
    float _2787 = fma(_2765, _2775, _2779);
    float _2789 = -_2729;
    float _2791 = fma(_2789, _2775, _2781);
    float _2793 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2365);
    float _2795 = _2461 * _2715;
    float _2797 = _2763 * _2469;
    float _2799 = fma(_2753, _2717, _2783);
    float _2801 = _2699 * 0.15915493667125701904296875;
    float _2803 = -_2795;
    float _2805 = fma(_2421, _2719, _2803);
    float _2807 = fma(_2745, _2717, _2761);
    float _2809 = fma(_2767, _2717, _2797);
    float _2811 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2721);
    float _2813 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2793);
    float _2815 = fma(_2769, _2805, _2807);
    float _2817 = fma(_2765, _2805, _2799);
    float _2819 = -_2729;
    float _2821 = fma(_2819, _2805, _2809);
    float _2823 = _2691 * _2785;
    float _2825 = _2691 * _2815;
    float _2827 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2811);
    float _2829 = _2373 * 6.283185482025146484375;
    float _2831 = sin(_2829);
    float _2833 = fma(_2705, _2791, _2823);
    float _2835 = fma(_2705, _2821, _2825);
    float _2837 = _2813 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2839 = _2827 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2841 = fma(_2683, _2787, _2833);
    float _2843 = fma(_2683, _2817, _2835);
    float _2845 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2375);
    float _2847 = _2801 * 6.283185482025146484375;
    float _2849 = sin(_2847);
    float _2851 = _2837 + _2841;
    float _2853 = _2839 + _2843;
    float _2855 = _2469 * _2719;
    float _2857 = _2747 * _2421;
    float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2861 = _2851 + _2859;
    float _2863 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2865 = _2853 + _2863;
    float _2867 = _2763 * _2421;
    float _2869 = -_2855;
    float _2871 = fma(_2461, _2717, _2869);
    float _2873 = _2861 * _2861;
    float _2875 = _2865 * _2865;
    float _2877 = fma(_2745, _2715, _2857);
    float _2879 = fma(_2767, _2715, _2867);
    float _2881 = _2751 * _2421;
    float _2883 = _2873 + _2875;
    float _2885 = fma(_2769, _2871, _2877);
    float _2887 = -_2201;
    float _2889 = fma(_2849, _2831, _2887);
    float _2891 = fma(_2193, _2369, _2059);
    float _2893 = _2373 * 6.283185482025146484375;
    float _2895 = cos(_2893);
    float _2897 = fma(_2753, _2715, _2881);
    float _2899 = fma(_2193, _2889, _2201);
    float _2901 = fma(_2273, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2891);
    float _2903 = -_2729;
    float _2905 = fma(_2903, _2871, _2879);
    float _2907 = _2691 * _2885;
    float _2909 = fma(_2227, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2899);
    float _2911 = fma(_2765, _2871, _2897);
    float _2913 = sqrt(_2883);
    float _2915 = _2709 ? _2891 : _2901;
    float _2917 = fma(_2705, _2905, _2907);
    float _2919 = _2709 ? _2899 : _2909;
    float _2921 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2845);
    float _2923 = _2915 * _2915;
    float _2925 = fma(_2683, _2911, _2917);
    float _2927 = _2921 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2929 = -_2199;
    float _2931 = fma(_2849, _2895, _2929);
    float _2933 = fma(_2919, _2919, _2923);
    float _2935 = _2927 + _2925;
    float _2937 = fma(_2193, _2931, _2199);
    float _2939 = rsqrt(_2933);
    bool _2941 = _2913 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2943 = _2873;
    float _2945 = _2875;
    float _2947 = _2883;
    float _2949 = _2851;
    float _2951 = _2853;
    float _2953 = _2891;
    float _2955 = _2937;
    if (!_2941)
    {
        _443 = _2935;
    }
    float _2957 = _443;
    bool _2959 = !_2941;
    float _2961 = _2957;
    if (!_2959)
    {
        float _2963 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2967 = _2913 + _2965;
        float _2969 = rsqrt(_2883);
        float _2971 = _2967 * _2963;
        float _2973 = _2935 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2975 = _2971 * 0.15915493667125701904296875;
        float _2977 = _2975 * 6.283185482025146484375;
        float _2979 = sin(_2977);
        float _2981 = _2975 * 6.283185482025146484375;
        float _2983 = cos(_2981);
        float _2985 = fma(_2979, _2973, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2987 = _2969 * _2985;
        float _2989 = _2983 + (-1.0);
        float _2991 = _2861 * _2987;
        float _2993 = _2865 * _2987;
        float _2995 = _2989 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2997 = _2991 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2999 = _2991 * _2991;
        float _3001 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3003 = fma(_2935, _2983, _2995);
        float _3005 = _2993 * _2993;
        _2961 = _3003;
        _2943 = _2999;
        _2945 = _3005;
        _2947 = _2969;
        _2949 = _2997;
        _2951 = _3001;
    }
    float _3007 = _2961;
    float _3009 = _2943;
    float _3011 = _2945;
    float _3013 = _2947;
    float _3015 = _2949;
    float _3017 = _2951;
    float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3021 = _3007 + _3019;
    float _3023 = _3013;
    if (!_2709)
    {
        _2953 = _2901;
    }
    float _3025 = _2953;
    if (!_2709)
    {
        float _3027 = fma(_2225, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2937);
        _2955 = _3027;
    }
    float _3029 = _2955;
    if (_2709)
    {
        _3023 = _2899;
    }
    float _3031 = _3023;
    float _3033 = fma(_3021, _3021, _3009);
    float _3035 = _2915 * _2939;
    float _3037 = _3031;
    if (!_2709)
    {
        _3037 = _2909;
    }
    float _3039 = _3037;
    float _3041 = _2885 * _3025;
    float _3043 = _3033 + _3011;
    float _3045 = _2785 * _3025;
    float _3047 = _2815 * _3025;
    float _3049 = _2919 * _2939;
    float _3051 = -_3035;
    float _3053 = _2817 * _3051;
    float _3055 = fma(_2905, _3029, _3041);
    float _3057 = sqrt(_3043);
    float _3059 = -_3035;
    float _3061 = _2787 * _3059;
    float _3063 = -_3035;
    float _3065 = _2911 * _3063;
    float _3067 = fma(_2791, _3029, _3045);
    float _3069 = fma(_2821, _3029, _3047);
    float _3071 = fma(_2815, _3049, _3053);
    float _3073 = fma(_2911, _3039, _3055);
    float _3075 = fma(_2785, _3049, _3061);
    float _3077 = fma(_2885, _3049, _3065);
    float _3079 = fma(_2787, _3039, _3067);
    float _3081 = fma(_2817, _3039, _3069);
    out.m_67.x = _2089;
    out.m_67.y = _2018;
    out.m_67.z = _2022;
    out.m_67.w = _2024;
    out.m_69.x = _2791;
    out.m_69.y = _2905;
    out.m_69.z = _2821;
    bool _3083 = _3057 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3085 = isnan(_3057);
    bool _3087 = _3083 || _3085;
    bool _3089 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3091 = _3087 || _3089;
    out.m_71.x = _3075;
    out.m_71.y = _3077;
    out.m_71.z = _3071;
    out.m_73.x = _3079;
    out.m_73.y = _3073;
    out.m_73.z = _3081;
    float _3093 = _3049;
    float _3095 = _3075;
    float _3097 = _3079;
    if (!_3091)
    {
        _3093 = 1.0;
    }
    float _3099 = _3093;
    bool _3101 = !_3091;
    float _3103 = _3099;
    if (!_3101)
    {
        bool _3105 = _3057 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3107 = isnan(_3057);
        bool _3109 = _3105 || _3107;
        bool _3111 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3113 = _3109 || _3111;
        if (!_3113)
        {
            float _3115 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3117 = _3057 + _3115;
            float _3119 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3121 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3119;
            float _3123 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3125 = _3123 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3127 = 1.0 / _3121;
            float _3129 = _3117 * _3127;
            float _3131 = fma(_3129, _3125, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3103 = _3131;
            _3133 = true;
        }
        else
        {
            bool _3135 = _3057 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3137 = isnan(_3057);
            bool _3139 = _3135 || _3137;
            bool _3141 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3143 = _3139 || _3141;
            if (!_3143)
            {
                float _3145 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3147 = _3057 + _3145;
                float _3149 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3151 = _3149 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3153 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3155 = _3153 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3157 = 1.0 / _3151;
                float _3159 = _3147 * _3157;
                float _3161 = fma(_3159, _3155, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3103 = _3161;
                _3133 = true;
            }
            else
            {
                _3103 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3133 = false;
    float _3163 = _3103;
    float _3165 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3167 = _3007 + _3165;
    float _3169 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3171 = _3015 + _3169;
    float _3173 = fma(_3167, _3163, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3175 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3177 = _3017 + _3175;
    float _3179 = fma(_3171, _3163, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3181 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3183 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3185 = _3173 + _3183;
    float _3187 = fma(_3177, _3163, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3189 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3191 = _3179 + _3189;
    float _3193 = _3185 * _3185;
    float _3195 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3197 = _3187 + _3195;
    float _3199 = fma(_3191, _3191, _3193);
    float _3201 = fma(_3197, _3197, _3199);
    float _3203 = rsqrt(_3201);
    float _3205 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3207 = _3191 * _3205;
    float _3209 = _3197 * _3205;
    float _3211 = _3207 * _3207;
    float _3213 = _3209 * _3209;
    float _3215 = _3211 + _3213;
    float _3217 = sqrt(_3215);
    bool _3219 = _3217 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3223 = _3217 + _3221;
    float _3225 = _3197;
    float _3227 = _3163;
    float _3229 = _3223;
    float _3231 = _3207;
    if (_3219)
    {
        float _3233 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3225 = _3233;
    }
    float _3235 = _3225;
    if (_3219)
    {
        float _3237 = rsqrt(_3215);
        _3227 = _3237;
    }
    float _3239 = _3227;
    float _3241 = _3239;
    if (_3219)
    {
        float _3243 = _3223 * _3235;
        _3229 = _3243;
    }
    float _3245 = _3229;
    float _3247 = _3173 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_3219)
    {
        float _3249 = _3245 * 0.15915493667125701904296875;
        _3095 = _3249;
    }
    float _3251 = _3095;
    float _3253 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3247);
    float _3255 = _3203;
    if (_3219)
    {
        float _3257 = _3251 * 6.283185482025146484375;
        float _3259 = sin(_3257);
        _3255 = _3259;
    }
    float _3261 = _3255;
    float _3263 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3265 = precise::max(0.0, _3263);
    float _3267 = _3193;
    float _3269 = _3265;
    float _3271 = _3263;
    if (_3219)
    {
        float _3273 = _3251 * 6.283185482025146484375;
        float _3275 = cos(_3273);
        _3267 = _3275;
    }
    float _3277 = _3267;
    float _3279 = -_3205;
    float _3281 = -_3265;
    float _3283 = fma(_3185, _3279, _3281);
    if (_3219)
    {
        float _3285 = _3283 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3269 = _3285;
    }
    float _3287 = _3269;
    float _3289 = sqrt(_3201);
    float _3291 = _3287;
    float _3293 = _3261;
    if (_3219)
    {
        float _3295 = fma(_3261, _3287, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3291 = _3295;
    }
    float _3297 = _3291;
    float _3299 = _3297;
    if (!_3219)
    {
        _3293 = _3209;
    }
    float _3301 = _3293;
    float _3303 = _3301;
    if (_3219)
    {
        float _3305 = _3277 + (-1.0);
        _3271 = _3305;
    }
    float _3307 = _3271;
    float _3309 = _3307;
    if (_3219)
    {
        float _3311 = _3239 * _3297;
        _3097 = _3311;
    }
    float _3313 = _3097;
    if (!_3219)
    {
        _3241 = _3283;
    }
    float _3315 = _3241;
    float _3317 = _3315;
    if (_3219)
    {
        float _3319 = _3307 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3309 = _3319;
    }
    float _3321 = _3309;
    float _3323 = _3321;
    if (_3219)
    {
        float _3325 = _3207 * _3313;
        _3231 = _3325;
    }
    float _3327 = _3231;
    if (!_3219)
    {
        _3299 = _3211;
    }
    float _3329 = _3299;
    float _3331 = _3329;
    if (_3219)
    {
        float _3333 = _3209 * _3313;
        _3303 = _3333;
    }
    float _3335 = _3303;
    if (_3219)
    {
        float _3337 = fma(_3283, _3277, _3321);
        _3317 = _3337;
    }
    float _3339 = _3317;
    if (_3219)
    {
        float _3341 = _3327 * _3327;
        _3331 = _3341;
    }
    float _3343 = _3331;
    if (!_3219)
    {
        _3323 = _3213;
    }
    float _3345 = _3323;
    float _3347 = _3345;
    if (_3219)
    {
        float _3349 = _3335 * _3335;
        _3347 = _3349;
    }
    float _3351 = _3347;
    float _3353 = fma(_3339, _3339, _3343);
    float _3355 = _3173 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3357 = _3353 + _3351;
    float _3359 = _3173 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3361 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3363 = fma(_3289, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3361);
    float _3365 = precise::clamp(_3363, 0.0, 1.0);
    float _3367 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3355);
    float _3369 = rsqrt(_3357);
    float _3371 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3359);
    float _3373 = _3173 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3375 = -_3365;
    float _3377 = _3375 + 1.0;
    float _3379 = fma(_3187, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3367);
    float _3381 = fma(_3187, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3371);
    float _3383 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3373);
    float _3385 = _3379 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3387 = _3381 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3389 = fma(_3187, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3383);
    float _3391 = abs(_3377);
    float _3393 = log2(_3391);
    float _3395 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3397 = _3389 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3399 = _3369 * _3327;
    float _3401 = _3369 * _3339;
    float _3403 = _3397 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3405 = -_3395;
    float _3407 = fma(_3405, _3181, 1.0);
    float _3409 = _3399 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3411 = fma(_3187, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3253);
    float _3413 = fma(_3385, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3403);
    float _3415 = _3369 * _3335;
    float _3417 = -_3409;
    float _3419 = fma(_3401, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3417);
    float _3421 = _3411 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3423 = fma(_3387, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3413);
    float _3425 = _3393 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3427 = -_3415;
    float _3429 = fma(_3427, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3419);
    float _3431 = _3397 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3433 = fma(_3421, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3423);
    float _3435 = exp2(_3425);
    float _3437 = fma(_3429, -0.5, 0.5);
    float _3439 = _3397 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3441 = fma(_3385, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3431);
    float _3443 = fma(_3429, 0.5, 0.5);
    float _3445 = fma(_3385, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3439);
    float _3447 = _3401 + 1.0;
    float _3449 = log2(_3407);
    float _3451 = fma(_3387, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3441);
    float _3453 = fma(_3387, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3445);
    float _3455 = fma(_3443, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3457 = fma(_3443, _3455, -0.212114393711090087890625);
    float _3459 = 1.0 / _3433;
    float _3461 = -_3401;
    float _3463 = fma(_3435, _3447, _3461);
    float _3465 = fma(_3421, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3451);
    float _3467 = fma(_3421, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3453);
    float _3469 = fma(_3443, _3457, 1.570728778839111328125);
    float _3471 = fma(_3463, 0.5, 0.5);
    float _3473 = sqrt(_3437);
    float _3475 = _3449 * 0.693147182464599609375;
    float _3477 = _3475 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3479 = _3465 * _3459;
    float _3481 = _3467 * _3459;
    float _3483 = fma(_3479, 0.5, 0.5);
    float _3485 = fma(_3481, -0.5, 0.5);
    float _3487 = _3473 * 0.636619746685028076171875;
    float3 _8810 = float3(_3483, _3485, _3477);
    float _3489 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8810, float3(0.0), isnan(_8810)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8810, float3(0.0), isnan(_8810)), level(0.0)).x;
    float3 _8821 = float3(_3483, _3485, _3477);
    float4 _3491 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8821, float3(0.0), isnan(_8821)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8821, float3(0.0), isnan(_8821)), level(0.0)).xyzw;
    float _3493 = _3491.x;
    float _3495 = _3491.y;
    float _3497 = _3491.z;
    float _3499 = _3491.w;
    float _3501 = -_3469;
    float _3503 = fma(_3487, _3501, 1.0);
    float2 _8842 = float2(_3503, _3471);
    float3 _3507 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8842, float2(0.0), isnan(_8842)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8842, float2(0.0), isnan(_8842)), level(0.0)).xyz;
    float _3509 = _3507.x;
    float _3511 = _3507.y;
    float _3513 = _3507.z;
    float _3515 = _3393 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3517 = _3397 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2837;
    out.m_75.y = _2927;
    out.m_75.z = _2839;
    float _3519 = fma(_3385, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3517);
    float _3521 = exp2(_3515);
    out.m_77.x = _3179;
    out.m_77.y = _3173;
    out.m_77.z = _3187;
    float _3523 = fma(_3387, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3519);
    float _3525 = fma(_3421, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3523);
    float _3527 = _3525 + _3433;
    out.gl_Position.x = _3465;
    out.gl_Position.y = _3467;
    out.gl_Position.z = _3525;
    out.gl_Position.w = _3433;
    float _3529 = -_3521;
    float _3531 = _3529 + 1.0;
    float _3533 = _3527 * 0.5;
    float _3535 = _3531 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3537 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3539 = -_3535;
    float _3541 = _3539 + 1.0;
    out.m_79.z = _3533;
    out.m_79.w = _3433;
    out.m_49.x = _3537;
    float _3543 = _3535 * _3489;
    float _3545 = _3499 * _3543;
    float _3547 = _3513 * _3543;
    float _3549 = fma(_3509, _3545, _3493);
    float _3551 = fma(_3511, _3545, _3495);
    float _3553 = _3499 * _3541;
    float _3555 = fma(_3499, _3547, _3497);
    out.m_81.x = _3549;
    out.m_81.y = _3551;
    out.m_81.z = _3555;
    out.m_81.w = _3553;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

