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
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c8 [[id(3)]];
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
    float4 m_59 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_67 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 m_83 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_57 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
};

static inline __attribute__((always_inline))
int _98(thread const int& _10504, thread const int& _10505, constant _10& support_buffer)
{
    float _10508 = as_type<float>(support_buffer._m4);
    int _10510 = _10505 + as_type<int>(_10508);
    int _10512 = 1 + _10510;
    float _10514 = support_buffer._m5[_10512].x;
    float _10516 = abs(_10514);
    bool _10518 = _10516 == 1.0;
    if (_10518)
    {
        return _10504;
    }
    float _10520 = float(_10504);
    float _10522 = _10520 / _10516;
    int _10524 = int(_10522);
    return _10524;
}

static inline __attribute__((always_inline))
int _99(thread const int& _10554, thread const int& _10555, constant _10& support_buffer)
{
    float _10558 = as_type<float>(support_buffer._m4);
    int _10560 = _10555 + as_type<int>(_10558);
    int _10562 = 1 + _10560;
    float _10564 = support_buffer._m5[_10562].x;
    bool _10566 = _10564 == 1.0;
    if (_10566)
    {
        return _10554;
    }
    float _10568 = float(_10554);
    float _10570 = _10568 * _10564;
    int _10572 = int(_10570);
    return _10572;
}

static inline __attribute__((always_inline))
void _96(thread const int& _10192, thread const int& _10193, thread const int& _10194, thread const int& _10195, thread int& _10196, thread int& _10197, thread int& _10198, thread int& _10199, thread int& _10200, thread int& _10201, thread int& _10202, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _10205 = _10193;
    int _10207 = _10192;
    int _10209 = _10194;
    float _10211 = 0.0 + as_type<float>(_10192);
    bool _10213 = _10211 != 0.0;
    bool _10215 = isnan(_10211);
    bool _10217 = _10213 || _10215;
    bool _10219 = isnan(0.0);
    bool _10221 = _10217 || _10219;
    int _10223 = 0;
    int _10225 = _10221 ? (-1) : 0;
    if (!_10221)
    {
        float _10227 = as_type<float>(_10192) * 1.0;
        _10205 = as_type<int>(_10227);
    }
    int _10229 = _10205;
    bool _10231 = !_10221;
    int _10233 = _10229;
    int _10235 = _10229;
    if (!_10231)
    {
        bool _10237 = _10211 >= 0.0;
        bool _10239 = isnan(_10211);
        bool _10241 = _10237 || _10239;
        bool _10243 = isnan(0.0);
        bool _10245 = _10241 || _10243;
        _10225 = _10245 ? (-1) : 0;
        if (!_10245)
        {
            _10233 = 2147483647;
        }
        int _10247 = _10233;
        bool _10249 = !_10245;
        int _10251 = _10247;
        _10235 = _10247;
        if (!_10249)
        {
            float _10253 = abs(as_type<float>(_10192));
            float _10255 = 0.0 + _10253;
            bool _10257 = _10255 > as_type<float>(0x7f800000u /* inf */);
            bool _10259 = isnan(_10255);
            bool _10261 = _10257 || _10259;
            bool _10263 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _10265 = _10261 || _10263;
            _10223 = 2139095040;
            _10225 = _10265 ? (-1) : 0;
            if (_10265)
            {
                float _10267 = as_type<float>(_10192) + 1.0;
                _10251 = as_type<int>(_10267);
            }
            int _10269 = _10251;
            int _10271 = _10269;
            _10235 = _10269;
            if (!_10265)
            {
                bool _10273 = _10255 != as_type<float>(0x7f800000u /* inf */);
                bool _10275 = isnan(_10255);
                bool _10277 = _10273 || _10275;
                bool _10279 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _10281 = _10277 || _10279;
                _10225 = _10281 ? (-1) : 0;
                if (!_10281)
                {
                    _10271 = _10192;
                }
                int _10283 = _10271;
                bool _10285 = !_10281;
                _10235 = _10283;
                if (!_10285)
                {
                    float _10287 = as_type<float>(_10192) * 18446744073709551616.0;
                    float _10289 = rsqrt(_10287);
                    float _10291 = _10287 * _10289;
                    float _10293 = _10289 * 0.5;
                    float _10295 = -_10291;
                    float _10297 = 0.0 + _10295;
                    float _10299 = fma(_10293, _10297, 0.5);
                    float _10301 = fma(_10291, _10299, _10291);
                    float _10303 = -_10301;
                    float _10305 = 0.0 + _10303;
                    float _10307 = fma(_10301, _10305, _10287);
                    float _10309 = fma(_10293, _10307, _10301);
                    float _10311 = _10309 * 2.3283064365386962890625e-10;
                    _10207 = as_type<int>(_10287);
                    _10223 = as_type<int>(_10309);
                    _10235 = as_type<int>(_10311);
                    _10209 = as_type<int>(_10301);
                }
            }
        }
    }
    int _10313 = _10207;
    int _10315 = _10223;
    int _10317 = _10235;
    int _10319 = _10209;
    int _10321 = _10225;
    _10196 = _10313;
    _10197 = _10315;
    _10198 = _10317;
    _10199 = _10195;
    _10200 = 0;
    _10201 = _10319;
    _10202 = _10321;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3669 = false;
    bool _2851 = false;
    bool _2659 = false;
    bool _1455 = false;
    bool _1081 = false;
    bool _907 = false;
    bool _695 = false;
    bool _521 = false;
    bool _305 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = in.m_48.w;
    float _107 = trunc(_103);
    int _109 = int(_107);
    float _111 = -_105;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _113;
    bool _117 = _109 >= 1;
    float _119 = 0.0;
    float _121 = as_type<float>(_109);
    float _123 = _113;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _119;
    if (!_117)
    {
        out.m_53.x = 0.0;
    }
    int _127 = 0;
    if (!_117)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4164 = as_type<float>(_131);
        out.gl_Position.z = _4164;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _135 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_105);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = float(_109);
    bool _147 = _113 >= _145;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    if (_151)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _121;
    if (_151)
    {
        out.m_53.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _133 = as_type<int>(_155);
    }
    int _157 = _133;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4219 = as_type<float>(_157);
        out.gl_Position.z = _4219;
    }
    if (_151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _159 = in.m_55.w;
    float _161 = 1.0 / _145;
    float _163 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_48.x;
    float _177 = in.m_48.y;
    float _179 = in.m_48.z;
    float _181 = in.m_46.x;
    float _183 = in.m_46.y;
    float _185 = in.m_46.z;
    float _187 = 0.0;
    float _189 = _163;
    if (!_173)
    {
        float _191 = _163 * _163;
        float _193 = _191 * 0.5;
        _187 = _193;
    }
    float _195 = _187;
    float _197 = _195;
    if (!_173)
    {
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    bool _203 = !_173;
    float _205 = _201;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _163 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _163);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    bool _239 = !_173;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _163 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _189 = _259;
    }
    float _261 = _189;
    bool _263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _265 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _267 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _271 = fma(_261, _175, _265);
    float _273 = fma(_261, _177, _267);
    float _275 = fma(_261, _179, _269);
    float _277 = fma(_271, _159, _181);
    float _279 = fma(_273, _159, _183);
    float _281 = fma(_275, _159, _185);
    float _283 = _113 * _161;
    bool _285 = !_263;
    float _303;
    if (!_285)
    {
        float _287 = in.m_57.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        _303 = _283;
    }
    _305 = false;
    float _307 = _303;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = _307 + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = _307 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _307 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _329;
    float _333 = 1.0 / _323;
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _337 = 1.0 / _331;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = 1.0 / _327;
    float _345 = _311 * _333;
    bool _347 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _349 = isnan(_307);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _359;
    float _363 = fma(_341, _345, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _365 = fma(_361, _345, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _367 = _315 * _337;
    bool _369 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _371 = isnan(_307);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = -_357;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _385;
    float _389 = _379 * _383;
    float _391 = fma(_387, _345, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _393 = _319 * _343;
    bool _395 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _397 = isnan(_307);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = -_379;
    float _409 = _407 + 1.0;
    bool _411 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _413 = isnan(_307);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _431 = -_405;
    float _433 = _431 + 1.0;
    float _435 = _405 * _409;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _441 = fma(_429, _393, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _443 = _421 * _433;
    float _445 = -_421;
    float _447 = _445 + 1.0;
    float _449 = fma(_439, _393, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _451 = fma(_425, _393, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _453 = _363 * _443;
    float _455 = _365 * _443;
    float _457 = _391 * _443;
    float _459 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].x, _453);
    float _461 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].y, _455);
    float _463 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].z, _457);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _469;
    float _473 = fma(_441, _435, _459);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _475;
    float _479 = fma(_467, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _481 = fma(_471, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _483 = fma(_449, _435, _461);
    float _485 = fma(_477, _367, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _487 = fma(_451, _435, _463);
    float _489 = fma(_479, _389, _473);
    float _491 = fma(_481, _389, _483);
    float _493 = fma(_485, _389, _487);
    float _495 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].x, _489);
    float _497 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].y, _491);
    float _499 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].z, _493);
    bool _501 = !_335;
    float _519;
    if (!_501)
    {
        float _503 = in.m_57.x;
        float _505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _507 = _503 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _509 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[11].x, _113);
        float _511 = _509 * _505;
        float _513 = floor(_511);
        float _515 = -_513;
        float _517 = _511 + _515;
        _519 = _517;
        _521 = true;
    }
    else
    {
        _519 = _283;
    }
    _521 = false;
    float _523 = _519;
    float _525 = in.m_55.x;
    float _527 = in.m_55.y;
    float _529 = in.m_55.z;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _533 = _523 + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _535;
    bool _539 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _541 = 1.0 / _537;
    float _543 = _497 * _527;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _549 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _551 = isnan(_523);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = _499 * _529;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _565 = _523 + _563;
    float _567 = 1.0 / _547;
    bool _569 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _571 = isnan(_523);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = _533 * _541;
    bool _583 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _585 = isnan(_523);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = -_559;
    float _597 = _595 + 1.0;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _599;
    float _603 = _593 * _597;
    float _605 = -_593;
    float _607 = _605 + 1.0;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _609;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _613;
    float _617 = fma(_601, _581, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _619 = _579 * _607;
    float _621 = fma(_611, _581, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _623 = fma(_615, _581, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _625 = _565 * _567;
    float _627 = _617 * _619;
    float _629 = _621 * _619;
    float _631 = _623 * _619;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _645 = -_579;
    float _647 = _645 + 1.0;
    float _649 = fma(_635, _625, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _651 = fma(_639, _625, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _653 = fma(_643, _625, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _655 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[107].x, _629);
    float _657 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[107].y, _627);
    float _659 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[107].z, _631);
    float _661 = _495 * _525;
    float _663 = fma(_649, _603, _655);
    float _665 = fma(_651, _603, _657);
    float _667 = fma(_653, _603, _659);
    float _669 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[109].x, _663);
    float _671 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[109].y, _665);
    float _673 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[109].z, _667);
    bool _675 = !_539;
    float _693;
    if (!_675)
    {
        float _677 = in.m_57.x;
        float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _681 = _677 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[11].y, _113);
        float _685 = _683 * _679;
        float _687 = floor(_685);
        float _689 = -_687;
        float _691 = _685 + _689;
        _693 = _691;
        _695 = true;
    }
    else
    {
        _693 = _283;
    }
    _695 = false;
    float _697 = _693;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _701 = _697 + _699;
    float _703 = _669 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _713 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _715 = isnan(_697);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _725;
    float _729 = 1.0 / _707;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _735 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _737 = isnan(_697);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = _671 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _753 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _755 = isnan(_697);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = _673 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _767 = 1.0 / _711;
    float _769 = -_745;
    float _771 = _769 + 1.0;
    bool _773 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _775 = _723 * _771;
    float _777 = _727 * _729;
    bool _779 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _781 = isnan(_697);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -_723;
    float _793 = _791 + 1.0;
    float _795 = 1.0 / _733;
    float _797 = fma(_777, _701, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _799;
    float _803 = _789 * _793;
    float _805 = -_789;
    float _807 = _805 + 1.0;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _813 = 1.0 / _751;
    float _815 = _763 * _807;
    float _817 = _811 * _767;
    float _819 = -_763;
    float _821 = _819 + 1.0;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _825 = _697 + _823;
    float _827 = _797 * _815;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _831 = _697 + _829;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _837 = _801 * _795;
    bool _839 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _841 = isnan(_697);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = fma(_817, _831, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _853 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[115].x, _827);
    float _855 = fma(_837, _825, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _859 = _697 + _857;
    float _861 = -_849;
    float _863 = _861 + 1.0;
    float _865 = fma(_851, _803, _853);
    float _867 = _835 * _813;
    float _869 = _745 * _863;
    float _871 = fma(_855, _775, _865);
    float _873 = fma(_867, _859, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _875 = _747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = fma(_873, _869, _871);
    float _879 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[119].x, _877);
    float _883 = _765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = _881 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _879;
    out.m_59.y = _875;
    out.m_59.z = _883;
    out.m_59.w = _885;
    bool _887 = !_773;
    float _905;
    if (!_887)
    {
        float _889 = in.m_57.x;
        float _891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _893 = _889 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _895 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[11].z, _113);
        float _897 = _895 * _891;
        float _899 = floor(_897);
        float _901 = -_899;
        float _903 = _897 + _901;
        _905 = _903;
        _907 = true;
    }
    else
    {
        _905 = _283;
    }
    _907 = false;
    float _909 = _905;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _913 = _909 + _911;
    bool _915 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _917 = isnan(_909);
    bool _919 = _915 || _917;
    bool _921 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _923 = _919 || _921;
    float _925 = float(_923);
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _929 = _909 + _927;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _931;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _939 = 1.0 / _933;
    bool _941 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _943 = 1.0 / _937;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _945;
    float _949 = _913 * _939;
    bool _951 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _953 = isnan(_909);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = -_925;
    float _965 = _963 + 1.0;
    bool _967 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _969 = isnan(_909);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    float _979 = fma(_947, _949, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _981 = _977 * _965;
    float _983 = -_977;
    float _985 = _983 + 1.0;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _987;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _991;
    float _995 = _929 * _943;
    float _997 = _961 * _985;
    float _999 = fma(_989, _949, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1001 = fma(_993, _949, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1003 = -_961;
    float _1005 = _1003 + 1.0;
    float _1007 = _979 * _997;
    float _1009 = _999 * _997;
    float _1011 = _1001 * _997;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1025 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1009);
    float _1027 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1007);
    float _1029 = fma(_1015, _995, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1031 = fma(_1019, _995, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1033 = fma(_1023, _995, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1035 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1011);
    float _1037 = fma(_1029, _981, _1025);
    float _1039 = fma(_1031, _981, _1027);
    float _1041 = fma(_1033, _981, _1035);
    float _1043 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1037);
    float _1045 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1039);
    float _1047 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1041);
    float _1049 = _1043 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1051 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1053 = _1047 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1055 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1057 = _1051 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1059 = _1053 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1055;
    out.m_61.y = _1057;
    out.m_61.z = _1059;
    bool _1061 = !_941;
    float _1079;
    if (!_1061)
    {
        float _1063 = in.m_57.x;
        float _1065 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1067 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1069 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[14].x, _113);
        float _1071 = _1069 * _1065;
        float _1073 = floor(_1071);
        float _1075 = -_1073;
        float _1077 = _1071 + _1075;
        _1079 = _1077;
        _1081 = true;
    }
    else
    {
        _1079 = _283;
    }
    _1081 = false;
    float _1083 = _1079;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1087 = _1083 + _1085;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1091 = _1083 + _1089;
    bool _1093 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1095 = isnan(_1083);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1101 = _1097 || _1099;
    float _1103 = float(_1101);
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1105;
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1113;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1121 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1123 = isnan(_1083);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1129 = _1125 || _1127;
    float _1131 = float(_1129);
    float _1133 = 1.0 / _1111;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1137 = _1083 + _1135;
    bool _1139 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1141 = isnan(_1083);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = 1.0 / _1107;
    float _1153 = -_1131;
    float _1155 = _1153 + 1.0;
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1157;
    bool _1161 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1163 = isnan(_1083);
    bool _1165 = _1161 || _1163;
    bool _1167 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1169 = _1165 || _1167;
    float _1171 = float(_1169);
    float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1175 = _1173 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1177 = _1149 * _1155;
    float _1179 = 1.0 / _1115;
    float _1181 = _1091 * _1133;
    bool _1183 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1185 = isnan(_1083);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1191 = _1187 || _1189;
    float _1193 = float(_1191);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1195;
    bool _1199 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1201 = 1.0 / _1119;
    float _1203 = _1087 * _1151;
    float _1205 = -_1103;
    float _1207 = _1205 + 1.0;
    float _1209 = _1131 * _1207;
    bool _1211 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1213 = isnan(_1083);
    bool _1215 = _1211 || _1213;
    bool _1217 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1219 = _1215 || _1217;
    float _1221 = float(_1219);
    float _1223 = _1137 * _1179;
    float _1225 = -_1149;
    float _1227 = _1225 + 1.0;
    float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1231 = _1083 + _1229;
    float _1233 = -_1193;
    float _1235 = _1233 + 1.0;
    float _1237 = 1.0 / _1159;
    float _1239 = _1193 * _1227;
    bool _1241 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1243 = isnan(_1083);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    float _1253 = _1221 * _1235;
    float _1255 = _1231 * _1201;
    float _1257 = -_1221;
    float _1259 = _1257 + 1.0;
    bool _1261 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1263 = isnan(_1083);
    bool _1265 = _1261 || _1263;
    bool _1267 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1269 = _1265 || _1267;
    float _1271 = float(_1269);
    float _1273 = -_1251;
    float _1275 = _1273 + 1.0;
    float _1277 = 1.0 / _1175;
    float _1279 = _1251 * _1259;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1283 = _1083 + _1281;
    float _1285 = _1271 * _1275;
    float _1287 = -_1271;
    float _1289 = _1287 + 1.0;
    float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1291;
    float _1295 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1295;
    float _1299 = _1171 * _1289;
    float _1301 = fma(_1293, _1203, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1305 = _1303 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1307 = -_1171;
    float _1309 = _1307 + 1.0;
    float _1311 = 1.0 / _1197;
    float _1313 = _1301 * _1299;
    float _1315 = fma(_1305, _1181, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1317 = fma(_1297, _1223, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1319 = fma(_1309, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1313);
    float _1321 = _1283 * _1237;
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1325 = _1083 + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1329 = _1083 + _1327;
    float _1331 = fma(_1315, _1285, _1319);
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1335 = _1333 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1337 = _1325 * _1277;
    float _1339 = fma(_1317, _1279, _1331);
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1341;
    float _1345 = fma(_1335, _1255, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1347 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1349 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1347;
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1353 = _1351 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1355 = fma(_1343, _1203, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1361 = fma(_1345, _1253, _1339);
    float _1363 = fma(_1349, _1321, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1365 = _1329 * _1311;
    float _1367 = fma(_1363, _1239, _1361);
    float _1369 = fma(_1359, _1337, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1371 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1371;
    float _1375 = _1355 * _1299;
    float _1377 = fma(_1353, _1181, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1379 = fma(_1369, _1177, _1367);
    float _1381 = fma(_1373, _1365, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1383 = fma(_1309, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1375);
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1385;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1393 = fma(_1381, _1209, _1379);
    float _1395 = fma(_1387, _1223, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1397 = fma(_1377, _1285, _1383);
    float _1399 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1393);
    float _1401 = fma(_1391, _1255, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1403;
    float _1407 = fma(_1395, _1279, _1397);
    out.m_63.y = _1399;
    float _1409 = fma(_1405, _1321, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1413 = _1411 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1415 = fma(_1401, _1253, _1407);
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1417;
    float _1421 = fma(_1413, _1337, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1423 = fma(_1409, _1239, _1415);
    float _1425 = fma(_1419, _1365, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1427 = fma(_1421, _1177, _1423);
    float _1429 = fma(_1425, _1209, _1427);
    float _1431 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1429);
    float _1433 = precise::clamp(_1431, 0.0, 1.0);
    bool _1435 = !_1199;
    float _1453;
    if (!_1435)
    {
        float _1437 = in.m_57.x;
        float _1439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1441 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1443 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[14].y, _113);
        float _1445 = _1443 * _1439;
        float _1447 = floor(_1445);
        float _1449 = -_1447;
        float _1451 = _1445 + _1449;
        _1453 = _1451;
        _1455 = true;
    }
    else
    {
        _1453 = _283;
    }
    _1455 = false;
    float _1457 = _1453;
    int _1459 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1461 = _1459;
    int _1463 = 0;
    int _1465 = _98(_1461, _1463, (*spvDescriptorSet0.support_buffer));
    float _1467 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1469 = int(_1467);
    float _1471 = in.m_57.x;
    float _1473 = in.m_57.y;
    float _1475 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1477 = int(_1475);
    float _1479 = float(_1469);
    float _1481 = 1.0 / _1479;
    float _1483 = float(uint(_1477));
    int _1485 = ~_1477;
    int _1487 = _1485 + 1;
    int _1489 = ~_1477;
    int _1491 = _1489 + 1;
    float _1493 = 1.0 / _1483;
    bool _1495 = _1477 == 0;
    int _1497 = ~_1477;
    int _1499 = _1497 + 1;
    float _1501 = _113 * _1481;
    float _1503 = trunc(_1501);
    int _1505 = int(_1503);
    int _1507 = as_type<int>(_1493) + (-2);
    float _1509 = float(uint(_1505));
    float _1511 = as_type<float>(_1507) * _1509;
    float _1513 = trunc(_1511);
    float _1515 = precise::max(_1513, 0.0);
    uint _1518 = uint(_1515);
    int _1520 = _1487 * int(_1518);
    int _1522 = _1520 + _1505;
    float _1524 = float(_1477);
    float _1526 = float(uint(_1522));
    float _1528 = as_type<float>(_1507) * _1526;
    float _1530 = trunc(_1528);
    float _1532 = precise::max(_1530, 0.0);
    uint _1534 = uint(_1532);
    int _1536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1538 = _1536 != 0;
    bool _1540 = !_1538;
    float _1542 = _1540 ? 7.345489978790283203125 : 1.0;
    float _1544 = _1542 * _1471;
    int _1546 = int(_1518) + int(_1534);
    float _1548 = floor(_1544);
    float _1550 = float(_1505);
    int _1552 = _1491 * _1546;
    int _1554 = _1552 + _1505;
    bool _1556 = _1550 >= _1524;
    bool _1558 = isnan(_1550);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan(_1524);
    bool _1564 = _1560 || _1562;
    float _1566 = float(_1564);
    bool _1568 = uint(_1554) >= uint(_1477);
    float _1570 = trunc(_1566);
    int _1572 = int(_1570);
    bool _1574 = !_1568;
    int _1576 = _1574 ? 0 : (-1);
    int _1578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1580 = _1578 != 0;
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1584 = _1582 != 0;
    int _1586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1588 = _1586 != 0;
    float _1590 = -_1548;
    float _1592 = _1544 + _1590;
    int _1594 = ~_1546;
    int _1596 = _1594 + _1576;
    int _1598 = _1596 + 1;
    float _1600 = _113 * _1524;
    float _1602 = _1592 * _1524;
    int _1604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1606 = _1604 != 0;
    int _1608 = _1477 * _1598;
    int _1610 = _1608 + _1505;
    float _1612 = _1600 * _161;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1616 = _1614 != 0;
    float _1618 = trunc(_1602);
    int _1620 = int(_1618);
    bool _1622 = !_1584;
    int _1624 = _1622 ? 0 : 1;
    int _1626 = ~_1572;
    int _1628 = _1626 + 1;
    int _1630 = _1628 + 1;
    bool _1632 = !_1495;
    int _1634 = _1632 ? _1610 : (-1);
    int _1636 = _1477 + (-1);
    float _1638 = trunc(_1612);
    int _1640 = int(_1638);
    int _1642 = abs(_1624);
    int _1644 = _1634 * _1630;
    bool _1646 = !_1616;
    int _1648 = _1646 ? 0 : 1;
    bool _1650 = !_1588;
    int _1652 = _1650 ? 0 : 1;
    int _1654 = _1572 * _1636;
    int _1656 = _1654 + _1644;
    bool _1658 = !_1580;
    int _1660 = _1658 ? 0 : 1;
    int _1662 = abs(_1648);
    int _1664 = abs(_1660);
    int _1666 = _1620 * _1662;
    int _1668 = _1666 + _1505;
    bool _1670 = !_1606;
    int _1672 = _1670 ? 0 : 1;
    int _1674 = abs(_1652);
    int _1676 = _1656 * _1642;
    int _1678 = abs(_1672);
    int _1680 = _1640 * _1664;
    int _1682 = _1680 + _1676;
    float _1684 = in.m_65.z;
    int _1686 = ~_1477;
    int _1688 = _1686 + 1;
    int _1690 = _1668 * _1674;
    int _1692 = _1690 + _1682;
    int _1694 = _1620 * _1678;
    int _1696 = _1694 + _1692;
    float _1698 = float(uint(_1696));
    float _1700 = as_type<float>(_1507) * _1698;
    float _1702 = trunc(_1700);
    float _1704 = precise::max(_1702, 0.0);
    uint _1706 = uint(_1704);
    float _1708 = trunc(_1684);
    int _1710 = int(_1708);
    int _1712 = _1688 * int(_1706);
    int _1714 = _1712 + _1696;
    float _1716 = float(uint(_1714));
    float _1718 = as_type<float>(_1507) * _1716;
    float _1720 = trunc(_1718);
    float _1722 = precise::max(_1720, 0.0);
    uint _1724 = uint(_1722);
    int _1726 = int(_1706) + int(_1724);
    int _1728 = _1499 * _1726;
    int _1730 = _1728 + _1696;
    int _1732 = _1465 + (-1);
    float _1734 = float(_1732);
    float _1736 = _1433 * _1734;
    float _1738 = trunc(_1736);
    int _1740 = int(_1738);
    int _1742 = _1740;
    int _1744 = 0;
    int _1746 = _99(_1742, _1744, (*spvDescriptorSet0.support_buffer));
    int _1748 = _1710;
    int _1750 = 0;
    int _1752 = _99(_1748, _1750, (*spvDescriptorSet0.support_buffer));
    float4 _1755 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1746, _1752)), 0).xyzw;
    float _1757 = _1755.x;
    float _1759 = _1755.y;
    float _1761 = _1755.z;
    float _1763 = _1755.w;
    bool _1765 = uint(_1730) >= uint(_1477);
    float _1767 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1769 = _1457 + _1767;
    int _1771 = ~_1477;
    int _1773 = _1771 + 1;
    bool _1775 = !_1765;
    int _1777 = _1775 ? 0 : (-1);
    int _1779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1781 = _1779 != 0;
    int _1783 = ~_1726;
    int _1785 = _1783 + _1777;
    int _1787 = _1785 + 1;
    float _1789 = float(uint(_1668));
    int _1791 = _1477 * _1787;
    int _1793 = _1791 + _1696;
    float _1795 = as_type<float>(_1507) * _1789;
    int _1797 = ~_1477;
    int _1799 = _1797 + 1;
    bool _1801 = !_1495;
    int _1803 = _1801 ? _1793 : (-1);
    float _1805 = trunc(_1795);
    float _1807 = precise::max(_1805, 0.0);
    uint _1809 = uint(_1807);
    int _1811 = _1803 >> 31;
    int _1813 = _1803 & 3;
    bool _1815 = _1813 != 0;
    int _1817 = _1811 & 3;
    int _1819 = _1803 & 3;
    bool _1821 = _1819 != 0;
    int _1823 = _1803 + _1817;
    bool _1825 = uint(_1819) > 1u;
    int _1827 = _1823 >> 2;
    int _1829 = _1799 * int(_1809);
    int _1831 = _1829 + _1668;
    bool _1833 = _1819 != 3;
    int _1835 = _1827 << 4;
    int _1837 = _1835 + 368;
    float _1839 = float(uint(_1831));
    uint _1841 = uint(int(uint(_1837) >> uint(2)));
    uint _1843 = uint(int(uint(int(_1841)) >> uint(2)));
    int _1845 = int(_1841) & 3;
    float _1847 = (*spvDescriptorSet0.vp_c9)._m0[int(_1843)][_1845];
    int _1849 = int(_1841) + 1;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    int _1853 = _1849 & 3;
    float _1855 = (*spvDescriptorSet0.vp_c9)._m0[int(_1851)][_1853];
    float _1857 = as_type<float>(_1507) * _1839;
    int _1859 = _1815 ? 0 : 1;
    int _1861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1863 = _1861 != 0;
    float _1865 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1867 = _1865 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    int _1869 = _1837 + 8;
    uint _1871 = uint(int(uint(_1869) >> uint(2)));
    uint _1873 = uint(int(uint(int(_1871)) >> uint(2)));
    int _1875 = int(_1871) & 3;
    float _1877 = (*spvDescriptorSet0.vp_c9)._m0[int(_1873)][_1875];
    int _1879 = int(_1871) + 1;
    uint _1881 = uint(int(uint(_1879) >> uint(2)));
    int _1883 = _1879 & 3;
    float _1885 = (*spvDescriptorSet0.vp_c9)._m0[int(_1881)][_1883];
    float _1887 = trunc(_1857);
    float _1889 = precise::max(_1887, 0.0);
    uint _1891 = uint(_1889);
    bool _1893 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1895 = isnan(_1457);
    bool _1897 = _1893 || _1895;
    bool _1899 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1901 = _1897 || _1899;
    float _1903 = float(_1901);
    bool _1905 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1907 = isnan(_1457);
    bool _1909 = _1905 || _1907;
    bool _1911 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1913 = _1909 || _1911;
    float _1915 = float(_1913);
    float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1919 = _1917 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1921 = 1.0 / _1867;
    float _1923 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1925 = int(_1809) + int(_1891);
    float _1927 = 1.0 / _1919;
    int _1929 = ~_1859;
    int _1931 = _1929 + 1;
    int _1933 = _1931 + 1;
    int _1935 = _1933;
    if (!_1825)
    {
        int _1937 = ~_1859;
        int _1939 = _1937 + 1;
        _1935 = _1939;
    }
    int _1941 = _1935;
    int _1943 = _1773 * _1925;
    int _1945 = _1943 + _1668;
    bool _1947 = uint(_1819) >= 2u;
    int _1949 = abs(_1941);
    bool _1951 = uint(_1945) >= uint(_1477);
    int _1953 = ~_1949;
    int _1955 = _1953 + 1;
    int _1957 = _1955 + 1;
    int _1959 = _1947 ? 0 : 1;
    bool _1961 = !_1951;
    int _1963 = _1961 ? 0 : (-1);
    bool _1965 = _1819 != 3;
    int _1967 = ~_1959;
    int _1969 = _1967 + 1;
    int _1971 = _1969 + 1;
    int _1973 = _1957 * as_type<int>(_1855);
    bool _1975 = !_1821;
    int _1977 = _1975 ? 0 : 1;
    int _1979 = _1971;
    if (_1833)
    {
        int _1981 = ~_1959;
        int _1983 = _1981 + 1;
        _1979 = _1983;
    }
    int _1985 = _1979;
    float _1987 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1989 = abs(_1977);
    bool _1991 = !_1965;
    int _1993 = _1991 ? 0 : (-1);
    int _1995 = abs(_1985);
    int _1997 = abs(_1993);
    int _1999 = ~_1989;
    int _2001 = _1999 + 1;
    int _2003 = _2001 + 1;
    int _2005 = _2003 * as_type<int>(_1847);
    int _2007 = _2005 + _1973;
    int _2009 = ~_1995;
    int _2011 = _2009 + 1;
    int _2013 = _2011 + 1;
    float _2015 = -_1923;
    float _2017 = fma(_1987, 2.0, _2015);
    int _2019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2021 = _2019 != 0;
    float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2025 = _2023 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2027 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2029 = int(_2027);
    int _2031 = ~_1997;
    int _2033 = _2031 + 1;
    int _2035 = _2033 + 1;
    int _2037 = _2013 * as_type<int>(_1877);
    int _2039 = _2037 + _2007;
    int _2041 = ~_1925;
    int _2043 = _2041 + _1963;
    int _2045 = _2043 + 1;
    float _2047 = _1473 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2049 = _2035 * as_type<int>(_1885);
    int _2051 = _2049 + _2039;
    bool _2053 = !_1781;
    int _2055 = _2053 ? 0 : 1;
    int _2057 = _1477 * _2045;
    int _2059 = _2057 + _1668;
    float _2061 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2063 = _2061 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2065 = abs(_2055);
    float _2067 = 1.0 / _2025;
    float _2069 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2071 = ~_2065;
    int _2073 = _2071 + 1;
    int _2075 = _2073 + 1;
    float _2077 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2079 = _2077 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2081 = fma(_2047, -2.0, _2069);
    float _2083 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2085 = _2083 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    int _2087 = abs(_2029);
    float _2089 = 1.0 / _2063;
    int _2091 = _2051 * _2075;
    float _2093 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2081);
    float _2095 = float(uint(_2087));
    float _2097 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2099 = _2097 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2101 = 1.0 / _2079;
    int _2103 = ~_2029;
    int _2105 = _2103 + 1;
    bool _2107 = _1473 > 0.5;
    bool _2109 = _2107 && _2021;
    float _2111 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2113 = 1.0 / _2085;
    bool _2115 = !_1495;
    int _2117 = _2115 ? _2059 : (-1);
    float _2119 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2111);
    bool _2121 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2123 = isnan(_1457);
    bool _2125 = _2121 || _2123;
    bool _2127 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2129 = _2125 || _2127;
    float _2131 = float(_2129);
    int _2133 = _2117 * _2065;
    int _2135 = _2133 + _2091;
    float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2137;
    float _2141 = 1.0 / _2095;
    float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2145 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2143;
    float _2147 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2149 = _2147 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2151 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2153 = _2151 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2155 = _2139 * _2101;
    float _2157 = _2145 * _2089;
    bool _2159 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2161 = isnan(_1457);
    bool _2163 = _2159 || _2161;
    bool _2165 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2167 = _2163 || _2165;
    float _2169 = float(_2167);
    float _2171 = _2153 * _2067;
    float _2173 = 1.0 / _2099;
    float _2175 = _2149 * _2113;
    int _2177 = abs(_2135);
    float _2179 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2181 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2179;
    float _2183 = float(uint(_2029));
    float _2185 = fma(_2157, _1769, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _2187 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2189 = isnan(_1457);
    bool _2191 = _2187 || _2189;
    bool _2193 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2195 = _2191 || _2193;
    float _2197 = float(_2195);
    float _2199 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2201 = _2199 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    int _2203 = as_type<int>(_2141) + (-2);
    float _2205 = 1.0 / _2183;
    float _2207 = float(uint(_2177));
    float _2209 = -_2169;
    float _2211 = _2209 + 1.0;
    bool _2213 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2215 = isnan(_1457);
    bool _2217 = _2213 || _2215;
    bool _2219 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2221 = _2217 || _2219;
    float _2223 = float(_2221);
    float _2225 = _2201 * _1921;
    float _2227 = float(uint(_2135));
    float _2229 = _2197 * _2211;
    float _2231 = _2181 * _2173;
    float _2233 = as_type<float>(_2203) * _2207;
    float _2235 = -_2197;
    float _2237 = _2235 + 1.0;
    float _2239 = -_2223;
    float _2241 = _2239 + 1.0;
    bool _2243 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2245 = isnan(_1457);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2251 = _2247 || _2249;
    float _2253 = float(_2251);
    float _2255 = _2223 * _2237;
    float _2257 = _2131 * _2241;
    float _2259 = -_2131;
    float _2261 = _2259 + 1.0;
    float _2263 = trunc(_2233);
    float _2265 = precise::max(_2263, 0.0);
    uint _2267 = uint(_2265);
    float _2269 = _2253 * _2261;
    int _2271 = as_type<int>(_2205) + (-2);
    float _2273 = -_2253;
    float _2275 = _2273 + 1.0;
    bool _2277 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2279 = isnan(_1457);
    bool _2281 = _2277 || _2279;
    bool _2283 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2285 = _2281 || _2283;
    float _2287 = float(_2285);
    float _2289 = as_type<float>(_2271) * _2227;
    float _2291 = -_1903;
    float _2293 = _2291 + 1.0;
    float _2295 = _1903 * _2275;
    float _2297 = _1915 * _2293;
    float _2299 = trunc(_2289);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    int _2305 = ~int(_2267);
    int _2307 = _2305 + 1;
    float _2309 = -_1915;
    float _2311 = _2309 + 1.0;
    float _2313 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2315 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2313;
    int _2317 = _2307 * _2087;
    int _2319 = _2317 + _2177;
    float _2321 = _2287 * _2311;
    float _2323 = _2315 * _1927;
    float _2325 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2327 = _1457 + _2325;
    float _2329 = float(uint(_2319));
    float _2331 = _2185 * _2321;
    float _2333 = -_2287;
    float _2335 = _2333 + 1.0;
    float _2337 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2339 = _1457 + _2337;
    int _2341 = _2105 * int(_2303);
    int _2343 = _2341 + _2135;
    float _2345 = as_type<float>(_2203) * _2329;
    float _2347 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2349 = _1457 + _2347;
    float _2351 = fma(_2335, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2331);
    float _2353 = fma(_2175, _2339, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2355 = float(uint(_2343));
    float _2357 = trunc(_2345);
    float _2359 = precise::max(_2357, 0.0);
    uint _2361 = uint(_2359);
    float _2363 = fma(_2171, _2349, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2365 = fma(_2155, _2327, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2367 = as_type<float>(_2271) * _2355;
    float _2369 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2371 = _1457 + _2369;
    float _2373 = _2155;
    if (_1863)
    {
        float _2375 = in.m_57.x;
        _2373 = _2375;
    }
    float _2377 = _2373;
    float _2379 = fma(_2363, _2297, _2351);
    float _2381 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2383 = _1457 + _2381;
    float _2385 = fma(_2231, _2371, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2387 = trunc(_2367);
    float _2389 = precise::max(_2387, 0.0);
    uint _2391 = uint(_2389);
    float _2393 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2395 = _1457 + _2393;
    float _2397 = fma(_2365, _2295, _2379);
    float _2399 = fma(_2225, _2383, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2401 = fma(_2323, _2395, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    int _2403 = int(_2267) + int(_2361);
    float _2405 = in.m_65.x;
    float _2407 = fma(_2353, _2269, _2397);
    float _2409 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2411 = ~_2403;
    int _2413 = _2411 + 1;
    float _2415 = fma(_2385, _2257, _2407);
    int _2417 = ~_2029;
    int _2419 = _2417 + 1;
    float _2421 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2409);
    float _2423 = fma(_2399, _2255, _2415);
    int _2425 = int(_2303) + int(_2391);
    float _2427 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2421);
    int _2429 = _2413 * _2087;
    int _2431 = _2429 + _2177;
    bool _2433 = _2377 > 0.5;
    bool _2435 = _2433 && _1863;
    int _2437 = _2419 * _2425;
    int _2439 = _2437 + _2135;
    float _2441 = fma(_2401, _2229, _2423);
    int _2443 = _2135 ^ _2029;
    float _2445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2447 = uint(_2431) >= uint(_2087);
    float _2449 = fma(_2169, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2441);
    bool _2451 = uint(_2439) >= uint(_2029);
    float _2453 = in.m_65.y;
    bool _2455 = !_2447;
    int _2457 = _2455 ? 0 : (-1);
    float _2459 = -_113;
    float _2461 = fma(_2459, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2017);
    uint _2463 = uint(int(uint(_2443) >> uint(31)));
    float _2465 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2467 = !_2451;
    float _2469 = _2467 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    out.m_67.x = _2449;
    float _2471 = as_type<float>(_2413);
    float _2473 = _2469;
    if (_1863)
    {
        _2471 = _2405;
    }
    float _2475 = _2471;
    int _2477 = ~_2457;
    int _2479 = _2403 + _2477;
    int _2481 = _2479 + 1;
    int _2483 = ~int(_2463);
    int _2485 = _2483 + 1;
    float _2487 = _2475;
    if (_2435)
    {
        float _2489 = -_2475;
        float _2491 = _2489 + 1.0;
        _2487 = _2491;
    }
    float _2493 = _2487;
    int _2495 = ~_2425;
    int _2497 = _2495 + as_type<int>(_2469);
    int _2499 = _2497 + 1;
    float _2501 = _2445 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2503 = _2481 ^ _2485;
    bool _2505 = _2029 == 0;
    bool _2507 = _2029 == 0;
    int _2509 = _2029 * _2499;
    int _2511 = _2509 + _2135;
    int _2513 = ~_2485;
    int _2515 = _2513 + _2503;
    int _2517 = _2515 + 1;
    float _2519 = _2465 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2521 = _2499;
    if (!_1863)
    {
        _2473 = _2405;
    }
    float _2523 = _2473;
    float _2525 = _2453;
    float _2527 = _2523;
    if (_2109)
    {
        float _2529 = -_2453;
        float _2531 = _2529 + 1.0;
        _2525 = _2531;
    }
    float _2533 = _2525;
    bool _2535 = !_2505;
    int _2537 = _2535 ? _2511 : (-1);
    bool _2539 = !_2507;
    int _2541 = _2539 ? _2517 : (-1);
    if (_1863)
    {
        _2527 = _2493;
    }
    float _2543 = _2527;
    uint _2545 = as_type<uint>(half2(float2(_1763, 0.0)));
    float _2547 = float(_2537);
    float _2549 = fma(_2501, _2543, -0.5);
    uint _2551 = extract_bits(_2545, 0u, 8u);
    int _2553 = int(_2551) & 255;
    uint _2555 = extract_bits(_2545, 8u, 8u);
    int _2557 = int(_2555) & 255;
    int _2559 = _2557 << 8;
    int _2561 = _2553 | _2559;
    float _2563 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2119);
    float _2565 = float(_2541);
    float _2567 = fma(_2501, _2547, _2461);
    bool _2569 = _2561 >= 32768;
    float _2571 = fma(_2519, _2533, -0.5);
    float _2573 = -_2093;
    float _2575 = fma(_2519, _2565, _2573);
    float _2577 = fma(_2563, _2549, _2567);
    float _2579 = fma(_2427, _2571, _2575);
    int _2581 = _1740 + 1;
    float _2583 = _2577 + 0.5;
    float _2585 = _2579 + 0.5;
    int _2587 = min(_1732, _2581);
    int _2589 = _2561 + (-1024);
    int _2591 = _2589;
    if (_2569)
    {
        int _2593 = ~_2561;
        int _2595 = _2593 + 33792;
        int _2597 = _2595 + 1;
        _2591 = _2597;
    }
    int _2599 = _2591;
    int _2601 = _2599 + 30719;
    float _2603 = float(_2601);
    float _2605 = fma(_2603, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2607 = abs(_2605);
    float _2609 = -_2607;
    float _2611 = _2609 + 1.0;
    float _2613 = abs(_2605);
    float _2615 = fma(_2613, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2617 = _2605 < 0.0;
    float _2619 = float(_2617);
    int _2621 = as_type<int>(_2611) + (-218103808);
    float _2623 = abs(_2605);
    float _2625 = fma(_2623, _2615, -0.212114393711090087890625);
    bool _2627 = uint(_2621) >= 1920991232u;
    float _2629 = abs(_2605);
    float _2631 = fma(_2629, _2625, 1.570728778839111328125);
    bool _2633 = !_2627;
    float _2657;
    if (!_2633)
    {
        int _2635 = as_type<int>(_2611);
        int _2637 = _2457;
        int _2639 = _2499;
        int _2641 = 13056;
        int _2643;
        int _2645;
        int _2647;
        int _2649;
        int _2651;
        int _2653;
        int _2655;
        _96(_2635, _2637, _2639, _2641, _2643, _2645, _2647, _2649, _2651, _2653, _2655, out.gl_Position, out.gl_PointSize);
        _2521 = _2653;
        _2657 = as_type<float>(_2647);
        _2659 = true;
    }
    else
    {
        float _2661 = rsqrt(_2611);
        float _2663 = _2611 * _2661;
        float _2665 = _2661 * 0.5;
        float _2667 = -_2663;
        float _2669 = 0.0 + _2667;
        float _2671 = fma(_2665, _2669, 0.5);
        float _2673 = fma(_2663, _2671, _2663);
        float _2675 = -_2673;
        float _2677 = 0.0 + _2675;
        float _2679 = fma(_2673, _2677, _2611);
        float _2681 = fma(_2665, _2679, _2673);
        _2657 = _2681;
    }
    _2659 = false;
    float _2683 = _2657;
    int _2685 = _2521;
    int _2687 = _2587;
    int _2689 = 0;
    int _2691 = _99(_2687, _2689, (*spvDescriptorSet0.support_buffer));
    int _2693 = _1710;
    int _2695 = 0;
    int _2697 = _99(_2693, _2695, (*spvDescriptorSet0.support_buffer));
    float4 _2699 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2691, _2697)), 0).xyzw;
    float _2701 = _2699.x;
    float _2703 = _2699.y;
    float _2705 = _2699.z;
    float _2707 = _2699.w;
    float _2709 = _2631 * _2683;
    float _2711 = _2619 * 2.0;
    float _2713 = _2603 * 3.883221149444580078125;
    float _2715 = floor(_1736);
    float _2717 = -_2711;
    float _2719 = fma(_2709, _2717, _2709);
    float _2721 = _2713 * 0.15915493667125701904296875;
    float _2723 = fma(_2619, 3.1415927410125732421875, _2719);
    float _2725 = _2721 * 6.283185482025146484375;
    float _2727 = cos(_2725);
    float _2729 = _2723 * 0.15915493667125701904296875;
    float _2731 = _2729 * 6.283185482025146484375;
    float _2733 = sin(_2731);
    float _2735 = -_2715;
    float _2737 = _1736 + _2735;
    float _2739 = _2721 * 6.283185482025146484375;
    float _2741 = sin(_2739);
    float _2743 = _2733 * _2727;
    float _2745 = _2733 * _2741;
    uint _2747 = as_type<uint>(half2(float2(_2707, 0.0)));
    float _2749 = -_1757;
    float _2751 = _2749 + _2701;
    float _2753 = -_1759;
    float _2755 = _2753 + _2703;
    float _2757 = -_1761;
    float _2759 = _2757 + _2705;
    uint _2761 = extract_bits(_2747, 0u, 8u);
    int _2763 = int(_2761) & 255;
    uint _2765 = extract_bits(_2747, 8u, 8u);
    int _2767 = int(_2765) & 255;
    int _2769 = _2767 << 8;
    int _2771 = _2763 | _2769;
    float _2773 = fma(_2737, _2751, _1757);
    float _2775 = fma(_2737, _2755, _1759);
    float _2777 = fma(_2737, _2759, _1761);
    bool _2779 = _2771 >= 32768;
    int _2781 = _2771 + (-1024);
    int _2783 = _2781;
    if (_2779)
    {
        int _2785 = ~_2771;
        int _2787 = _2785 + 33792;
        int _2789 = _2787 + 1;
        _2783 = _2789;
    }
    int _2791 = _2783;
    int _2793 = _2791 + 30719;
    float _2795 = float(_2793);
    float _2797 = fma(_2795, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2799 = abs(_2797);
    float _2801 = -_2799;
    float _2803 = _2801 + 1.0;
    float _2805 = abs(_2797);
    float _2807 = fma(_2805, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2809 = _2797 < 0.0;
    float _2811 = float(_2809);
    int _2813 = as_type<int>(_2803) + (-218103808);
    float _2815 = abs(_2797);
    float _2817 = fma(_2815, _2807, -0.212114393711090087890625);
    bool _2819 = uint(_2813) >= 1920991232u;
    float _2821 = abs(_2797);
    float _2823 = fma(_2821, _2817, 1.570728778839111328125);
    bool _2825 = !_2819;
    float _2849;
    if (!_2825)
    {
        int _2827 = as_type<int>(_2803);
        int _2829 = as_type<int>(_2703);
        int _2831 = _2685;
        int _2833 = 13968;
        int _2835;
        int _2837;
        int _2839;
        int _2841;
        int _2843;
        int _2845;
        int _2847;
        _96(_2827, _2829, _2831, _2833, _2835, _2837, _2839, _2841, _2843, _2845, _2847, out.gl_Position, out.gl_PointSize);
        _2849 = as_type<float>(_2839);
        _2851 = true;
    }
    else
    {
        float _2853 = rsqrt(_2803);
        float _2855 = _2803 * _2853;
        float _2857 = _2853 * 0.5;
        float _2859 = -_2855;
        float _2861 = 0.0 + _2859;
        float _2863 = fma(_2857, _2861, 0.5);
        float _2865 = fma(_2855, _2863, _2855);
        float _2867 = -_2865;
        float _2869 = 0.0 + _2867;
        float _2871 = fma(_2865, _2869, _2803);
        float _2873 = fma(_2857, _2871, _2865);
        _2849 = _2873;
    }
    _2851 = false;
    float _2875 = _2849;
    float _2877 = in.m_57.x;
    float _2879 = in.m_57.y;
    float _2881 = in.m_57.z;
    float _2883 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2885 = log2(_2883);
    float _2887 = _279 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2889 = _279 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2891 = _279 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2895 = _2893 != 0;
    int _2897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2899 = _2897 != 0;
    int _2901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2903 = _2901 != 0;
    float _2905 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2887);
    float _2907 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2889);
    float _2909 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2891);
    float _2911 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2905);
    float _2913 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2909);
    float _2915 = _2823 * _2875;
    float _2917 = _2911 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2919 = _2811 * 2.0;
    float _2921 = _2885 * _113;
    float _2923 = _2913 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2925 = _661 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2927 = -_2919;
    float _2929 = fma(_2915, _2927, _2915);
    float _2931 = _561 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2933 = _543 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2935 = exp2(_2921);
    float _2937 = _2881 * 2.0;
    float _2939 = _2877 * 2.0;
    float _2941 = _2881 + _2877;
    float _2943 = _2879 * 2.0;
    float _2945 = _2795 * 3.883221149444580078125;
    float _2947 = floor(_2937);
    float _2949 = floor(_2939);
    bool _2951 = _2947 > 0.0;
    float _2953 = floor(_2943);
    bool _2955 = _2947 >= 0.0;
    bool _2957 = isnan(_2947);
    bool _2959 = _2955 || _2957;
    bool _2961 = isnan(0.0);
    bool _2963 = _2959 || _2961;
    float _2965 = _2941 + (-1.0);
    float _2967 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2907);
    int _2969 = _2963 ? 0 : 1;
    float _2971 = fma(_2965, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _2973 = _2949 > 0.0;
    float _2975 = _2967 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2977 = ~_2969;
    int _2979 = _2977 + 1;
    int _2981 = _2979 + 1;
    int _2983 = _2981;
    if (!_2951)
    {
        int _2985 = ~_2969;
        int _2987 = _2985 + 1;
        _2983 = _2987;
    }
    int _2989 = _2983;
    bool _2991 = !_2895;
    int _2993 = _2991 ? 0 : 1;
    float _2995 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2997 = 1.0 + _2995;
    bool _2999 = _2949 >= 0.0;
    bool _3001 = isnan(_2949);
    bool _3003 = _2999 || _3001;
    bool _3005 = isnan(0.0);
    bool _3007 = _3003 || _3005;
    float _3009 = -_2935;
    float _3011 = _3009 + 1.0;
    int _3013 = abs(_2993);
    float _3015 = 1.0 / _2997;
    float _3017 = in.m_69.x;
    float _3019 = in.m_69.y;
    float _3021 = in.m_69.z;
    bool _3023 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3025 = isnan(1.0);
    bool _3027 = _3023 || _3025;
    bool _3029 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3031 = _3027 || _3029;
    bool _3033 = _2953 > 0.0;
    bool _3035 = _2953 >= 0.0;
    bool _3037 = isnan(_2953);
    bool _3039 = _3035 || _3037;
    bool _3041 = isnan(0.0);
    bool _3043 = _3039 || _3041;
    float _3045 = _2879 + _2877;
    int _3047 = _3007 ? 0 : 1;
    bool _3049 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3051 = isnan(0.0);
    bool _3053 = _3049 || _3051;
    bool _3055 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3057 = _3053 || _3055;
    float _3059 = _3045 + (-1.0);
    float _3061 = float(_3013);
    float _3063 = float(_2989);
    float _3065 = fma(_3059, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3067 = _3057 ? _3011 : 0.0;
    int _3069 = _3043 ? 0 : 1;
    float _3071 = _3061 * _3063;
    bool _3073 = !_2903;
    int _3075 = _3073 ? 0 : 1;
    if (_3031)
    {
        float _3077 = _3067 * _3015;
        _123 = _3077;
    }
    float _3079 = _123;
    int _3081 = ~_3069;
    int _3083 = _3081 + 1;
    int _3085 = _3083 + 1;
    float _3087 = _3071 * (-2.0);
    int _3089 = _3085;
    if (!_3033)
    {
        int _3091 = ~_3069;
        int _3093 = _3091 + 1;
        _3089 = _3093;
    }
    int _3095 = _3089;
    float _3097 = _2877 + (-0.5);
    int _3099 = abs(_3075);
    float _3101 = -_2975;
    float _3103 = _3101 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _3105 = ~_3047;
    int _3107 = _3105 + 1;
    int _3109 = _3107 + 1;
    float _3111 = fma(_3087, _3017, _3017);
    int _3113 = _3109;
    if (!_2973)
    {
        int _3115 = ~_3047;
        int _3117 = _3115 + 1;
        _3113 = _3117;
    }
    int _3119 = _3113;
    float _3121 = -_2917;
    float _3123 = _3121 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3125 = float(_3099);
    float _3127 = _3103 * _3103;
    float _3129 = float(_3095);
    float _3131 = fma(_3097, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3111);
    bool _3133 = !_2899;
    int _3135 = _3133 ? 0 : 1;
    float _3137 = -_2923;
    float _3139 = _3137 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3141 = fma(_3123, _3123, _3127);
    float _3143 = _3125 * _3129;
    int _3145 = abs(_3135);
    float _3147 = fma(_3065, _3087, _3065);
    float _3149 = fma(_3139, _3139, _3141);
    float _3151 = _3143 * (-2.0);
    float _3153 = float(_3145);
    float _3155 = _2881 + (-0.5);
    float _3157 = float(_3119);
    float _3159 = fma(_3151, _3021, _3021);
    float _3161 = _2881 + _2879;
    float _3163 = rsqrt(_3149);
    float _3165 = fma(_2971, _3151, _2971);
    float _3167 = _3153 * _3157;
    float _3169 = fma(_3155, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3159);
    float _3171 = _3161 + (-1.0);
    float _3173 = _3167 * (-2.0);
    float _3175 = _2879 + (-0.5);
    float _3177 = fma(_3147, _3079, _3131);
    float _3179 = fma(_3171, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3181 = fma(_3173, _3019, _3019);
    float _3183 = fma(_3165, _3079, _3169);
    float _3185 = _3177 * 0.15915493667125701904296875;
    float _3187 = fma(_3179, _3173, _3179);
    float _3189 = fma(_3175, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3181);
    float _3191 = _3183 * 0.15915493667125701904296875;
    float _3193 = _3185 * 6.283185482025146484375;
    float _3195 = sin(_3193);
    float _3197 = fma(_2811, 3.1415927410125732421875, _2929);
    float _3199 = fma(_3187, _3079, _3189);
    float _3201 = _3123 * _3163;
    float _3203 = _3139 * _3163;
    float _3205 = _2945 * 0.15915493667125701904296875;
    float _3207 = _3199 * 0.15915493667125701904296875;
    float _3209 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3211 = _3201 * _3209;
    float _3213 = _3103 * _3163;
    float _3215 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3217 = _3203 * _3215;
    float _3219 = _3185 * 6.283185482025146484375;
    float _3221 = cos(_3219);
    float _3223 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3225 = -_3211;
    float _3227 = fma(_3203, _3223, _3225);
    float _3229 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3231 = _3213 * _3229;
    float _3233 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3235 = -_3217;
    float _3237 = fma(_3213, _3233, _3235);
    float _3239 = _3227 * _3227;
    bool _3241 = _2775 != 0.0;
    bool _3243 = isnan(_2775);
    bool _3245 = _3241 || _3243;
    bool _3247 = isnan(0.0);
    bool _3249 = _3245 || _3247;
    float _3251 = _3197 * 0.15915493667125701904296875;
    float _3253 = _3191 * 6.283185482025146484375;
    float _3255 = sin(_3253);
    float _3257 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3259 = -_3231;
    float _3261 = fma(_3201, _3257, _3259);
    float _3263 = fma(_3237, _3237, _3239);
    float _3265 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2777);
    float _3267 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2775);
    bool _3269 = _2773 == 0.0;
    bool _3271 = !_3249;
    bool _3273 = _3269 && _3271;
    float _3275 = _2931 * _3265;
    float _3277 = _3191 * 6.283185482025146484375;
    float _3279 = cos(_3277);
    float _3281 = _2933 * _3267;
    bool _3283 = _2777 == 0.0;
    bool _3285 = _3283 && _3273;
    float _3287 = _3207 * 6.283185482025146484375;
    float _3289 = cos(_3287);
    float _3291 = fma(_3261, _3261, _3263);
    float _3293 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2773);
    float _3295 = _3195 * _3255;
    float _3297 = _2925 * _3293;
    float _3299 = _3207 * 6.283185482025146484375;
    float _3301 = sin(_3299);
    float _3303 = _3195 * _3279;
    float _3305 = _3221 * _3279;
    float _3307 = rsqrt(_3291);
    float _3309 = _3221 * _3255;
    float _3311 = _3195 * _3289;
    float _3313 = _3221 * _3289;
    float _3315 = _3289 * _3255;
    float _3317 = _3289 * _3279;
    float _3319 = _3311 * _3281;
    float _3321 = -_3309;
    float _3323 = fma(_3301, _3303, _3321);
    float _3325 = -_3303;
    float _3327 = fma(_3301, _3309, _3325);
    float _3329 = fma(_3301, _3295, _3305);
    float _3331 = fma(_3301, _3305, _3295);
    float _3333 = _3323 * _3281;
    float _3335 = -_3301;
    float _3337 = fma(_3335, _3297, _3319);
    float _3339 = _3329 * _3281;
    float _3341 = _3205 * 6.283185482025146484375;
    float _3343 = cos(_3341);
    float _3345 = _3237 * _3307;
    float _3347 = _3227 * _3307;
    float _3349 = fma(_3317, _3297, _3333);
    float _3351 = _3261 * _3307;
    float _3353 = fma(_3315, _3297, _3339);
    float _3355 = _3203 * _3347;
    float _3357 = _3213 * _3345;
    float _3359 = fma(_3331, _3275, _3349);
    float _3361 = fma(_3327, _3275, _3353);
    float _3363 = -_3355;
    float _3365 = fma(_3213, _3351, _3363);
    float _3367 = -_3357;
    float _3369 = fma(_3201, _3347, _3367);
    float _3371 = fma(_3313, _3275, _3337);
    float _3373 = _3251 * 6.283185482025146484375;
    float _3375 = sin(_3373);
    float _3377 = _3365 * _3361;
    float _3379 = _3369 * _3361;
    float _3381 = _3329 * _3369;
    float _3383 = fma(_3345, _3359, _3377);
    float _3385 = fma(_3351, _3359, _3379);
    float _3387 = -_2605;
    float _3389 = _3387 + _2797;
    float _3391 = _3205 * 6.283185482025146484375;
    float _3393 = sin(_3391);
    float _3395 = fma(_3201, _3371, _3383);
    float _3397 = fma(_3203, _3371, _3385);
    float _3399 = fma(_2737, _3389, _2605);
    float _3401 = fma(_3323, _3351, _3381);
    float _3403 = _2917 + _3395;
    float _3405 = _2923 + _3397;
    float _3407 = _3399;
    float _3409 = _3311;
    float _3411 = _3403;
    float _3413 = _3405;
    float _3415 = _3313;
    if (!_3285)
    {
        float _3417 = fma(_2775, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3399);
        _3407 = _3417;
    }
    float _3419 = _3407;
    float _3421 = -_2743;
    float _3423 = fma(_3375, _3343, _3421);
    float _3425 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3427 = _3403 + _3425;
    float _3429 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3431 = _3405 + _3429;
    float _3433 = fma(_2737, _3423, _2743);
    float _3435 = _3427 * _3427;
    float _3437 = _3431 * _3431;
    float _3439 = -_2745;
    float _3441 = fma(_3375, _3393, _3439);
    float _3443 = _3201 * _3351;
    float _3445 = _3435 + _3437;
    float _3447 = _3433;
    float _3449 = _3435;
    float _3451 = _3437;
    if (!_3285)
    {
        float _3453 = fma(_2773, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3433);
        _3447 = _3453;
    }
    float _3455 = _3447;
    float _3457 = fma(_2737, _3441, _2745);
    float _3459 = -_3443;
    float _3461 = fma(_3203, _3345, _3459);
    float _3463 = sqrt(_3445);
    float _3465 = _3329 * _3365;
    float _3467 = _3457;
    if (!_3285)
    {
        float _3469 = fma(_2777, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3457);
        _3467 = _3469;
    }
    float _3471 = _3467;
    float _3473 = _3329 * _3461;
    float _3475 = _3327 * _3365;
    float _3477 = fma(_3323, _3345, _3465);
    float _3479 = _3315 * _3461;
    float _3481 = fma(_3323, _3347, _3473);
    float _3483 = _3315 * _3369;
    float _3485 = _3327 * _3369;
    float _3487 = _3315 * _3365;
    float _3489 = _3327 * _3461;
    float _3491 = _3461 * _3361;
    float _3493 = fma(_3317, _3347, _3479);
    float _3495 = fma(_3317, _3345, _3487);
    float _3497 = fma(_3331, _3345, _3475);
    bool _3499 = _3463 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3501 = fma(_3347, _3359, _3491);
    float _3503 = fma(_3331, _3347, _3489);
    float _3505 = fma(_3311, _3201, _3477);
    float _3507 = fma(_3311, _3203, _3401);
    float _3509 = fma(_3213, _3371, _3501);
    float _3511 = fma(_3311, _3213, _3481);
    float _3513 = fma(_3317, _3351, _3483);
    float _3515 = fma(_3331, _3351, _3485);
    float _3517 = _2975 + _3509;
    if (!_3499)
    {
        _3409 = _3517;
    }
    float _3519 = _3409;
    bool _3521 = !_3499;
    float _3523 = _3519;
    if (!_3521)
    {
        float _3525 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3529 = _3463 + _3527;
        float _3531 = _3517 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3533 = rsqrt(_3445);
        float _3535 = _3529 * _3525;
        float _3537 = _3535 * 0.15915493667125701904296875;
        float _3539 = _3537 * 6.283185482025146484375;
        float _3541 = sin(_3539);
        float _3543 = _3537 * 6.283185482025146484375;
        float _3545 = cos(_3543);
        float _3547 = fma(_3541, _3531, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3549 = _3533 * _3547;
        float _3551 = _3545 + (-1.0);
        float _3553 = _3427 * _3549;
        float _3555 = _3431 * _3549;
        float _3557 = _3551 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3559 = _3553 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3561 = _3553 * _3553;
        float _3563 = _3555 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3565 = fma(_3517, _3545, _3557);
        float _3567 = _3555 * _3555;
        _3523 = _3565;
        _3449 = _3561;
        _3451 = _3567;
        _3411 = _3559;
        _3413 = _3563;
    }
    float _3569 = _3523;
    float _3571 = _3449;
    float _3573 = _3451;
    float _3575 = _3411;
    float _3577 = _3413;
    float _3579 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3581 = _3569 + _3579;
    float _3583 = -_3301;
    float _3585 = fma(_3583, _3201, _3495);
    float _3587 = -_3301;
    float _3589 = fma(_3587, _3213, _3493);
    float _3591 = _3505 * _3419;
    float _3593 = fma(_3581, _3581, _3571);
    float _3595 = _3511 * _3419;
    float _3597 = -_3301;
    float _3599 = fma(_3597, _3203, _3513);
    float _3601 = _3507 * _3419;
    float _3603 = _3593 + _3573;
    float _3605 = fma(_3313, _3201, _3497);
    float _3607 = fma(_3313, _3213, _3503);
    float _3609 = fma(_3585, _3455, _3591);
    float _3611 = sqrt(_3603);
    float _3613 = fma(_3589, _3455, _3595);
    float _3615 = fma(_3313, _3203, _3515);
    float _3617 = fma(_3599, _3455, _3601);
    float _3619 = fma(_3605, _3471, _3609);
    float _3621 = fma(_3607, _3471, _3613);
    out.m_71.x = _2583;
    out.m_71.y = _2585;
    float _3623 = fma(_3615, _3471, _3617);
    out.m_73.x = _3619;
    out.m_73.y = _3621;
    out.m_73.z = _3623;
    bool _3625 = _3611 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3627 = isnan(_3611);
    bool _3629 = _3625 || _3627;
    bool _3631 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3633 = _3629 || _3631;
    if (!_3633)
    {
        _3415 = 1.0;
    }
    float _3635 = _3415;
    bool _3637 = !_3633;
    float _3639 = _3635;
    if (!_3637)
    {
        bool _3641 = _3611 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3643 = isnan(_3611);
        bool _3645 = _3641 || _3643;
        bool _3647 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3649 = _3645 || _3647;
        if (!_3649)
        {
            float _3651 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3653 = _3611 + _3651;
            float _3655 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3657 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3655;
            float _3659 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3661 = _3659 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3663 = 1.0 / _3657;
            float _3665 = _3653 * _3663;
            float _3667 = fma(_3665, _3661, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3639 = _3667;
            _3669 = true;
        }
        else
        {
            bool _3671 = _3611 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3673 = isnan(_3611);
            bool _3675 = _3671 || _3673;
            bool _3677 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3679 = _3675 || _3677;
            if (!_3679)
            {
                float _3681 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3683 = _3611 + _3681;
                float _3685 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3687 = _3685 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3689 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3691 = _3689 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3693 = 1.0 / _3687;
                float _3695 = _3683 * _3693;
                float _3697 = fma(_3695, _3691, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3639 = _3697;
                _3669 = true;
            }
            else
            {
                _3639 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3669 = false;
    float _3699 = _3639;
    float _3701 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3703 = _3569 + _3701;
    float _3705 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3707 = _3575 + _3705;
    float _3709 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3711 = _3577 + _3709;
    float _3713 = fma(_3703, _3699, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3715 = fma(_3707, _3699, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3717 = fma(_3711, _3699, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3719 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3721 = _3713 + _3719;
    float _3723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3725 = _3715 + _3723;
    float _3727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3729 = _3717 + _3727;
    float _3731 = _3721 * _3721;
    float _3733 = fma(_3725, _3725, _3731);
    float _3735 = fma(_3729, _3729, _3733);
    float _3737 = rsqrt(_3735);
    float _3739 = _3737 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3741 = _3725 * _3739;
    float _3743 = _3729 * _3739;
    float _3745 = _3741 * _3741;
    float _3747 = _3743 * _3743;
    float _3749 = _3745 + _3747;
    float _3751 = sqrt(_3749);
    bool _3753 = _3751 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3757 = _3751 + _3755;
    float _3759 = _3733;
    float _3761 = _3749;
    float _3763 = _3757;
    float _3765 = _3721;
    float _3767 = _3739;
    float _3769 = _3741;
    if (_3753)
    {
        float _3771 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3759 = _3771;
    }
    float _3773 = _3759;
    if (_3753)
    {
        float _3775 = rsqrt(_3749);
        _3761 = _3775;
    }
    float _3777 = _3761;
    float _3779 = _3773;
    if (_3753)
    {
        float _3781 = _3757 * _3773;
        _3763 = _3781;
    }
    float _3783 = _3763;
    if (_3753)
    {
        float _3785 = _3783 * 0.15915493667125701904296875;
        _3779 = _3785;
    }
    float _3787 = _3779;
    float _3789 = _3729;
    float _3791 = _3787;
    if (_3753)
    {
        float _3793 = _3787 * 6.283185482025146484375;
        float _3795 = sin(_3793);
        _3789 = _3795;
    }
    float _3797 = _3789;
    float _3799 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3801 = precise::max(0.0, _3799);
    float _3803 = _3737;
    float _3805 = _3801;
    if (_3753)
    {
        float _3807 = _3787 * 6.283185482025146484375;
        float _3809 = cos(_3807);
        _3803 = _3809;
    }
    float _3811 = _3803;
    float _3813 = -_3739;
    float _3815 = -_3801;
    float _3817 = fma(_3721, _3813, _3815);
    if (_3753)
    {
        float _3819 = _3817 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3765 = _3819;
    }
    float _3821 = _3765;
    float _3823 = _3821;
    float _3825 = _3797;
    if (_3753)
    {
        float _3827 = fma(_3797, _3821, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3823 = _3827;
    }
    float _3829 = _3823;
    float _3831 = _3829;
    if (!_3753)
    {
        _3825 = _3817;
    }
    float _3833 = _3825;
    float _3835 = _3833;
    float _3837 = _3811;
    if (_3753)
    {
        float _3839 = _3811 + (-1.0);
        _3805 = _3839;
    }
    float _3841 = _3805;
    float _3843 = _3841;
    if (_3753)
    {
        float _3845 = _3777 * _3829;
        _3767 = _3845;
    }
    float _3847 = _3767;
    if (!_3753)
    {
        _3831 = _3745;
    }
    float _3849 = _3831;
    float _3851 = sqrt(_3735);
    float _3853 = _3849;
    if (_3753)
    {
        float _3855 = _3841 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3791 = _3855;
    }
    float _3857 = _3791;
    if (_3753)
    {
        float _3859 = _3741 * _3847;
        _3769 = _3859;
    }
    float _3861 = _3769;
    if (!_3753)
    {
        _3843 = _3743;
    }
    float _3863 = _3843;
    float _3865 = _3863;
    if (_3753)
    {
        float _3867 = _3743 * _3847;
        _3865 = _3867;
    }
    float _3869 = _3865;
    if (_3753)
    {
        float _3871 = fma(_3817, _3811, _3857);
        _3835 = _3871;
    }
    float _3873 = _3835;
    if (_3753)
    {
        float _3875 = _3861 * _3861;
        _3853 = _3875;
    }
    float _3877 = _3853;
    if (!_3753)
    {
        _3837 = _3747;
    }
    float _3879 = _3837;
    float _3881 = _3879;
    if (_3753)
    {
        float _3883 = _3869 * _3869;
        _3881 = _3883;
    }
    float _3885 = _3881;
    float _3887 = fma(_3873, _3873, _3877);
    float _3889 = _3713 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3891 = _3887 + _3885;
    float _3893 = _3713 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3895 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3897 = fma(_3851, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3895);
    float _3899 = precise::clamp(_3897, 0.0, 1.0);
    float _3901 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3903 = rsqrt(_3891);
    float _3905 = fma(_3715, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3893);
    float _3907 = _3713 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3909 = -_3899;
    float _3911 = _3909 + 1.0;
    float _3913 = fma(_3715, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3889);
    float _3915 = fma(_3717, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3905);
    float _3917 = _3713 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3919 = fma(_3715, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3907);
    float _3921 = _3915 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3923 = fma(_3715, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3917);
    float _3925 = fma(_3717, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3919);
    float _3927 = abs(_3911);
    float _3929 = log2(_3927);
    float _3931 = _3921 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3933 = fma(_3717, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3923);
    float _3935 = _3925 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3937 = _3903 * _3861;
    float _3939 = -_3931;
    float _3941 = fma(_3939, _3901, 1.0);
    float _3943 = _3933 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3945 = _3935 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3947 = _3937 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3949 = _3903 * _3873;
    float _3951 = fma(_3717, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3913);
    float _3953 = fma(_3943, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3945);
    float _3955 = _3903 * _3869;
    float _3957 = -_3947;
    float _3959 = fma(_3949, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3957);
    float _3961 = _3951 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3963 = fma(_3921, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3953);
    float _3965 = _3929 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3967 = -_3955;
    float _3969 = fma(_3967, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3959);
    float _3971 = log2(_3941);
    float _3973 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3963);
    float _3975 = _3935 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3977 = fma(_3969, -0.5, 0.5);
    float _3979 = _3935 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3981 = fma(_3969, 0.5, 0.5);
    float _3983 = fma(_3943, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3975);
    float _3985 = exp2(_3965);
    float _3987 = fma(_3943, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3979);
    float _3989 = fma(_3921, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3983);
    float _3991 = _3949 + 1.0;
    float _3993 = fma(_3981, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3995 = fma(_3921, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3987);
    float _3997 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3989);
    float _3999 = 1.0 / _3973;
    float _4001 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3995);
    float _4003 = fma(_3981, _3993, -0.212114393711090087890625);
    float _4005 = fma(_3981, _4003, 1.570728778839111328125);
    float _4007 = sqrt(_3977);
    float _4009 = -_3949;
    float _4011 = fma(_3985, _3991, _4009);
    float _4013 = _3971 * 0.693147182464599609375;
    float _4015 = fma(_4011, 0.5, 0.5);
    float _4017 = _3997 * _3999;
    float _4019 = _4001 * _3999;
    float _4021 = _4013 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4023 = fma(_4017, 0.5, 0.5);
    float _4025 = fma(_4019, -0.5, 0.5);
    float _4027 = _4007 * 0.636619746685028076171875;
    float _4029 = -_4005;
    float _4031 = fma(_4027, _4029, 1.0);
    float3 _10046 = float3(_4023, _4025, _4021);
    float _4033 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10046, float3(0.0), isnan(_10046)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10046, float3(0.0), isnan(_10046)), level(0.0)).x;
    float3 _10057 = float3(_4023, _4025, _4021);
    float4 _4035 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10057, float3(0.0), isnan(_10057)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10057, float3(0.0), isnan(_10057)), level(0.0)).xyzw;
    float _4037 = _4035.x;
    float _4039 = _4035.y;
    float _4041 = _4035.z;
    float _4043 = _4035.w;
    float2 _10073 = float2(_4031, _4015);
    float3 _4047 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10073, float2(0.0), isnan(_10073)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10073, float2(0.0), isnan(_10073)), level(0.0)).xyz;
    float _4049 = _4047.x;
    float _4051 = _4047.y;
    float _4053 = _4047.z;
    float _4055 = _3929 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4057 = _3935 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2917;
    out.m_75.y = _2975;
    out.m_75.z = _2923;
    float _4059 = fma(_3943, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4057);
    float _4061 = exp2(_4055);
    out.m_53.x = 1.0;
    float _4063 = fma(_3921, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4059);
    out.m_77.x = _3715;
    out.m_77.y = _3713;
    out.m_77.z = _3717;
    float _4065 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4063);
    float _4067 = _4065 + _3973;
    out.gl_Position.x = _3997;
    out.gl_Position.y = _4001;
    out.gl_Position.z = _4065;
    out.gl_Position.w = _3973;
    float _4069 = _4067 * 0.5;
    float _4071 = -_4061;
    float _4073 = _4071 + 1.0;
    float _4075 = _4073 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.z = _4069;
    out.m_79.w = _3973;
    float _4077 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4079 = -_4075;
    float _4081 = _4079 + 1.0;
    out.m_81.w = _4077;
    float _4083 = _4075 * _4033;
    float _4085 = _4043 * _4083;
    float _4087 = _4053 * _4083;
    float _4089 = _4043 * _4081;
    float _4091 = fma(_4049, _4085, _4037);
    float _4093 = fma(_4051, _4085, _4039);
    float _4095 = fma(_4043, _4087, _4041);
    out.m_83.x = _4091;
    out.m_83.y = _4093;
    out.m_83.z = _4095;
    out.m_83.w = _4089;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3669 = false;
    bool _2851 = false;
    bool _2659 = false;
    bool _1455 = false;
    bool _1081 = false;
    bool _907 = false;
    bool _695 = false;
    bool _521 = false;
    bool _305 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = in.m_48.w;
    float _107 = trunc(_103);
    int _109 = int(_107);
    float _111 = -_105;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _113;
    bool _117 = _109 >= 1;
    float _119 = 0.0;
    float _121 = as_type<float>(_109);
    float _123 = _113;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _119;
    if (!_117)
    {
        out.m_53.x = 0.0;
    }
    int _127 = 0;
    if (!_117)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4164 = as_type<float>(_131);
        out.gl_Position.z = _4164;
    }
    if (!_117)
    {
        return out;
    }
    bool _135 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_105);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = float(_109);
    bool _147 = _113 >= _145;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    if (_151)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _121;
    if (_151)
    {
        out.m_53.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _133 = as_type<int>(_155);
    }
    int _157 = _133;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4219 = as_type<float>(_157);
        out.gl_Position.z = _4219;
    }
    if (_151)
    {
        return out;
    }
    float _159 = in.m_55.w;
    float _161 = 1.0 / _145;
    float _163 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_48.x;
    float _177 = in.m_48.y;
    float _179 = in.m_48.z;
    float _181 = in.m_46.x;
    float _183 = in.m_46.y;
    float _185 = in.m_46.z;
    float _187 = 0.0;
    float _189 = _163;
    if (!_173)
    {
        float _191 = _163 * _163;
        float _193 = _191 * 0.5;
        _187 = _193;
    }
    float _195 = _187;
    float _197 = _195;
    if (!_173)
    {
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    bool _203 = !_173;
    float _205 = _201;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _163 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _163);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    bool _239 = !_173;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _163 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _189 = _259;
    }
    float _261 = _189;
    bool _263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _265 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _267 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _271 = fma(_261, _175, _265);
    float _273 = fma(_261, _177, _267);
    float _275 = fma(_261, _179, _269);
    float _277 = fma(_271, _159, _181);
    float _279 = fma(_273, _159, _183);
    float _281 = fma(_275, _159, _185);
    float _283 = _113 * _161;
    bool _285 = !_263;
    float _303;
    if (!_285)
    {
        float _287 = in.m_57.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        _303 = _283;
    }
    _305 = false;
    float _307 = _303;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = _307 + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = _307 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _307 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _329;
    float _333 = 1.0 / _323;
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _337 = 1.0 / _331;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = 1.0 / _327;
    float _345 = _311 * _333;
    bool _347 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _349 = isnan(_307);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _359;
    float _363 = fma(_341, _345, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _365 = fma(_361, _345, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _367 = _315 * _337;
    bool _369 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _371 = isnan(_307);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = -_357;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _385;
    float _389 = _379 * _383;
    float _391 = fma(_387, _345, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _393 = _319 * _343;
    bool _395 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _397 = isnan(_307);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = -_379;
    float _409 = _407 + 1.0;
    bool _411 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _413 = isnan(_307);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _431 = -_405;
    float _433 = _431 + 1.0;
    float _435 = _405 * _409;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _441 = fma(_429, _393, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _443 = _421 * _433;
    float _445 = -_421;
    float _447 = _445 + 1.0;
    float _449 = fma(_439, _393, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _451 = fma(_425, _393, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _453 = _363 * _443;
    float _455 = _365 * _443;
    float _457 = _391 * _443;
    float _459 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].x, _453);
    float _461 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].y, _455);
    float _463 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].z, _457);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _469;
    float _473 = fma(_441, _435, _459);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _475;
    float _479 = fma(_467, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _481 = fma(_471, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _483 = fma(_449, _435, _461);
    float _485 = fma(_477, _367, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _487 = fma(_451, _435, _463);
    float _489 = fma(_479, _389, _473);
    float _491 = fma(_481, _389, _483);
    float _493 = fma(_485, _389, _487);
    float _495 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].x, _489);
    float _497 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].y, _491);
    float _499 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].z, _493);
    bool _501 = !_335;
    float _519;
    if (!_501)
    {
        float _503 = in.m_57.x;
        float _505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _507 = _503 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _509 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[11].x, _113);
        float _511 = _509 * _505;
        float _513 = floor(_511);
        float _515 = -_513;
        float _517 = _511 + _515;
        _519 = _517;
        _521 = true;
    }
    else
    {
        _519 = _283;
    }
    _521 = false;
    float _523 = _519;
    float _525 = in.m_55.x;
    float _527 = in.m_55.y;
    float _529 = in.m_55.z;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _533 = _523 + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _535;
    bool _539 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _541 = 1.0 / _537;
    float _543 = _497 * _527;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _549 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _551 = isnan(_523);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = _499 * _529;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _565 = _523 + _563;
    float _567 = 1.0 / _547;
    bool _569 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _571 = isnan(_523);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = _533 * _541;
    bool _583 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _585 = isnan(_523);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = -_559;
    float _597 = _595 + 1.0;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _599;
    float _603 = _593 * _597;
    float _605 = -_593;
    float _607 = _605 + 1.0;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _609;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _613;
    float _617 = fma(_601, _581, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _619 = _579 * _607;
    float _621 = fma(_611, _581, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _623 = fma(_615, _581, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _625 = _565 * _567;
    float _627 = _617 * _619;
    float _629 = _621 * _619;
    float _631 = _623 * _619;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _645 = -_579;
    float _647 = _645 + 1.0;
    float _649 = fma(_635, _625, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _651 = fma(_639, _625, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _653 = fma(_643, _625, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _655 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[107].x, _629);
    float _657 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[107].y, _627);
    float _659 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[107].z, _631);
    float _661 = _495 * _525;
    float _663 = fma(_649, _603, _655);
    float _665 = fma(_651, _603, _657);
    float _667 = fma(_653, _603, _659);
    float _669 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[109].x, _663);
    float _671 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[109].y, _665);
    float _673 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[109].z, _667);
    bool _675 = !_539;
    float _693;
    if (!_675)
    {
        float _677 = in.m_57.x;
        float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _681 = _677 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[11].y, _113);
        float _685 = _683 * _679;
        float _687 = floor(_685);
        float _689 = -_687;
        float _691 = _685 + _689;
        _693 = _691;
        _695 = true;
    }
    else
    {
        _693 = _283;
    }
    _695 = false;
    float _697 = _693;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _701 = _697 + _699;
    float _703 = _669 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _713 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _715 = isnan(_697);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _725;
    float _729 = 1.0 / _707;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _735 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _737 = isnan(_697);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = _671 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _753 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _755 = isnan(_697);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = _673 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _767 = 1.0 / _711;
    float _769 = -_745;
    float _771 = _769 + 1.0;
    bool _773 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _775 = _723 * _771;
    float _777 = _727 * _729;
    bool _779 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _781 = isnan(_697);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -_723;
    float _793 = _791 + 1.0;
    float _795 = 1.0 / _733;
    float _797 = fma(_777, _701, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _799;
    float _803 = _789 * _793;
    float _805 = -_789;
    float _807 = _805 + 1.0;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _813 = 1.0 / _751;
    float _815 = _763 * _807;
    float _817 = _811 * _767;
    float _819 = -_763;
    float _821 = _819 + 1.0;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _825 = _697 + _823;
    float _827 = _797 * _815;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _831 = _697 + _829;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _837 = _801 * _795;
    bool _839 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _841 = isnan(_697);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = fma(_817, _831, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _853 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[115].x, _827);
    float _855 = fma(_837, _825, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _859 = _697 + _857;
    float _861 = -_849;
    float _863 = _861 + 1.0;
    float _865 = fma(_851, _803, _853);
    float _867 = _835 * _813;
    float _869 = _745 * _863;
    float _871 = fma(_855, _775, _865);
    float _873 = fma(_867, _859, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _875 = _747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = fma(_873, _869, _871);
    float _879 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[119].x, _877);
    float _883 = _765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = _881 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _879;
    out.m_59.y = _875;
    out.m_59.z = _883;
    out.m_59.w = _885;
    bool _887 = !_773;
    float _905;
    if (!_887)
    {
        float _889 = in.m_57.x;
        float _891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _893 = _889 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _895 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[11].z, _113);
        float _897 = _895 * _891;
        float _899 = floor(_897);
        float _901 = -_899;
        float _903 = _897 + _901;
        _905 = _903;
        _907 = true;
    }
    else
    {
        _905 = _283;
    }
    _907 = false;
    float _909 = _905;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _913 = _909 + _911;
    bool _915 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _917 = isnan(_909);
    bool _919 = _915 || _917;
    bool _921 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _923 = _919 || _921;
    float _925 = float(_923);
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _929 = _909 + _927;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _931;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _939 = 1.0 / _933;
    bool _941 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _943 = 1.0 / _937;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _945;
    float _949 = _913 * _939;
    bool _951 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _953 = isnan(_909);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = -_925;
    float _965 = _963 + 1.0;
    bool _967 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _969 = isnan(_909);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    float _979 = fma(_947, _949, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _981 = _977 * _965;
    float _983 = -_977;
    float _985 = _983 + 1.0;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _987;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _991;
    float _995 = _929 * _943;
    float _997 = _961 * _985;
    float _999 = fma(_989, _949, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1001 = fma(_993, _949, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1003 = -_961;
    float _1005 = _1003 + 1.0;
    float _1007 = _979 * _997;
    float _1009 = _999 * _997;
    float _1011 = _1001 * _997;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1025 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1009);
    float _1027 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1007);
    float _1029 = fma(_1015, _995, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1031 = fma(_1019, _995, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1033 = fma(_1023, _995, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1035 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1011);
    float _1037 = fma(_1029, _981, _1025);
    float _1039 = fma(_1031, _981, _1027);
    float _1041 = fma(_1033, _981, _1035);
    float _1043 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1037);
    float _1045 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1039);
    float _1047 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1041);
    float _1049 = _1043 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1051 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1053 = _1047 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1055 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1057 = _1051 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1059 = _1053 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1055;
    out.m_61.y = _1057;
    out.m_61.z = _1059;
    bool _1061 = !_941;
    float _1079;
    if (!_1061)
    {
        float _1063 = in.m_57.x;
        float _1065 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1067 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1069 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[14].x, _113);
        float _1071 = _1069 * _1065;
        float _1073 = floor(_1071);
        float _1075 = -_1073;
        float _1077 = _1071 + _1075;
        _1079 = _1077;
        _1081 = true;
    }
    else
    {
        _1079 = _283;
    }
    _1081 = false;
    float _1083 = _1079;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1087 = _1083 + _1085;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1091 = _1083 + _1089;
    bool _1093 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1095 = isnan(_1083);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1101 = _1097 || _1099;
    float _1103 = float(_1101);
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1105;
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1113;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1121 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1123 = isnan(_1083);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1129 = _1125 || _1127;
    float _1131 = float(_1129);
    float _1133 = 1.0 / _1111;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1137 = _1083 + _1135;
    bool _1139 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1141 = isnan(_1083);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = 1.0 / _1107;
    float _1153 = -_1131;
    float _1155 = _1153 + 1.0;
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1157;
    bool _1161 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1163 = isnan(_1083);
    bool _1165 = _1161 || _1163;
    bool _1167 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1169 = _1165 || _1167;
    float _1171 = float(_1169);
    float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1175 = _1173 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1177 = _1149 * _1155;
    float _1179 = 1.0 / _1115;
    float _1181 = _1091 * _1133;
    bool _1183 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1185 = isnan(_1083);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1191 = _1187 || _1189;
    float _1193 = float(_1191);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1195;
    bool _1199 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1201 = 1.0 / _1119;
    float _1203 = _1087 * _1151;
    float _1205 = -_1103;
    float _1207 = _1205 + 1.0;
    float _1209 = _1131 * _1207;
    bool _1211 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1213 = isnan(_1083);
    bool _1215 = _1211 || _1213;
    bool _1217 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1219 = _1215 || _1217;
    float _1221 = float(_1219);
    float _1223 = _1137 * _1179;
    float _1225 = -_1149;
    float _1227 = _1225 + 1.0;
    float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1231 = _1083 + _1229;
    float _1233 = -_1193;
    float _1235 = _1233 + 1.0;
    float _1237 = 1.0 / _1159;
    float _1239 = _1193 * _1227;
    bool _1241 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1243 = isnan(_1083);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    float _1253 = _1221 * _1235;
    float _1255 = _1231 * _1201;
    float _1257 = -_1221;
    float _1259 = _1257 + 1.0;
    bool _1261 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1263 = isnan(_1083);
    bool _1265 = _1261 || _1263;
    bool _1267 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1269 = _1265 || _1267;
    float _1271 = float(_1269);
    float _1273 = -_1251;
    float _1275 = _1273 + 1.0;
    float _1277 = 1.0 / _1175;
    float _1279 = _1251 * _1259;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1283 = _1083 + _1281;
    float _1285 = _1271 * _1275;
    float _1287 = -_1271;
    float _1289 = _1287 + 1.0;
    float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1291;
    float _1295 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1295;
    float _1299 = _1171 * _1289;
    float _1301 = fma(_1293, _1203, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1305 = _1303 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1307 = -_1171;
    float _1309 = _1307 + 1.0;
    float _1311 = 1.0 / _1197;
    float _1313 = _1301 * _1299;
    float _1315 = fma(_1305, _1181, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1317 = fma(_1297, _1223, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1319 = fma(_1309, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1313);
    float _1321 = _1283 * _1237;
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1325 = _1083 + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1329 = _1083 + _1327;
    float _1331 = fma(_1315, _1285, _1319);
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1335 = _1333 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1337 = _1325 * _1277;
    float _1339 = fma(_1317, _1279, _1331);
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1341;
    float _1345 = fma(_1335, _1255, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1347 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1349 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1347;
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1353 = _1351 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1355 = fma(_1343, _1203, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1361 = fma(_1345, _1253, _1339);
    float _1363 = fma(_1349, _1321, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1365 = _1329 * _1311;
    float _1367 = fma(_1363, _1239, _1361);
    float _1369 = fma(_1359, _1337, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1371 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1371;
    float _1375 = _1355 * _1299;
    float _1377 = fma(_1353, _1181, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1379 = fma(_1369, _1177, _1367);
    float _1381 = fma(_1373, _1365, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1383 = fma(_1309, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1375);
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1385;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1393 = fma(_1381, _1209, _1379);
    float _1395 = fma(_1387, _1223, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1397 = fma(_1377, _1285, _1383);
    float _1399 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1393);
    float _1401 = fma(_1391, _1255, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1403;
    float _1407 = fma(_1395, _1279, _1397);
    out.m_63.y = _1399;
    float _1409 = fma(_1405, _1321, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1413 = _1411 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1415 = fma(_1401, _1253, _1407);
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1417;
    float _1421 = fma(_1413, _1337, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1423 = fma(_1409, _1239, _1415);
    float _1425 = fma(_1419, _1365, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1427 = fma(_1421, _1177, _1423);
    float _1429 = fma(_1425, _1209, _1427);
    float _1431 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1429);
    float _1433 = precise::clamp(_1431, 0.0, 1.0);
    bool _1435 = !_1199;
    float _1453;
    if (!_1435)
    {
        float _1437 = in.m_57.x;
        float _1439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1441 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1443 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[14].y, _113);
        float _1445 = _1443 * _1439;
        float _1447 = floor(_1445);
        float _1449 = -_1447;
        float _1451 = _1445 + _1449;
        _1453 = _1451;
        _1455 = true;
    }
    else
    {
        _1453 = _283;
    }
    _1455 = false;
    float _1457 = _1453;
    int _1459 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1461 = _1459;
    int _1463 = 0;
    int _1465 = _98(_1461, _1463, (*spvDescriptorSet0.support_buffer));
    float _1467 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1469 = int(_1467);
    float _1471 = in.m_57.x;
    float _1473 = in.m_57.y;
    float _1475 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1477 = int(_1475);
    float _1479 = float(_1469);
    float _1481 = 1.0 / _1479;
    float _1483 = float(uint(_1477));
    int _1485 = ~_1477;
    int _1487 = _1485 + 1;
    int _1489 = ~_1477;
    int _1491 = _1489 + 1;
    float _1493 = 1.0 / _1483;
    bool _1495 = _1477 == 0;
    int _1497 = ~_1477;
    int _1499 = _1497 + 1;
    float _1501 = _113 * _1481;
    float _1503 = trunc(_1501);
    int _1505 = int(_1503);
    int _1507 = as_type<int>(_1493) + (-2);
    float _1509 = float(uint(_1505));
    float _1511 = as_type<float>(_1507) * _1509;
    float _1513 = trunc(_1511);
    float _1515 = precise::max(_1513, 0.0);
    uint _1518 = uint(_1515);
    int _1520 = _1487 * int(_1518);
    int _1522 = _1520 + _1505;
    float _1524 = float(_1477);
    float _1526 = float(uint(_1522));
    float _1528 = as_type<float>(_1507) * _1526;
    float _1530 = trunc(_1528);
    float _1532 = precise::max(_1530, 0.0);
    uint _1534 = uint(_1532);
    int _1536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1538 = _1536 != 0;
    bool _1540 = !_1538;
    float _1542 = _1540 ? 7.345489978790283203125 : 1.0;
    float _1544 = _1542 * _1471;
    int _1546 = int(_1518) + int(_1534);
    float _1548 = floor(_1544);
    float _1550 = float(_1505);
    int _1552 = _1491 * _1546;
    int _1554 = _1552 + _1505;
    bool _1556 = _1550 >= _1524;
    bool _1558 = isnan(_1550);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan(_1524);
    bool _1564 = _1560 || _1562;
    float _1566 = float(_1564);
    bool _1568 = uint(_1554) >= uint(_1477);
    float _1570 = trunc(_1566);
    int _1572 = int(_1570);
    bool _1574 = !_1568;
    int _1576 = _1574 ? 0 : (-1);
    int _1578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1580 = _1578 != 0;
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1584 = _1582 != 0;
    int _1586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1588 = _1586 != 0;
    float _1590 = -_1548;
    float _1592 = _1544 + _1590;
    int _1594 = ~_1546;
    int _1596 = _1594 + _1576;
    int _1598 = _1596 + 1;
    float _1600 = _113 * _1524;
    float _1602 = _1592 * _1524;
    int _1604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1606 = _1604 != 0;
    int _1608 = _1477 * _1598;
    int _1610 = _1608 + _1505;
    float _1612 = _1600 * _161;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1616 = _1614 != 0;
    float _1618 = trunc(_1602);
    int _1620 = int(_1618);
    bool _1622 = !_1584;
    int _1624 = _1622 ? 0 : 1;
    int _1626 = ~_1572;
    int _1628 = _1626 + 1;
    int _1630 = _1628 + 1;
    bool _1632 = !_1495;
    int _1634 = _1632 ? _1610 : (-1);
    int _1636 = _1477 + (-1);
    float _1638 = trunc(_1612);
    int _1640 = int(_1638);
    int _1642 = abs(_1624);
    int _1644 = _1634 * _1630;
    bool _1646 = !_1616;
    int _1648 = _1646 ? 0 : 1;
    bool _1650 = !_1588;
    int _1652 = _1650 ? 0 : 1;
    int _1654 = _1572 * _1636;
    int _1656 = _1654 + _1644;
    bool _1658 = !_1580;
    int _1660 = _1658 ? 0 : 1;
    int _1662 = abs(_1648);
    int _1664 = abs(_1660);
    int _1666 = _1620 * _1662;
    int _1668 = _1666 + _1505;
    bool _1670 = !_1606;
    int _1672 = _1670 ? 0 : 1;
    int _1674 = abs(_1652);
    int _1676 = _1656 * _1642;
    int _1678 = abs(_1672);
    int _1680 = _1640 * _1664;
    int _1682 = _1680 + _1676;
    float _1684 = in.m_65.z;
    int _1686 = ~_1477;
    int _1688 = _1686 + 1;
    int _1690 = _1668 * _1674;
    int _1692 = _1690 + _1682;
    int _1694 = _1620 * _1678;
    int _1696 = _1694 + _1692;
    float _1698 = float(uint(_1696));
    float _1700 = as_type<float>(_1507) * _1698;
    float _1702 = trunc(_1700);
    float _1704 = precise::max(_1702, 0.0);
    uint _1706 = uint(_1704);
    float _1708 = trunc(_1684);
    int _1710 = int(_1708);
    int _1712 = _1688 * int(_1706);
    int _1714 = _1712 + _1696;
    float _1716 = float(uint(_1714));
    float _1718 = as_type<float>(_1507) * _1716;
    float _1720 = trunc(_1718);
    float _1722 = precise::max(_1720, 0.0);
    uint _1724 = uint(_1722);
    int _1726 = int(_1706) + int(_1724);
    int _1728 = _1499 * _1726;
    int _1730 = _1728 + _1696;
    int _1732 = _1465 + (-1);
    float _1734 = float(_1732);
    float _1736 = _1433 * _1734;
    float _1738 = trunc(_1736);
    int _1740 = int(_1738);
    int _1742 = _1740;
    int _1744 = 0;
    int _1746 = _99(_1742, _1744, (*spvDescriptorSet0.support_buffer));
    int _1748 = _1710;
    int _1750 = 0;
    int _1752 = _99(_1748, _1750, (*spvDescriptorSet0.support_buffer));
    float4 _1755 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1746, _1752)), 0).xyzw;
    float _1757 = _1755.x;
    float _1759 = _1755.y;
    float _1761 = _1755.z;
    float _1763 = _1755.w;
    bool _1765 = uint(_1730) >= uint(_1477);
    float _1767 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1769 = _1457 + _1767;
    int _1771 = ~_1477;
    int _1773 = _1771 + 1;
    bool _1775 = !_1765;
    int _1777 = _1775 ? 0 : (-1);
    int _1779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1781 = _1779 != 0;
    int _1783 = ~_1726;
    int _1785 = _1783 + _1777;
    int _1787 = _1785 + 1;
    float _1789 = float(uint(_1668));
    int _1791 = _1477 * _1787;
    int _1793 = _1791 + _1696;
    float _1795 = as_type<float>(_1507) * _1789;
    int _1797 = ~_1477;
    int _1799 = _1797 + 1;
    bool _1801 = !_1495;
    int _1803 = _1801 ? _1793 : (-1);
    float _1805 = trunc(_1795);
    float _1807 = precise::max(_1805, 0.0);
    uint _1809 = uint(_1807);
    int _1811 = _1803 >> 31;
    int _1813 = _1803 & 3;
    bool _1815 = _1813 != 0;
    int _1817 = _1811 & 3;
    int _1819 = _1803 & 3;
    bool _1821 = _1819 != 0;
    int _1823 = _1803 + _1817;
    bool _1825 = uint(_1819) > 1u;
    int _1827 = _1823 >> 2;
    int _1829 = _1799 * int(_1809);
    int _1831 = _1829 + _1668;
    bool _1833 = _1819 != 3;
    int _1835 = _1827 << 4;
    int _1837 = _1835 + 368;
    float _1839 = float(uint(_1831));
    uint _1841 = uint(int(uint(_1837) >> uint(2)));
    uint _1843 = uint(int(uint(int(_1841)) >> uint(2)));
    int _1845 = int(_1841) & 3;
    float _1847 = (*spvDescriptorSet0.vp_c9)._m0[int(_1843)][_1845];
    int _1849 = int(_1841) + 1;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    int _1853 = _1849 & 3;
    float _1855 = (*spvDescriptorSet0.vp_c9)._m0[int(_1851)][_1853];
    float _1857 = as_type<float>(_1507) * _1839;
    int _1859 = _1815 ? 0 : 1;
    int _1861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1863 = _1861 != 0;
    float _1865 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1867 = _1865 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    int _1869 = _1837 + 8;
    uint _1871 = uint(int(uint(_1869) >> uint(2)));
    uint _1873 = uint(int(uint(int(_1871)) >> uint(2)));
    int _1875 = int(_1871) & 3;
    float _1877 = (*spvDescriptorSet0.vp_c9)._m0[int(_1873)][_1875];
    int _1879 = int(_1871) + 1;
    uint _1881 = uint(int(uint(_1879) >> uint(2)));
    int _1883 = _1879 & 3;
    float _1885 = (*spvDescriptorSet0.vp_c9)._m0[int(_1881)][_1883];
    float _1887 = trunc(_1857);
    float _1889 = precise::max(_1887, 0.0);
    uint _1891 = uint(_1889);
    bool _1893 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1895 = isnan(_1457);
    bool _1897 = _1893 || _1895;
    bool _1899 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1901 = _1897 || _1899;
    float _1903 = float(_1901);
    bool _1905 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1907 = isnan(_1457);
    bool _1909 = _1905 || _1907;
    bool _1911 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1913 = _1909 || _1911;
    float _1915 = float(_1913);
    float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1919 = _1917 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1921 = 1.0 / _1867;
    float _1923 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1925 = int(_1809) + int(_1891);
    float _1927 = 1.0 / _1919;
    int _1929 = ~_1859;
    int _1931 = _1929 + 1;
    int _1933 = _1931 + 1;
    int _1935 = _1933;
    if (!_1825)
    {
        int _1937 = ~_1859;
        int _1939 = _1937 + 1;
        _1935 = _1939;
    }
    int _1941 = _1935;
    int _1943 = _1773 * _1925;
    int _1945 = _1943 + _1668;
    bool _1947 = uint(_1819) >= 2u;
    int _1949 = abs(_1941);
    bool _1951 = uint(_1945) >= uint(_1477);
    int _1953 = ~_1949;
    int _1955 = _1953 + 1;
    int _1957 = _1955 + 1;
    int _1959 = _1947 ? 0 : 1;
    bool _1961 = !_1951;
    int _1963 = _1961 ? 0 : (-1);
    bool _1965 = _1819 != 3;
    int _1967 = ~_1959;
    int _1969 = _1967 + 1;
    int _1971 = _1969 + 1;
    int _1973 = _1957 * as_type<int>(_1855);
    bool _1975 = !_1821;
    int _1977 = _1975 ? 0 : 1;
    int _1979 = _1971;
    if (_1833)
    {
        int _1981 = ~_1959;
        int _1983 = _1981 + 1;
        _1979 = _1983;
    }
    int _1985 = _1979;
    float _1987 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1989 = abs(_1977);
    bool _1991 = !_1965;
    int _1993 = _1991 ? 0 : (-1);
    int _1995 = abs(_1985);
    int _1997 = abs(_1993);
    int _1999 = ~_1989;
    int _2001 = _1999 + 1;
    int _2003 = _2001 + 1;
    int _2005 = _2003 * as_type<int>(_1847);
    int _2007 = _2005 + _1973;
    int _2009 = ~_1995;
    int _2011 = _2009 + 1;
    int _2013 = _2011 + 1;
    float _2015 = -_1923;
    float _2017 = fma(_1987, 2.0, _2015);
    int _2019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2021 = _2019 != 0;
    float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2025 = _2023 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2027 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2029 = int(_2027);
    int _2031 = ~_1997;
    int _2033 = _2031 + 1;
    int _2035 = _2033 + 1;
    int _2037 = _2013 * as_type<int>(_1877);
    int _2039 = _2037 + _2007;
    int _2041 = ~_1925;
    int _2043 = _2041 + _1963;
    int _2045 = _2043 + 1;
    float _2047 = _1473 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2049 = _2035 * as_type<int>(_1885);
    int _2051 = _2049 + _2039;
    bool _2053 = !_1781;
    int _2055 = _2053 ? 0 : 1;
    int _2057 = _1477 * _2045;
    int _2059 = _2057 + _1668;
    float _2061 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2063 = _2061 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2065 = abs(_2055);
    float _2067 = 1.0 / _2025;
    float _2069 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2071 = ~_2065;
    int _2073 = _2071 + 1;
    int _2075 = _2073 + 1;
    float _2077 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2079 = _2077 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2081 = fma(_2047, -2.0, _2069);
    float _2083 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2085 = _2083 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    int _2087 = abs(_2029);
    float _2089 = 1.0 / _2063;
    int _2091 = _2051 * _2075;
    float _2093 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2081);
    float _2095 = float(uint(_2087));
    float _2097 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2099 = _2097 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2101 = 1.0 / _2079;
    int _2103 = ~_2029;
    int _2105 = _2103 + 1;
    bool _2107 = _1473 > 0.5;
    bool _2109 = _2107 && _2021;
    float _2111 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2113 = 1.0 / _2085;
    bool _2115 = !_1495;
    int _2117 = _2115 ? _2059 : (-1);
    float _2119 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2111);
    bool _2121 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2123 = isnan(_1457);
    bool _2125 = _2121 || _2123;
    bool _2127 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2129 = _2125 || _2127;
    float _2131 = float(_2129);
    int _2133 = _2117 * _2065;
    int _2135 = _2133 + _2091;
    float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2137;
    float _2141 = 1.0 / _2095;
    float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2145 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2143;
    float _2147 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2149 = _2147 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2151 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2153 = _2151 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2155 = _2139 * _2101;
    float _2157 = _2145 * _2089;
    bool _2159 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2161 = isnan(_1457);
    bool _2163 = _2159 || _2161;
    bool _2165 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2167 = _2163 || _2165;
    float _2169 = float(_2167);
    float _2171 = _2153 * _2067;
    float _2173 = 1.0 / _2099;
    float _2175 = _2149 * _2113;
    int _2177 = abs(_2135);
    float _2179 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2181 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2179;
    float _2183 = float(uint(_2029));
    float _2185 = fma(_2157, _1769, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _2187 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2189 = isnan(_1457);
    bool _2191 = _2187 || _2189;
    bool _2193 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2195 = _2191 || _2193;
    float _2197 = float(_2195);
    float _2199 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2201 = _2199 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    int _2203 = as_type<int>(_2141) + (-2);
    float _2205 = 1.0 / _2183;
    float _2207 = float(uint(_2177));
    float _2209 = -_2169;
    float _2211 = _2209 + 1.0;
    bool _2213 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2215 = isnan(_1457);
    bool _2217 = _2213 || _2215;
    bool _2219 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2221 = _2217 || _2219;
    float _2223 = float(_2221);
    float _2225 = _2201 * _1921;
    float _2227 = float(uint(_2135));
    float _2229 = _2197 * _2211;
    float _2231 = _2181 * _2173;
    float _2233 = as_type<float>(_2203) * _2207;
    float _2235 = -_2197;
    float _2237 = _2235 + 1.0;
    float _2239 = -_2223;
    float _2241 = _2239 + 1.0;
    bool _2243 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2245 = isnan(_1457);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2251 = _2247 || _2249;
    float _2253 = float(_2251);
    float _2255 = _2223 * _2237;
    float _2257 = _2131 * _2241;
    float _2259 = -_2131;
    float _2261 = _2259 + 1.0;
    float _2263 = trunc(_2233);
    float _2265 = precise::max(_2263, 0.0);
    uint _2267 = uint(_2265);
    float _2269 = _2253 * _2261;
    int _2271 = as_type<int>(_2205) + (-2);
    float _2273 = -_2253;
    float _2275 = _2273 + 1.0;
    bool _2277 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2279 = isnan(_1457);
    bool _2281 = _2277 || _2279;
    bool _2283 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2285 = _2281 || _2283;
    float _2287 = float(_2285);
    float _2289 = as_type<float>(_2271) * _2227;
    float _2291 = -_1903;
    float _2293 = _2291 + 1.0;
    float _2295 = _1903 * _2275;
    float _2297 = _1915 * _2293;
    float _2299 = trunc(_2289);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    int _2305 = ~int(_2267);
    int _2307 = _2305 + 1;
    float _2309 = -_1915;
    float _2311 = _2309 + 1.0;
    float _2313 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2315 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2313;
    int _2317 = _2307 * _2087;
    int _2319 = _2317 + _2177;
    float _2321 = _2287 * _2311;
    float _2323 = _2315 * _1927;
    float _2325 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2327 = _1457 + _2325;
    float _2329 = float(uint(_2319));
    float _2331 = _2185 * _2321;
    float _2333 = -_2287;
    float _2335 = _2333 + 1.0;
    float _2337 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2339 = _1457 + _2337;
    int _2341 = _2105 * int(_2303);
    int _2343 = _2341 + _2135;
    float _2345 = as_type<float>(_2203) * _2329;
    float _2347 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2349 = _1457 + _2347;
    float _2351 = fma(_2335, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2331);
    float _2353 = fma(_2175, _2339, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2355 = float(uint(_2343));
    float _2357 = trunc(_2345);
    float _2359 = precise::max(_2357, 0.0);
    uint _2361 = uint(_2359);
    float _2363 = fma(_2171, _2349, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2365 = fma(_2155, _2327, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2367 = as_type<float>(_2271) * _2355;
    float _2369 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2371 = _1457 + _2369;
    float _2373 = _2155;
    if (_1863)
    {
        float _2375 = in.m_57.x;
        _2373 = _2375;
    }
    float _2377 = _2373;
    float _2379 = fma(_2363, _2297, _2351);
    float _2381 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2383 = _1457 + _2381;
    float _2385 = fma(_2231, _2371, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2387 = trunc(_2367);
    float _2389 = precise::max(_2387, 0.0);
    uint _2391 = uint(_2389);
    float _2393 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2395 = _1457 + _2393;
    float _2397 = fma(_2365, _2295, _2379);
    float _2399 = fma(_2225, _2383, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2401 = fma(_2323, _2395, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    int _2403 = int(_2267) + int(_2361);
    float _2405 = in.m_65.x;
    float _2407 = fma(_2353, _2269, _2397);
    float _2409 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2411 = ~_2403;
    int _2413 = _2411 + 1;
    float _2415 = fma(_2385, _2257, _2407);
    int _2417 = ~_2029;
    int _2419 = _2417 + 1;
    float _2421 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2409);
    float _2423 = fma(_2399, _2255, _2415);
    int _2425 = int(_2303) + int(_2391);
    float _2427 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2421);
    int _2429 = _2413 * _2087;
    int _2431 = _2429 + _2177;
    bool _2433 = _2377 > 0.5;
    bool _2435 = _2433 && _1863;
    int _2437 = _2419 * _2425;
    int _2439 = _2437 + _2135;
    float _2441 = fma(_2401, _2229, _2423);
    int _2443 = _2135 ^ _2029;
    float _2445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2447 = uint(_2431) >= uint(_2087);
    float _2449 = fma(_2169, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2441);
    bool _2451 = uint(_2439) >= uint(_2029);
    float _2453 = in.m_65.y;
    bool _2455 = !_2447;
    int _2457 = _2455 ? 0 : (-1);
    float _2459 = -_113;
    float _2461 = fma(_2459, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2017);
    uint _2463 = uint(int(uint(_2443) >> uint(31)));
    float _2465 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2467 = !_2451;
    float _2469 = _2467 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    out.m_67.x = _2449;
    float _2471 = as_type<float>(_2413);
    float _2473 = _2469;
    if (_1863)
    {
        _2471 = _2405;
    }
    float _2475 = _2471;
    int _2477 = ~_2457;
    int _2479 = _2403 + _2477;
    int _2481 = _2479 + 1;
    int _2483 = ~int(_2463);
    int _2485 = _2483 + 1;
    float _2487 = _2475;
    if (_2435)
    {
        float _2489 = -_2475;
        float _2491 = _2489 + 1.0;
        _2487 = _2491;
    }
    float _2493 = _2487;
    int _2495 = ~_2425;
    int _2497 = _2495 + as_type<int>(_2469);
    int _2499 = _2497 + 1;
    float _2501 = _2445 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2503 = _2481 ^ _2485;
    bool _2505 = _2029 == 0;
    bool _2507 = _2029 == 0;
    int _2509 = _2029 * _2499;
    int _2511 = _2509 + _2135;
    int _2513 = ~_2485;
    int _2515 = _2513 + _2503;
    int _2517 = _2515 + 1;
    float _2519 = _2465 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2521 = _2499;
    if (!_1863)
    {
        _2473 = _2405;
    }
    float _2523 = _2473;
    float _2525 = _2453;
    float _2527 = _2523;
    if (_2109)
    {
        float _2529 = -_2453;
        float _2531 = _2529 + 1.0;
        _2525 = _2531;
    }
    float _2533 = _2525;
    bool _2535 = !_2505;
    int _2537 = _2535 ? _2511 : (-1);
    bool _2539 = !_2507;
    int _2541 = _2539 ? _2517 : (-1);
    if (_1863)
    {
        _2527 = _2493;
    }
    float _2543 = _2527;
    uint _2545 = as_type<uint>(half2(float2(_1763, 0.0)));
    float _2547 = float(_2537);
    float _2549 = fma(_2501, _2543, -0.5);
    uint _2551 = extract_bits(_2545, 0u, 8u);
    int _2553 = int(_2551) & 255;
    uint _2555 = extract_bits(_2545, 8u, 8u);
    int _2557 = int(_2555) & 255;
    int _2559 = _2557 << 8;
    int _2561 = _2553 | _2559;
    float _2563 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2119);
    float _2565 = float(_2541);
    float _2567 = fma(_2501, _2547, _2461);
    bool _2569 = _2561 >= 32768;
    float _2571 = fma(_2519, _2533, -0.5);
    float _2573 = -_2093;
    float _2575 = fma(_2519, _2565, _2573);
    float _2577 = fma(_2563, _2549, _2567);
    float _2579 = fma(_2427, _2571, _2575);
    int _2581 = _1740 + 1;
    float _2583 = _2577 + 0.5;
    float _2585 = _2579 + 0.5;
    int _2587 = min(_1732, _2581);
    int _2589 = _2561 + (-1024);
    int _2591 = _2589;
    if (_2569)
    {
        int _2593 = ~_2561;
        int _2595 = _2593 + 33792;
        int _2597 = _2595 + 1;
        _2591 = _2597;
    }
    int _2599 = _2591;
    int _2601 = _2599 + 30719;
    float _2603 = float(_2601);
    float _2605 = fma(_2603, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2607 = abs(_2605);
    float _2609 = -_2607;
    float _2611 = _2609 + 1.0;
    float _2613 = abs(_2605);
    float _2615 = fma(_2613, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2617 = _2605 < 0.0;
    float _2619 = float(_2617);
    int _2621 = as_type<int>(_2611) + (-218103808);
    float _2623 = abs(_2605);
    float _2625 = fma(_2623, _2615, -0.212114393711090087890625);
    bool _2627 = uint(_2621) >= 1920991232u;
    float _2629 = abs(_2605);
    float _2631 = fma(_2629, _2625, 1.570728778839111328125);
    bool _2633 = !_2627;
    float _2657;
    if (!_2633)
    {
        int _2635 = as_type<int>(_2611);
        int _2637 = _2457;
        int _2639 = _2499;
        int _2641 = 13056;
        int _2643;
        int _2645;
        int _2647;
        int _2649;
        int _2651;
        int _2653;
        int _2655;
        _96(_2635, _2637, _2639, _2641, _2643, _2645, _2647, _2649, _2651, _2653, _2655, out.gl_Position, out.gl_PointSize);
        _2521 = _2653;
        _2657 = as_type<float>(_2647);
        _2659 = true;
    }
    else
    {
        float _2661 = rsqrt(_2611);
        float _2663 = _2611 * _2661;
        float _2665 = _2661 * 0.5;
        float _2667 = -_2663;
        float _2669 = 0.0 + _2667;
        float _2671 = fma(_2665, _2669, 0.5);
        float _2673 = fma(_2663, _2671, _2663);
        float _2675 = -_2673;
        float _2677 = 0.0 + _2675;
        float _2679 = fma(_2673, _2677, _2611);
        float _2681 = fma(_2665, _2679, _2673);
        _2657 = _2681;
    }
    _2659 = false;
    float _2683 = _2657;
    int _2685 = _2521;
    int _2687 = _2587;
    int _2689 = 0;
    int _2691 = _99(_2687, _2689, (*spvDescriptorSet0.support_buffer));
    int _2693 = _1710;
    int _2695 = 0;
    int _2697 = _99(_2693, _2695, (*spvDescriptorSet0.support_buffer));
    float4 _2699 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2691, _2697)), 0).xyzw;
    float _2701 = _2699.x;
    float _2703 = _2699.y;
    float _2705 = _2699.z;
    float _2707 = _2699.w;
    float _2709 = _2631 * _2683;
    float _2711 = _2619 * 2.0;
    float _2713 = _2603 * 3.883221149444580078125;
    float _2715 = floor(_1736);
    float _2717 = -_2711;
    float _2719 = fma(_2709, _2717, _2709);
    float _2721 = _2713 * 0.15915493667125701904296875;
    float _2723 = fma(_2619, 3.1415927410125732421875, _2719);
    float _2725 = _2721 * 6.283185482025146484375;
    float _2727 = cos(_2725);
    float _2729 = _2723 * 0.15915493667125701904296875;
    float _2731 = _2729 * 6.283185482025146484375;
    float _2733 = sin(_2731);
    float _2735 = -_2715;
    float _2737 = _1736 + _2735;
    float _2739 = _2721 * 6.283185482025146484375;
    float _2741 = sin(_2739);
    float _2743 = _2733 * _2727;
    float _2745 = _2733 * _2741;
    uint _2747 = as_type<uint>(half2(float2(_2707, 0.0)));
    float _2749 = -_1757;
    float _2751 = _2749 + _2701;
    float _2753 = -_1759;
    float _2755 = _2753 + _2703;
    float _2757 = -_1761;
    float _2759 = _2757 + _2705;
    uint _2761 = extract_bits(_2747, 0u, 8u);
    int _2763 = int(_2761) & 255;
    uint _2765 = extract_bits(_2747, 8u, 8u);
    int _2767 = int(_2765) & 255;
    int _2769 = _2767 << 8;
    int _2771 = _2763 | _2769;
    float _2773 = fma(_2737, _2751, _1757);
    float _2775 = fma(_2737, _2755, _1759);
    float _2777 = fma(_2737, _2759, _1761);
    bool _2779 = _2771 >= 32768;
    int _2781 = _2771 + (-1024);
    int _2783 = _2781;
    if (_2779)
    {
        int _2785 = ~_2771;
        int _2787 = _2785 + 33792;
        int _2789 = _2787 + 1;
        _2783 = _2789;
    }
    int _2791 = _2783;
    int _2793 = _2791 + 30719;
    float _2795 = float(_2793);
    float _2797 = fma(_2795, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2799 = abs(_2797);
    float _2801 = -_2799;
    float _2803 = _2801 + 1.0;
    float _2805 = abs(_2797);
    float _2807 = fma(_2805, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2809 = _2797 < 0.0;
    float _2811 = float(_2809);
    int _2813 = as_type<int>(_2803) + (-218103808);
    float _2815 = abs(_2797);
    float _2817 = fma(_2815, _2807, -0.212114393711090087890625);
    bool _2819 = uint(_2813) >= 1920991232u;
    float _2821 = abs(_2797);
    float _2823 = fma(_2821, _2817, 1.570728778839111328125);
    bool _2825 = !_2819;
    float _2849;
    if (!_2825)
    {
        int _2827 = as_type<int>(_2803);
        int _2829 = as_type<int>(_2703);
        int _2831 = _2685;
        int _2833 = 13968;
        int _2835;
        int _2837;
        int _2839;
        int _2841;
        int _2843;
        int _2845;
        int _2847;
        _96(_2827, _2829, _2831, _2833, _2835, _2837, _2839, _2841, _2843, _2845, _2847, out.gl_Position, out.gl_PointSize);
        _2849 = as_type<float>(_2839);
        _2851 = true;
    }
    else
    {
        float _2853 = rsqrt(_2803);
        float _2855 = _2803 * _2853;
        float _2857 = _2853 * 0.5;
        float _2859 = -_2855;
        float _2861 = 0.0 + _2859;
        float _2863 = fma(_2857, _2861, 0.5);
        float _2865 = fma(_2855, _2863, _2855);
        float _2867 = -_2865;
        float _2869 = 0.0 + _2867;
        float _2871 = fma(_2865, _2869, _2803);
        float _2873 = fma(_2857, _2871, _2865);
        _2849 = _2873;
    }
    _2851 = false;
    float _2875 = _2849;
    float _2877 = in.m_57.x;
    float _2879 = in.m_57.y;
    float _2881 = in.m_57.z;
    float _2883 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2885 = log2(_2883);
    float _2887 = _279 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2889 = _279 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2891 = _279 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2895 = _2893 != 0;
    int _2897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2899 = _2897 != 0;
    int _2901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2903 = _2901 != 0;
    float _2905 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2887);
    float _2907 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2889);
    float _2909 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2891);
    float _2911 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2905);
    float _2913 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2909);
    float _2915 = _2823 * _2875;
    float _2917 = _2911 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2919 = _2811 * 2.0;
    float _2921 = _2885 * _113;
    float _2923 = _2913 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2925 = _661 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2927 = -_2919;
    float _2929 = fma(_2915, _2927, _2915);
    float _2931 = _561 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2933 = _543 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2935 = exp2(_2921);
    float _2937 = _2881 * 2.0;
    float _2939 = _2877 * 2.0;
    float _2941 = _2881 + _2877;
    float _2943 = _2879 * 2.0;
    float _2945 = _2795 * 3.883221149444580078125;
    float _2947 = floor(_2937);
    float _2949 = floor(_2939);
    bool _2951 = _2947 > 0.0;
    float _2953 = floor(_2943);
    bool _2955 = _2947 >= 0.0;
    bool _2957 = isnan(_2947);
    bool _2959 = _2955 || _2957;
    bool _2961 = isnan(0.0);
    bool _2963 = _2959 || _2961;
    float _2965 = _2941 + (-1.0);
    float _2967 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2907);
    int _2969 = _2963 ? 0 : 1;
    float _2971 = fma(_2965, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _2973 = _2949 > 0.0;
    float _2975 = _2967 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2977 = ~_2969;
    int _2979 = _2977 + 1;
    int _2981 = _2979 + 1;
    int _2983 = _2981;
    if (!_2951)
    {
        int _2985 = ~_2969;
        int _2987 = _2985 + 1;
        _2983 = _2987;
    }
    int _2989 = _2983;
    bool _2991 = !_2895;
    int _2993 = _2991 ? 0 : 1;
    float _2995 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2997 = 1.0 + _2995;
    bool _2999 = _2949 >= 0.0;
    bool _3001 = isnan(_2949);
    bool _3003 = _2999 || _3001;
    bool _3005 = isnan(0.0);
    bool _3007 = _3003 || _3005;
    float _3009 = -_2935;
    float _3011 = _3009 + 1.0;
    int _3013 = abs(_2993);
    float _3015 = 1.0 / _2997;
    float _3017 = in.m_69.x;
    float _3019 = in.m_69.y;
    float _3021 = in.m_69.z;
    bool _3023 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3025 = isnan(1.0);
    bool _3027 = _3023 || _3025;
    bool _3029 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3031 = _3027 || _3029;
    bool _3033 = _2953 > 0.0;
    bool _3035 = _2953 >= 0.0;
    bool _3037 = isnan(_2953);
    bool _3039 = _3035 || _3037;
    bool _3041 = isnan(0.0);
    bool _3043 = _3039 || _3041;
    float _3045 = _2879 + _2877;
    int _3047 = _3007 ? 0 : 1;
    bool _3049 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3051 = isnan(0.0);
    bool _3053 = _3049 || _3051;
    bool _3055 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3057 = _3053 || _3055;
    float _3059 = _3045 + (-1.0);
    float _3061 = float(_3013);
    float _3063 = float(_2989);
    float _3065 = fma(_3059, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3067 = _3057 ? _3011 : 0.0;
    int _3069 = _3043 ? 0 : 1;
    float _3071 = _3061 * _3063;
    bool _3073 = !_2903;
    int _3075 = _3073 ? 0 : 1;
    if (_3031)
    {
        float _3077 = _3067 * _3015;
        _123 = _3077;
    }
    float _3079 = _123;
    int _3081 = ~_3069;
    int _3083 = _3081 + 1;
    int _3085 = _3083 + 1;
    float _3087 = _3071 * (-2.0);
    int _3089 = _3085;
    if (!_3033)
    {
        int _3091 = ~_3069;
        int _3093 = _3091 + 1;
        _3089 = _3093;
    }
    int _3095 = _3089;
    float _3097 = _2877 + (-0.5);
    int _3099 = abs(_3075);
    float _3101 = -_2975;
    float _3103 = _3101 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _3105 = ~_3047;
    int _3107 = _3105 + 1;
    int _3109 = _3107 + 1;
    float _3111 = fma(_3087, _3017, _3017);
    int _3113 = _3109;
    if (!_2973)
    {
        int _3115 = ~_3047;
        int _3117 = _3115 + 1;
        _3113 = _3117;
    }
    int _3119 = _3113;
    float _3121 = -_2917;
    float _3123 = _3121 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3125 = float(_3099);
    float _3127 = _3103 * _3103;
    float _3129 = float(_3095);
    float _3131 = fma(_3097, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3111);
    bool _3133 = !_2899;
    int _3135 = _3133 ? 0 : 1;
    float _3137 = -_2923;
    float _3139 = _3137 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3141 = fma(_3123, _3123, _3127);
    float _3143 = _3125 * _3129;
    int _3145 = abs(_3135);
    float _3147 = fma(_3065, _3087, _3065);
    float _3149 = fma(_3139, _3139, _3141);
    float _3151 = _3143 * (-2.0);
    float _3153 = float(_3145);
    float _3155 = _2881 + (-0.5);
    float _3157 = float(_3119);
    float _3159 = fma(_3151, _3021, _3021);
    float _3161 = _2881 + _2879;
    float _3163 = rsqrt(_3149);
    float _3165 = fma(_2971, _3151, _2971);
    float _3167 = _3153 * _3157;
    float _3169 = fma(_3155, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3159);
    float _3171 = _3161 + (-1.0);
    float _3173 = _3167 * (-2.0);
    float _3175 = _2879 + (-0.5);
    float _3177 = fma(_3147, _3079, _3131);
    float _3179 = fma(_3171, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3181 = fma(_3173, _3019, _3019);
    float _3183 = fma(_3165, _3079, _3169);
    float _3185 = _3177 * 0.15915493667125701904296875;
    float _3187 = fma(_3179, _3173, _3179);
    float _3189 = fma(_3175, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3181);
    float _3191 = _3183 * 0.15915493667125701904296875;
    float _3193 = _3185 * 6.283185482025146484375;
    float _3195 = sin(_3193);
    float _3197 = fma(_2811, 3.1415927410125732421875, _2929);
    float _3199 = fma(_3187, _3079, _3189);
    float _3201 = _3123 * _3163;
    float _3203 = _3139 * _3163;
    float _3205 = _2945 * 0.15915493667125701904296875;
    float _3207 = _3199 * 0.15915493667125701904296875;
    float _3209 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3211 = _3201 * _3209;
    float _3213 = _3103 * _3163;
    float _3215 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3217 = _3203 * _3215;
    float _3219 = _3185 * 6.283185482025146484375;
    float _3221 = cos(_3219);
    float _3223 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3225 = -_3211;
    float _3227 = fma(_3203, _3223, _3225);
    float _3229 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3231 = _3213 * _3229;
    float _3233 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3235 = -_3217;
    float _3237 = fma(_3213, _3233, _3235);
    float _3239 = _3227 * _3227;
    bool _3241 = _2775 != 0.0;
    bool _3243 = isnan(_2775);
    bool _3245 = _3241 || _3243;
    bool _3247 = isnan(0.0);
    bool _3249 = _3245 || _3247;
    float _3251 = _3197 * 0.15915493667125701904296875;
    float _3253 = _3191 * 6.283185482025146484375;
    float _3255 = sin(_3253);
    float _3257 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3259 = -_3231;
    float _3261 = fma(_3201, _3257, _3259);
    float _3263 = fma(_3237, _3237, _3239);
    float _3265 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2777);
    float _3267 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2775);
    bool _3269 = _2773 == 0.0;
    bool _3271 = !_3249;
    bool _3273 = _3269 && _3271;
    float _3275 = _2931 * _3265;
    float _3277 = _3191 * 6.283185482025146484375;
    float _3279 = cos(_3277);
    float _3281 = _2933 * _3267;
    bool _3283 = _2777 == 0.0;
    bool _3285 = _3283 && _3273;
    float _3287 = _3207 * 6.283185482025146484375;
    float _3289 = cos(_3287);
    float _3291 = fma(_3261, _3261, _3263);
    float _3293 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2773);
    float _3295 = _3195 * _3255;
    float _3297 = _2925 * _3293;
    float _3299 = _3207 * 6.283185482025146484375;
    float _3301 = sin(_3299);
    float _3303 = _3195 * _3279;
    float _3305 = _3221 * _3279;
    float _3307 = rsqrt(_3291);
    float _3309 = _3221 * _3255;
    float _3311 = _3195 * _3289;
    float _3313 = _3221 * _3289;
    float _3315 = _3289 * _3255;
    float _3317 = _3289 * _3279;
    float _3319 = _3311 * _3281;
    float _3321 = -_3309;
    float _3323 = fma(_3301, _3303, _3321);
    float _3325 = -_3303;
    float _3327 = fma(_3301, _3309, _3325);
    float _3329 = fma(_3301, _3295, _3305);
    float _3331 = fma(_3301, _3305, _3295);
    float _3333 = _3323 * _3281;
    float _3335 = -_3301;
    float _3337 = fma(_3335, _3297, _3319);
    float _3339 = _3329 * _3281;
    float _3341 = _3205 * 6.283185482025146484375;
    float _3343 = cos(_3341);
    float _3345 = _3237 * _3307;
    float _3347 = _3227 * _3307;
    float _3349 = fma(_3317, _3297, _3333);
    float _3351 = _3261 * _3307;
    float _3353 = fma(_3315, _3297, _3339);
    float _3355 = _3203 * _3347;
    float _3357 = _3213 * _3345;
    float _3359 = fma(_3331, _3275, _3349);
    float _3361 = fma(_3327, _3275, _3353);
    float _3363 = -_3355;
    float _3365 = fma(_3213, _3351, _3363);
    float _3367 = -_3357;
    float _3369 = fma(_3201, _3347, _3367);
    float _3371 = fma(_3313, _3275, _3337);
    float _3373 = _3251 * 6.283185482025146484375;
    float _3375 = sin(_3373);
    float _3377 = _3365 * _3361;
    float _3379 = _3369 * _3361;
    float _3381 = _3329 * _3369;
    float _3383 = fma(_3345, _3359, _3377);
    float _3385 = fma(_3351, _3359, _3379);
    float _3387 = -_2605;
    float _3389 = _3387 + _2797;
    float _3391 = _3205 * 6.283185482025146484375;
    float _3393 = sin(_3391);
    float _3395 = fma(_3201, _3371, _3383);
    float _3397 = fma(_3203, _3371, _3385);
    float _3399 = fma(_2737, _3389, _2605);
    float _3401 = fma(_3323, _3351, _3381);
    float _3403 = _2917 + _3395;
    float _3405 = _2923 + _3397;
    float _3407 = _3399;
    float _3409 = _3311;
    float _3411 = _3403;
    float _3413 = _3405;
    float _3415 = _3313;
    if (!_3285)
    {
        float _3417 = fma(_2775, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3399);
        _3407 = _3417;
    }
    float _3419 = _3407;
    float _3421 = -_2743;
    float _3423 = fma(_3375, _3343, _3421);
    float _3425 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3427 = _3403 + _3425;
    float _3429 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3431 = _3405 + _3429;
    float _3433 = fma(_2737, _3423, _2743);
    float _3435 = _3427 * _3427;
    float _3437 = _3431 * _3431;
    float _3439 = -_2745;
    float _3441 = fma(_3375, _3393, _3439);
    float _3443 = _3201 * _3351;
    float _3445 = _3435 + _3437;
    float _3447 = _3433;
    float _3449 = _3435;
    float _3451 = _3437;
    if (!_3285)
    {
        float _3453 = fma(_2773, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3433);
        _3447 = _3453;
    }
    float _3455 = _3447;
    float _3457 = fma(_2737, _3441, _2745);
    float _3459 = -_3443;
    float _3461 = fma(_3203, _3345, _3459);
    float _3463 = sqrt(_3445);
    float _3465 = _3329 * _3365;
    float _3467 = _3457;
    if (!_3285)
    {
        float _3469 = fma(_2777, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3457);
        _3467 = _3469;
    }
    float _3471 = _3467;
    float _3473 = _3329 * _3461;
    float _3475 = _3327 * _3365;
    float _3477 = fma(_3323, _3345, _3465);
    float _3479 = _3315 * _3461;
    float _3481 = fma(_3323, _3347, _3473);
    float _3483 = _3315 * _3369;
    float _3485 = _3327 * _3369;
    float _3487 = _3315 * _3365;
    float _3489 = _3327 * _3461;
    float _3491 = _3461 * _3361;
    float _3493 = fma(_3317, _3347, _3479);
    float _3495 = fma(_3317, _3345, _3487);
    float _3497 = fma(_3331, _3345, _3475);
    bool _3499 = _3463 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3501 = fma(_3347, _3359, _3491);
    float _3503 = fma(_3331, _3347, _3489);
    float _3505 = fma(_3311, _3201, _3477);
    float _3507 = fma(_3311, _3203, _3401);
    float _3509 = fma(_3213, _3371, _3501);
    float _3511 = fma(_3311, _3213, _3481);
    float _3513 = fma(_3317, _3351, _3483);
    float _3515 = fma(_3331, _3351, _3485);
    float _3517 = _2975 + _3509;
    if (!_3499)
    {
        _3409 = _3517;
    }
    float _3519 = _3409;
    bool _3521 = !_3499;
    float _3523 = _3519;
    if (!_3521)
    {
        float _3525 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3529 = _3463 + _3527;
        float _3531 = _3517 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3533 = rsqrt(_3445);
        float _3535 = _3529 * _3525;
        float _3537 = _3535 * 0.15915493667125701904296875;
        float _3539 = _3537 * 6.283185482025146484375;
        float _3541 = sin(_3539);
        float _3543 = _3537 * 6.283185482025146484375;
        float _3545 = cos(_3543);
        float _3547 = fma(_3541, _3531, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3549 = _3533 * _3547;
        float _3551 = _3545 + (-1.0);
        float _3553 = _3427 * _3549;
        float _3555 = _3431 * _3549;
        float _3557 = _3551 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3559 = _3553 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3561 = _3553 * _3553;
        float _3563 = _3555 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3565 = fma(_3517, _3545, _3557);
        float _3567 = _3555 * _3555;
        _3523 = _3565;
        _3449 = _3561;
        _3451 = _3567;
        _3411 = _3559;
        _3413 = _3563;
    }
    float _3569 = _3523;
    float _3571 = _3449;
    float _3573 = _3451;
    float _3575 = _3411;
    float _3577 = _3413;
    float _3579 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3581 = _3569 + _3579;
    float _3583 = -_3301;
    float _3585 = fma(_3583, _3201, _3495);
    float _3587 = -_3301;
    float _3589 = fma(_3587, _3213, _3493);
    float _3591 = _3505 * _3419;
    float _3593 = fma(_3581, _3581, _3571);
    float _3595 = _3511 * _3419;
    float _3597 = -_3301;
    float _3599 = fma(_3597, _3203, _3513);
    float _3601 = _3507 * _3419;
    float _3603 = _3593 + _3573;
    float _3605 = fma(_3313, _3201, _3497);
    float _3607 = fma(_3313, _3213, _3503);
    float _3609 = fma(_3585, _3455, _3591);
    float _3611 = sqrt(_3603);
    float _3613 = fma(_3589, _3455, _3595);
    float _3615 = fma(_3313, _3203, _3515);
    float _3617 = fma(_3599, _3455, _3601);
    float _3619 = fma(_3605, _3471, _3609);
    float _3621 = fma(_3607, _3471, _3613);
    out.m_71.x = _2583;
    out.m_71.y = _2585;
    float _3623 = fma(_3615, _3471, _3617);
    out.m_73.x = _3619;
    out.m_73.y = _3621;
    out.m_73.z = _3623;
    bool _3625 = _3611 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3627 = isnan(_3611);
    bool _3629 = _3625 || _3627;
    bool _3631 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3633 = _3629 || _3631;
    if (!_3633)
    {
        _3415 = 1.0;
    }
    float _3635 = _3415;
    bool _3637 = !_3633;
    float _3639 = _3635;
    if (!_3637)
    {
        bool _3641 = _3611 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3643 = isnan(_3611);
        bool _3645 = _3641 || _3643;
        bool _3647 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3649 = _3645 || _3647;
        if (!_3649)
        {
            float _3651 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3653 = _3611 + _3651;
            float _3655 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3657 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3655;
            float _3659 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3661 = _3659 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3663 = 1.0 / _3657;
            float _3665 = _3653 * _3663;
            float _3667 = fma(_3665, _3661, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3639 = _3667;
            _3669 = true;
        }
        else
        {
            bool _3671 = _3611 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3673 = isnan(_3611);
            bool _3675 = _3671 || _3673;
            bool _3677 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3679 = _3675 || _3677;
            if (!_3679)
            {
                float _3681 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3683 = _3611 + _3681;
                float _3685 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3687 = _3685 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3689 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3691 = _3689 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3693 = 1.0 / _3687;
                float _3695 = _3683 * _3693;
                float _3697 = fma(_3695, _3691, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3639 = _3697;
                _3669 = true;
            }
            else
            {
                _3639 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3669 = false;
    float _3699 = _3639;
    float _3701 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3703 = _3569 + _3701;
    float _3705 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3707 = _3575 + _3705;
    float _3709 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3711 = _3577 + _3709;
    float _3713 = fma(_3703, _3699, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3715 = fma(_3707, _3699, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3717 = fma(_3711, _3699, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3719 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3721 = _3713 + _3719;
    float _3723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3725 = _3715 + _3723;
    float _3727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3729 = _3717 + _3727;
    float _3731 = _3721 * _3721;
    float _3733 = fma(_3725, _3725, _3731);
    float _3735 = fma(_3729, _3729, _3733);
    float _3737 = rsqrt(_3735);
    float _3739 = _3737 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3741 = _3725 * _3739;
    float _3743 = _3729 * _3739;
    float _3745 = _3741 * _3741;
    float _3747 = _3743 * _3743;
    float _3749 = _3745 + _3747;
    float _3751 = sqrt(_3749);
    bool _3753 = _3751 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3757 = _3751 + _3755;
    float _3759 = _3733;
    float _3761 = _3749;
    float _3763 = _3757;
    float _3765 = _3721;
    float _3767 = _3739;
    float _3769 = _3741;
    if (_3753)
    {
        float _3771 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3759 = _3771;
    }
    float _3773 = _3759;
    if (_3753)
    {
        float _3775 = rsqrt(_3749);
        _3761 = _3775;
    }
    float _3777 = _3761;
    float _3779 = _3773;
    if (_3753)
    {
        float _3781 = _3757 * _3773;
        _3763 = _3781;
    }
    float _3783 = _3763;
    if (_3753)
    {
        float _3785 = _3783 * 0.15915493667125701904296875;
        _3779 = _3785;
    }
    float _3787 = _3779;
    float _3789 = _3729;
    float _3791 = _3787;
    if (_3753)
    {
        float _3793 = _3787 * 6.283185482025146484375;
        float _3795 = sin(_3793);
        _3789 = _3795;
    }
    float _3797 = _3789;
    float _3799 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3801 = precise::max(0.0, _3799);
    float _3803 = _3737;
    float _3805 = _3801;
    if (_3753)
    {
        float _3807 = _3787 * 6.283185482025146484375;
        float _3809 = cos(_3807);
        _3803 = _3809;
    }
    float _3811 = _3803;
    float _3813 = -_3739;
    float _3815 = -_3801;
    float _3817 = fma(_3721, _3813, _3815);
    if (_3753)
    {
        float _3819 = _3817 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3765 = _3819;
    }
    float _3821 = _3765;
    float _3823 = _3821;
    float _3825 = _3797;
    if (_3753)
    {
        float _3827 = fma(_3797, _3821, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3823 = _3827;
    }
    float _3829 = _3823;
    float _3831 = _3829;
    if (!_3753)
    {
        _3825 = _3817;
    }
    float _3833 = _3825;
    float _3835 = _3833;
    float _3837 = _3811;
    if (_3753)
    {
        float _3839 = _3811 + (-1.0);
        _3805 = _3839;
    }
    float _3841 = _3805;
    float _3843 = _3841;
    if (_3753)
    {
        float _3845 = _3777 * _3829;
        _3767 = _3845;
    }
    float _3847 = _3767;
    if (!_3753)
    {
        _3831 = _3745;
    }
    float _3849 = _3831;
    float _3851 = sqrt(_3735);
    float _3853 = _3849;
    if (_3753)
    {
        float _3855 = _3841 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3791 = _3855;
    }
    float _3857 = _3791;
    if (_3753)
    {
        float _3859 = _3741 * _3847;
        _3769 = _3859;
    }
    float _3861 = _3769;
    if (!_3753)
    {
        _3843 = _3743;
    }
    float _3863 = _3843;
    float _3865 = _3863;
    if (_3753)
    {
        float _3867 = _3743 * _3847;
        _3865 = _3867;
    }
    float _3869 = _3865;
    if (_3753)
    {
        float _3871 = fma(_3817, _3811, _3857);
        _3835 = _3871;
    }
    float _3873 = _3835;
    if (_3753)
    {
        float _3875 = _3861 * _3861;
        _3853 = _3875;
    }
    float _3877 = _3853;
    if (!_3753)
    {
        _3837 = _3747;
    }
    float _3879 = _3837;
    float _3881 = _3879;
    if (_3753)
    {
        float _3883 = _3869 * _3869;
        _3881 = _3883;
    }
    float _3885 = _3881;
    float _3887 = fma(_3873, _3873, _3877);
    float _3889 = _3713 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3891 = _3887 + _3885;
    float _3893 = _3713 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3895 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3897 = fma(_3851, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3895);
    float _3899 = precise::clamp(_3897, 0.0, 1.0);
    float _3901 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3903 = rsqrt(_3891);
    float _3905 = fma(_3715, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3893);
    float _3907 = _3713 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3909 = -_3899;
    float _3911 = _3909 + 1.0;
    float _3913 = fma(_3715, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3889);
    float _3915 = fma(_3717, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3905);
    float _3917 = _3713 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3919 = fma(_3715, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3907);
    float _3921 = _3915 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3923 = fma(_3715, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3917);
    float _3925 = fma(_3717, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3919);
    float _3927 = abs(_3911);
    float _3929 = log2(_3927);
    float _3931 = _3921 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3933 = fma(_3717, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3923);
    float _3935 = _3925 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3937 = _3903 * _3861;
    float _3939 = -_3931;
    float _3941 = fma(_3939, _3901, 1.0);
    float _3943 = _3933 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3945 = _3935 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3947 = _3937 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3949 = _3903 * _3873;
    float _3951 = fma(_3717, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3913);
    float _3953 = fma(_3943, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3945);
    float _3955 = _3903 * _3869;
    float _3957 = -_3947;
    float _3959 = fma(_3949, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3957);
    float _3961 = _3951 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3963 = fma(_3921, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3953);
    float _3965 = _3929 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3967 = -_3955;
    float _3969 = fma(_3967, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3959);
    float _3971 = log2(_3941);
    float _3973 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3963);
    float _3975 = _3935 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3977 = fma(_3969, -0.5, 0.5);
    float _3979 = _3935 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3981 = fma(_3969, 0.5, 0.5);
    float _3983 = fma(_3943, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3975);
    float _3985 = exp2(_3965);
    float _3987 = fma(_3943, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3979);
    float _3989 = fma(_3921, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3983);
    float _3991 = _3949 + 1.0;
    float _3993 = fma(_3981, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3995 = fma(_3921, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3987);
    float _3997 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3989);
    float _3999 = 1.0 / _3973;
    float _4001 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3995);
    float _4003 = fma(_3981, _3993, -0.212114393711090087890625);
    float _4005 = fma(_3981, _4003, 1.570728778839111328125);
    float _4007 = sqrt(_3977);
    float _4009 = -_3949;
    float _4011 = fma(_3985, _3991, _4009);
    float _4013 = _3971 * 0.693147182464599609375;
    float _4015 = fma(_4011, 0.5, 0.5);
    float _4017 = _3997 * _3999;
    float _4019 = _4001 * _3999;
    float _4021 = _4013 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4023 = fma(_4017, 0.5, 0.5);
    float _4025 = fma(_4019, -0.5, 0.5);
    float _4027 = _4007 * 0.636619746685028076171875;
    float _4029 = -_4005;
    float _4031 = fma(_4027, _4029, 1.0);
    float3 _10046 = float3(_4023, _4025, _4021);
    float _4033 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10046, float3(0.0), isnan(_10046)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10046, float3(0.0), isnan(_10046)), level(0.0)).x;
    float3 _10057 = float3(_4023, _4025, _4021);
    float4 _4035 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10057, float3(0.0), isnan(_10057)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10057, float3(0.0), isnan(_10057)), level(0.0)).xyzw;
    float _4037 = _4035.x;
    float _4039 = _4035.y;
    float _4041 = _4035.z;
    float _4043 = _4035.w;
    float2 _10073 = float2(_4031, _4015);
    float3 _4047 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10073, float2(0.0), isnan(_10073)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10073, float2(0.0), isnan(_10073)), level(0.0)).xyz;
    float _4049 = _4047.x;
    float _4051 = _4047.y;
    float _4053 = _4047.z;
    float _4055 = _3929 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4057 = _3935 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2917;
    out.m_75.y = _2975;
    out.m_75.z = _2923;
    float _4059 = fma(_3943, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4057);
    float _4061 = exp2(_4055);
    out.m_53.x = 1.0;
    float _4063 = fma(_3921, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4059);
    out.m_77.x = _3715;
    out.m_77.y = _3713;
    out.m_77.z = _3717;
    float _4065 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4063);
    float _4067 = _4065 + _3973;
    out.gl_Position.x = _3997;
    out.gl_Position.y = _4001;
    out.gl_Position.z = _4065;
    out.gl_Position.w = _3973;
    float _4069 = _4067 * 0.5;
    float _4071 = -_4061;
    float _4073 = _4071 + 1.0;
    float _4075 = _4073 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.z = _4069;
    out.m_79.w = _3973;
    float _4077 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4079 = -_4075;
    float _4081 = _4079 + 1.0;
    out.m_81.w = _4077;
    float _4083 = _4075 * _4033;
    float _4085 = _4043 * _4083;
    float _4087 = _4053 * _4083;
    float _4089 = _4043 * _4081;
    float _4091 = fma(_4049, _4085, _4037);
    float _4093 = fma(_4051, _4085, _4039);
    float _4095 = fma(_4043, _4087, _4041);
    out.m_83.x = _4091;
    out.m_83.y = _4093;
    out.m_83.z = _4095;
    out.m_83.w = _4089;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3669 = false;
    bool _2851 = false;
    bool _2659 = false;
    bool _1455 = false;
    bool _1081 = false;
    bool _907 = false;
    bool _695 = false;
    bool _521 = false;
    bool _305 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = in.m_48.w;
    float _107 = trunc(_103);
    int _109 = int(_107);
    float _111 = -_105;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _113;
    bool _117 = _109 >= 1;
    float _119 = 0.0;
    float _121 = as_type<float>(_109);
    float _123 = _113;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _119;
    if (!_117)
    {
        out.m_53.x = 0.0;
    }
    int _127 = 0;
    if (!_117)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4164 = as_type<float>(_131);
        out.gl_Position.z = _4164;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _135 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_105);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = float(_109);
    bool _147 = _113 >= _145;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    if (_151)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _121;
    if (_151)
    {
        out.m_53.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _133 = as_type<int>(_155);
    }
    int _157 = _133;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4219 = as_type<float>(_157);
        out.gl_Position.z = _4219;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _159 = in.m_55.w;
    float _161 = 1.0 / _145;
    float _163 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_48.x;
    float _177 = in.m_48.y;
    float _179 = in.m_48.z;
    float _181 = in.m_46.x;
    float _183 = in.m_46.y;
    float _185 = in.m_46.z;
    float _187 = 0.0;
    float _189 = _163;
    if (!_173)
    {
        float _191 = _163 * _163;
        float _193 = _191 * 0.5;
        _187 = _193;
    }
    float _195 = _187;
    float _197 = _195;
    if (!_173)
    {
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    bool _203 = !_173;
    float _205 = _201;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _163 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _163);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    bool _239 = !_173;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _163 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _189 = _259;
    }
    float _261 = _189;
    bool _263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _265 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _267 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _271 = fma(_261, _175, _265);
    float _273 = fma(_261, _177, _267);
    float _275 = fma(_261, _179, _269);
    float _277 = fma(_271, _159, _181);
    float _279 = fma(_273, _159, _183);
    float _281 = fma(_275, _159, _185);
    float _283 = _113 * _161;
    bool _285 = !_263;
    float _303;
    if (!_285)
    {
        float _287 = in.m_57.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        _303 = _283;
    }
    _305 = false;
    float _307 = _303;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = _307 + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = _307 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _307 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _329;
    float _333 = 1.0 / _323;
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _337 = 1.0 / _331;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = 1.0 / _327;
    float _345 = _311 * _333;
    bool _347 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _349 = isnan(_307);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _359;
    float _363 = fma(_341, _345, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _365 = fma(_361, _345, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _367 = _315 * _337;
    bool _369 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _371 = isnan(_307);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = -_357;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _385;
    float _389 = _379 * _383;
    float _391 = fma(_387, _345, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _393 = _319 * _343;
    bool _395 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _397 = isnan(_307);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = -_379;
    float _409 = _407 + 1.0;
    bool _411 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _413 = isnan(_307);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _431 = -_405;
    float _433 = _431 + 1.0;
    float _435 = _405 * _409;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _441 = fma(_429, _393, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _443 = _421 * _433;
    float _445 = -_421;
    float _447 = _445 + 1.0;
    float _449 = fma(_439, _393, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _451 = fma(_425, _393, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _453 = _363 * _443;
    float _455 = _365 * _443;
    float _457 = _391 * _443;
    float _459 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].x, _453);
    float _461 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].y, _455);
    float _463 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].z, _457);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _469;
    float _473 = fma(_441, _435, _459);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _475;
    float _479 = fma(_467, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _481 = fma(_471, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _483 = fma(_449, _435, _461);
    float _485 = fma(_477, _367, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _487 = fma(_451, _435, _463);
    float _489 = fma(_479, _389, _473);
    float _491 = fma(_481, _389, _483);
    float _493 = fma(_485, _389, _487);
    float _495 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].x, _489);
    float _497 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].y, _491);
    float _499 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].z, _493);
    bool _501 = !_335;
    float _519;
    if (!_501)
    {
        float _503 = in.m_57.x;
        float _505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _507 = _503 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _509 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[11].x, _113);
        float _511 = _509 * _505;
        float _513 = floor(_511);
        float _515 = -_513;
        float _517 = _511 + _515;
        _519 = _517;
        _521 = true;
    }
    else
    {
        _519 = _283;
    }
    _521 = false;
    float _523 = _519;
    float _525 = in.m_55.x;
    float _527 = in.m_55.y;
    float _529 = in.m_55.z;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _533 = _523 + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _535;
    bool _539 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _541 = 1.0 / _537;
    float _543 = _497 * _527;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _549 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _551 = isnan(_523);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = _499 * _529;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _565 = _523 + _563;
    float _567 = 1.0 / _547;
    bool _569 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _571 = isnan(_523);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = _533 * _541;
    bool _583 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _585 = isnan(_523);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = -_559;
    float _597 = _595 + 1.0;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _599;
    float _603 = _593 * _597;
    float _605 = -_593;
    float _607 = _605 + 1.0;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _609;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _613;
    float _617 = fma(_601, _581, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _619 = _579 * _607;
    float _621 = fma(_611, _581, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _623 = fma(_615, _581, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _625 = _565 * _567;
    float _627 = _617 * _619;
    float _629 = _621 * _619;
    float _631 = _623 * _619;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _645 = -_579;
    float _647 = _645 + 1.0;
    float _649 = fma(_635, _625, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _651 = fma(_639, _625, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _653 = fma(_643, _625, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _655 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[107].x, _629);
    float _657 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[107].y, _627);
    float _659 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[107].z, _631);
    float _661 = _495 * _525;
    float _663 = fma(_649, _603, _655);
    float _665 = fma(_651, _603, _657);
    float _667 = fma(_653, _603, _659);
    float _669 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[109].x, _663);
    float _671 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[109].y, _665);
    float _673 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[109].z, _667);
    bool _675 = !_539;
    float _693;
    if (!_675)
    {
        float _677 = in.m_57.x;
        float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _681 = _677 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[11].y, _113);
        float _685 = _683 * _679;
        float _687 = floor(_685);
        float _689 = -_687;
        float _691 = _685 + _689;
        _693 = _691;
        _695 = true;
    }
    else
    {
        _693 = _283;
    }
    _695 = false;
    float _697 = _693;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _701 = _697 + _699;
    float _703 = _669 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _713 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _715 = isnan(_697);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _725;
    float _729 = 1.0 / _707;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _735 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _737 = isnan(_697);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = _671 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _753 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _755 = isnan(_697);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = _673 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _767 = 1.0 / _711;
    float _769 = -_745;
    float _771 = _769 + 1.0;
    bool _773 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _775 = _723 * _771;
    float _777 = _727 * _729;
    bool _779 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _781 = isnan(_697);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -_723;
    float _793 = _791 + 1.0;
    float _795 = 1.0 / _733;
    float _797 = fma(_777, _701, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _799;
    float _803 = _789 * _793;
    float _805 = -_789;
    float _807 = _805 + 1.0;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _813 = 1.0 / _751;
    float _815 = _763 * _807;
    float _817 = _811 * _767;
    float _819 = -_763;
    float _821 = _819 + 1.0;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _825 = _697 + _823;
    float _827 = _797 * _815;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _831 = _697 + _829;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _837 = _801 * _795;
    bool _839 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _841 = isnan(_697);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = fma(_817, _831, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _853 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[115].x, _827);
    float _855 = fma(_837, _825, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _859 = _697 + _857;
    float _861 = -_849;
    float _863 = _861 + 1.0;
    float _865 = fma(_851, _803, _853);
    float _867 = _835 * _813;
    float _869 = _745 * _863;
    float _871 = fma(_855, _775, _865);
    float _873 = fma(_867, _859, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _875 = _747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = fma(_873, _869, _871);
    float _879 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[119].x, _877);
    float _883 = _765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = _881 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _879;
    out.m_59.y = _875;
    out.m_59.z = _883;
    out.m_59.w = _885;
    bool _887 = !_773;
    float _905;
    if (!_887)
    {
        float _889 = in.m_57.x;
        float _891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _893 = _889 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _895 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[11].z, _113);
        float _897 = _895 * _891;
        float _899 = floor(_897);
        float _901 = -_899;
        float _903 = _897 + _901;
        _905 = _903;
        _907 = true;
    }
    else
    {
        _905 = _283;
    }
    _907 = false;
    float _909 = _905;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _913 = _909 + _911;
    bool _915 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _917 = isnan(_909);
    bool _919 = _915 || _917;
    bool _921 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _923 = _919 || _921;
    float _925 = float(_923);
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _929 = _909 + _927;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _931;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _939 = 1.0 / _933;
    bool _941 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _943 = 1.0 / _937;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _945;
    float _949 = _913 * _939;
    bool _951 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _953 = isnan(_909);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = -_925;
    float _965 = _963 + 1.0;
    bool _967 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _969 = isnan(_909);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    float _979 = fma(_947, _949, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _981 = _977 * _965;
    float _983 = -_977;
    float _985 = _983 + 1.0;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _987;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _991;
    float _995 = _929 * _943;
    float _997 = _961 * _985;
    float _999 = fma(_989, _949, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1001 = fma(_993, _949, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1003 = -_961;
    float _1005 = _1003 + 1.0;
    float _1007 = _979 * _997;
    float _1009 = _999 * _997;
    float _1011 = _1001 * _997;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1025 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1009);
    float _1027 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1007);
    float _1029 = fma(_1015, _995, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1031 = fma(_1019, _995, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1033 = fma(_1023, _995, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1035 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1011);
    float _1037 = fma(_1029, _981, _1025);
    float _1039 = fma(_1031, _981, _1027);
    float _1041 = fma(_1033, _981, _1035);
    float _1043 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1037);
    float _1045 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1039);
    float _1047 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1041);
    float _1049 = _1043 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1051 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1053 = _1047 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1055 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1057 = _1051 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1059 = _1053 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1055;
    out.m_61.y = _1057;
    out.m_61.z = _1059;
    bool _1061 = !_941;
    float _1079;
    if (!_1061)
    {
        float _1063 = in.m_57.x;
        float _1065 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1067 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1069 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[14].x, _113);
        float _1071 = _1069 * _1065;
        float _1073 = floor(_1071);
        float _1075 = -_1073;
        float _1077 = _1071 + _1075;
        _1079 = _1077;
        _1081 = true;
    }
    else
    {
        _1079 = _283;
    }
    _1081 = false;
    float _1083 = _1079;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1087 = _1083 + _1085;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1091 = _1083 + _1089;
    bool _1093 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1095 = isnan(_1083);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1101 = _1097 || _1099;
    float _1103 = float(_1101);
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1105;
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1113;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1121 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1123 = isnan(_1083);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1129 = _1125 || _1127;
    float _1131 = float(_1129);
    float _1133 = 1.0 / _1111;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1137 = _1083 + _1135;
    bool _1139 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1141 = isnan(_1083);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = 1.0 / _1107;
    float _1153 = -_1131;
    float _1155 = _1153 + 1.0;
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1157;
    bool _1161 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1163 = isnan(_1083);
    bool _1165 = _1161 || _1163;
    bool _1167 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1169 = _1165 || _1167;
    float _1171 = float(_1169);
    float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1175 = _1173 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1177 = _1149 * _1155;
    float _1179 = 1.0 / _1115;
    float _1181 = _1091 * _1133;
    bool _1183 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1185 = isnan(_1083);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1191 = _1187 || _1189;
    float _1193 = float(_1191);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1195;
    bool _1199 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1201 = 1.0 / _1119;
    float _1203 = _1087 * _1151;
    float _1205 = -_1103;
    float _1207 = _1205 + 1.0;
    float _1209 = _1131 * _1207;
    bool _1211 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1213 = isnan(_1083);
    bool _1215 = _1211 || _1213;
    bool _1217 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1219 = _1215 || _1217;
    float _1221 = float(_1219);
    float _1223 = _1137 * _1179;
    float _1225 = -_1149;
    float _1227 = _1225 + 1.0;
    float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1231 = _1083 + _1229;
    float _1233 = -_1193;
    float _1235 = _1233 + 1.0;
    float _1237 = 1.0 / _1159;
    float _1239 = _1193 * _1227;
    bool _1241 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1243 = isnan(_1083);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    float _1253 = _1221 * _1235;
    float _1255 = _1231 * _1201;
    float _1257 = -_1221;
    float _1259 = _1257 + 1.0;
    bool _1261 = _1083 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1263 = isnan(_1083);
    bool _1265 = _1261 || _1263;
    bool _1267 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1269 = _1265 || _1267;
    float _1271 = float(_1269);
    float _1273 = -_1251;
    float _1275 = _1273 + 1.0;
    float _1277 = 1.0 / _1175;
    float _1279 = _1251 * _1259;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1283 = _1083 + _1281;
    float _1285 = _1271 * _1275;
    float _1287 = -_1271;
    float _1289 = _1287 + 1.0;
    float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1291;
    float _1295 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1295;
    float _1299 = _1171 * _1289;
    float _1301 = fma(_1293, _1203, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1305 = _1303 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1307 = -_1171;
    float _1309 = _1307 + 1.0;
    float _1311 = 1.0 / _1197;
    float _1313 = _1301 * _1299;
    float _1315 = fma(_1305, _1181, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1317 = fma(_1297, _1223, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1319 = fma(_1309, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1313);
    float _1321 = _1283 * _1237;
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1325 = _1083 + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1329 = _1083 + _1327;
    float _1331 = fma(_1315, _1285, _1319);
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1335 = _1333 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1337 = _1325 * _1277;
    float _1339 = fma(_1317, _1279, _1331);
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1341;
    float _1345 = fma(_1335, _1255, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1347 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1349 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1347;
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1353 = _1351 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1355 = fma(_1343, _1203, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1361 = fma(_1345, _1253, _1339);
    float _1363 = fma(_1349, _1321, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1365 = _1329 * _1311;
    float _1367 = fma(_1363, _1239, _1361);
    float _1369 = fma(_1359, _1337, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1371 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1371;
    float _1375 = _1355 * _1299;
    float _1377 = fma(_1353, _1181, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1379 = fma(_1369, _1177, _1367);
    float _1381 = fma(_1373, _1365, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1383 = fma(_1309, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1375);
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1385;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1393 = fma(_1381, _1209, _1379);
    float _1395 = fma(_1387, _1223, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1397 = fma(_1377, _1285, _1383);
    float _1399 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1393);
    float _1401 = fma(_1391, _1255, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1403;
    float _1407 = fma(_1395, _1279, _1397);
    out.m_63.y = _1399;
    float _1409 = fma(_1405, _1321, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1413 = _1411 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1415 = fma(_1401, _1253, _1407);
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1417;
    float _1421 = fma(_1413, _1337, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1423 = fma(_1409, _1239, _1415);
    float _1425 = fma(_1419, _1365, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1427 = fma(_1421, _1177, _1423);
    float _1429 = fma(_1425, _1209, _1427);
    float _1431 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1429);
    float _1433 = precise::clamp(_1431, 0.0, 1.0);
    bool _1435 = !_1199;
    float _1453;
    if (!_1435)
    {
        float _1437 = in.m_57.x;
        float _1439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1441 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1443 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[14].y, _113);
        float _1445 = _1443 * _1439;
        float _1447 = floor(_1445);
        float _1449 = -_1447;
        float _1451 = _1445 + _1449;
        _1453 = _1451;
        _1455 = true;
    }
    else
    {
        _1453 = _283;
    }
    _1455 = false;
    float _1457 = _1453;
    int _1459 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1461 = _1459;
    int _1463 = 0;
    int _1465 = _98(_1461, _1463, (*spvDescriptorSet0.support_buffer));
    float _1467 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1469 = int(_1467);
    float _1471 = in.m_57.x;
    float _1473 = in.m_57.y;
    float _1475 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1477 = int(_1475);
    float _1479 = float(_1469);
    float _1481 = 1.0 / _1479;
    float _1483 = float(uint(_1477));
    int _1485 = ~_1477;
    int _1487 = _1485 + 1;
    int _1489 = ~_1477;
    int _1491 = _1489 + 1;
    float _1493 = 1.0 / _1483;
    bool _1495 = _1477 == 0;
    int _1497 = ~_1477;
    int _1499 = _1497 + 1;
    float _1501 = _113 * _1481;
    float _1503 = trunc(_1501);
    int _1505 = int(_1503);
    int _1507 = as_type<int>(_1493) + (-2);
    float _1509 = float(uint(_1505));
    float _1511 = as_type<float>(_1507) * _1509;
    float _1513 = trunc(_1511);
    float _1515 = precise::max(_1513, 0.0);
    uint _1518 = uint(_1515);
    int _1520 = _1487 * int(_1518);
    int _1522 = _1520 + _1505;
    float _1524 = float(_1477);
    float _1526 = float(uint(_1522));
    float _1528 = as_type<float>(_1507) * _1526;
    float _1530 = trunc(_1528);
    float _1532 = precise::max(_1530, 0.0);
    uint _1534 = uint(_1532);
    int _1536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1538 = _1536 != 0;
    bool _1540 = !_1538;
    float _1542 = _1540 ? 7.345489978790283203125 : 1.0;
    float _1544 = _1542 * _1471;
    int _1546 = int(_1518) + int(_1534);
    float _1548 = floor(_1544);
    float _1550 = float(_1505);
    int _1552 = _1491 * _1546;
    int _1554 = _1552 + _1505;
    bool _1556 = _1550 >= _1524;
    bool _1558 = isnan(_1550);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan(_1524);
    bool _1564 = _1560 || _1562;
    float _1566 = float(_1564);
    bool _1568 = uint(_1554) >= uint(_1477);
    float _1570 = trunc(_1566);
    int _1572 = int(_1570);
    bool _1574 = !_1568;
    int _1576 = _1574 ? 0 : (-1);
    int _1578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1580 = _1578 != 0;
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1584 = _1582 != 0;
    int _1586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1588 = _1586 != 0;
    float _1590 = -_1548;
    float _1592 = _1544 + _1590;
    int _1594 = ~_1546;
    int _1596 = _1594 + _1576;
    int _1598 = _1596 + 1;
    float _1600 = _113 * _1524;
    float _1602 = _1592 * _1524;
    int _1604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1606 = _1604 != 0;
    int _1608 = _1477 * _1598;
    int _1610 = _1608 + _1505;
    float _1612 = _1600 * _161;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1616 = _1614 != 0;
    float _1618 = trunc(_1602);
    int _1620 = int(_1618);
    bool _1622 = !_1584;
    int _1624 = _1622 ? 0 : 1;
    int _1626 = ~_1572;
    int _1628 = _1626 + 1;
    int _1630 = _1628 + 1;
    bool _1632 = !_1495;
    int _1634 = _1632 ? _1610 : (-1);
    int _1636 = _1477 + (-1);
    float _1638 = trunc(_1612);
    int _1640 = int(_1638);
    int _1642 = abs(_1624);
    int _1644 = _1634 * _1630;
    bool _1646 = !_1616;
    int _1648 = _1646 ? 0 : 1;
    bool _1650 = !_1588;
    int _1652 = _1650 ? 0 : 1;
    int _1654 = _1572 * _1636;
    int _1656 = _1654 + _1644;
    bool _1658 = !_1580;
    int _1660 = _1658 ? 0 : 1;
    int _1662 = abs(_1648);
    int _1664 = abs(_1660);
    int _1666 = _1620 * _1662;
    int _1668 = _1666 + _1505;
    bool _1670 = !_1606;
    int _1672 = _1670 ? 0 : 1;
    int _1674 = abs(_1652);
    int _1676 = _1656 * _1642;
    int _1678 = abs(_1672);
    int _1680 = _1640 * _1664;
    int _1682 = _1680 + _1676;
    float _1684 = in.m_65.z;
    int _1686 = ~_1477;
    int _1688 = _1686 + 1;
    int _1690 = _1668 * _1674;
    int _1692 = _1690 + _1682;
    int _1694 = _1620 * _1678;
    int _1696 = _1694 + _1692;
    float _1698 = float(uint(_1696));
    float _1700 = as_type<float>(_1507) * _1698;
    float _1702 = trunc(_1700);
    float _1704 = precise::max(_1702, 0.0);
    uint _1706 = uint(_1704);
    float _1708 = trunc(_1684);
    int _1710 = int(_1708);
    int _1712 = _1688 * int(_1706);
    int _1714 = _1712 + _1696;
    float _1716 = float(uint(_1714));
    float _1718 = as_type<float>(_1507) * _1716;
    float _1720 = trunc(_1718);
    float _1722 = precise::max(_1720, 0.0);
    uint _1724 = uint(_1722);
    int _1726 = int(_1706) + int(_1724);
    int _1728 = _1499 * _1726;
    int _1730 = _1728 + _1696;
    int _1732 = _1465 + (-1);
    float _1734 = float(_1732);
    float _1736 = _1433 * _1734;
    float _1738 = trunc(_1736);
    int _1740 = int(_1738);
    int _1742 = _1740;
    int _1744 = 0;
    int _1746 = _99(_1742, _1744, (*spvDescriptorSet0.support_buffer));
    int _1748 = _1710;
    int _1750 = 0;
    int _1752 = _99(_1748, _1750, (*spvDescriptorSet0.support_buffer));
    float4 _1755 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1746, _1752)), 0).xyzw;
    float _1757 = _1755.x;
    float _1759 = _1755.y;
    float _1761 = _1755.z;
    float _1763 = _1755.w;
    bool _1765 = uint(_1730) >= uint(_1477);
    float _1767 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1769 = _1457 + _1767;
    int _1771 = ~_1477;
    int _1773 = _1771 + 1;
    bool _1775 = !_1765;
    int _1777 = _1775 ? 0 : (-1);
    int _1779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1781 = _1779 != 0;
    int _1783 = ~_1726;
    int _1785 = _1783 + _1777;
    int _1787 = _1785 + 1;
    float _1789 = float(uint(_1668));
    int _1791 = _1477 * _1787;
    int _1793 = _1791 + _1696;
    float _1795 = as_type<float>(_1507) * _1789;
    int _1797 = ~_1477;
    int _1799 = _1797 + 1;
    bool _1801 = !_1495;
    int _1803 = _1801 ? _1793 : (-1);
    float _1805 = trunc(_1795);
    float _1807 = precise::max(_1805, 0.0);
    uint _1809 = uint(_1807);
    int _1811 = _1803 >> 31;
    int _1813 = _1803 & 3;
    bool _1815 = _1813 != 0;
    int _1817 = _1811 & 3;
    int _1819 = _1803 & 3;
    bool _1821 = _1819 != 0;
    int _1823 = _1803 + _1817;
    bool _1825 = uint(_1819) > 1u;
    int _1827 = _1823 >> 2;
    int _1829 = _1799 * int(_1809);
    int _1831 = _1829 + _1668;
    bool _1833 = _1819 != 3;
    int _1835 = _1827 << 4;
    int _1837 = _1835 + 368;
    float _1839 = float(uint(_1831));
    uint _1841 = uint(int(uint(_1837) >> uint(2)));
    uint _1843 = uint(int(uint(int(_1841)) >> uint(2)));
    int _1845 = int(_1841) & 3;
    float _1847 = (*spvDescriptorSet0.vp_c9)._m0[int(_1843)][_1845];
    int _1849 = int(_1841) + 1;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    int _1853 = _1849 & 3;
    float _1855 = (*spvDescriptorSet0.vp_c9)._m0[int(_1851)][_1853];
    float _1857 = as_type<float>(_1507) * _1839;
    int _1859 = _1815 ? 0 : 1;
    int _1861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1863 = _1861 != 0;
    float _1865 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1867 = _1865 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    int _1869 = _1837 + 8;
    uint _1871 = uint(int(uint(_1869) >> uint(2)));
    uint _1873 = uint(int(uint(int(_1871)) >> uint(2)));
    int _1875 = int(_1871) & 3;
    float _1877 = (*spvDescriptorSet0.vp_c9)._m0[int(_1873)][_1875];
    int _1879 = int(_1871) + 1;
    uint _1881 = uint(int(uint(_1879) >> uint(2)));
    int _1883 = _1879 & 3;
    float _1885 = (*spvDescriptorSet0.vp_c9)._m0[int(_1881)][_1883];
    float _1887 = trunc(_1857);
    float _1889 = precise::max(_1887, 0.0);
    uint _1891 = uint(_1889);
    bool _1893 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1895 = isnan(_1457);
    bool _1897 = _1893 || _1895;
    bool _1899 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1901 = _1897 || _1899;
    float _1903 = float(_1901);
    bool _1905 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1907 = isnan(_1457);
    bool _1909 = _1905 || _1907;
    bool _1911 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1913 = _1909 || _1911;
    float _1915 = float(_1913);
    float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1919 = _1917 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1921 = 1.0 / _1867;
    float _1923 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1925 = int(_1809) + int(_1891);
    float _1927 = 1.0 / _1919;
    int _1929 = ~_1859;
    int _1931 = _1929 + 1;
    int _1933 = _1931 + 1;
    int _1935 = _1933;
    if (!_1825)
    {
        int _1937 = ~_1859;
        int _1939 = _1937 + 1;
        _1935 = _1939;
    }
    int _1941 = _1935;
    int _1943 = _1773 * _1925;
    int _1945 = _1943 + _1668;
    bool _1947 = uint(_1819) >= 2u;
    int _1949 = abs(_1941);
    bool _1951 = uint(_1945) >= uint(_1477);
    int _1953 = ~_1949;
    int _1955 = _1953 + 1;
    int _1957 = _1955 + 1;
    int _1959 = _1947 ? 0 : 1;
    bool _1961 = !_1951;
    int _1963 = _1961 ? 0 : (-1);
    bool _1965 = _1819 != 3;
    int _1967 = ~_1959;
    int _1969 = _1967 + 1;
    int _1971 = _1969 + 1;
    int _1973 = _1957 * as_type<int>(_1855);
    bool _1975 = !_1821;
    int _1977 = _1975 ? 0 : 1;
    int _1979 = _1971;
    if (_1833)
    {
        int _1981 = ~_1959;
        int _1983 = _1981 + 1;
        _1979 = _1983;
    }
    int _1985 = _1979;
    float _1987 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1989 = abs(_1977);
    bool _1991 = !_1965;
    int _1993 = _1991 ? 0 : (-1);
    int _1995 = abs(_1985);
    int _1997 = abs(_1993);
    int _1999 = ~_1989;
    int _2001 = _1999 + 1;
    int _2003 = _2001 + 1;
    int _2005 = _2003 * as_type<int>(_1847);
    int _2007 = _2005 + _1973;
    int _2009 = ~_1995;
    int _2011 = _2009 + 1;
    int _2013 = _2011 + 1;
    float _2015 = -_1923;
    float _2017 = fma(_1987, 2.0, _2015);
    int _2019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2021 = _2019 != 0;
    float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2025 = _2023 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2027 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2029 = int(_2027);
    int _2031 = ~_1997;
    int _2033 = _2031 + 1;
    int _2035 = _2033 + 1;
    int _2037 = _2013 * as_type<int>(_1877);
    int _2039 = _2037 + _2007;
    int _2041 = ~_1925;
    int _2043 = _2041 + _1963;
    int _2045 = _2043 + 1;
    float _2047 = _1473 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2049 = _2035 * as_type<int>(_1885);
    int _2051 = _2049 + _2039;
    bool _2053 = !_1781;
    int _2055 = _2053 ? 0 : 1;
    int _2057 = _1477 * _2045;
    int _2059 = _2057 + _1668;
    float _2061 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2063 = _2061 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2065 = abs(_2055);
    float _2067 = 1.0 / _2025;
    float _2069 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2071 = ~_2065;
    int _2073 = _2071 + 1;
    int _2075 = _2073 + 1;
    float _2077 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2079 = _2077 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2081 = fma(_2047, -2.0, _2069);
    float _2083 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2085 = _2083 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    int _2087 = abs(_2029);
    float _2089 = 1.0 / _2063;
    int _2091 = _2051 * _2075;
    float _2093 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2081);
    float _2095 = float(uint(_2087));
    float _2097 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2099 = _2097 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2101 = 1.0 / _2079;
    int _2103 = ~_2029;
    int _2105 = _2103 + 1;
    bool _2107 = _1473 > 0.5;
    bool _2109 = _2107 && _2021;
    float _2111 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2113 = 1.0 / _2085;
    bool _2115 = !_1495;
    int _2117 = _2115 ? _2059 : (-1);
    float _2119 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2111);
    bool _2121 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2123 = isnan(_1457);
    bool _2125 = _2121 || _2123;
    bool _2127 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2129 = _2125 || _2127;
    float _2131 = float(_2129);
    int _2133 = _2117 * _2065;
    int _2135 = _2133 + _2091;
    float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2137;
    float _2141 = 1.0 / _2095;
    float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2145 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2143;
    float _2147 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2149 = _2147 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2151 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2153 = _2151 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2155 = _2139 * _2101;
    float _2157 = _2145 * _2089;
    bool _2159 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2161 = isnan(_1457);
    bool _2163 = _2159 || _2161;
    bool _2165 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2167 = _2163 || _2165;
    float _2169 = float(_2167);
    float _2171 = _2153 * _2067;
    float _2173 = 1.0 / _2099;
    float _2175 = _2149 * _2113;
    int _2177 = abs(_2135);
    float _2179 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2181 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2179;
    float _2183 = float(uint(_2029));
    float _2185 = fma(_2157, _1769, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _2187 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2189 = isnan(_1457);
    bool _2191 = _2187 || _2189;
    bool _2193 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2195 = _2191 || _2193;
    float _2197 = float(_2195);
    float _2199 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2201 = _2199 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    int _2203 = as_type<int>(_2141) + (-2);
    float _2205 = 1.0 / _2183;
    float _2207 = float(uint(_2177));
    float _2209 = -_2169;
    float _2211 = _2209 + 1.0;
    bool _2213 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2215 = isnan(_1457);
    bool _2217 = _2213 || _2215;
    bool _2219 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2221 = _2217 || _2219;
    float _2223 = float(_2221);
    float _2225 = _2201 * _1921;
    float _2227 = float(uint(_2135));
    float _2229 = _2197 * _2211;
    float _2231 = _2181 * _2173;
    float _2233 = as_type<float>(_2203) * _2207;
    float _2235 = -_2197;
    float _2237 = _2235 + 1.0;
    float _2239 = -_2223;
    float _2241 = _2239 + 1.0;
    bool _2243 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2245 = isnan(_1457);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2251 = _2247 || _2249;
    float _2253 = float(_2251);
    float _2255 = _2223 * _2237;
    float _2257 = _2131 * _2241;
    float _2259 = -_2131;
    float _2261 = _2259 + 1.0;
    float _2263 = trunc(_2233);
    float _2265 = precise::max(_2263, 0.0);
    uint _2267 = uint(_2265);
    float _2269 = _2253 * _2261;
    int _2271 = as_type<int>(_2205) + (-2);
    float _2273 = -_2253;
    float _2275 = _2273 + 1.0;
    bool _2277 = _1457 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2279 = isnan(_1457);
    bool _2281 = _2277 || _2279;
    bool _2283 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2285 = _2281 || _2283;
    float _2287 = float(_2285);
    float _2289 = as_type<float>(_2271) * _2227;
    float _2291 = -_1903;
    float _2293 = _2291 + 1.0;
    float _2295 = _1903 * _2275;
    float _2297 = _1915 * _2293;
    float _2299 = trunc(_2289);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    int _2305 = ~int(_2267);
    int _2307 = _2305 + 1;
    float _2309 = -_1915;
    float _2311 = _2309 + 1.0;
    float _2313 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2315 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2313;
    int _2317 = _2307 * _2087;
    int _2319 = _2317 + _2177;
    float _2321 = _2287 * _2311;
    float _2323 = _2315 * _1927;
    float _2325 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2327 = _1457 + _2325;
    float _2329 = float(uint(_2319));
    float _2331 = _2185 * _2321;
    float _2333 = -_2287;
    float _2335 = _2333 + 1.0;
    float _2337 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2339 = _1457 + _2337;
    int _2341 = _2105 * int(_2303);
    int _2343 = _2341 + _2135;
    float _2345 = as_type<float>(_2203) * _2329;
    float _2347 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2349 = _1457 + _2347;
    float _2351 = fma(_2335, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2331);
    float _2353 = fma(_2175, _2339, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2355 = float(uint(_2343));
    float _2357 = trunc(_2345);
    float _2359 = precise::max(_2357, 0.0);
    uint _2361 = uint(_2359);
    float _2363 = fma(_2171, _2349, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2365 = fma(_2155, _2327, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2367 = as_type<float>(_2271) * _2355;
    float _2369 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2371 = _1457 + _2369;
    float _2373 = _2155;
    if (_1863)
    {
        float _2375 = in.m_57.x;
        _2373 = _2375;
    }
    float _2377 = _2373;
    float _2379 = fma(_2363, _2297, _2351);
    float _2381 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2383 = _1457 + _2381;
    float _2385 = fma(_2231, _2371, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2387 = trunc(_2367);
    float _2389 = precise::max(_2387, 0.0);
    uint _2391 = uint(_2389);
    float _2393 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2395 = _1457 + _2393;
    float _2397 = fma(_2365, _2295, _2379);
    float _2399 = fma(_2225, _2383, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2401 = fma(_2323, _2395, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    int _2403 = int(_2267) + int(_2361);
    float _2405 = in.m_65.x;
    float _2407 = fma(_2353, _2269, _2397);
    float _2409 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2411 = ~_2403;
    int _2413 = _2411 + 1;
    float _2415 = fma(_2385, _2257, _2407);
    int _2417 = ~_2029;
    int _2419 = _2417 + 1;
    float _2421 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2409);
    float _2423 = fma(_2399, _2255, _2415);
    int _2425 = int(_2303) + int(_2391);
    float _2427 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2421);
    int _2429 = _2413 * _2087;
    int _2431 = _2429 + _2177;
    bool _2433 = _2377 > 0.5;
    bool _2435 = _2433 && _1863;
    int _2437 = _2419 * _2425;
    int _2439 = _2437 + _2135;
    float _2441 = fma(_2401, _2229, _2423);
    int _2443 = _2135 ^ _2029;
    float _2445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2447 = uint(_2431) >= uint(_2087);
    float _2449 = fma(_2169, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2441);
    bool _2451 = uint(_2439) >= uint(_2029);
    float _2453 = in.m_65.y;
    bool _2455 = !_2447;
    int _2457 = _2455 ? 0 : (-1);
    float _2459 = -_113;
    float _2461 = fma(_2459, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2017);
    uint _2463 = uint(int(uint(_2443) >> uint(31)));
    float _2465 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2467 = !_2451;
    float _2469 = _2467 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    out.m_67.x = _2449;
    float _2471 = as_type<float>(_2413);
    float _2473 = _2469;
    if (_1863)
    {
        _2471 = _2405;
    }
    float _2475 = _2471;
    int _2477 = ~_2457;
    int _2479 = _2403 + _2477;
    int _2481 = _2479 + 1;
    int _2483 = ~int(_2463);
    int _2485 = _2483 + 1;
    float _2487 = _2475;
    if (_2435)
    {
        float _2489 = -_2475;
        float _2491 = _2489 + 1.0;
        _2487 = _2491;
    }
    float _2493 = _2487;
    int _2495 = ~_2425;
    int _2497 = _2495 + as_type<int>(_2469);
    int _2499 = _2497 + 1;
    float _2501 = _2445 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2503 = _2481 ^ _2485;
    bool _2505 = _2029 == 0;
    bool _2507 = _2029 == 0;
    int _2509 = _2029 * _2499;
    int _2511 = _2509 + _2135;
    int _2513 = ~_2485;
    int _2515 = _2513 + _2503;
    int _2517 = _2515 + 1;
    float _2519 = _2465 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2521 = _2499;
    if (!_1863)
    {
        _2473 = _2405;
    }
    float _2523 = _2473;
    float _2525 = _2453;
    float _2527 = _2523;
    if (_2109)
    {
        float _2529 = -_2453;
        float _2531 = _2529 + 1.0;
        _2525 = _2531;
    }
    float _2533 = _2525;
    bool _2535 = !_2505;
    int _2537 = _2535 ? _2511 : (-1);
    bool _2539 = !_2507;
    int _2541 = _2539 ? _2517 : (-1);
    if (_1863)
    {
        _2527 = _2493;
    }
    float _2543 = _2527;
    uint _2545 = as_type<uint>(half2(float2(_1763, 0.0)));
    float _2547 = float(_2537);
    float _2549 = fma(_2501, _2543, -0.5);
    uint _2551 = extract_bits(_2545, 0u, 8u);
    int _2553 = int(_2551) & 255;
    uint _2555 = extract_bits(_2545, 8u, 8u);
    int _2557 = int(_2555) & 255;
    int _2559 = _2557 << 8;
    int _2561 = _2553 | _2559;
    float _2563 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2119);
    float _2565 = float(_2541);
    float _2567 = fma(_2501, _2547, _2461);
    bool _2569 = _2561 >= 32768;
    float _2571 = fma(_2519, _2533, -0.5);
    float _2573 = -_2093;
    float _2575 = fma(_2519, _2565, _2573);
    float _2577 = fma(_2563, _2549, _2567);
    float _2579 = fma(_2427, _2571, _2575);
    int _2581 = _1740 + 1;
    float _2583 = _2577 + 0.5;
    float _2585 = _2579 + 0.5;
    int _2587 = min(_1732, _2581);
    int _2589 = _2561 + (-1024);
    int _2591 = _2589;
    if (_2569)
    {
        int _2593 = ~_2561;
        int _2595 = _2593 + 33792;
        int _2597 = _2595 + 1;
        _2591 = _2597;
    }
    int _2599 = _2591;
    int _2601 = _2599 + 30719;
    float _2603 = float(_2601);
    float _2605 = fma(_2603, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2607 = abs(_2605);
    float _2609 = -_2607;
    float _2611 = _2609 + 1.0;
    float _2613 = abs(_2605);
    float _2615 = fma(_2613, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2617 = _2605 < 0.0;
    float _2619 = float(_2617);
    int _2621 = as_type<int>(_2611) + (-218103808);
    float _2623 = abs(_2605);
    float _2625 = fma(_2623, _2615, -0.212114393711090087890625);
    bool _2627 = uint(_2621) >= 1920991232u;
    float _2629 = abs(_2605);
    float _2631 = fma(_2629, _2625, 1.570728778839111328125);
    bool _2633 = !_2627;
    float _2657;
    if (!_2633)
    {
        int _2635 = as_type<int>(_2611);
        int _2637 = _2457;
        int _2639 = _2499;
        int _2641 = 13056;
        int _2643;
        int _2645;
        int _2647;
        int _2649;
        int _2651;
        int _2653;
        int _2655;
        _96(_2635, _2637, _2639, _2641, _2643, _2645, _2647, _2649, _2651, _2653, _2655, out.gl_Position, out.gl_PointSize);
        _2521 = _2653;
        _2657 = as_type<float>(_2647);
        _2659 = true;
    }
    else
    {
        float _2661 = rsqrt(_2611);
        float _2663 = _2611 * _2661;
        float _2665 = _2661 * 0.5;
        float _2667 = -_2663;
        float _2669 = 0.0 + _2667;
        float _2671 = fma(_2665, _2669, 0.5);
        float _2673 = fma(_2663, _2671, _2663);
        float _2675 = -_2673;
        float _2677 = 0.0 + _2675;
        float _2679 = fma(_2673, _2677, _2611);
        float _2681 = fma(_2665, _2679, _2673);
        _2657 = _2681;
    }
    _2659 = false;
    float _2683 = _2657;
    int _2685 = _2521;
    int _2687 = _2587;
    int _2689 = 0;
    int _2691 = _99(_2687, _2689, (*spvDescriptorSet0.support_buffer));
    int _2693 = _1710;
    int _2695 = 0;
    int _2697 = _99(_2693, _2695, (*spvDescriptorSet0.support_buffer));
    float4 _2699 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2691, _2697)), 0).xyzw;
    float _2701 = _2699.x;
    float _2703 = _2699.y;
    float _2705 = _2699.z;
    float _2707 = _2699.w;
    float _2709 = _2631 * _2683;
    float _2711 = _2619 * 2.0;
    float _2713 = _2603 * 3.883221149444580078125;
    float _2715 = floor(_1736);
    float _2717 = -_2711;
    float _2719 = fma(_2709, _2717, _2709);
    float _2721 = _2713 * 0.15915493667125701904296875;
    float _2723 = fma(_2619, 3.1415927410125732421875, _2719);
    float _2725 = _2721 * 6.283185482025146484375;
    float _2727 = cos(_2725);
    float _2729 = _2723 * 0.15915493667125701904296875;
    float _2731 = _2729 * 6.283185482025146484375;
    float _2733 = sin(_2731);
    float _2735 = -_2715;
    float _2737 = _1736 + _2735;
    float _2739 = _2721 * 6.283185482025146484375;
    float _2741 = sin(_2739);
    float _2743 = _2733 * _2727;
    float _2745 = _2733 * _2741;
    uint _2747 = as_type<uint>(half2(float2(_2707, 0.0)));
    float _2749 = -_1757;
    float _2751 = _2749 + _2701;
    float _2753 = -_1759;
    float _2755 = _2753 + _2703;
    float _2757 = -_1761;
    float _2759 = _2757 + _2705;
    uint _2761 = extract_bits(_2747, 0u, 8u);
    int _2763 = int(_2761) & 255;
    uint _2765 = extract_bits(_2747, 8u, 8u);
    int _2767 = int(_2765) & 255;
    int _2769 = _2767 << 8;
    int _2771 = _2763 | _2769;
    float _2773 = fma(_2737, _2751, _1757);
    float _2775 = fma(_2737, _2755, _1759);
    float _2777 = fma(_2737, _2759, _1761);
    bool _2779 = _2771 >= 32768;
    int _2781 = _2771 + (-1024);
    int _2783 = _2781;
    if (_2779)
    {
        int _2785 = ~_2771;
        int _2787 = _2785 + 33792;
        int _2789 = _2787 + 1;
        _2783 = _2789;
    }
    int _2791 = _2783;
    int _2793 = _2791 + 30719;
    float _2795 = float(_2793);
    float _2797 = fma(_2795, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2799 = abs(_2797);
    float _2801 = -_2799;
    float _2803 = _2801 + 1.0;
    float _2805 = abs(_2797);
    float _2807 = fma(_2805, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2809 = _2797 < 0.0;
    float _2811 = float(_2809);
    int _2813 = as_type<int>(_2803) + (-218103808);
    float _2815 = abs(_2797);
    float _2817 = fma(_2815, _2807, -0.212114393711090087890625);
    bool _2819 = uint(_2813) >= 1920991232u;
    float _2821 = abs(_2797);
    float _2823 = fma(_2821, _2817, 1.570728778839111328125);
    bool _2825 = !_2819;
    float _2849;
    if (!_2825)
    {
        int _2827 = as_type<int>(_2803);
        int _2829 = as_type<int>(_2703);
        int _2831 = _2685;
        int _2833 = 13968;
        int _2835;
        int _2837;
        int _2839;
        int _2841;
        int _2843;
        int _2845;
        int _2847;
        _96(_2827, _2829, _2831, _2833, _2835, _2837, _2839, _2841, _2843, _2845, _2847, out.gl_Position, out.gl_PointSize);
        _2849 = as_type<float>(_2839);
        _2851 = true;
    }
    else
    {
        float _2853 = rsqrt(_2803);
        float _2855 = _2803 * _2853;
        float _2857 = _2853 * 0.5;
        float _2859 = -_2855;
        float _2861 = 0.0 + _2859;
        float _2863 = fma(_2857, _2861, 0.5);
        float _2865 = fma(_2855, _2863, _2855);
        float _2867 = -_2865;
        float _2869 = 0.0 + _2867;
        float _2871 = fma(_2865, _2869, _2803);
        float _2873 = fma(_2857, _2871, _2865);
        _2849 = _2873;
    }
    _2851 = false;
    float _2875 = _2849;
    float _2877 = in.m_57.x;
    float _2879 = in.m_57.y;
    float _2881 = in.m_57.z;
    float _2883 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2885 = log2(_2883);
    float _2887 = _279 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2889 = _279 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2891 = _279 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2895 = _2893 != 0;
    int _2897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2899 = _2897 != 0;
    int _2901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2903 = _2901 != 0;
    float _2905 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2887);
    float _2907 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2889);
    float _2909 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2891);
    float _2911 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2905);
    float _2913 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2909);
    float _2915 = _2823 * _2875;
    float _2917 = _2911 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2919 = _2811 * 2.0;
    float _2921 = _2885 * _113;
    float _2923 = _2913 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2925 = _661 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2927 = -_2919;
    float _2929 = fma(_2915, _2927, _2915);
    float _2931 = _561 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2933 = _543 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2935 = exp2(_2921);
    float _2937 = _2881 * 2.0;
    float _2939 = _2877 * 2.0;
    float _2941 = _2881 + _2877;
    float _2943 = _2879 * 2.0;
    float _2945 = _2795 * 3.883221149444580078125;
    float _2947 = floor(_2937);
    float _2949 = floor(_2939);
    bool _2951 = _2947 > 0.0;
    float _2953 = floor(_2943);
    bool _2955 = _2947 >= 0.0;
    bool _2957 = isnan(_2947);
    bool _2959 = _2955 || _2957;
    bool _2961 = isnan(0.0);
    bool _2963 = _2959 || _2961;
    float _2965 = _2941 + (-1.0);
    float _2967 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2907);
    int _2969 = _2963 ? 0 : 1;
    float _2971 = fma(_2965, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _2973 = _2949 > 0.0;
    float _2975 = _2967 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2977 = ~_2969;
    int _2979 = _2977 + 1;
    int _2981 = _2979 + 1;
    int _2983 = _2981;
    if (!_2951)
    {
        int _2985 = ~_2969;
        int _2987 = _2985 + 1;
        _2983 = _2987;
    }
    int _2989 = _2983;
    bool _2991 = !_2895;
    int _2993 = _2991 ? 0 : 1;
    float _2995 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2997 = 1.0 + _2995;
    bool _2999 = _2949 >= 0.0;
    bool _3001 = isnan(_2949);
    bool _3003 = _2999 || _3001;
    bool _3005 = isnan(0.0);
    bool _3007 = _3003 || _3005;
    float _3009 = -_2935;
    float _3011 = _3009 + 1.0;
    int _3013 = abs(_2993);
    float _3015 = 1.0 / _2997;
    float _3017 = in.m_69.x;
    float _3019 = in.m_69.y;
    float _3021 = in.m_69.z;
    bool _3023 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3025 = isnan(1.0);
    bool _3027 = _3023 || _3025;
    bool _3029 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3031 = _3027 || _3029;
    bool _3033 = _2953 > 0.0;
    bool _3035 = _2953 >= 0.0;
    bool _3037 = isnan(_2953);
    bool _3039 = _3035 || _3037;
    bool _3041 = isnan(0.0);
    bool _3043 = _3039 || _3041;
    float _3045 = _2879 + _2877;
    int _3047 = _3007 ? 0 : 1;
    bool _3049 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3051 = isnan(0.0);
    bool _3053 = _3049 || _3051;
    bool _3055 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3057 = _3053 || _3055;
    float _3059 = _3045 + (-1.0);
    float _3061 = float(_3013);
    float _3063 = float(_2989);
    float _3065 = fma(_3059, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3067 = _3057 ? _3011 : 0.0;
    int _3069 = _3043 ? 0 : 1;
    float _3071 = _3061 * _3063;
    bool _3073 = !_2903;
    int _3075 = _3073 ? 0 : 1;
    if (_3031)
    {
        float _3077 = _3067 * _3015;
        _123 = _3077;
    }
    float _3079 = _123;
    int _3081 = ~_3069;
    int _3083 = _3081 + 1;
    int _3085 = _3083 + 1;
    float _3087 = _3071 * (-2.0);
    int _3089 = _3085;
    if (!_3033)
    {
        int _3091 = ~_3069;
        int _3093 = _3091 + 1;
        _3089 = _3093;
    }
    int _3095 = _3089;
    float _3097 = _2877 + (-0.5);
    int _3099 = abs(_3075);
    float _3101 = -_2975;
    float _3103 = _3101 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _3105 = ~_3047;
    int _3107 = _3105 + 1;
    int _3109 = _3107 + 1;
    float _3111 = fma(_3087, _3017, _3017);
    int _3113 = _3109;
    if (!_2973)
    {
        int _3115 = ~_3047;
        int _3117 = _3115 + 1;
        _3113 = _3117;
    }
    int _3119 = _3113;
    float _3121 = -_2917;
    float _3123 = _3121 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3125 = float(_3099);
    float _3127 = _3103 * _3103;
    float _3129 = float(_3095);
    float _3131 = fma(_3097, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3111);
    bool _3133 = !_2899;
    int _3135 = _3133 ? 0 : 1;
    float _3137 = -_2923;
    float _3139 = _3137 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3141 = fma(_3123, _3123, _3127);
    float _3143 = _3125 * _3129;
    int _3145 = abs(_3135);
    float _3147 = fma(_3065, _3087, _3065);
    float _3149 = fma(_3139, _3139, _3141);
    float _3151 = _3143 * (-2.0);
    float _3153 = float(_3145);
    float _3155 = _2881 + (-0.5);
    float _3157 = float(_3119);
    float _3159 = fma(_3151, _3021, _3021);
    float _3161 = _2881 + _2879;
    float _3163 = rsqrt(_3149);
    float _3165 = fma(_2971, _3151, _2971);
    float _3167 = _3153 * _3157;
    float _3169 = fma(_3155, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3159);
    float _3171 = _3161 + (-1.0);
    float _3173 = _3167 * (-2.0);
    float _3175 = _2879 + (-0.5);
    float _3177 = fma(_3147, _3079, _3131);
    float _3179 = fma(_3171, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3181 = fma(_3173, _3019, _3019);
    float _3183 = fma(_3165, _3079, _3169);
    float _3185 = _3177 * 0.15915493667125701904296875;
    float _3187 = fma(_3179, _3173, _3179);
    float _3189 = fma(_3175, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3181);
    float _3191 = _3183 * 0.15915493667125701904296875;
    float _3193 = _3185 * 6.283185482025146484375;
    float _3195 = sin(_3193);
    float _3197 = fma(_2811, 3.1415927410125732421875, _2929);
    float _3199 = fma(_3187, _3079, _3189);
    float _3201 = _3123 * _3163;
    float _3203 = _3139 * _3163;
    float _3205 = _2945 * 0.15915493667125701904296875;
    float _3207 = _3199 * 0.15915493667125701904296875;
    float _3209 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3211 = _3201 * _3209;
    float _3213 = _3103 * _3163;
    float _3215 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3217 = _3203 * _3215;
    float _3219 = _3185 * 6.283185482025146484375;
    float _3221 = cos(_3219);
    float _3223 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3225 = -_3211;
    float _3227 = fma(_3203, _3223, _3225);
    float _3229 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3231 = _3213 * _3229;
    float _3233 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3235 = -_3217;
    float _3237 = fma(_3213, _3233, _3235);
    float _3239 = _3227 * _3227;
    bool _3241 = _2775 != 0.0;
    bool _3243 = isnan(_2775);
    bool _3245 = _3241 || _3243;
    bool _3247 = isnan(0.0);
    bool _3249 = _3245 || _3247;
    float _3251 = _3197 * 0.15915493667125701904296875;
    float _3253 = _3191 * 6.283185482025146484375;
    float _3255 = sin(_3253);
    float _3257 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3259 = -_3231;
    float _3261 = fma(_3201, _3257, _3259);
    float _3263 = fma(_3237, _3237, _3239);
    float _3265 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2777);
    float _3267 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2775);
    bool _3269 = _2773 == 0.0;
    bool _3271 = !_3249;
    bool _3273 = _3269 && _3271;
    float _3275 = _2931 * _3265;
    float _3277 = _3191 * 6.283185482025146484375;
    float _3279 = cos(_3277);
    float _3281 = _2933 * _3267;
    bool _3283 = _2777 == 0.0;
    bool _3285 = _3283 && _3273;
    float _3287 = _3207 * 6.283185482025146484375;
    float _3289 = cos(_3287);
    float _3291 = fma(_3261, _3261, _3263);
    float _3293 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2773);
    float _3295 = _3195 * _3255;
    float _3297 = _2925 * _3293;
    float _3299 = _3207 * 6.283185482025146484375;
    float _3301 = sin(_3299);
    float _3303 = _3195 * _3279;
    float _3305 = _3221 * _3279;
    float _3307 = rsqrt(_3291);
    float _3309 = _3221 * _3255;
    float _3311 = _3195 * _3289;
    float _3313 = _3221 * _3289;
    float _3315 = _3289 * _3255;
    float _3317 = _3289 * _3279;
    float _3319 = _3311 * _3281;
    float _3321 = -_3309;
    float _3323 = fma(_3301, _3303, _3321);
    float _3325 = -_3303;
    float _3327 = fma(_3301, _3309, _3325);
    float _3329 = fma(_3301, _3295, _3305);
    float _3331 = fma(_3301, _3305, _3295);
    float _3333 = _3323 * _3281;
    float _3335 = -_3301;
    float _3337 = fma(_3335, _3297, _3319);
    float _3339 = _3329 * _3281;
    float _3341 = _3205 * 6.283185482025146484375;
    float _3343 = cos(_3341);
    float _3345 = _3237 * _3307;
    float _3347 = _3227 * _3307;
    float _3349 = fma(_3317, _3297, _3333);
    float _3351 = _3261 * _3307;
    float _3353 = fma(_3315, _3297, _3339);
    float _3355 = _3203 * _3347;
    float _3357 = _3213 * _3345;
    float _3359 = fma(_3331, _3275, _3349);
    float _3361 = fma(_3327, _3275, _3353);
    float _3363 = -_3355;
    float _3365 = fma(_3213, _3351, _3363);
    float _3367 = -_3357;
    float _3369 = fma(_3201, _3347, _3367);
    float _3371 = fma(_3313, _3275, _3337);
    float _3373 = _3251 * 6.283185482025146484375;
    float _3375 = sin(_3373);
    float _3377 = _3365 * _3361;
    float _3379 = _3369 * _3361;
    float _3381 = _3329 * _3369;
    float _3383 = fma(_3345, _3359, _3377);
    float _3385 = fma(_3351, _3359, _3379);
    float _3387 = -_2605;
    float _3389 = _3387 + _2797;
    float _3391 = _3205 * 6.283185482025146484375;
    float _3393 = sin(_3391);
    float _3395 = fma(_3201, _3371, _3383);
    float _3397 = fma(_3203, _3371, _3385);
    float _3399 = fma(_2737, _3389, _2605);
    float _3401 = fma(_3323, _3351, _3381);
    float _3403 = _2917 + _3395;
    float _3405 = _2923 + _3397;
    float _3407 = _3399;
    float _3409 = _3311;
    float _3411 = _3403;
    float _3413 = _3405;
    float _3415 = _3313;
    if (!_3285)
    {
        float _3417 = fma(_2775, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3399);
        _3407 = _3417;
    }
    float _3419 = _3407;
    float _3421 = -_2743;
    float _3423 = fma(_3375, _3343, _3421);
    float _3425 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3427 = _3403 + _3425;
    float _3429 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3431 = _3405 + _3429;
    float _3433 = fma(_2737, _3423, _2743);
    float _3435 = _3427 * _3427;
    float _3437 = _3431 * _3431;
    float _3439 = -_2745;
    float _3441 = fma(_3375, _3393, _3439);
    float _3443 = _3201 * _3351;
    float _3445 = _3435 + _3437;
    float _3447 = _3433;
    float _3449 = _3435;
    float _3451 = _3437;
    if (!_3285)
    {
        float _3453 = fma(_2773, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3433);
        _3447 = _3453;
    }
    float _3455 = _3447;
    float _3457 = fma(_2737, _3441, _2745);
    float _3459 = -_3443;
    float _3461 = fma(_3203, _3345, _3459);
    float _3463 = sqrt(_3445);
    float _3465 = _3329 * _3365;
    float _3467 = _3457;
    if (!_3285)
    {
        float _3469 = fma(_2777, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3457);
        _3467 = _3469;
    }
    float _3471 = _3467;
    float _3473 = _3329 * _3461;
    float _3475 = _3327 * _3365;
    float _3477 = fma(_3323, _3345, _3465);
    float _3479 = _3315 * _3461;
    float _3481 = fma(_3323, _3347, _3473);
    float _3483 = _3315 * _3369;
    float _3485 = _3327 * _3369;
    float _3487 = _3315 * _3365;
    float _3489 = _3327 * _3461;
    float _3491 = _3461 * _3361;
    float _3493 = fma(_3317, _3347, _3479);
    float _3495 = fma(_3317, _3345, _3487);
    float _3497 = fma(_3331, _3345, _3475);
    bool _3499 = _3463 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3501 = fma(_3347, _3359, _3491);
    float _3503 = fma(_3331, _3347, _3489);
    float _3505 = fma(_3311, _3201, _3477);
    float _3507 = fma(_3311, _3203, _3401);
    float _3509 = fma(_3213, _3371, _3501);
    float _3511 = fma(_3311, _3213, _3481);
    float _3513 = fma(_3317, _3351, _3483);
    float _3515 = fma(_3331, _3351, _3485);
    float _3517 = _2975 + _3509;
    if (!_3499)
    {
        _3409 = _3517;
    }
    float _3519 = _3409;
    bool _3521 = !_3499;
    float _3523 = _3519;
    if (!_3521)
    {
        float _3525 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3529 = _3463 + _3527;
        float _3531 = _3517 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3533 = rsqrt(_3445);
        float _3535 = _3529 * _3525;
        float _3537 = _3535 * 0.15915493667125701904296875;
        float _3539 = _3537 * 6.283185482025146484375;
        float _3541 = sin(_3539);
        float _3543 = _3537 * 6.283185482025146484375;
        float _3545 = cos(_3543);
        float _3547 = fma(_3541, _3531, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3549 = _3533 * _3547;
        float _3551 = _3545 + (-1.0);
        float _3553 = _3427 * _3549;
        float _3555 = _3431 * _3549;
        float _3557 = _3551 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3559 = _3553 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3561 = _3553 * _3553;
        float _3563 = _3555 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3565 = fma(_3517, _3545, _3557);
        float _3567 = _3555 * _3555;
        _3523 = _3565;
        _3449 = _3561;
        _3451 = _3567;
        _3411 = _3559;
        _3413 = _3563;
    }
    float _3569 = _3523;
    float _3571 = _3449;
    float _3573 = _3451;
    float _3575 = _3411;
    float _3577 = _3413;
    float _3579 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3581 = _3569 + _3579;
    float _3583 = -_3301;
    float _3585 = fma(_3583, _3201, _3495);
    float _3587 = -_3301;
    float _3589 = fma(_3587, _3213, _3493);
    float _3591 = _3505 * _3419;
    float _3593 = fma(_3581, _3581, _3571);
    float _3595 = _3511 * _3419;
    float _3597 = -_3301;
    float _3599 = fma(_3597, _3203, _3513);
    float _3601 = _3507 * _3419;
    float _3603 = _3593 + _3573;
    float _3605 = fma(_3313, _3201, _3497);
    float _3607 = fma(_3313, _3213, _3503);
    float _3609 = fma(_3585, _3455, _3591);
    float _3611 = sqrt(_3603);
    float _3613 = fma(_3589, _3455, _3595);
    float _3615 = fma(_3313, _3203, _3515);
    float _3617 = fma(_3599, _3455, _3601);
    float _3619 = fma(_3605, _3471, _3609);
    float _3621 = fma(_3607, _3471, _3613);
    out.m_71.x = _2583;
    out.m_71.y = _2585;
    float _3623 = fma(_3615, _3471, _3617);
    out.m_73.x = _3619;
    out.m_73.y = _3621;
    out.m_73.z = _3623;
    bool _3625 = _3611 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3627 = isnan(_3611);
    bool _3629 = _3625 || _3627;
    bool _3631 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3633 = _3629 || _3631;
    if (!_3633)
    {
        _3415 = 1.0;
    }
    float _3635 = _3415;
    bool _3637 = !_3633;
    float _3639 = _3635;
    if (!_3637)
    {
        bool _3641 = _3611 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3643 = isnan(_3611);
        bool _3645 = _3641 || _3643;
        bool _3647 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3649 = _3645 || _3647;
        if (!_3649)
        {
            float _3651 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3653 = _3611 + _3651;
            float _3655 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3657 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3655;
            float _3659 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3661 = _3659 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3663 = 1.0 / _3657;
            float _3665 = _3653 * _3663;
            float _3667 = fma(_3665, _3661, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3639 = _3667;
            _3669 = true;
        }
        else
        {
            bool _3671 = _3611 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3673 = isnan(_3611);
            bool _3675 = _3671 || _3673;
            bool _3677 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3679 = _3675 || _3677;
            if (!_3679)
            {
                float _3681 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3683 = _3611 + _3681;
                float _3685 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3687 = _3685 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3689 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3691 = _3689 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3693 = 1.0 / _3687;
                float _3695 = _3683 * _3693;
                float _3697 = fma(_3695, _3691, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3639 = _3697;
                _3669 = true;
            }
            else
            {
                _3639 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3669 = false;
    float _3699 = _3639;
    float _3701 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3703 = _3569 + _3701;
    float _3705 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3707 = _3575 + _3705;
    float _3709 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3711 = _3577 + _3709;
    float _3713 = fma(_3703, _3699, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3715 = fma(_3707, _3699, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3717 = fma(_3711, _3699, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3719 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3721 = _3713 + _3719;
    float _3723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3725 = _3715 + _3723;
    float _3727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3729 = _3717 + _3727;
    float _3731 = _3721 * _3721;
    float _3733 = fma(_3725, _3725, _3731);
    float _3735 = fma(_3729, _3729, _3733);
    float _3737 = rsqrt(_3735);
    float _3739 = _3737 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3741 = _3725 * _3739;
    float _3743 = _3729 * _3739;
    float _3745 = _3741 * _3741;
    float _3747 = _3743 * _3743;
    float _3749 = _3745 + _3747;
    float _3751 = sqrt(_3749);
    bool _3753 = _3751 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3757 = _3751 + _3755;
    float _3759 = _3733;
    float _3761 = _3749;
    float _3763 = _3757;
    float _3765 = _3721;
    float _3767 = _3739;
    float _3769 = _3741;
    if (_3753)
    {
        float _3771 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3759 = _3771;
    }
    float _3773 = _3759;
    if (_3753)
    {
        float _3775 = rsqrt(_3749);
        _3761 = _3775;
    }
    float _3777 = _3761;
    float _3779 = _3773;
    if (_3753)
    {
        float _3781 = _3757 * _3773;
        _3763 = _3781;
    }
    float _3783 = _3763;
    if (_3753)
    {
        float _3785 = _3783 * 0.15915493667125701904296875;
        _3779 = _3785;
    }
    float _3787 = _3779;
    float _3789 = _3729;
    float _3791 = _3787;
    if (_3753)
    {
        float _3793 = _3787 * 6.283185482025146484375;
        float _3795 = sin(_3793);
        _3789 = _3795;
    }
    float _3797 = _3789;
    float _3799 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3801 = precise::max(0.0, _3799);
    float _3803 = _3737;
    float _3805 = _3801;
    if (_3753)
    {
        float _3807 = _3787 * 6.283185482025146484375;
        float _3809 = cos(_3807);
        _3803 = _3809;
    }
    float _3811 = _3803;
    float _3813 = -_3739;
    float _3815 = -_3801;
    float _3817 = fma(_3721, _3813, _3815);
    if (_3753)
    {
        float _3819 = _3817 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3765 = _3819;
    }
    float _3821 = _3765;
    float _3823 = _3821;
    float _3825 = _3797;
    if (_3753)
    {
        float _3827 = fma(_3797, _3821, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3823 = _3827;
    }
    float _3829 = _3823;
    float _3831 = _3829;
    if (!_3753)
    {
        _3825 = _3817;
    }
    float _3833 = _3825;
    float _3835 = _3833;
    float _3837 = _3811;
    if (_3753)
    {
        float _3839 = _3811 + (-1.0);
        _3805 = _3839;
    }
    float _3841 = _3805;
    float _3843 = _3841;
    if (_3753)
    {
        float _3845 = _3777 * _3829;
        _3767 = _3845;
    }
    float _3847 = _3767;
    if (!_3753)
    {
        _3831 = _3745;
    }
    float _3849 = _3831;
    float _3851 = sqrt(_3735);
    float _3853 = _3849;
    if (_3753)
    {
        float _3855 = _3841 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3791 = _3855;
    }
    float _3857 = _3791;
    if (_3753)
    {
        float _3859 = _3741 * _3847;
        _3769 = _3859;
    }
    float _3861 = _3769;
    if (!_3753)
    {
        _3843 = _3743;
    }
    float _3863 = _3843;
    float _3865 = _3863;
    if (_3753)
    {
        float _3867 = _3743 * _3847;
        _3865 = _3867;
    }
    float _3869 = _3865;
    if (_3753)
    {
        float _3871 = fma(_3817, _3811, _3857);
        _3835 = _3871;
    }
    float _3873 = _3835;
    if (_3753)
    {
        float _3875 = _3861 * _3861;
        _3853 = _3875;
    }
    float _3877 = _3853;
    if (!_3753)
    {
        _3837 = _3747;
    }
    float _3879 = _3837;
    float _3881 = _3879;
    if (_3753)
    {
        float _3883 = _3869 * _3869;
        _3881 = _3883;
    }
    float _3885 = _3881;
    float _3887 = fma(_3873, _3873, _3877);
    float _3889 = _3713 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3891 = _3887 + _3885;
    float _3893 = _3713 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3895 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3897 = fma(_3851, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3895);
    float _3899 = precise::clamp(_3897, 0.0, 1.0);
    float _3901 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3903 = rsqrt(_3891);
    float _3905 = fma(_3715, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3893);
    float _3907 = _3713 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3909 = -_3899;
    float _3911 = _3909 + 1.0;
    float _3913 = fma(_3715, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3889);
    float _3915 = fma(_3717, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3905);
    float _3917 = _3713 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3919 = fma(_3715, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3907);
    float _3921 = _3915 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3923 = fma(_3715, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3917);
    float _3925 = fma(_3717, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3919);
    float _3927 = abs(_3911);
    float _3929 = log2(_3927);
    float _3931 = _3921 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3933 = fma(_3717, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3923);
    float _3935 = _3925 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3937 = _3903 * _3861;
    float _3939 = -_3931;
    float _3941 = fma(_3939, _3901, 1.0);
    float _3943 = _3933 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3945 = _3935 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3947 = _3937 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3949 = _3903 * _3873;
    float _3951 = fma(_3717, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3913);
    float _3953 = fma(_3943, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3945);
    float _3955 = _3903 * _3869;
    float _3957 = -_3947;
    float _3959 = fma(_3949, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3957);
    float _3961 = _3951 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3963 = fma(_3921, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3953);
    float _3965 = _3929 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3967 = -_3955;
    float _3969 = fma(_3967, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3959);
    float _3971 = log2(_3941);
    float _3973 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3963);
    float _3975 = _3935 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3977 = fma(_3969, -0.5, 0.5);
    float _3979 = _3935 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3981 = fma(_3969, 0.5, 0.5);
    float _3983 = fma(_3943, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3975);
    float _3985 = exp2(_3965);
    float _3987 = fma(_3943, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3979);
    float _3989 = fma(_3921, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3983);
    float _3991 = _3949 + 1.0;
    float _3993 = fma(_3981, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3995 = fma(_3921, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3987);
    float _3997 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3989);
    float _3999 = 1.0 / _3973;
    float _4001 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3995);
    float _4003 = fma(_3981, _3993, -0.212114393711090087890625);
    float _4005 = fma(_3981, _4003, 1.570728778839111328125);
    float _4007 = sqrt(_3977);
    float _4009 = -_3949;
    float _4011 = fma(_3985, _3991, _4009);
    float _4013 = _3971 * 0.693147182464599609375;
    float _4015 = fma(_4011, 0.5, 0.5);
    float _4017 = _3997 * _3999;
    float _4019 = _4001 * _3999;
    float _4021 = _4013 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4023 = fma(_4017, 0.5, 0.5);
    float _4025 = fma(_4019, -0.5, 0.5);
    float _4027 = _4007 * 0.636619746685028076171875;
    float _4029 = -_4005;
    float _4031 = fma(_4027, _4029, 1.0);
    float3 _10046 = float3(_4023, _4025, _4021);
    float _4033 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10046, float3(0.0), isnan(_10046)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10046, float3(0.0), isnan(_10046)), level(0.0)).x;
    float3 _10057 = float3(_4023, _4025, _4021);
    float4 _4035 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10057, float3(0.0), isnan(_10057)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10057, float3(0.0), isnan(_10057)), level(0.0)).xyzw;
    float _4037 = _4035.x;
    float _4039 = _4035.y;
    float _4041 = _4035.z;
    float _4043 = _4035.w;
    float2 _10073 = float2(_4031, _4015);
    float3 _4047 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10073, float2(0.0), isnan(_10073)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10073, float2(0.0), isnan(_10073)), level(0.0)).xyz;
    float _4049 = _4047.x;
    float _4051 = _4047.y;
    float _4053 = _4047.z;
    float _4055 = _3929 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4057 = _3935 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2917;
    out.m_75.y = _2975;
    out.m_75.z = _2923;
    float _4059 = fma(_3943, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4057);
    float _4061 = exp2(_4055);
    out.m_53.x = 1.0;
    float _4063 = fma(_3921, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4059);
    out.m_77.x = _3715;
    out.m_77.y = _3713;
    out.m_77.z = _3717;
    float _4065 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4063);
    float _4067 = _4065 + _3973;
    out.gl_Position.x = _3997;
    out.gl_Position.y = _4001;
    out.gl_Position.z = _4065;
    out.gl_Position.w = _3973;
    float _4069 = _4067 * 0.5;
    float _4071 = -_4061;
    float _4073 = _4071 + 1.0;
    float _4075 = _4073 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.z = _4069;
    out.m_79.w = _3973;
    float _4077 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4079 = -_4075;
    float _4081 = _4079 + 1.0;
    out.m_81.w = _4077;
    float _4083 = _4075 * _4033;
    float _4085 = _4043 * _4083;
    float _4087 = _4053 * _4083;
    float _4089 = _4043 * _4081;
    float _4091 = fma(_4049, _4085, _4037);
    float _4093 = fma(_4051, _4085, _4039);
    float _4095 = fma(_4043, _4087, _4041);
    out.m_83.x = _4091;
    out.m_83.y = _4093;
    out.m_83.z = _4095;
    out.m_83.w = _4089;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

