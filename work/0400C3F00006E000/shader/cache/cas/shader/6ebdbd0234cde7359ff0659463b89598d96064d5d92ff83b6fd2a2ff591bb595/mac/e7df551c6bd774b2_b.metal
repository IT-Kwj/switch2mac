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
    float4 m_59 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
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
    float4 m_51 [[attribute(3)]];
    float4 m_53 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
};

static inline __attribute__((always_inline))
int _98(thread const int& _8940, thread const int& _8941, constant _10& support_buffer)
{
    float _8944 = as_type<float>(support_buffer._m4);
    int _8946 = _8941 + as_type<int>(_8944);
    int _8948 = 1 + _8946;
    float _8950 = support_buffer._m5[_8948].x;
    float _8952 = abs(_8950);
    bool _8954 = _8952 == 1.0;
    if (_8954)
    {
        return _8940;
    }
    float _8956 = float(_8940);
    float _8958 = _8956 / _8952;
    int _8960 = int(_8958);
    return _8960;
}

static inline __attribute__((always_inline))
int _99(thread const int& _8990, thread const int& _8991, constant _10& support_buffer)
{
    float _8994 = as_type<float>(support_buffer._m4);
    int _8996 = _8991 + as_type<int>(_8994);
    int _8998 = 1 + _8996;
    float _9000 = support_buffer._m5[_8998].x;
    bool _9002 = _9000 == 1.0;
    if (_9002)
    {
        return _8990;
    }
    float _9004 = float(_8990);
    float _9006 = _9004 * _9000;
    int _9008 = int(_9006);
    return _9008;
}

static inline __attribute__((always_inline))
void _96(thread const int& _8628, thread const int& _8629, thread const int& _8630, thread const int& _8631, thread int& _8632, thread int& _8633, thread int& _8634, thread int& _8635, thread int& _8636, thread int& _8637, thread int& _8638, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _8641 = _8629;
    int _8643 = _8628;
    int _8645 = _8630;
    float _8647 = 0.0 + as_type<float>(_8628);
    bool _8649 = _8647 != 0.0;
    bool _8651 = isnan(_8647);
    bool _8653 = _8649 || _8651;
    bool _8655 = isnan(0.0);
    bool _8657 = _8653 || _8655;
    int _8659 = 0;
    int _8661 = _8657 ? (-1) : 0;
    if (!_8657)
    {
        float _8663 = as_type<float>(_8628) * 1.0;
        _8641 = as_type<int>(_8663);
    }
    int _8665 = _8641;
    bool _8667 = !_8657;
    int _8669 = _8665;
    int _8671 = _8665;
    if (!_8667)
    {
        bool _8673 = _8647 >= 0.0;
        bool _8675 = isnan(_8647);
        bool _8677 = _8673 || _8675;
        bool _8679 = isnan(0.0);
        bool _8681 = _8677 || _8679;
        _8661 = _8681 ? (-1) : 0;
        if (!_8681)
        {
            _8669 = 2147483647;
        }
        int _8683 = _8669;
        bool _8685 = !_8681;
        int _8687 = _8683;
        _8671 = _8683;
        if (!_8685)
        {
            float _8689 = abs(as_type<float>(_8628));
            float _8691 = 0.0 + _8689;
            bool _8693 = _8691 > as_type<float>(0x7f800000u /* inf */);
            bool _8695 = isnan(_8691);
            bool _8697 = _8693 || _8695;
            bool _8699 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _8701 = _8697 || _8699;
            _8659 = 2139095040;
            _8661 = _8701 ? (-1) : 0;
            if (_8701)
            {
                float _8703 = as_type<float>(_8628) + 1.0;
                _8687 = as_type<int>(_8703);
            }
            int _8705 = _8687;
            int _8707 = _8705;
            _8671 = _8705;
            if (!_8701)
            {
                bool _8709 = _8691 != as_type<float>(0x7f800000u /* inf */);
                bool _8711 = isnan(_8691);
                bool _8713 = _8709 || _8711;
                bool _8715 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _8717 = _8713 || _8715;
                _8661 = _8717 ? (-1) : 0;
                if (!_8717)
                {
                    _8707 = _8628;
                }
                int _8719 = _8707;
                bool _8721 = !_8717;
                _8671 = _8719;
                if (!_8721)
                {
                    float _8723 = as_type<float>(_8628) * 18446744073709551616.0;
                    float _8725 = rsqrt(_8723);
                    float _8727 = _8723 * _8725;
                    float _8729 = _8725 * 0.5;
                    float _8731 = -_8727;
                    float _8733 = 0.0 + _8731;
                    float _8735 = fma(_8729, _8733, 0.5);
                    float _8737 = fma(_8727, _8735, _8727);
                    float _8739 = -_8737;
                    float _8741 = 0.0 + _8739;
                    float _8743 = fma(_8737, _8741, _8723);
                    float _8745 = fma(_8729, _8743, _8737);
                    float _8747 = _8745 * 2.3283064365386962890625e-10;
                    _8643 = as_type<int>(_8723);
                    _8659 = as_type<int>(_8745);
                    _8671 = as_type<int>(_8747);
                    _8645 = as_type<int>(_8737);
                }
            }
        }
    }
    int _8749 = _8643;
    int _8751 = _8659;
    int _8753 = _8671;
    int _8755 = _8645;
    int _8757 = _8661;
    _8632 = _8749;
    _8633 = _8751;
    _8634 = _8753;
    _8635 = _8631;
    _8636 = 0;
    _8637 = _8755;
    _8638 = _8757;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3011 = false;
    bool _2303 = false;
    bool _2111 = false;
    bool _1609 = false;
    bool _1293 = false;
    bool _915 = false;
    bool _813 = false;
    bool _635 = false;
    bool _307 = false;
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
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3489 = as_type<float>(_121);
        out.gl_Position.z = _3489;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_51.w;
    float _127 = in.m_53.x;
    bool _129 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_125);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_125;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.x = _127;
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
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3563 = as_type<float>(_163);
        out.gl_Position.z = _3563;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = in.m_57.w;
    float _167 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _169 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _171 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _173 = _169 || _171;
    bool _175 = isnan(1.0);
    bool _177 = _173 || _175;
    float _179 = in.m_51.x;
    float _181 = in.m_51.y;
    float _183 = in.m_51.z;
    float _185 = in.m_46.x;
    float _187 = in.m_46.y;
    float _189 = in.m_46.z;
    float _191 = 0.0;
    float _193 = _167;
    if (!_177)
    {
        float _195 = _167 * _167;
        float _197 = _195 * 0.5;
        _191 = _197;
    }
    float _199 = _191;
    float _201 = _199;
    if (!_177)
    {
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    bool _207 = !_177;
    float _209 = _205;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _167 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _167);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
    }
    float _241 = _209;
    bool _243 = !_177;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _167 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _193 = _263;
    }
    float _265 = _193;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _269 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _275 = fma(_265, _179, _269);
    float _277 = fma(_265, _181, _271);
    float _279 = fma(_265, _183, _273);
    float _281 = fma(_275, _165, _185);
    float _283 = fma(_277, _165, _187);
    float _285 = fma(_279, _165, _189);
    bool _287 = !_267;
    float _289 = _285;
    float _305;
    if (!_287)
    {
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _293 = _127 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_107);
        float _311 = 1.0 / _309;
        float _313 = _141 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _315 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _337 = 1.0 / _323;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _339;
    float _343 = 1.0 / _331;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = _315 + _345;
    bool _349 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _351 = isnan(_315);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    bool _361 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _363 = isnan(_315);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -_359;
    float _375 = _373 + 1.0;
    float _377 = 1.0 / _327;
    float _379 = _347 * _337;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = _315 + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _385;
    bool _389 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _391 = fma(_387, _379, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _393 = 1.0 / _335;
    float _395 = _383 * _343;
    bool _397 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _399 = isnan(_315);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _411 = _315 + _409;
    bool _413 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _415 = isnan(_315);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = 1.0 / _341;
    float _427 = _319 * _377;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _431 = _315 + _429;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _433;
    float _437 = -_423;
    float _439 = _437 + 1.0;
    float _441 = fma(_435, _379, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _443 = _411 * _393;
    float _445 = -_407;
    float _447 = _445 + 1.0;
    float _449 = _423 * _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _451;
    float _455 = _431 * _425;
    bool _457 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _459 = isnan(_315);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = fma(_453, _379, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _471 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _473 = isnan(_315);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = _467 * _439;
    float _485 = -_467;
    float _487 = _485 + 1.0;
    float _489 = _481 * _375;
    float _491 = -_481;
    float _493 = _491 + 1.0;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _499 = _359 * _487;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _509 = _371 * _493;
    float _511 = fma(_497, _427, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _513 = fma(_503, _427, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _515 = fma(_507, _427, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _517 = _469 * _509;
    float _519 = -_371;
    float _521 = _519 + 1.0;
    float _523 = _391 * _509;
    float _525 = _441 * _509;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _527;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _535;
    float _539 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[143].x, _517);
    float _541 = fma(_529, _395, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _543 = fma(_533, _395, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _545 = fma(_537, _395, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _551 = fma(_513, _489, _539);
    float _553 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[143].y, _523);
    float _555 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[143].z, _525);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _561 = fma(_549, _443, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _563 = fma(_543, _499, _551);
    float _565 = fma(_515, _489, _553);
    float _567 = fma(_559, _443, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _569 = fma(_511, _489, _555);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _575 = fma(_541, _499, _565);
    float _577 = fma(_545, _499, _569);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _583;
    float _587 = fma(_573, _443, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _589;
    float _593 = fma(_561, _483, _563);
    float _595 = fma(_581, _455, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _597 = fma(_585, _455, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _599 = fma(_591, _455, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _601 = fma(_567, _483, _575);
    float _603 = fma(_587, _483, _577);
    float _605 = fma(_595, _449, _593);
    float _607 = fma(_597, _449, _601);
    float _609 = fma(_599, _449, _603);
    float _611 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[148].x, _605);
    float _613 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[148].y, _607);
    float _615 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[148].z, _609);
    bool _617 = !_389;
    float _633;
    if (!_617)
    {
        float _619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _621 = _127 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _623 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[11].x, _141);
        float _625 = _623 * _619;
        float _627 = floor(_625);
        float _629 = -_627;
        float _631 = _625 + _629;
        _633 = _631;
        _635 = true;
    }
    else
    {
        float _637 = float(_107);
        float _639 = 1.0 / _637;
        float _641 = _141 * _639;
        _633 = _641;
    }
    _635 = false;
    float _643 = _633;
    float _645 = in.m_57.x;
    float _647 = in.m_57.y;
    float _649 = in.m_57.z;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _653 = _643 + _651;
    bool _655 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _657 = isnan(_643);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _667;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _675 = 1.0 / _669;
    bool _677 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _679 = 1.0 / _673;
    float _681 = _613 * _647;
    bool _683 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _685 = isnan(_643);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = _615 * _649;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _697;
    float _701 = _653 * _675;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _705 = _643 + _703;
    bool _707 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _709 = isnan(_643);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = -_693;
    float _721 = _719 + 1.0;
    float _723 = fma(_699, _701, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _725 = _717 * _721;
    float _727 = -_717;
    float _729 = _727 + 1.0;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _731;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _735;
    float _739 = _705 * _679;
    float _741 = _665 * _729;
    float _743 = fma(_733, _701, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _745 = fma(_737, _701, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _747 = -_665;
    float _749 = _747 + 1.0;
    float _751 = _723 * _741;
    float _753 = _743 * _741;
    float _755 = _745 * _741;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _769 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[107].x, _753);
    float _771 = fma(_759, _739, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _773 = fma(_763, _739, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _775 = fma(_767, _739, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _777 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[107].y, _751);
    float _779 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[107].z, _755);
    float _781 = fma(_771, _725, _769);
    float _783 = _611 * _645;
    float _785 = fma(_773, _725, _777);
    float _787 = fma(_775, _725, _779);
    float _789 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[109].x, _781);
    float _791 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[109].y, _785);
    float _793 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[109].z, _787);
    bool _795 = !_677;
    float _811;
    if (!_795)
    {
        float _797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _799 = _127 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _801 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _803 = _801 * _797;
        float _805 = floor(_803);
        float _807 = -_805;
        float _809 = _803 + _807;
        _811 = _809;
        _813 = true;
    }
    else
    {
        float _815 = float(_107);
        float _817 = 1.0 / _815;
        float _819 = _141 * _817;
        _811 = _819;
    }
    _813 = false;
    float _821 = _811;
    bool _823 = _821 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _825 = isnan(_821);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _839 = _821 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _841 = isnan(_821);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _851;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _857 = _821 + _855;
    float _859 = -_833;
    float _861 = _859 + 1.0;
    bool _863 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _865 = 1.0 / _837;
    float _867 = _849 * _861;
    float _869 = -_849;
    float _871 = _869 + 1.0;
    float _873 = _853 * _865;
    float _875 = _793 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _877 = fma(_873, _857, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _879 = _791 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _881 = _875 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = _877 * _867;
    float _885 = _789 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _887 = _879 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _889 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[115].x, _883);
    float _891 = _885 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[116].x, _889);
    float _895 = _893 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _891;
    out.m_59.y = _887;
    out.m_59.z = _881;
    out.m_59.w = _895;
    bool _897 = !_863;
    float _913;
    if (!_897)
    {
        float _899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _901 = _127 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _903 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[14].x, _141);
        float _905 = _903 * _899;
        float _907 = floor(_905);
        float _909 = -_907;
        float _911 = _905 + _909;
        _913 = _911;
        _915 = true;
    }
    else
    {
        float _917 = float(_107);
        float _919 = 1.0 / _917;
        float _921 = _141 * _919;
        _913 = _921;
    }
    _915 = false;
    float _923 = _913;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _927 = _923 + _925;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _931 = _923 + _929;
    bool _933 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _935 = isnan(_923);
    bool _937 = _933 || _935;
    bool _939 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _941 = _937 || _939;
    float _943 = float(_941);
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _945;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _953;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _961 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _963 = isnan(_923);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = 1.0 / _951;
    float _975 = -_943;
    float _977 = _975 + 1.0;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _981 = _923 + _979;
    bool _983 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _985 = isnan(_923);
    bool _987 = _983 || _985;
    bool _989 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _991 = _987 || _989;
    float _993 = float(_991);
    bool _995 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _997 = isnan(_923);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    float _1007 = 1.0 / _947;
    bool _1009 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1011 = 1.0 / _955;
    float _1013 = _931 * _973;
    bool _1015 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1017 = isnan(_923);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1023 = _1019 || _1021;
    float _1025 = float(_1023);
    float _1027 = -_1025;
    float _1029 = _1027 + 1.0;
    float _1031 = 1.0 / _959;
    float _1033 = _927 * _1007;
    float _1035 = _971 * _977;
    float _1037 = -_971;
    float _1039 = _1037 + 1.0;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1041;
    float _1045 = _993 * _1039;
    float _1047 = _981 * _1011;
    float _1049 = -_993;
    float _1051 = _1049 + 1.0;
    bool _1053 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1055 = isnan(_923);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1061 = _1057 || _1059;
    float _1063 = float(_1061);
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1067 = _923 + _1065;
    float _1069 = 1.0 / _1043;
    float _1071 = _1025 * _1051;
    bool _1073 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1075 = isnan(_923);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = -_1063;
    float _1087 = _1085 + 1.0;
    float _1089 = _1067 * _1031;
    float _1091 = _1063 * _1029;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1097 = -_1083;
    float _1099 = _1097 + 1.0;
    float _1101 = _1083 * _1087;
    bool _1103 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1105 = isnan(_923);
    bool _1107 = _1103 || _1105;
    bool _1109 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1111 = _1107 || _1109;
    float _1113 = float(_1111);
    float _1115 = -_1005;
    float _1117 = _1115 + 1.0;
    float _1119 = _1005 * _1099;
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1121;
    float _1125 = 1.0 / _1095;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1127;
    float _1131 = _1113 * _1117;
    float _1133 = fma(_1123, _1033, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1141 = _923 + _1139;
    float _1143 = _1133 * _1131;
    float _1145 = 1.0 / _1129;
    float _1147 = -_1113;
    float _1149 = _1147 + 1.0;
    float _1151 = fma(_1137, _1013, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1155 = _923 + _1153;
    float _1157 = _1141 * _1069;
    float _1159 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1143);
    float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1167 = _923 + _1165;
    float _1169 = _1155 * _1125;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1171;
    float _1175 = fma(_1151, _1119, _1159);
    float _1177 = fma(_1173, _1047, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1179;
    float _1183 = fma(_1177, _1101, _1175);
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1187 = _1185 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1189 = fma(_1163, _1089, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1191;
    float _1195 = fma(_1181, _1033, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1199 = _1197 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1201 = fma(_1189, _1091, _1183);
    float _1203 = fma(_1193, _1157, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1205 = fma(_1187, _1013, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1207 = _1167 * _1145;
    float _1209 = fma(_1203, _1071, _1201);
    float _1211 = fma(_1199, _1169, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1213;
    float _1217 = _1195 * _1131;
    float _1219 = fma(_1211, _1045, _1209);
    float _1221 = fma(_1215, _1207, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1223;
    float _1227 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1217);
    float _1229 = fma(_1221, _1035, _1219);
    float _1231 = fma(_1225, _1047, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1235 = _1233 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1237 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1229);
    float _1239 = fma(_1205, _1119, _1227);
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1241;
    float _1245 = fma(_1235, _1089, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1247 = fma(_1231, _1101, _1239);
    out.m_61.y = _1237;
    float _1249 = fma(_1243, _1157, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1253 = _1251 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1255 = fma(_1245, _1091, _1247);
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1257;
    float _1261 = fma(_1253, _1169, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1263 = fma(_1249, _1071, _1255);
    float _1265 = fma(_1259, _1207, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1267 = fma(_1261, _1045, _1263);
    float _1269 = fma(_1265, _1035, _1267);
    float _1271 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1269);
    float _1273 = precise::clamp(_1271, 0.0, 1.0);
    bool _1275 = !_1009;
    float _1291;
    if (!_1275)
    {
        float _1277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1279 = _127 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1281 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[14].y, _141);
        float _1283 = _1281 * _1277;
        float _1285 = floor(_1283);
        float _1287 = -_1285;
        float _1289 = _1283 + _1287;
        _1291 = _1289;
        _1293 = true;
    }
    else
    {
        float _1295 = float(_107);
        float _1297 = 1.0 / _1295;
        float _1299 = _141 * _1297;
        _1291 = _1299;
    }
    _1293 = false;
    float _1301 = _1291;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1305 = _1301 + _1303;
    bool _1307 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1309 = isnan(_1301);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1315 = _1311 || _1313;
    float _1317 = float(_1315);
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1321 = _1319 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1323;
    bool _1327 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1329 = isnan(_1301);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1335 = _1331 || _1333;
    float _1337 = float(_1335);
    bool _1339 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1341 = isnan(_1301);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1347 = _1343 || _1345;
    float _1349 = float(_1347);
    float _1351 = 1.0 / _1321;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1355 = _1353 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1357 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1359 = isnan(_1301);
    bool _1361 = _1357 || _1359;
    bool _1363 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1365 = _1361 || _1363;
    float _1367 = float(_1365);
    float _1369 = -_1349;
    float _1371 = _1369 + 1.0;
    bool _1373 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1375 = isnan(_1301);
    bool _1377 = _1373 || _1375;
    bool _1379 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1381 = _1377 || _1379;
    float _1383 = float(_1381);
    float _1385 = 1.0 / _1355;
    float _1387 = -_1367;
    float _1389 = _1387 + 1.0;
    bool _1391 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1393 = _1325 * _1351;
    float _1395 = -_1317;
    float _1397 = _1395 + 1.0;
    float _1399 = -_1337;
    float _1401 = _1399 + 1.0;
    float _1403 = -_1383;
    float _1405 = _1403 + 1.0;
    float _1407 = fma(_1393, _1305, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1409 = _1337 * _1397;
    float _1411 = _1349 * _1401;
    float _1413 = _1367 * _1371;
    bool _1415 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1417 = isnan(_1301);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1423 = _1419 || _1421;
    float _1425 = float(_1423);
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1429 = _1427 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1433 = _1431 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1435 = _1383 * _1389;
    bool _1437 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1439 = isnan(_1301);
    bool _1441 = _1437 || _1439;
    bool _1443 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1445 = _1441 || _1443;
    float _1447 = float(_1445);
    float _1449 = _1425 * _1405;
    float _1451 = 1.0 / _1433;
    float _1453 = -_1425;
    float _1455 = _1453 + 1.0;
    float _1457 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1459 = _1457 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1461 = _1447 * _1455;
    float _1463 = _1459 * _1385;
    float _1465 = 1.0 / _1429;
    float _1467 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1469 = _1467 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1471 = _1407 * _1461;
    float _1473 = -_1447;
    float _1475 = _1473 + 1.0;
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1479 = _1477 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1481;
    float _1485 = 1.0 / _1469;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1489 = _1301 + _1487;
    float _1491 = fma(_1475, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1471);
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1495 = _1493 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1497 = _1483 * _1451;
    float _1499 = fma(_1463, _1489, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1503 = _1301 + _1501;
    float _1505 = 1.0 / _1479;
    float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1509 = _1507 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1511 = fma(_1497, _1503, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1513 = fma(_1499, _1449, _1491);
    float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1517 = _1301 + _1515;
    float _1519 = _1509 * _1465;
    float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1523 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1521;
    float _1525 = 1.0 / _1495;
    float _1527 = fma(_1519, _1517, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1529 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1531 = _1529 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1533 = _1523 * _1485;
    float _1535 = fma(_1511, _1435, _1513);
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1539 = _1301 + _1537;
    bool _1541 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1543 = isnan(_1301);
    bool _1545 = _1541 || _1543;
    bool _1547 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1549 = _1545 || _1547;
    float _1551 = float(_1549);
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1555 = _1301 + _1553;
    float _1557 = _1531 * _1505;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1561 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1559;
    float _1563 = fma(_1533, _1539, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1565 = fma(_1527, _1413, _1535);
    float _1567 = fma(_1557, _1555, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1569 = -_1551;
    float _1571 = _1569 + 1.0;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1575 = _1301 + _1573;
    float _1577 = fma(_1563, _1411, _1565);
    float _1579 = _1561 * _1525;
    float _1581 = _1317 * _1571;
    float _1583 = fma(_1567, _1409, _1577);
    float _1585 = fma(_1579, _1575, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1587 = fma(_1585, _1581, _1583);
    float _1589 = fma(_1551, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1587);
    out.m_63.x = _1589;
    bool _1591 = !_1391;
    float _1607;
    if (!_1591)
    {
        float _1593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1595 = _127 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1597 = fma(_1595, (*spvDescriptorSet0.vp_c9)._m0[14].z, _141);
        float _1599 = _1597 * _1593;
        float _1601 = floor(_1599);
        float _1603 = -_1601;
        float _1605 = _1599 + _1603;
        _1607 = _1605;
        _1609 = true;
    }
    else
    {
        float _1611 = float(_107);
        float _1613 = 1.0 / _1611;
        float _1615 = _141 * _1613;
        _1607 = _1615;
    }
    _1609 = false;
    float _1617 = _1607;
    int _1619 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1621 = _1619;
    int _1623 = 0;
    int _1625 = _98(_1621, _1623, (*spvDescriptorSet0.support_buffer));
    float _1627 = in.m_65.z;
    float _1629 = trunc(_1627);
    int _1631 = int(_1629);
    int _1633 = _1625 + (-1);
    float _1635 = float(_1633);
    float _1637 = _1273 * _1635;
    float _1639 = trunc(_1637);
    int _1641 = int(_1639);
    int _1643 = _1641;
    int _1645 = 0;
    int _1647 = _99(_1643, _1645, (*spvDescriptorSet0.support_buffer));
    int _1649 = _1631;
    int _1651 = 0;
    int _1653 = _99(_1649, _1651, (*spvDescriptorSet0.support_buffer));
    float4 _1656 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1647, _1653)), 0).xyzw;
    float _1658 = _1656.x;
    float _1660 = _1656.y;
    float _1662 = _1656.z;
    float _1664 = _1656.w;
    float _1666 = in.m_53.y;
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1670 = _1668 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1674 = _1672 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1676 = 1.0 / _1670;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1680 = _1678 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    int _1682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1684 = _1682 != 0;
    float _1686 = in.m_65.x;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1692 = _127 > 0.5;
    bool _1694 = _1692 && _1684;
    float _1696 = 1.0 / _1674;
    bool _1698 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1700 = isnan(_1617);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1706 = _1702 || _1704;
    float _1708 = float(_1706);
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1712 = _1710 != 0;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1714;
    bool _1718 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1720 = isnan(_1617);
    bool _1722 = _1718 || _1720;
    bool _1724 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1726 = _1722 || _1724;
    float _1728 = float(_1726);
    float _1730 = 1.0 / _1680;
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1732;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1738 = _1736 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    bool _1740 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1742 = isnan(_1617);
    bool _1744 = _1740 || _1742;
    bool _1746 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1748 = _1744 || _1746;
    float _1750 = float(_1748);
    float _1752 = _1734 * _1676;
    bool _1754 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1756 = isnan(_1617);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1762 = _1758 || _1760;
    float _1764 = float(_1762);
    float _1766 = -_1708;
    float _1768 = _1766 + 1.0;
    float _1770 = 1.0 / _1690;
    float _1772 = _1738 * _1696;
    bool _1774 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1776 = isnan(_1617);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1782 = _1778 || _1780;
    float _1784 = float(_1782);
    float _1786 = -_1764;
    float _1788 = _1786 + 1.0;
    float _1790 = _1764 * _1768;
    float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1794 = _1792 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1796 = -_1784;
    float _1798 = _1796 + 1.0;
    float _1800 = _1794 * _1730;
    bool _1802 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1804 = isnan(_1617);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1810 = _1806 || _1808;
    float _1812 = float(_1810);
    float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1816 = _1814 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1818 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1820 = isnan(_1617);
    bool _1822 = _1818 || _1820;
    bool _1824 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1826 = _1822 || _1824;
    float _1828 = float(_1826);
    bool _1830 = _1666 > 0.5;
    bool _1832 = _1830 && _1712;
    float _1834 = _1812 * _1788;
    float _1836 = -_1812;
    float _1838 = _1836 + 1.0;
    float _1840 = _1716 * _1770;
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1844 = _1617 + _1842;
    float _1846 = _1784 * _1838;
    float _1848 = _1728 * _1798;
    float _1850 = -_1728;
    float _1852 = _1850 + 1.0;
    float _1854 = 1.0 / _1816;
    float _1856 = fma(_1752, _1844, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    bool _1858 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1860 = isnan(_1617);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1866 = _1862 || _1864;
    float _1868 = float(_1866);
    float _1870 = _1828 * _1852;
    float _1872 = -_1828;
    float _1874 = _1872 + 1.0;
    float _1876 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1878 = _1876 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1880 = _1868 * _1874;
    float _1882 = -_1868;
    float _1884 = _1882 + 1.0;
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1888 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1886;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1892 = _1617 + _1890;
    float _1894 = _1750 * _1884;
    float _1896 = 1.0 / _1878;
    float _1898 = _1888 * _1854;
    float _1900 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1902 = _1617 + _1900;
    float _1904 = _1856 * _1894;
    float _1906 = -_1750;
    float _1908 = _1906 + 1.0;
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1912 = _1910 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1914 = fma(_1840, _1902, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1916 = fma(_1772, _1892, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1918 = fma(_1908, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1904);
    float _1920 = in.m_65.y;
    float _1922 = 1.0 / _1912;
    float _1924 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1926 = _1617 + _1924;
    float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1930 = _1928 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1932 = fma(_1916, _1880, _1918);
    float _1934 = fma(_1800, _1926, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1936 = _1930 * _1896;
    float _1938 = fma(_1914, _1870, _1932);
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1942 = _1617 + _1940;
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1946 = _1617 + _1944;
    float _1948 = fma(_1934, _1848, _1938);
    float _1950 = fma(_1898, _1942, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1952 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1954 = _1617 + _1952;
    float _1956 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1956;
    float _1960 = fma(_1936, _1946, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1962 = fma(_1950, _1846, _1948);
    float _1964 = _1958 * _1922;
    float _1966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1968 = fma(_1960, _1834, _1962);
    float _1970 = _1834;
    int _1972 = as_type<int>(_1908);
    if (_1684)
    {
        _1970 = _1686;
    }
    float _1974 = _1970;
    float _1976 = fma(_1964, _1954, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1978 = _1920;
    float _1980 = _1974;
    float _1982 = _1976;
    if (_1832)
    {
        float _1984 = -_1920;
        float _1986 = _1984 + 1.0;
        _1978 = _1986;
    }
    float _1988 = _1978;
    float _1990 = fma(_1976, _1790, _1968);
    if (_1694)
    {
        float _1992 = -_1974;
        float _1994 = _1992 + 1.0;
        _1980 = _1994;
    }
    float _1996 = _1980;
    if (!_1684)
    {
        _1982 = _1686;
    }
    float _1998 = _1982;
    float _2000 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2002 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1990);
    float _2004 = _1988 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2006 = _1998;
    if (_1684)
    {
        _2006 = _1996;
    }
    float _2008 = _2006;
    int _2010 = _1641 + 1;
    float _2012 = _2004 * _1966;
    out.m_67.x = _2002;
    float _2014 = _2008 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2016 = min(_1633, _2010);
    float _2018 = _2014 * _2000;
    uint _2021 = as_type<uint>(half2(float2(_1664, 0.0)));
    uint _2023 = extract_bits(_2021, 0u, 8u);
    int _2025 = int(_2023) & 255;
    uint _2027 = extract_bits(_2021, 8u, 8u);
    int _2029 = int(_2027) & 255;
    int _2031 = _2029 << 8;
    int _2033 = _2025 | _2031;
    bool _2035 = _2033 >= 32768;
    int _2037 = _2033 + (-1024);
    int _2039 = _2037;
    float _2041 = _2018;
    float _2043 = _2012;
    if (_2035)
    {
        int _2045 = ~_2033;
        int _2047 = _2045 + 33792;
        int _2049 = _2047 + 1;
        _2039 = _2049;
    }
    int _2051 = _2039;
    int _2053 = _2051 + 30719;
    float _2055 = float(_2053);
    float _2057 = fma(_2055, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2059 = abs(_2057);
    float _2061 = -_2059;
    float _2063 = _2061 + 1.0;
    float _2065 = abs(_2057);
    float _2067 = fma(_2065, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2069 = _2057 < 0.0;
    float _2071 = float(_2069);
    int _2073 = as_type<int>(_2063) + (-218103808);
    float _2075 = abs(_2057);
    float _2077 = fma(_2075, _2067, -0.212114393711090087890625);
    bool _2079 = uint(_2073) >= 1920991232u;
    float _2081 = abs(_2057);
    float _2083 = fma(_2081, _2077, 1.570728778839111328125);
    bool _2085 = !_2079;
    float _2109;
    if (!_2085)
    {
        int _2087 = as_type<int>(_2063);
        int _2089 = as_type<int>(_1898);
        int _2091 = as_type<int>(_1908);
        int _2093 = 10224;
        int _2095;
        int _2097;
        int _2099;
        int _2101;
        int _2103;
        int _2105;
        int _2107;
        _96(_2087, _2089, _2091, _2093, _2095, _2097, _2099, _2101, _2103, _2105, _2107, out.gl_Position, out.gl_PointSize);
        _2109 = as_type<float>(_2099);
        _1972 = _2105;
        _2111 = true;
    }
    else
    {
        float _2113 = rsqrt(_2063);
        float _2115 = _2063 * _2113;
        float _2117 = _2113 * 0.5;
        float _2119 = -_2115;
        float _2121 = 0.0 + _2119;
        float _2123 = fma(_2117, _2121, 0.5);
        float _2125 = fma(_2115, _2123, _2115);
        float _2127 = -_2125;
        float _2129 = 0.0 + _2127;
        float _2131 = fma(_2125, _2129, _2063);
        float _2133 = fma(_2117, _2131, _2125);
        _2109 = _2133;
    }
    _2111 = false;
    float _2135 = _2109;
    int _2137 = _1972;
    int _2139 = _2016;
    int _2141 = 0;
    int _2143 = _99(_2139, _2141, (*spvDescriptorSet0.support_buffer));
    int _2145 = _1631;
    int _2147 = 0;
    int _2149 = _99(_2145, _2147, (*spvDescriptorSet0.support_buffer));
    float4 _2151 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2143, _2149)), 0).xyzw;
    float _2153 = _2151.x;
    float _2155 = _2151.y;
    float _2157 = _2151.z;
    float _2159 = _2151.w;
    float _2161 = _2083 * _2135;
    float _2163 = _2071 * 2.0;
    float _2165 = _2055 * 3.883221149444580078125;
    float _2167 = floor(_1637);
    float _2169 = -_2163;
    float _2171 = fma(_2161, _2169, _2161);
    float _2173 = _2165 * 0.15915493667125701904296875;
    float _2175 = fma(_2071, 3.1415927410125732421875, _2171);
    float _2177 = _2173 * 6.283185482025146484375;
    float _2179 = cos(_2177);
    float _2181 = _2175 * 0.15915493667125701904296875;
    float _2183 = _2181 * 6.283185482025146484375;
    float _2185 = sin(_2183);
    float _2187 = -_2167;
    float _2189 = _1637 + _2187;
    float _2191 = _2173 * 6.283185482025146484375;
    float _2193 = sin(_2191);
    float _2195 = _2185 * _2179;
    float _2197 = _2185 * _2193;
    uint _2199 = as_type<uint>(half2(float2(_2159, 0.0)));
    float _2201 = -_1660;
    float _2203 = _2201 + _2155;
    float _2205 = -_1658;
    float _2207 = _2205 + _2153;
    float _2209 = -_1662;
    float _2211 = _2209 + _2157;
    uint _2213 = extract_bits(_2199, 0u, 8u);
    int _2215 = int(_2213) & 255;
    uint _2217 = extract_bits(_2199, 8u, 8u);
    int _2219 = int(_2217) & 255;
    int _2221 = _2219 << 8;
    int _2223 = _2215 | _2221;
    float _2225 = fma(_2189, _2207, _1658);
    float _2227 = fma(_2189, _2211, _1662);
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
    float _2243 = fma(_2189, _2203, _1660);
    int _2245 = _2241 + 30719;
    float _2247 = float(_2245);
    float _2249 = fma(_2247, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2251 = abs(_2249);
    float _2253 = -_2251;
    float _2255 = _2253 + 1.0;
    float _2257 = abs(_2249);
    float _2259 = fma(_2257, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2261 = _2249 < 0.0;
    float _2263 = float(_2261);
    int _2265 = as_type<int>(_2255) + (-218103808);
    float _2267 = abs(_2249);
    float _2269 = fma(_2267, _2259, -0.212114393711090087890625);
    bool _2271 = uint(_2265) >= 1920991232u;
    float _2273 = abs(_2249);
    float _2275 = fma(_2273, _2269, 1.570728778839111328125);
    bool _2277 = !_2271;
    float _2301;
    if (!_2277)
    {
        int _2279 = as_type<int>(_2255);
        int _2281 = as_type<int>(_2161);
        int _2283 = _2137;
        int _2285 = 11120;
        int _2287;
        int _2289;
        int _2291;
        int _2293;
        int _2295;
        int _2297;
        int _2299;
        _96(_2279, _2281, _2283, _2285, _2287, _2289, _2291, _2293, _2295, _2297, _2299, out.gl_Position, out.gl_PointSize);
        _2301 = as_type<float>(_2291);
        _2303 = true;
    }
    else
    {
        float _2305 = rsqrt(_2255);
        float _2307 = _2255 * _2305;
        float _2309 = _2305 * 0.5;
        float _2311 = -_2307;
        float _2313 = 0.0 + _2311;
        float _2315 = fma(_2309, _2313, 0.5);
        float _2317 = fma(_2307, _2315, _2307);
        float _2319 = -_2317;
        float _2321 = 0.0 + _2319;
        float _2323 = fma(_2317, _2321, _2255);
        float _2325 = fma(_2309, _2323, _2317);
        _2301 = _2325;
    }
    _2303 = false;
    float _2327 = _2301;
    float _2329 = in.m_53.x;
    float _2331 = in.m_53.y;
    float _2333 = in.m_53.z;
    float _2335 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2337 = log2(_2335);
    float _2339 = _2275 * _2327;
    float _2341 = _783 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2345 = _2343 != 0;
    int _2347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2349 = _2347 != 0;
    int _2351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2353 = _2351 != 0;
    float _2355 = _681 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2357 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2359 = -_2057;
    float _2361 = _2359 + _2249;
    float _2363 = fma(_2189, _2361, _2057);
    float _2365 = _2337 * _141;
    float _2367 = exp2(_2365);
    float _2369 = _2333 * 2.0;
    float _2371 = _2329 * 2.0;
    float _2373 = _2333 + _2331;
    float _2375 = _2331 + _2329;
    float _2377 = _2331 * 2.0;
    float _2379 = _2331 + (-0.5);
    float _2381 = _2373 + (-1.0);
    float _2383 = floor(_2369);
    float _2385 = _2375 + (-1.0);
    float _2387 = floor(_2371);
    float _2389 = -_2367;
    float _2391 = _2389 + 1.0;
    bool _2393 = _2383 > 0.0;
    float _2395 = fma(_2381, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2397 = _2383 >= 0.0;
    bool _2399 = isnan(_2383);
    bool _2401 = _2397 || _2399;
    bool _2403 = isnan(0.0);
    bool _2405 = _2401 || _2403;
    float _2407 = fma(_2385, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2409 = !_2345;
    int _2411 = _2409 ? 0 : 1;
    float _2413 = floor(_2377);
    int _2415 = _2405 ? 0 : 1;
    int _2417 = abs(_2411);
    int _2419 = ~_2415;
    int _2421 = _2419 + 1;
    int _2423 = _2421 + 1;
    bool _2425 = _2387 > 0.0;
    int _2427 = _2423;
    float _2429 = _2363;
    if (!_2393)
    {
        int _2431 = ~_2415;
        int _2433 = _2431 + 1;
        _2427 = _2433;
    }
    int _2435 = _2427;
    float _2437 = in.m_69.x;
    float _2439 = in.m_69.y;
    float _2441 = in.m_69.z;
    bool _2443 = _2387 >= 0.0;
    bool _2445 = isnan(_2387);
    bool _2447 = _2443 || _2445;
    bool _2449 = isnan(0.0);
    bool _2451 = _2447 || _2449;
    float _2453 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2455 = 1.0 + _2453;
    bool _2457 = !_2349;
    int _2459 = _2457 ? 0 : 1;
    bool _2461 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2463 = isnan(1.0);
    bool _2465 = _2461 || _2463;
    bool _2467 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2469 = _2465 || _2467;
    float _2471 = 1.0 / _2455;
    float _2473 = float(_2435);
    int _2475 = _2451 ? 0 : 1;
    bool _2477 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2479 = isnan(0.0);
    bool _2481 = _2477 || _2479;
    bool _2483 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2485 = _2481 || _2483;
    int _2487 = abs(_2459);
    float _2489 = float(_2417);
    int _2491 = ~_2475;
    int _2493 = _2491 + 1;
    int _2495 = _2493 + 1;
    int _2497 = _2495;
    if (!_2425)
    {
        int _2499 = ~_2475;
        int _2501 = _2499 + 1;
        _2497 = _2501;
    }
    int _2503 = _2497;
    float _2505 = _2489 * _2473;
    float _2507 = _2485 ? _2391 : 0.0;
    bool _2509 = _2413 > 0.0;
    float _2511 = _2505 * (-2.0);
    float _2513 = float(_2487);
    if (_2469)
    {
        float _2515 = _2507 * _2471;
        _145 = _2515;
    }
    float _2517 = _145;
    float _2519 = float(_2503);
    float _2521 = _2329 + (-0.5);
    bool _2523 = _2413 >= 0.0;
    bool _2525 = isnan(_2413);
    bool _2527 = _2523 || _2525;
    bool _2529 = isnan(0.0);
    bool _2531 = _2527 || _2529;
    float _2533 = fma(_2511, _2437, _2437);
    bool _2535 = !_2353;
    int _2537 = _2535 ? 0 : 1;
    float _2539 = _2513 * _2519;
    int _2541 = _2531 ? 0 : 1;
    float _2543 = fma(_2521, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2533);
    int _2545 = abs(_2537);
    float _2547 = _2539 * (-2.0);
    float _2549 = fma(_2407, _2511, _2407);
    int _2551 = ~_2541;
    int _2553 = _2551 + 1;
    int _2555 = _2553 + 1;
    float _2557 = _2333 + _2329;
    int _2559 = _2555;
    if (!_2509)
    {
        int _2561 = ~_2541;
        int _2563 = _2561 + 1;
        _2559 = _2563;
    }
    int _2565 = _2559;
    float _2567 = fma(_2395, _2547, _2395);
    float _2569 = fma(_2547, _2439, _2439);
    float _2571 = float(_2545);
    float _2573 = _2557 + (-1.0);
    float _2575 = float(_2565);
    float _2577 = fma(_2379, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2569);
    float _2579 = _2333 + (-0.5);
    float _2581 = fma(_2549, _2517, _2543);
    float _2583 = _283 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2585 = _2571 * _2575;
    float _2587 = fma(_2567, _2517, _2577);
    float _2589 = _2581 * 0.15915493667125701904296875;
    float _2591 = _2585 * (-2.0);
    float _2593 = fma(_2573, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2595 = _2587 * 0.15915493667125701904296875;
    float _2597 = fma(_2591, _2441, _2441);
    float _2599 = _2589 * 6.283185482025146484375;
    float _2601 = sin(_2599);
    float _2603 = fma(_2593, _2591, _2593);
    float _2605 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2225);
    float _2607 = fma(_2579, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2597);
    float _2609 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2583);
    bool _2611 = _2243 != 0.0;
    bool _2613 = isnan(_2243);
    bool _2615 = _2611 || _2613;
    bool _2617 = isnan(0.0);
    bool _2619 = _2615 || _2617;
    float _2621 = _2341 * _2605;
    float _2623 = fma(_2603, _2517, _2607);
    float _2625 = _2589 * 6.283185482025146484375;
    float _2627 = cos(_2625);
    float _2629 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2243);
    bool _2631 = _2225 == 0.0;
    bool _2633 = !_2619;
    bool _2635 = _2631 && _2633;
    float _2637 = _2623 * 0.15915493667125701904296875;
    float _2639 = _2263 * 2.0;
    float _2641 = _2355 * _2629;
    float _2643 = _283 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2645 = _283 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2647 = _2595 * 6.283185482025146484375;
    float _2649 = sin(_2647);
    float _2651 = -_2639;
    float _2653 = fma(_2339, _2651, _2339);
    float _2655 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2643);
    bool _2657 = _2227 == 0.0;
    bool _2659 = _2657 && _2635;
    float _2661 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2645);
    float _2663 = fma(_2263, 3.1415927410125732421875, _2653);
    float _2665 = _2595 * 6.283185482025146484375;
    float _2667 = cos(_2665);
    float _2669 = _2663 * 0.15915493667125701904296875;
    float _2671 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2661);
    float _2673 = _2637 * 6.283185482025146484375;
    float _2675 = cos(_2673);
    float _2677 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2227);
    float _2679 = _2601 * _2649;
    float _2681 = _2671;
    if (!_2659)
    {
        float _2683 = fma(_2243, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2363);
        _2429 = _2683;
    }
    float _2685 = _2429;
    float _2687 = _2357 * _2677;
    float _2689 = _2637 * 6.283185482025146484375;
    float _2691 = sin(_2689);
    float _2693 = _2627 * _2667;
    float _2695 = _2601 * _2667;
    float _2697 = _2627 * _2675;
    float _2699 = _2627 * _2649;
    float _2701 = _2601 * _2675;
    float _2703 = _2667 * _2675;
    float _2705 = _2697 * _2641;
    float _2707 = _2649 * _2675;
    float _2709 = _2701 * _2641;
    float _2711 = _2669 * 6.283185482025146484375;
    float _2713 = sin(_2711);
    float _2715 = fma(_2691, _2693, _2679);
    float _2717 = fma(_2691, _2679, _2693);
    float _2719 = -_2699;
    float _2721 = fma(_2691, _2695, _2719);
    float _2723 = -_2641;
    float _2725 = _2691 * _2723;
    float _2727 = -_2695;
    float _2729 = fma(_2691, _2699, _2727);
    float _2731 = fma(_2715, _2621, _2705);
    float _2733 = _2701 * _2685;
    float _2735 = fma(_2703, _2621, _2725);
    float _2737 = fma(_2721, _2621, _2709);
    float _2739 = fma(_2729, _2687, _2731);
    float _2741 = _2247 * 3.883221149444580078125;
    float _2743 = fma(_2707, _2687, _2735);
    float _2745 = fma(_2717, _2687, _2737);
    float _2747 = _2739 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2749 = _2739 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2751 = _2741 * 0.15915493667125701904296875;
    float _2753 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2655);
    float _2755 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2609);
    float _2757 = fma(_2743, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2747);
    float _2759 = fma(_2743, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2749);
    float _2761 = _2753 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2763 = _2755 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2765 = fma(_2745, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2757);
    float _2767 = fma(_2745, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2759);
    float _2769 = _2751 * 6.283185482025146484375;
    float _2771 = cos(_2769);
    float _2773 = _2739 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2775 = _2761 + _2765;
    float _2777 = _2763 + _2767;
    float _2779 = fma(_2743, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2773);
    float _2781 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2783 = _2775 + _2781;
    float _2785 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2787 = _2777 + _2785;
    float _2789 = _2751 * 6.283185482025146484375;
    float _2791 = sin(_2789);
    float _2793 = fma(_2745, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2779);
    float _2795 = _2783 * _2783;
    float _2797 = _2787 * _2787;
    float _2799 = _2697 * _2685;
    float _2801 = _2795 + _2797;
    float _2803 = -_2195;
    float _2805 = fma(_2713, _2771, _2803);
    float _2807 = sqrt(_2801);
    float _2809 = fma(_2189, _2805, _2195);
    float _2811 = -_2197;
    float _2813 = fma(_2713, _2791, _2811);
    float _2815 = _2671 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2817 = _2809;
    float _2819 = _2685;
    float _2821 = _2779;
    float _2823 = _2691;
    if (!_2659)
    {
        float _2825 = fma(_2225, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2809);
        _2817 = _2825;
    }
    float _2827 = _2817;
    float _2829 = fma(_2189, _2813, _2197);
    float _2831 = _2815 + _2793;
    float _2833 = -_2685;
    float _2835 = _2691 * _2833;
    float _2837 = _2829;
    if (!_2659)
    {
        float _2839 = fma(_2227, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2829);
        _2837 = _2839;
    }
    float _2841 = _2837;
    bool _2843 = _2807 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_2843)
    {
        _2819 = _2797;
    }
    float _2845 = _2819;
    float _2847 = _2845;
    if (!_2843)
    {
        _289 = _2795;
    }
    float _2849 = _289;
    float _2851 = _2849;
    if (!_2843)
    {
        _2821 = _2775;
    }
    float _2853 = _2821;
    float _2855 = _2853;
    if (!_2843)
    {
        _2823 = _2777;
    }
    float _2857 = _2823;
    float _2859 = _2857;
    if (!_2843)
    {
        _2681 = _2831;
    }
    float _2861 = _2681;
    bool _2863 = !_2843;
    float _2865 = _2861;
    if (!_2863)
    {
        float _2867 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2871 = _2807 + _2869;
        float _2873 = _2831 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2875 = rsqrt(_2801);
        float _2877 = _2871 * _2867;
        float _2879 = _2877 * 0.15915493667125701904296875;
        float _2881 = _2879 * 6.283185482025146484375;
        float _2883 = sin(_2881);
        float _2885 = _2879 * 6.283185482025146484375;
        float _2887 = cos(_2885);
        float _2889 = fma(_2883, _2873, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2891 = _2875 * _2889;
        float _2893 = _2887 + (-1.0);
        float _2895 = _2783 * _2891;
        float _2897 = _2787 * _2891;
        float _2899 = _2893 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2901 = _2897 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2903 = _2897 * _2897;
        float _2905 = fma(_2831, _2887, _2899);
        float _2907 = _2895 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2909 = _2895 * _2895;
        _2865 = _2905;
        _2851 = _2909;
        _2847 = _2903;
        _2855 = _2907;
        _2859 = _2901;
    }
    float _2911 = _2865;
    float _2913 = _2851;
    float _2915 = _2847;
    float _2917 = _2855;
    float _2919 = _2859;
    float _2921 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2923 = _2911 + _2921;
    float _2925 = fma(_2715, _2827, _2799);
    float _2927 = fma(_2703, _2827, _2835);
    float _2929 = fma(_2721, _2827, _2733);
    float _2931 = fma(_2923, _2923, _2913);
    float _2933 = fma(_2729, _2841, _2925);
    float _2935 = fma(_2707, _2841, _2927);
    float _2937 = fma(_2717, _2841, _2929);
    float _2939 = _2931 + _2915;
    float _2941 = _2933 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2943 = _2933 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2945 = _2933 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_71.x = _2018;
    out.m_71.y = _2012;
    float _2947 = fma(_2935, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2941);
    float _2949 = sqrt(_2939);
    float _2951 = fma(_2935, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2943);
    float _2953 = fma(_2935, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2945);
    float _2955 = fma(_2937, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2947);
    float _2957 = fma(_2937, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2951);
    float _2959 = fma(_2937, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2953);
    out.m_73.x = _2955;
    out.m_73.y = _2957;
    out.m_73.z = _2959;
    bool _2961 = _2949 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2963 = isnan(_2949);
    bool _2965 = _2961 || _2963;
    bool _2967 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2969 = _2965 || _2967;
    float _2971 = _2931;
    float _2973 = _2937;
    float _2975 = _2923;
    if (!_2969)
    {
        _2971 = 1.0;
    }
    float _2977 = _2971;
    bool _2979 = !_2969;
    float _2981 = _2977;
    if (!_2979)
    {
        bool _2983 = _2949 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2985 = isnan(_2949);
        bool _2987 = _2983 || _2985;
        bool _2989 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2991 = _2987 || _2989;
        if (!_2991)
        {
            float _2993 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2995 = _2949 + _2993;
            float _2997 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2999 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2997;
            float _3001 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3003 = _3001 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3005 = 1.0 / _2999;
            float _3007 = _2995 * _3005;
            float _3009 = fma(_3007, _3003, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2981 = _3009;
            _2041 = _3005;
            _3011 = true;
        }
        else
        {
            bool _3013 = _2949 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3015 = isnan(_2949);
            bool _3017 = _3013 || _3015;
            bool _3019 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3021 = _3017 || _3019;
            if (!_3021)
            {
                float _3023 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3025 = _2949 + _3023;
                float _3027 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3029 = _3027 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3031 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3033 = _3031 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3035 = 1.0 / _3029;
                float _3037 = _3025 * _3035;
                float _3039 = fma(_3037, _3033, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2981 = _3039;
                _2041 = _3035;
                _3011 = true;
            }
            else
            {
                _2981 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3011 = false;
    float _3041 = _2981;
    float _3043 = _2041;
    float _3045 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3047 = _2911 + _3045;
    float _3049 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3051 = _2917 + _3049;
    float _3053 = fma(_3047, _3041, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3055 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3057 = _2919 + _3055;
    float _3059 = fma(_3051, _3041, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3061 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3063 = _3053 + _3061;
    float _3065 = fma(_3057, _3041, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3067 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3069 = _3059 + _3067;
    float _3071 = _3063 * _3063;
    float _3073 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3075 = _3065 + _3073;
    float _3077 = fma(_3069, _3069, _3071);
    float _3079 = fma(_3075, _3075, _3077);
    float _3081 = rsqrt(_3079);
    float _3083 = _3081 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3085 = _3069 * _3083;
    float _3087 = _3075 * _3083;
    float _3089 = _3085 * _3085;
    float _3091 = _3087 * _3087;
    float _3093 = _3089 + _3091;
    float _3095 = sqrt(_3093);
    bool _3097 = _3095 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3099 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3101 = _3095 + _3099;
    float _3103 = _3081;
    float _3105 = _3101;
    float _3107 = _3085;
    if (_3097)
    {
        float _3109 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3103 = _3109;
    }
    float _3111 = _3103;
    if (_3097)
    {
        float _3113 = rsqrt(_3093);
        _2973 = _3113;
    }
    float _3115 = _2973;
    float _3117 = _3115;
    if (_3097)
    {
        float _3119 = _3101 * _3111;
        _3105 = _3119;
    }
    float _3121 = _3105;
    if (_3097)
    {
        float _3123 = _3121 * 0.15915493667125701904296875;
        _2043 = _3123;
    }
    float _3125 = _2043;
    float _3127 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3129 = _3075;
    if (_3097)
    {
        float _3131 = _3125 * 6.283185482025146484375;
        float _3133 = sin(_3131);
        _3129 = _3133;
    }
    float _3135 = _3129;
    float _3137 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3139 = precise::max(0.0, _3137);
    float _3141 = _3043;
    float _3143 = _3139;
    float _3145 = _3137;
    if (_3097)
    {
        float _3147 = _3125 * 6.283185482025146484375;
        float _3149 = cos(_3147);
        _3141 = _3149;
    }
    float _3151 = _3141;
    float _3153 = -_3083;
    float _3155 = -_3139;
    float _3157 = fma(_3063, _3153, _3155);
    if (_3097)
    {
        float _3159 = _3157 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3143 = _3159;
    }
    float _3161 = _3143;
    float _3163 = sqrt(_3079);
    float _3165 = _3053 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3167 = _3161;
    float _3169 = _3135;
    if (_3097)
    {
        float _3171 = fma(_3135, _3161, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3167 = _3171;
    }
    float _3173 = _3167;
    float _3175 = _3173;
    if (!_3097)
    {
        _3169 = _3087;
    }
    float _3177 = _3169;
    float _3179 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3165);
    float _3181 = _3177;
    if (_3097)
    {
        float _3183 = _3151 + (-1.0);
        _3145 = _3183;
    }
    float _3185 = _3145;
    float _3187 = _3185;
    if (_3097)
    {
        float _3189 = _3115 * _3173;
        _2975 = _3189;
    }
    float _3191 = _2975;
    if (!_3097)
    {
        _3117 = _3157;
    }
    float _3193 = _3117;
    float _3195 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3179);
    float _3197 = _3193;
    if (_3097)
    {
        float _3199 = _3185 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3187 = _3199;
    }
    float _3201 = _3187;
    float _3203 = _3201;
    if (_3097)
    {
        float _3205 = _3085 * _3191;
        _3107 = _3205;
    }
    float _3207 = _3107;
    if (!_3097)
    {
        _3175 = _3089;
    }
    float _3209 = _3175;
    float _3211 = _3209;
    if (_3097)
    {
        float _3213 = _3087 * _3191;
        _3181 = _3213;
    }
    float _3215 = _3181;
    if (_3097)
    {
        float _3217 = fma(_3157, _3151, _3201);
        _3197 = _3217;
    }
    float _3219 = _3197;
    if (_3097)
    {
        float _3221 = _3207 * _3207;
        _3211 = _3221;
    }
    float _3223 = _3211;
    if (!_3097)
    {
        _3203 = _3091;
    }
    float _3225 = _3203;
    float _3227 = _3225;
    if (_3097)
    {
        float _3229 = _3215 * _3215;
        _3227 = _3229;
    }
    float _3231 = _3227;
    float _3233 = fma(_3219, _3219, _3223);
    float _3235 = _3053 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3237 = _3195 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3239 = _3233 + _3231;
    float _3241 = _3053 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3245 = fma(_3163, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3243);
    float _3247 = precise::clamp(_3245, 0.0, 1.0);
    float _3249 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3235);
    float _3251 = rsqrt(_3239);
    float _3253 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3241);
    float _3255 = _3053 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3257 = -_3247;
    float _3259 = _3257 + 1.0;
    float _3261 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3253);
    float _3263 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3255);
    float _3265 = _3261 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3267 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3263);
    float _3269 = abs(_3259);
    float _3271 = log2(_3269);
    float _3273 = _3265 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3275 = _3267 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3277 = _3251 * _3207;
    float _3279 = -_3273;
    float _3281 = fma(_3279, _3127, 1.0);
    float _3283 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3249);
    float _3285 = _3251 * _3219;
    float _3287 = _3275 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3289 = _3277 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3291 = _3251 * _3215;
    float _3293 = _3283 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3295 = fma(_3237, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3287);
    float _3297 = -_3289;
    float _3299 = fma(_3285, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3297);
    float _3301 = log2(_3281);
    float _3303 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3305 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3295);
    float _3307 = -_3291;
    float _3309 = fma(_3307, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3299);
    float _3311 = _3275 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3313 = _3275 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3315 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3305);
    float _3317 = fma(_3309, -0.5, 0.5);
    float _3319 = exp2(_3303);
    float _3321 = fma(_3237, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3311);
    float _3323 = fma(_3237, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3313);
    float _3325 = fma(_3309, 0.5, 0.5);
    float _3327 = _3285 + 1.0;
    float _3329 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3321);
    float _3331 = fma(_3325, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3333 = 1.0 / _3315;
    float _3335 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3323);
    float _3337 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3329);
    float _3339 = fma(_3325, _3331, -0.212114393711090087890625);
    float _3341 = _3301 * 0.693147182464599609375;
    float _3343 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3335);
    float _3345 = fma(_3325, _3339, 1.570728778839111328125);
    float _3347 = sqrt(_3317);
    float _3349 = -_3285;
    float _3351 = fma(_3319, _3327, _3349);
    float _3353 = _3341 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3355 = fma(_3351, 0.5, 0.5);
    float _3357 = _3337 * _3333;
    float _3359 = _3343 * _3333;
    float _3361 = fma(_3357, 0.5, 0.5);
    float _3363 = fma(_3359, -0.5, 0.5);
    float _3365 = _3347 * 0.636619746685028076171875;
    float3 _8477 = float3(_3361, _3363, _3353);
    float _3367 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8477, float3(0.0), isnan(_8477)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8477, float3(0.0), isnan(_8477)), level(0.0)).x;
    float3 _8488 = float3(_3361, _3363, _3353);
    float4 _3369 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8488, float3(0.0), isnan(_8488)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8488, float3(0.0), isnan(_8488)), level(0.0)).xyzw;
    float _3371 = _3369.x;
    float _3373 = _3369.y;
    float _3375 = _3369.z;
    float _3377 = _3369.w;
    float _3379 = -_3345;
    float _3381 = fma(_3365, _3379, 1.0);
    float2 _8509 = float2(_3381, _3355);
    float3 _3385 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8509, float2(0.0), isnan(_8509)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8509, float2(0.0), isnan(_8509)), level(0.0)).xyz;
    float _3387 = _3385.x;
    float _3389 = _3385.y;
    float _3391 = _3385.z;
    float _3393 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3395 = _3275 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2761;
    out.m_75.y = _2815;
    out.m_75.z = _2763;
    float _3397 = fma(_3237, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3395);
    float _3399 = exp2(_3393);
    out.m_77.x = _3059;
    out.m_77.y = _3053;
    out.m_77.z = _3065;
    float _3401 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3397);
    out.m_49.x = 1.0;
    float _3403 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3401);
    float _3405 = _3403 + _3315;
    out.gl_Position.x = _3337;
    out.gl_Position.y = _3343;
    out.gl_Position.z = _3403;
    out.gl_Position.w = _3315;
    float _3407 = _3405 * 0.5;
    float _3409 = -_3399;
    float _3411 = _3409 + 1.0;
    float _3413 = _3411 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3415 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.z = _3407;
    out.m_79.w = _3315;
    out.m_81.w = _3415;
    float _3417 = _3413 * _3367;
    float _3419 = -_3413;
    float _3421 = _3419 + 1.0;
    float _3423 = _3377 * _3417;
    float _3425 = _3391 * _3417;
    float _3427 = fma(_3387, _3423, _3371);
    float _3429 = fma(_3389, _3423, _3373);
    float _3431 = _3377 * _3421;
    float _3433 = fma(_3377, _3425, _3375);
    out.m_83.x = _3427;
    out.m_83.y = _3429;
    out.m_83.z = _3433;
    out.m_83.w = _3431;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3011 = false;
    bool _2303 = false;
    bool _2111 = false;
    bool _1609 = false;
    bool _1293 = false;
    bool _915 = false;
    bool _813 = false;
    bool _635 = false;
    bool _307 = false;
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
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3489 = as_type<float>(_121);
        out.gl_Position.z = _3489;
    }
    if (!_111)
    {
        return out;
    }
    float _125 = in.m_51.w;
    float _127 = in.m_53.x;
    bool _129 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_125);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_125;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.x = _127;
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
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3563 = as_type<float>(_163);
        out.gl_Position.z = _3563;
    }
    if (_155)
    {
        return out;
    }
    float _165 = in.m_57.w;
    float _167 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _169 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _171 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _173 = _169 || _171;
    bool _175 = isnan(1.0);
    bool _177 = _173 || _175;
    float _179 = in.m_51.x;
    float _181 = in.m_51.y;
    float _183 = in.m_51.z;
    float _185 = in.m_46.x;
    float _187 = in.m_46.y;
    float _189 = in.m_46.z;
    float _191 = 0.0;
    float _193 = _167;
    if (!_177)
    {
        float _195 = _167 * _167;
        float _197 = _195 * 0.5;
        _191 = _197;
    }
    float _199 = _191;
    float _201 = _199;
    if (!_177)
    {
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    bool _207 = !_177;
    float _209 = _205;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _167 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _167);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
    }
    float _241 = _209;
    bool _243 = !_177;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _167 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _193 = _263;
    }
    float _265 = _193;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _269 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _275 = fma(_265, _179, _269);
    float _277 = fma(_265, _181, _271);
    float _279 = fma(_265, _183, _273);
    float _281 = fma(_275, _165, _185);
    float _283 = fma(_277, _165, _187);
    float _285 = fma(_279, _165, _189);
    bool _287 = !_267;
    float _289 = _285;
    float _305;
    if (!_287)
    {
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _293 = _127 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_107);
        float _311 = 1.0 / _309;
        float _313 = _141 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _315 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _337 = 1.0 / _323;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _339;
    float _343 = 1.0 / _331;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = _315 + _345;
    bool _349 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _351 = isnan(_315);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    bool _361 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _363 = isnan(_315);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -_359;
    float _375 = _373 + 1.0;
    float _377 = 1.0 / _327;
    float _379 = _347 * _337;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = _315 + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _385;
    bool _389 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _391 = fma(_387, _379, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _393 = 1.0 / _335;
    float _395 = _383 * _343;
    bool _397 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _399 = isnan(_315);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _411 = _315 + _409;
    bool _413 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _415 = isnan(_315);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = 1.0 / _341;
    float _427 = _319 * _377;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _431 = _315 + _429;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _433;
    float _437 = -_423;
    float _439 = _437 + 1.0;
    float _441 = fma(_435, _379, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _443 = _411 * _393;
    float _445 = -_407;
    float _447 = _445 + 1.0;
    float _449 = _423 * _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _451;
    float _455 = _431 * _425;
    bool _457 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _459 = isnan(_315);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = fma(_453, _379, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _471 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _473 = isnan(_315);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = _467 * _439;
    float _485 = -_467;
    float _487 = _485 + 1.0;
    float _489 = _481 * _375;
    float _491 = -_481;
    float _493 = _491 + 1.0;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _499 = _359 * _487;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _509 = _371 * _493;
    float _511 = fma(_497, _427, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _513 = fma(_503, _427, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _515 = fma(_507, _427, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _517 = _469 * _509;
    float _519 = -_371;
    float _521 = _519 + 1.0;
    float _523 = _391 * _509;
    float _525 = _441 * _509;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _527;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _535;
    float _539 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[143].x, _517);
    float _541 = fma(_529, _395, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _543 = fma(_533, _395, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _545 = fma(_537, _395, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _551 = fma(_513, _489, _539);
    float _553 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[143].y, _523);
    float _555 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[143].z, _525);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _561 = fma(_549, _443, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _563 = fma(_543, _499, _551);
    float _565 = fma(_515, _489, _553);
    float _567 = fma(_559, _443, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _569 = fma(_511, _489, _555);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _575 = fma(_541, _499, _565);
    float _577 = fma(_545, _499, _569);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _583;
    float _587 = fma(_573, _443, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _589;
    float _593 = fma(_561, _483, _563);
    float _595 = fma(_581, _455, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _597 = fma(_585, _455, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _599 = fma(_591, _455, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _601 = fma(_567, _483, _575);
    float _603 = fma(_587, _483, _577);
    float _605 = fma(_595, _449, _593);
    float _607 = fma(_597, _449, _601);
    float _609 = fma(_599, _449, _603);
    float _611 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[148].x, _605);
    float _613 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[148].y, _607);
    float _615 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[148].z, _609);
    bool _617 = !_389;
    float _633;
    if (!_617)
    {
        float _619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _621 = _127 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _623 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[11].x, _141);
        float _625 = _623 * _619;
        float _627 = floor(_625);
        float _629 = -_627;
        float _631 = _625 + _629;
        _633 = _631;
        _635 = true;
    }
    else
    {
        float _637 = float(_107);
        float _639 = 1.0 / _637;
        float _641 = _141 * _639;
        _633 = _641;
    }
    _635 = false;
    float _643 = _633;
    float _645 = in.m_57.x;
    float _647 = in.m_57.y;
    float _649 = in.m_57.z;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _653 = _643 + _651;
    bool _655 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _657 = isnan(_643);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _667;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _675 = 1.0 / _669;
    bool _677 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _679 = 1.0 / _673;
    float _681 = _613 * _647;
    bool _683 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _685 = isnan(_643);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = _615 * _649;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _697;
    float _701 = _653 * _675;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _705 = _643 + _703;
    bool _707 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _709 = isnan(_643);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = -_693;
    float _721 = _719 + 1.0;
    float _723 = fma(_699, _701, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _725 = _717 * _721;
    float _727 = -_717;
    float _729 = _727 + 1.0;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _731;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _735;
    float _739 = _705 * _679;
    float _741 = _665 * _729;
    float _743 = fma(_733, _701, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _745 = fma(_737, _701, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _747 = -_665;
    float _749 = _747 + 1.0;
    float _751 = _723 * _741;
    float _753 = _743 * _741;
    float _755 = _745 * _741;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _769 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[107].x, _753);
    float _771 = fma(_759, _739, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _773 = fma(_763, _739, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _775 = fma(_767, _739, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _777 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[107].y, _751);
    float _779 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[107].z, _755);
    float _781 = fma(_771, _725, _769);
    float _783 = _611 * _645;
    float _785 = fma(_773, _725, _777);
    float _787 = fma(_775, _725, _779);
    float _789 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[109].x, _781);
    float _791 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[109].y, _785);
    float _793 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[109].z, _787);
    bool _795 = !_677;
    float _811;
    if (!_795)
    {
        float _797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _799 = _127 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _801 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _803 = _801 * _797;
        float _805 = floor(_803);
        float _807 = -_805;
        float _809 = _803 + _807;
        _811 = _809;
        _813 = true;
    }
    else
    {
        float _815 = float(_107);
        float _817 = 1.0 / _815;
        float _819 = _141 * _817;
        _811 = _819;
    }
    _813 = false;
    float _821 = _811;
    bool _823 = _821 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _825 = isnan(_821);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _839 = _821 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _841 = isnan(_821);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _851;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _857 = _821 + _855;
    float _859 = -_833;
    float _861 = _859 + 1.0;
    bool _863 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _865 = 1.0 / _837;
    float _867 = _849 * _861;
    float _869 = -_849;
    float _871 = _869 + 1.0;
    float _873 = _853 * _865;
    float _875 = _793 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _877 = fma(_873, _857, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _879 = _791 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _881 = _875 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = _877 * _867;
    float _885 = _789 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _887 = _879 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _889 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[115].x, _883);
    float _891 = _885 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[116].x, _889);
    float _895 = _893 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _891;
    out.m_59.y = _887;
    out.m_59.z = _881;
    out.m_59.w = _895;
    bool _897 = !_863;
    float _913;
    if (!_897)
    {
        float _899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _901 = _127 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _903 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[14].x, _141);
        float _905 = _903 * _899;
        float _907 = floor(_905);
        float _909 = -_907;
        float _911 = _905 + _909;
        _913 = _911;
        _915 = true;
    }
    else
    {
        float _917 = float(_107);
        float _919 = 1.0 / _917;
        float _921 = _141 * _919;
        _913 = _921;
    }
    _915 = false;
    float _923 = _913;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _927 = _923 + _925;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _931 = _923 + _929;
    bool _933 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _935 = isnan(_923);
    bool _937 = _933 || _935;
    bool _939 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _941 = _937 || _939;
    float _943 = float(_941);
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _945;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _953;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _961 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _963 = isnan(_923);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = 1.0 / _951;
    float _975 = -_943;
    float _977 = _975 + 1.0;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _981 = _923 + _979;
    bool _983 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _985 = isnan(_923);
    bool _987 = _983 || _985;
    bool _989 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _991 = _987 || _989;
    float _993 = float(_991);
    bool _995 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _997 = isnan(_923);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    float _1007 = 1.0 / _947;
    bool _1009 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1011 = 1.0 / _955;
    float _1013 = _931 * _973;
    bool _1015 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1017 = isnan(_923);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1023 = _1019 || _1021;
    float _1025 = float(_1023);
    float _1027 = -_1025;
    float _1029 = _1027 + 1.0;
    float _1031 = 1.0 / _959;
    float _1033 = _927 * _1007;
    float _1035 = _971 * _977;
    float _1037 = -_971;
    float _1039 = _1037 + 1.0;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1041;
    float _1045 = _993 * _1039;
    float _1047 = _981 * _1011;
    float _1049 = -_993;
    float _1051 = _1049 + 1.0;
    bool _1053 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1055 = isnan(_923);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1061 = _1057 || _1059;
    float _1063 = float(_1061);
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1067 = _923 + _1065;
    float _1069 = 1.0 / _1043;
    float _1071 = _1025 * _1051;
    bool _1073 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1075 = isnan(_923);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = -_1063;
    float _1087 = _1085 + 1.0;
    float _1089 = _1067 * _1031;
    float _1091 = _1063 * _1029;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1097 = -_1083;
    float _1099 = _1097 + 1.0;
    float _1101 = _1083 * _1087;
    bool _1103 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1105 = isnan(_923);
    bool _1107 = _1103 || _1105;
    bool _1109 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1111 = _1107 || _1109;
    float _1113 = float(_1111);
    float _1115 = -_1005;
    float _1117 = _1115 + 1.0;
    float _1119 = _1005 * _1099;
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1121;
    float _1125 = 1.0 / _1095;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1127;
    float _1131 = _1113 * _1117;
    float _1133 = fma(_1123, _1033, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1141 = _923 + _1139;
    float _1143 = _1133 * _1131;
    float _1145 = 1.0 / _1129;
    float _1147 = -_1113;
    float _1149 = _1147 + 1.0;
    float _1151 = fma(_1137, _1013, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1155 = _923 + _1153;
    float _1157 = _1141 * _1069;
    float _1159 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1143);
    float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1167 = _923 + _1165;
    float _1169 = _1155 * _1125;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1171;
    float _1175 = fma(_1151, _1119, _1159);
    float _1177 = fma(_1173, _1047, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1179;
    float _1183 = fma(_1177, _1101, _1175);
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1187 = _1185 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1189 = fma(_1163, _1089, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1191;
    float _1195 = fma(_1181, _1033, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1199 = _1197 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1201 = fma(_1189, _1091, _1183);
    float _1203 = fma(_1193, _1157, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1205 = fma(_1187, _1013, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1207 = _1167 * _1145;
    float _1209 = fma(_1203, _1071, _1201);
    float _1211 = fma(_1199, _1169, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1213;
    float _1217 = _1195 * _1131;
    float _1219 = fma(_1211, _1045, _1209);
    float _1221 = fma(_1215, _1207, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1223;
    float _1227 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1217);
    float _1229 = fma(_1221, _1035, _1219);
    float _1231 = fma(_1225, _1047, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1235 = _1233 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1237 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1229);
    float _1239 = fma(_1205, _1119, _1227);
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1241;
    float _1245 = fma(_1235, _1089, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1247 = fma(_1231, _1101, _1239);
    out.m_61.y = _1237;
    float _1249 = fma(_1243, _1157, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1253 = _1251 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1255 = fma(_1245, _1091, _1247);
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1257;
    float _1261 = fma(_1253, _1169, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1263 = fma(_1249, _1071, _1255);
    float _1265 = fma(_1259, _1207, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1267 = fma(_1261, _1045, _1263);
    float _1269 = fma(_1265, _1035, _1267);
    float _1271 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1269);
    float _1273 = precise::clamp(_1271, 0.0, 1.0);
    bool _1275 = !_1009;
    float _1291;
    if (!_1275)
    {
        float _1277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1279 = _127 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1281 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[14].y, _141);
        float _1283 = _1281 * _1277;
        float _1285 = floor(_1283);
        float _1287 = -_1285;
        float _1289 = _1283 + _1287;
        _1291 = _1289;
        _1293 = true;
    }
    else
    {
        float _1295 = float(_107);
        float _1297 = 1.0 / _1295;
        float _1299 = _141 * _1297;
        _1291 = _1299;
    }
    _1293 = false;
    float _1301 = _1291;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1305 = _1301 + _1303;
    bool _1307 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1309 = isnan(_1301);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1315 = _1311 || _1313;
    float _1317 = float(_1315);
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1321 = _1319 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1323;
    bool _1327 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1329 = isnan(_1301);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1335 = _1331 || _1333;
    float _1337 = float(_1335);
    bool _1339 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1341 = isnan(_1301);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1347 = _1343 || _1345;
    float _1349 = float(_1347);
    float _1351 = 1.0 / _1321;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1355 = _1353 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1357 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1359 = isnan(_1301);
    bool _1361 = _1357 || _1359;
    bool _1363 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1365 = _1361 || _1363;
    float _1367 = float(_1365);
    float _1369 = -_1349;
    float _1371 = _1369 + 1.0;
    bool _1373 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1375 = isnan(_1301);
    bool _1377 = _1373 || _1375;
    bool _1379 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1381 = _1377 || _1379;
    float _1383 = float(_1381);
    float _1385 = 1.0 / _1355;
    float _1387 = -_1367;
    float _1389 = _1387 + 1.0;
    bool _1391 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1393 = _1325 * _1351;
    float _1395 = -_1317;
    float _1397 = _1395 + 1.0;
    float _1399 = -_1337;
    float _1401 = _1399 + 1.0;
    float _1403 = -_1383;
    float _1405 = _1403 + 1.0;
    float _1407 = fma(_1393, _1305, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1409 = _1337 * _1397;
    float _1411 = _1349 * _1401;
    float _1413 = _1367 * _1371;
    bool _1415 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1417 = isnan(_1301);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1423 = _1419 || _1421;
    float _1425 = float(_1423);
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1429 = _1427 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1433 = _1431 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1435 = _1383 * _1389;
    bool _1437 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1439 = isnan(_1301);
    bool _1441 = _1437 || _1439;
    bool _1443 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1445 = _1441 || _1443;
    float _1447 = float(_1445);
    float _1449 = _1425 * _1405;
    float _1451 = 1.0 / _1433;
    float _1453 = -_1425;
    float _1455 = _1453 + 1.0;
    float _1457 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1459 = _1457 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1461 = _1447 * _1455;
    float _1463 = _1459 * _1385;
    float _1465 = 1.0 / _1429;
    float _1467 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1469 = _1467 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1471 = _1407 * _1461;
    float _1473 = -_1447;
    float _1475 = _1473 + 1.0;
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1479 = _1477 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1481;
    float _1485 = 1.0 / _1469;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1489 = _1301 + _1487;
    float _1491 = fma(_1475, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1471);
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1495 = _1493 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1497 = _1483 * _1451;
    float _1499 = fma(_1463, _1489, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1503 = _1301 + _1501;
    float _1505 = 1.0 / _1479;
    float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1509 = _1507 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1511 = fma(_1497, _1503, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1513 = fma(_1499, _1449, _1491);
    float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1517 = _1301 + _1515;
    float _1519 = _1509 * _1465;
    float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1523 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1521;
    float _1525 = 1.0 / _1495;
    float _1527 = fma(_1519, _1517, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1529 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1531 = _1529 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1533 = _1523 * _1485;
    float _1535 = fma(_1511, _1435, _1513);
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1539 = _1301 + _1537;
    bool _1541 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1543 = isnan(_1301);
    bool _1545 = _1541 || _1543;
    bool _1547 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1549 = _1545 || _1547;
    float _1551 = float(_1549);
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1555 = _1301 + _1553;
    float _1557 = _1531 * _1505;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1561 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1559;
    float _1563 = fma(_1533, _1539, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1565 = fma(_1527, _1413, _1535);
    float _1567 = fma(_1557, _1555, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1569 = -_1551;
    float _1571 = _1569 + 1.0;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1575 = _1301 + _1573;
    float _1577 = fma(_1563, _1411, _1565);
    float _1579 = _1561 * _1525;
    float _1581 = _1317 * _1571;
    float _1583 = fma(_1567, _1409, _1577);
    float _1585 = fma(_1579, _1575, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1587 = fma(_1585, _1581, _1583);
    float _1589 = fma(_1551, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1587);
    out.m_63.x = _1589;
    bool _1591 = !_1391;
    float _1607;
    if (!_1591)
    {
        float _1593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1595 = _127 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1597 = fma(_1595, (*spvDescriptorSet0.vp_c9)._m0[14].z, _141);
        float _1599 = _1597 * _1593;
        float _1601 = floor(_1599);
        float _1603 = -_1601;
        float _1605 = _1599 + _1603;
        _1607 = _1605;
        _1609 = true;
    }
    else
    {
        float _1611 = float(_107);
        float _1613 = 1.0 / _1611;
        float _1615 = _141 * _1613;
        _1607 = _1615;
    }
    _1609 = false;
    float _1617 = _1607;
    int _1619 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1621 = _1619;
    int _1623 = 0;
    int _1625 = _98(_1621, _1623, (*spvDescriptorSet0.support_buffer));
    float _1627 = in.m_65.z;
    float _1629 = trunc(_1627);
    int _1631 = int(_1629);
    int _1633 = _1625 + (-1);
    float _1635 = float(_1633);
    float _1637 = _1273 * _1635;
    float _1639 = trunc(_1637);
    int _1641 = int(_1639);
    int _1643 = _1641;
    int _1645 = 0;
    int _1647 = _99(_1643, _1645, (*spvDescriptorSet0.support_buffer));
    int _1649 = _1631;
    int _1651 = 0;
    int _1653 = _99(_1649, _1651, (*spvDescriptorSet0.support_buffer));
    float4 _1656 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1647, _1653)), 0).xyzw;
    float _1658 = _1656.x;
    float _1660 = _1656.y;
    float _1662 = _1656.z;
    float _1664 = _1656.w;
    float _1666 = in.m_53.y;
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1670 = _1668 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1674 = _1672 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1676 = 1.0 / _1670;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1680 = _1678 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    int _1682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1684 = _1682 != 0;
    float _1686 = in.m_65.x;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1692 = _127 > 0.5;
    bool _1694 = _1692 && _1684;
    float _1696 = 1.0 / _1674;
    bool _1698 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1700 = isnan(_1617);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1706 = _1702 || _1704;
    float _1708 = float(_1706);
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1712 = _1710 != 0;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1714;
    bool _1718 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1720 = isnan(_1617);
    bool _1722 = _1718 || _1720;
    bool _1724 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1726 = _1722 || _1724;
    float _1728 = float(_1726);
    float _1730 = 1.0 / _1680;
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1732;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1738 = _1736 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    bool _1740 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1742 = isnan(_1617);
    bool _1744 = _1740 || _1742;
    bool _1746 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1748 = _1744 || _1746;
    float _1750 = float(_1748);
    float _1752 = _1734 * _1676;
    bool _1754 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1756 = isnan(_1617);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1762 = _1758 || _1760;
    float _1764 = float(_1762);
    float _1766 = -_1708;
    float _1768 = _1766 + 1.0;
    float _1770 = 1.0 / _1690;
    float _1772 = _1738 * _1696;
    bool _1774 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1776 = isnan(_1617);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1782 = _1778 || _1780;
    float _1784 = float(_1782);
    float _1786 = -_1764;
    float _1788 = _1786 + 1.0;
    float _1790 = _1764 * _1768;
    float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1794 = _1792 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1796 = -_1784;
    float _1798 = _1796 + 1.0;
    float _1800 = _1794 * _1730;
    bool _1802 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1804 = isnan(_1617);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1810 = _1806 || _1808;
    float _1812 = float(_1810);
    float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1816 = _1814 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1818 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1820 = isnan(_1617);
    bool _1822 = _1818 || _1820;
    bool _1824 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1826 = _1822 || _1824;
    float _1828 = float(_1826);
    bool _1830 = _1666 > 0.5;
    bool _1832 = _1830 && _1712;
    float _1834 = _1812 * _1788;
    float _1836 = -_1812;
    float _1838 = _1836 + 1.0;
    float _1840 = _1716 * _1770;
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1844 = _1617 + _1842;
    float _1846 = _1784 * _1838;
    float _1848 = _1728 * _1798;
    float _1850 = -_1728;
    float _1852 = _1850 + 1.0;
    float _1854 = 1.0 / _1816;
    float _1856 = fma(_1752, _1844, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    bool _1858 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1860 = isnan(_1617);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1866 = _1862 || _1864;
    float _1868 = float(_1866);
    float _1870 = _1828 * _1852;
    float _1872 = -_1828;
    float _1874 = _1872 + 1.0;
    float _1876 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1878 = _1876 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1880 = _1868 * _1874;
    float _1882 = -_1868;
    float _1884 = _1882 + 1.0;
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1888 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1886;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1892 = _1617 + _1890;
    float _1894 = _1750 * _1884;
    float _1896 = 1.0 / _1878;
    float _1898 = _1888 * _1854;
    float _1900 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1902 = _1617 + _1900;
    float _1904 = _1856 * _1894;
    float _1906 = -_1750;
    float _1908 = _1906 + 1.0;
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1912 = _1910 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1914 = fma(_1840, _1902, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1916 = fma(_1772, _1892, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1918 = fma(_1908, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1904);
    float _1920 = in.m_65.y;
    float _1922 = 1.0 / _1912;
    float _1924 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1926 = _1617 + _1924;
    float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1930 = _1928 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1932 = fma(_1916, _1880, _1918);
    float _1934 = fma(_1800, _1926, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1936 = _1930 * _1896;
    float _1938 = fma(_1914, _1870, _1932);
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1942 = _1617 + _1940;
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1946 = _1617 + _1944;
    float _1948 = fma(_1934, _1848, _1938);
    float _1950 = fma(_1898, _1942, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1952 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1954 = _1617 + _1952;
    float _1956 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1956;
    float _1960 = fma(_1936, _1946, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1962 = fma(_1950, _1846, _1948);
    float _1964 = _1958 * _1922;
    float _1966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1968 = fma(_1960, _1834, _1962);
    float _1970 = _1834;
    int _1972 = as_type<int>(_1908);
    if (_1684)
    {
        _1970 = _1686;
    }
    float _1974 = _1970;
    float _1976 = fma(_1964, _1954, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1978 = _1920;
    float _1980 = _1974;
    float _1982 = _1976;
    if (_1832)
    {
        float _1984 = -_1920;
        float _1986 = _1984 + 1.0;
        _1978 = _1986;
    }
    float _1988 = _1978;
    float _1990 = fma(_1976, _1790, _1968);
    if (_1694)
    {
        float _1992 = -_1974;
        float _1994 = _1992 + 1.0;
        _1980 = _1994;
    }
    float _1996 = _1980;
    if (!_1684)
    {
        _1982 = _1686;
    }
    float _1998 = _1982;
    float _2000 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2002 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1990);
    float _2004 = _1988 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2006 = _1998;
    if (_1684)
    {
        _2006 = _1996;
    }
    float _2008 = _2006;
    int _2010 = _1641 + 1;
    float _2012 = _2004 * _1966;
    out.m_67.x = _2002;
    float _2014 = _2008 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2016 = min(_1633, _2010);
    float _2018 = _2014 * _2000;
    uint _2021 = as_type<uint>(half2(float2(_1664, 0.0)));
    uint _2023 = extract_bits(_2021, 0u, 8u);
    int _2025 = int(_2023) & 255;
    uint _2027 = extract_bits(_2021, 8u, 8u);
    int _2029 = int(_2027) & 255;
    int _2031 = _2029 << 8;
    int _2033 = _2025 | _2031;
    bool _2035 = _2033 >= 32768;
    int _2037 = _2033 + (-1024);
    int _2039 = _2037;
    float _2041 = _2018;
    float _2043 = _2012;
    if (_2035)
    {
        int _2045 = ~_2033;
        int _2047 = _2045 + 33792;
        int _2049 = _2047 + 1;
        _2039 = _2049;
    }
    int _2051 = _2039;
    int _2053 = _2051 + 30719;
    float _2055 = float(_2053);
    float _2057 = fma(_2055, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2059 = abs(_2057);
    float _2061 = -_2059;
    float _2063 = _2061 + 1.0;
    float _2065 = abs(_2057);
    float _2067 = fma(_2065, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2069 = _2057 < 0.0;
    float _2071 = float(_2069);
    int _2073 = as_type<int>(_2063) + (-218103808);
    float _2075 = abs(_2057);
    float _2077 = fma(_2075, _2067, -0.212114393711090087890625);
    bool _2079 = uint(_2073) >= 1920991232u;
    float _2081 = abs(_2057);
    float _2083 = fma(_2081, _2077, 1.570728778839111328125);
    bool _2085 = !_2079;
    float _2109;
    if (!_2085)
    {
        int _2087 = as_type<int>(_2063);
        int _2089 = as_type<int>(_1898);
        int _2091 = as_type<int>(_1908);
        int _2093 = 10224;
        int _2095;
        int _2097;
        int _2099;
        int _2101;
        int _2103;
        int _2105;
        int _2107;
        _96(_2087, _2089, _2091, _2093, _2095, _2097, _2099, _2101, _2103, _2105, _2107, out.gl_Position, out.gl_PointSize);
        _2109 = as_type<float>(_2099);
        _1972 = _2105;
        _2111 = true;
    }
    else
    {
        float _2113 = rsqrt(_2063);
        float _2115 = _2063 * _2113;
        float _2117 = _2113 * 0.5;
        float _2119 = -_2115;
        float _2121 = 0.0 + _2119;
        float _2123 = fma(_2117, _2121, 0.5);
        float _2125 = fma(_2115, _2123, _2115);
        float _2127 = -_2125;
        float _2129 = 0.0 + _2127;
        float _2131 = fma(_2125, _2129, _2063);
        float _2133 = fma(_2117, _2131, _2125);
        _2109 = _2133;
    }
    _2111 = false;
    float _2135 = _2109;
    int _2137 = _1972;
    int _2139 = _2016;
    int _2141 = 0;
    int _2143 = _99(_2139, _2141, (*spvDescriptorSet0.support_buffer));
    int _2145 = _1631;
    int _2147 = 0;
    int _2149 = _99(_2145, _2147, (*spvDescriptorSet0.support_buffer));
    float4 _2151 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2143, _2149)), 0).xyzw;
    float _2153 = _2151.x;
    float _2155 = _2151.y;
    float _2157 = _2151.z;
    float _2159 = _2151.w;
    float _2161 = _2083 * _2135;
    float _2163 = _2071 * 2.0;
    float _2165 = _2055 * 3.883221149444580078125;
    float _2167 = floor(_1637);
    float _2169 = -_2163;
    float _2171 = fma(_2161, _2169, _2161);
    float _2173 = _2165 * 0.15915493667125701904296875;
    float _2175 = fma(_2071, 3.1415927410125732421875, _2171);
    float _2177 = _2173 * 6.283185482025146484375;
    float _2179 = cos(_2177);
    float _2181 = _2175 * 0.15915493667125701904296875;
    float _2183 = _2181 * 6.283185482025146484375;
    float _2185 = sin(_2183);
    float _2187 = -_2167;
    float _2189 = _1637 + _2187;
    float _2191 = _2173 * 6.283185482025146484375;
    float _2193 = sin(_2191);
    float _2195 = _2185 * _2179;
    float _2197 = _2185 * _2193;
    uint _2199 = as_type<uint>(half2(float2(_2159, 0.0)));
    float _2201 = -_1660;
    float _2203 = _2201 + _2155;
    float _2205 = -_1658;
    float _2207 = _2205 + _2153;
    float _2209 = -_1662;
    float _2211 = _2209 + _2157;
    uint _2213 = extract_bits(_2199, 0u, 8u);
    int _2215 = int(_2213) & 255;
    uint _2217 = extract_bits(_2199, 8u, 8u);
    int _2219 = int(_2217) & 255;
    int _2221 = _2219 << 8;
    int _2223 = _2215 | _2221;
    float _2225 = fma(_2189, _2207, _1658);
    float _2227 = fma(_2189, _2211, _1662);
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
    float _2243 = fma(_2189, _2203, _1660);
    int _2245 = _2241 + 30719;
    float _2247 = float(_2245);
    float _2249 = fma(_2247, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2251 = abs(_2249);
    float _2253 = -_2251;
    float _2255 = _2253 + 1.0;
    float _2257 = abs(_2249);
    float _2259 = fma(_2257, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2261 = _2249 < 0.0;
    float _2263 = float(_2261);
    int _2265 = as_type<int>(_2255) + (-218103808);
    float _2267 = abs(_2249);
    float _2269 = fma(_2267, _2259, -0.212114393711090087890625);
    bool _2271 = uint(_2265) >= 1920991232u;
    float _2273 = abs(_2249);
    float _2275 = fma(_2273, _2269, 1.570728778839111328125);
    bool _2277 = !_2271;
    float _2301;
    if (!_2277)
    {
        int _2279 = as_type<int>(_2255);
        int _2281 = as_type<int>(_2161);
        int _2283 = _2137;
        int _2285 = 11120;
        int _2287;
        int _2289;
        int _2291;
        int _2293;
        int _2295;
        int _2297;
        int _2299;
        _96(_2279, _2281, _2283, _2285, _2287, _2289, _2291, _2293, _2295, _2297, _2299, out.gl_Position, out.gl_PointSize);
        _2301 = as_type<float>(_2291);
        _2303 = true;
    }
    else
    {
        float _2305 = rsqrt(_2255);
        float _2307 = _2255 * _2305;
        float _2309 = _2305 * 0.5;
        float _2311 = -_2307;
        float _2313 = 0.0 + _2311;
        float _2315 = fma(_2309, _2313, 0.5);
        float _2317 = fma(_2307, _2315, _2307);
        float _2319 = -_2317;
        float _2321 = 0.0 + _2319;
        float _2323 = fma(_2317, _2321, _2255);
        float _2325 = fma(_2309, _2323, _2317);
        _2301 = _2325;
    }
    _2303 = false;
    float _2327 = _2301;
    float _2329 = in.m_53.x;
    float _2331 = in.m_53.y;
    float _2333 = in.m_53.z;
    float _2335 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2337 = log2(_2335);
    float _2339 = _2275 * _2327;
    float _2341 = _783 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2345 = _2343 != 0;
    int _2347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2349 = _2347 != 0;
    int _2351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2353 = _2351 != 0;
    float _2355 = _681 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2357 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2359 = -_2057;
    float _2361 = _2359 + _2249;
    float _2363 = fma(_2189, _2361, _2057);
    float _2365 = _2337 * _141;
    float _2367 = exp2(_2365);
    float _2369 = _2333 * 2.0;
    float _2371 = _2329 * 2.0;
    float _2373 = _2333 + _2331;
    float _2375 = _2331 + _2329;
    float _2377 = _2331 * 2.0;
    float _2379 = _2331 + (-0.5);
    float _2381 = _2373 + (-1.0);
    float _2383 = floor(_2369);
    float _2385 = _2375 + (-1.0);
    float _2387 = floor(_2371);
    float _2389 = -_2367;
    float _2391 = _2389 + 1.0;
    bool _2393 = _2383 > 0.0;
    float _2395 = fma(_2381, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2397 = _2383 >= 0.0;
    bool _2399 = isnan(_2383);
    bool _2401 = _2397 || _2399;
    bool _2403 = isnan(0.0);
    bool _2405 = _2401 || _2403;
    float _2407 = fma(_2385, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2409 = !_2345;
    int _2411 = _2409 ? 0 : 1;
    float _2413 = floor(_2377);
    int _2415 = _2405 ? 0 : 1;
    int _2417 = abs(_2411);
    int _2419 = ~_2415;
    int _2421 = _2419 + 1;
    int _2423 = _2421 + 1;
    bool _2425 = _2387 > 0.0;
    int _2427 = _2423;
    float _2429 = _2363;
    if (!_2393)
    {
        int _2431 = ~_2415;
        int _2433 = _2431 + 1;
        _2427 = _2433;
    }
    int _2435 = _2427;
    float _2437 = in.m_69.x;
    float _2439 = in.m_69.y;
    float _2441 = in.m_69.z;
    bool _2443 = _2387 >= 0.0;
    bool _2445 = isnan(_2387);
    bool _2447 = _2443 || _2445;
    bool _2449 = isnan(0.0);
    bool _2451 = _2447 || _2449;
    float _2453 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2455 = 1.0 + _2453;
    bool _2457 = !_2349;
    int _2459 = _2457 ? 0 : 1;
    bool _2461 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2463 = isnan(1.0);
    bool _2465 = _2461 || _2463;
    bool _2467 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2469 = _2465 || _2467;
    float _2471 = 1.0 / _2455;
    float _2473 = float(_2435);
    int _2475 = _2451 ? 0 : 1;
    bool _2477 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2479 = isnan(0.0);
    bool _2481 = _2477 || _2479;
    bool _2483 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2485 = _2481 || _2483;
    int _2487 = abs(_2459);
    float _2489 = float(_2417);
    int _2491 = ~_2475;
    int _2493 = _2491 + 1;
    int _2495 = _2493 + 1;
    int _2497 = _2495;
    if (!_2425)
    {
        int _2499 = ~_2475;
        int _2501 = _2499 + 1;
        _2497 = _2501;
    }
    int _2503 = _2497;
    float _2505 = _2489 * _2473;
    float _2507 = _2485 ? _2391 : 0.0;
    bool _2509 = _2413 > 0.0;
    float _2511 = _2505 * (-2.0);
    float _2513 = float(_2487);
    if (_2469)
    {
        float _2515 = _2507 * _2471;
        _145 = _2515;
    }
    float _2517 = _145;
    float _2519 = float(_2503);
    float _2521 = _2329 + (-0.5);
    bool _2523 = _2413 >= 0.0;
    bool _2525 = isnan(_2413);
    bool _2527 = _2523 || _2525;
    bool _2529 = isnan(0.0);
    bool _2531 = _2527 || _2529;
    float _2533 = fma(_2511, _2437, _2437);
    bool _2535 = !_2353;
    int _2537 = _2535 ? 0 : 1;
    float _2539 = _2513 * _2519;
    int _2541 = _2531 ? 0 : 1;
    float _2543 = fma(_2521, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2533);
    int _2545 = abs(_2537);
    float _2547 = _2539 * (-2.0);
    float _2549 = fma(_2407, _2511, _2407);
    int _2551 = ~_2541;
    int _2553 = _2551 + 1;
    int _2555 = _2553 + 1;
    float _2557 = _2333 + _2329;
    int _2559 = _2555;
    if (!_2509)
    {
        int _2561 = ~_2541;
        int _2563 = _2561 + 1;
        _2559 = _2563;
    }
    int _2565 = _2559;
    float _2567 = fma(_2395, _2547, _2395);
    float _2569 = fma(_2547, _2439, _2439);
    float _2571 = float(_2545);
    float _2573 = _2557 + (-1.0);
    float _2575 = float(_2565);
    float _2577 = fma(_2379, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2569);
    float _2579 = _2333 + (-0.5);
    float _2581 = fma(_2549, _2517, _2543);
    float _2583 = _283 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2585 = _2571 * _2575;
    float _2587 = fma(_2567, _2517, _2577);
    float _2589 = _2581 * 0.15915493667125701904296875;
    float _2591 = _2585 * (-2.0);
    float _2593 = fma(_2573, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2595 = _2587 * 0.15915493667125701904296875;
    float _2597 = fma(_2591, _2441, _2441);
    float _2599 = _2589 * 6.283185482025146484375;
    float _2601 = sin(_2599);
    float _2603 = fma(_2593, _2591, _2593);
    float _2605 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2225);
    float _2607 = fma(_2579, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2597);
    float _2609 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2583);
    bool _2611 = _2243 != 0.0;
    bool _2613 = isnan(_2243);
    bool _2615 = _2611 || _2613;
    bool _2617 = isnan(0.0);
    bool _2619 = _2615 || _2617;
    float _2621 = _2341 * _2605;
    float _2623 = fma(_2603, _2517, _2607);
    float _2625 = _2589 * 6.283185482025146484375;
    float _2627 = cos(_2625);
    float _2629 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2243);
    bool _2631 = _2225 == 0.0;
    bool _2633 = !_2619;
    bool _2635 = _2631 && _2633;
    float _2637 = _2623 * 0.15915493667125701904296875;
    float _2639 = _2263 * 2.0;
    float _2641 = _2355 * _2629;
    float _2643 = _283 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2645 = _283 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2647 = _2595 * 6.283185482025146484375;
    float _2649 = sin(_2647);
    float _2651 = -_2639;
    float _2653 = fma(_2339, _2651, _2339);
    float _2655 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2643);
    bool _2657 = _2227 == 0.0;
    bool _2659 = _2657 && _2635;
    float _2661 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2645);
    float _2663 = fma(_2263, 3.1415927410125732421875, _2653);
    float _2665 = _2595 * 6.283185482025146484375;
    float _2667 = cos(_2665);
    float _2669 = _2663 * 0.15915493667125701904296875;
    float _2671 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2661);
    float _2673 = _2637 * 6.283185482025146484375;
    float _2675 = cos(_2673);
    float _2677 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2227);
    float _2679 = _2601 * _2649;
    float _2681 = _2671;
    if (!_2659)
    {
        float _2683 = fma(_2243, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2363);
        _2429 = _2683;
    }
    float _2685 = _2429;
    float _2687 = _2357 * _2677;
    float _2689 = _2637 * 6.283185482025146484375;
    float _2691 = sin(_2689);
    float _2693 = _2627 * _2667;
    float _2695 = _2601 * _2667;
    float _2697 = _2627 * _2675;
    float _2699 = _2627 * _2649;
    float _2701 = _2601 * _2675;
    float _2703 = _2667 * _2675;
    float _2705 = _2697 * _2641;
    float _2707 = _2649 * _2675;
    float _2709 = _2701 * _2641;
    float _2711 = _2669 * 6.283185482025146484375;
    float _2713 = sin(_2711);
    float _2715 = fma(_2691, _2693, _2679);
    float _2717 = fma(_2691, _2679, _2693);
    float _2719 = -_2699;
    float _2721 = fma(_2691, _2695, _2719);
    float _2723 = -_2641;
    float _2725 = _2691 * _2723;
    float _2727 = -_2695;
    float _2729 = fma(_2691, _2699, _2727);
    float _2731 = fma(_2715, _2621, _2705);
    float _2733 = _2701 * _2685;
    float _2735 = fma(_2703, _2621, _2725);
    float _2737 = fma(_2721, _2621, _2709);
    float _2739 = fma(_2729, _2687, _2731);
    float _2741 = _2247 * 3.883221149444580078125;
    float _2743 = fma(_2707, _2687, _2735);
    float _2745 = fma(_2717, _2687, _2737);
    float _2747 = _2739 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2749 = _2739 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2751 = _2741 * 0.15915493667125701904296875;
    float _2753 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2655);
    float _2755 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2609);
    float _2757 = fma(_2743, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2747);
    float _2759 = fma(_2743, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2749);
    float _2761 = _2753 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2763 = _2755 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2765 = fma(_2745, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2757);
    float _2767 = fma(_2745, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2759);
    float _2769 = _2751 * 6.283185482025146484375;
    float _2771 = cos(_2769);
    float _2773 = _2739 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2775 = _2761 + _2765;
    float _2777 = _2763 + _2767;
    float _2779 = fma(_2743, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2773);
    float _2781 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2783 = _2775 + _2781;
    float _2785 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2787 = _2777 + _2785;
    float _2789 = _2751 * 6.283185482025146484375;
    float _2791 = sin(_2789);
    float _2793 = fma(_2745, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2779);
    float _2795 = _2783 * _2783;
    float _2797 = _2787 * _2787;
    float _2799 = _2697 * _2685;
    float _2801 = _2795 + _2797;
    float _2803 = -_2195;
    float _2805 = fma(_2713, _2771, _2803);
    float _2807 = sqrt(_2801);
    float _2809 = fma(_2189, _2805, _2195);
    float _2811 = -_2197;
    float _2813 = fma(_2713, _2791, _2811);
    float _2815 = _2671 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2817 = _2809;
    float _2819 = _2685;
    float _2821 = _2779;
    float _2823 = _2691;
    if (!_2659)
    {
        float _2825 = fma(_2225, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2809);
        _2817 = _2825;
    }
    float _2827 = _2817;
    float _2829 = fma(_2189, _2813, _2197);
    float _2831 = _2815 + _2793;
    float _2833 = -_2685;
    float _2835 = _2691 * _2833;
    float _2837 = _2829;
    if (!_2659)
    {
        float _2839 = fma(_2227, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2829);
        _2837 = _2839;
    }
    float _2841 = _2837;
    bool _2843 = _2807 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_2843)
    {
        _2819 = _2797;
    }
    float _2845 = _2819;
    float _2847 = _2845;
    if (!_2843)
    {
        _289 = _2795;
    }
    float _2849 = _289;
    float _2851 = _2849;
    if (!_2843)
    {
        _2821 = _2775;
    }
    float _2853 = _2821;
    float _2855 = _2853;
    if (!_2843)
    {
        _2823 = _2777;
    }
    float _2857 = _2823;
    float _2859 = _2857;
    if (!_2843)
    {
        _2681 = _2831;
    }
    float _2861 = _2681;
    bool _2863 = !_2843;
    float _2865 = _2861;
    if (!_2863)
    {
        float _2867 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2871 = _2807 + _2869;
        float _2873 = _2831 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2875 = rsqrt(_2801);
        float _2877 = _2871 * _2867;
        float _2879 = _2877 * 0.15915493667125701904296875;
        float _2881 = _2879 * 6.283185482025146484375;
        float _2883 = sin(_2881);
        float _2885 = _2879 * 6.283185482025146484375;
        float _2887 = cos(_2885);
        float _2889 = fma(_2883, _2873, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2891 = _2875 * _2889;
        float _2893 = _2887 + (-1.0);
        float _2895 = _2783 * _2891;
        float _2897 = _2787 * _2891;
        float _2899 = _2893 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2901 = _2897 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2903 = _2897 * _2897;
        float _2905 = fma(_2831, _2887, _2899);
        float _2907 = _2895 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2909 = _2895 * _2895;
        _2865 = _2905;
        _2851 = _2909;
        _2847 = _2903;
        _2855 = _2907;
        _2859 = _2901;
    }
    float _2911 = _2865;
    float _2913 = _2851;
    float _2915 = _2847;
    float _2917 = _2855;
    float _2919 = _2859;
    float _2921 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2923 = _2911 + _2921;
    float _2925 = fma(_2715, _2827, _2799);
    float _2927 = fma(_2703, _2827, _2835);
    float _2929 = fma(_2721, _2827, _2733);
    float _2931 = fma(_2923, _2923, _2913);
    float _2933 = fma(_2729, _2841, _2925);
    float _2935 = fma(_2707, _2841, _2927);
    float _2937 = fma(_2717, _2841, _2929);
    float _2939 = _2931 + _2915;
    float _2941 = _2933 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2943 = _2933 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2945 = _2933 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_71.x = _2018;
    out.m_71.y = _2012;
    float _2947 = fma(_2935, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2941);
    float _2949 = sqrt(_2939);
    float _2951 = fma(_2935, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2943);
    float _2953 = fma(_2935, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2945);
    float _2955 = fma(_2937, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2947);
    float _2957 = fma(_2937, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2951);
    float _2959 = fma(_2937, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2953);
    out.m_73.x = _2955;
    out.m_73.y = _2957;
    out.m_73.z = _2959;
    bool _2961 = _2949 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2963 = isnan(_2949);
    bool _2965 = _2961 || _2963;
    bool _2967 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2969 = _2965 || _2967;
    float _2971 = _2931;
    float _2973 = _2937;
    float _2975 = _2923;
    if (!_2969)
    {
        _2971 = 1.0;
    }
    float _2977 = _2971;
    bool _2979 = !_2969;
    float _2981 = _2977;
    if (!_2979)
    {
        bool _2983 = _2949 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2985 = isnan(_2949);
        bool _2987 = _2983 || _2985;
        bool _2989 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2991 = _2987 || _2989;
        if (!_2991)
        {
            float _2993 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2995 = _2949 + _2993;
            float _2997 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2999 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2997;
            float _3001 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3003 = _3001 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3005 = 1.0 / _2999;
            float _3007 = _2995 * _3005;
            float _3009 = fma(_3007, _3003, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2981 = _3009;
            _2041 = _3005;
            _3011 = true;
        }
        else
        {
            bool _3013 = _2949 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3015 = isnan(_2949);
            bool _3017 = _3013 || _3015;
            bool _3019 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3021 = _3017 || _3019;
            if (!_3021)
            {
                float _3023 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3025 = _2949 + _3023;
                float _3027 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3029 = _3027 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3031 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3033 = _3031 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3035 = 1.0 / _3029;
                float _3037 = _3025 * _3035;
                float _3039 = fma(_3037, _3033, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2981 = _3039;
                _2041 = _3035;
                _3011 = true;
            }
            else
            {
                _2981 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3011 = false;
    float _3041 = _2981;
    float _3043 = _2041;
    float _3045 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3047 = _2911 + _3045;
    float _3049 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3051 = _2917 + _3049;
    float _3053 = fma(_3047, _3041, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3055 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3057 = _2919 + _3055;
    float _3059 = fma(_3051, _3041, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3061 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3063 = _3053 + _3061;
    float _3065 = fma(_3057, _3041, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3067 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3069 = _3059 + _3067;
    float _3071 = _3063 * _3063;
    float _3073 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3075 = _3065 + _3073;
    float _3077 = fma(_3069, _3069, _3071);
    float _3079 = fma(_3075, _3075, _3077);
    float _3081 = rsqrt(_3079);
    float _3083 = _3081 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3085 = _3069 * _3083;
    float _3087 = _3075 * _3083;
    float _3089 = _3085 * _3085;
    float _3091 = _3087 * _3087;
    float _3093 = _3089 + _3091;
    float _3095 = sqrt(_3093);
    bool _3097 = _3095 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3099 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3101 = _3095 + _3099;
    float _3103 = _3081;
    float _3105 = _3101;
    float _3107 = _3085;
    if (_3097)
    {
        float _3109 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3103 = _3109;
    }
    float _3111 = _3103;
    if (_3097)
    {
        float _3113 = rsqrt(_3093);
        _2973 = _3113;
    }
    float _3115 = _2973;
    float _3117 = _3115;
    if (_3097)
    {
        float _3119 = _3101 * _3111;
        _3105 = _3119;
    }
    float _3121 = _3105;
    if (_3097)
    {
        float _3123 = _3121 * 0.15915493667125701904296875;
        _2043 = _3123;
    }
    float _3125 = _2043;
    float _3127 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3129 = _3075;
    if (_3097)
    {
        float _3131 = _3125 * 6.283185482025146484375;
        float _3133 = sin(_3131);
        _3129 = _3133;
    }
    float _3135 = _3129;
    float _3137 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3139 = precise::max(0.0, _3137);
    float _3141 = _3043;
    float _3143 = _3139;
    float _3145 = _3137;
    if (_3097)
    {
        float _3147 = _3125 * 6.283185482025146484375;
        float _3149 = cos(_3147);
        _3141 = _3149;
    }
    float _3151 = _3141;
    float _3153 = -_3083;
    float _3155 = -_3139;
    float _3157 = fma(_3063, _3153, _3155);
    if (_3097)
    {
        float _3159 = _3157 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3143 = _3159;
    }
    float _3161 = _3143;
    float _3163 = sqrt(_3079);
    float _3165 = _3053 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3167 = _3161;
    float _3169 = _3135;
    if (_3097)
    {
        float _3171 = fma(_3135, _3161, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3167 = _3171;
    }
    float _3173 = _3167;
    float _3175 = _3173;
    if (!_3097)
    {
        _3169 = _3087;
    }
    float _3177 = _3169;
    float _3179 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3165);
    float _3181 = _3177;
    if (_3097)
    {
        float _3183 = _3151 + (-1.0);
        _3145 = _3183;
    }
    float _3185 = _3145;
    float _3187 = _3185;
    if (_3097)
    {
        float _3189 = _3115 * _3173;
        _2975 = _3189;
    }
    float _3191 = _2975;
    if (!_3097)
    {
        _3117 = _3157;
    }
    float _3193 = _3117;
    float _3195 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3179);
    float _3197 = _3193;
    if (_3097)
    {
        float _3199 = _3185 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3187 = _3199;
    }
    float _3201 = _3187;
    float _3203 = _3201;
    if (_3097)
    {
        float _3205 = _3085 * _3191;
        _3107 = _3205;
    }
    float _3207 = _3107;
    if (!_3097)
    {
        _3175 = _3089;
    }
    float _3209 = _3175;
    float _3211 = _3209;
    if (_3097)
    {
        float _3213 = _3087 * _3191;
        _3181 = _3213;
    }
    float _3215 = _3181;
    if (_3097)
    {
        float _3217 = fma(_3157, _3151, _3201);
        _3197 = _3217;
    }
    float _3219 = _3197;
    if (_3097)
    {
        float _3221 = _3207 * _3207;
        _3211 = _3221;
    }
    float _3223 = _3211;
    if (!_3097)
    {
        _3203 = _3091;
    }
    float _3225 = _3203;
    float _3227 = _3225;
    if (_3097)
    {
        float _3229 = _3215 * _3215;
        _3227 = _3229;
    }
    float _3231 = _3227;
    float _3233 = fma(_3219, _3219, _3223);
    float _3235 = _3053 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3237 = _3195 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3239 = _3233 + _3231;
    float _3241 = _3053 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3245 = fma(_3163, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3243);
    float _3247 = precise::clamp(_3245, 0.0, 1.0);
    float _3249 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3235);
    float _3251 = rsqrt(_3239);
    float _3253 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3241);
    float _3255 = _3053 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3257 = -_3247;
    float _3259 = _3257 + 1.0;
    float _3261 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3253);
    float _3263 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3255);
    float _3265 = _3261 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3267 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3263);
    float _3269 = abs(_3259);
    float _3271 = log2(_3269);
    float _3273 = _3265 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3275 = _3267 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3277 = _3251 * _3207;
    float _3279 = -_3273;
    float _3281 = fma(_3279, _3127, 1.0);
    float _3283 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3249);
    float _3285 = _3251 * _3219;
    float _3287 = _3275 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3289 = _3277 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3291 = _3251 * _3215;
    float _3293 = _3283 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3295 = fma(_3237, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3287);
    float _3297 = -_3289;
    float _3299 = fma(_3285, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3297);
    float _3301 = log2(_3281);
    float _3303 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3305 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3295);
    float _3307 = -_3291;
    float _3309 = fma(_3307, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3299);
    float _3311 = _3275 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3313 = _3275 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3315 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3305);
    float _3317 = fma(_3309, -0.5, 0.5);
    float _3319 = exp2(_3303);
    float _3321 = fma(_3237, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3311);
    float _3323 = fma(_3237, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3313);
    float _3325 = fma(_3309, 0.5, 0.5);
    float _3327 = _3285 + 1.0;
    float _3329 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3321);
    float _3331 = fma(_3325, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3333 = 1.0 / _3315;
    float _3335 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3323);
    float _3337 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3329);
    float _3339 = fma(_3325, _3331, -0.212114393711090087890625);
    float _3341 = _3301 * 0.693147182464599609375;
    float _3343 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3335);
    float _3345 = fma(_3325, _3339, 1.570728778839111328125);
    float _3347 = sqrt(_3317);
    float _3349 = -_3285;
    float _3351 = fma(_3319, _3327, _3349);
    float _3353 = _3341 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3355 = fma(_3351, 0.5, 0.5);
    float _3357 = _3337 * _3333;
    float _3359 = _3343 * _3333;
    float _3361 = fma(_3357, 0.5, 0.5);
    float _3363 = fma(_3359, -0.5, 0.5);
    float _3365 = _3347 * 0.636619746685028076171875;
    float3 _8477 = float3(_3361, _3363, _3353);
    float _3367 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8477, float3(0.0), isnan(_8477)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8477, float3(0.0), isnan(_8477)), level(0.0)).x;
    float3 _8488 = float3(_3361, _3363, _3353);
    float4 _3369 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8488, float3(0.0), isnan(_8488)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8488, float3(0.0), isnan(_8488)), level(0.0)).xyzw;
    float _3371 = _3369.x;
    float _3373 = _3369.y;
    float _3375 = _3369.z;
    float _3377 = _3369.w;
    float _3379 = -_3345;
    float _3381 = fma(_3365, _3379, 1.0);
    float2 _8509 = float2(_3381, _3355);
    float3 _3385 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8509, float2(0.0), isnan(_8509)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8509, float2(0.0), isnan(_8509)), level(0.0)).xyz;
    float _3387 = _3385.x;
    float _3389 = _3385.y;
    float _3391 = _3385.z;
    float _3393 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3395 = _3275 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2761;
    out.m_75.y = _2815;
    out.m_75.z = _2763;
    float _3397 = fma(_3237, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3395);
    float _3399 = exp2(_3393);
    out.m_77.x = _3059;
    out.m_77.y = _3053;
    out.m_77.z = _3065;
    float _3401 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3397);
    out.m_49.x = 1.0;
    float _3403 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3401);
    float _3405 = _3403 + _3315;
    out.gl_Position.x = _3337;
    out.gl_Position.y = _3343;
    out.gl_Position.z = _3403;
    out.gl_Position.w = _3315;
    float _3407 = _3405 * 0.5;
    float _3409 = -_3399;
    float _3411 = _3409 + 1.0;
    float _3413 = _3411 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3415 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.z = _3407;
    out.m_79.w = _3315;
    out.m_81.w = _3415;
    float _3417 = _3413 * _3367;
    float _3419 = -_3413;
    float _3421 = _3419 + 1.0;
    float _3423 = _3377 * _3417;
    float _3425 = _3391 * _3417;
    float _3427 = fma(_3387, _3423, _3371);
    float _3429 = fma(_3389, _3423, _3373);
    float _3431 = _3377 * _3421;
    float _3433 = fma(_3377, _3425, _3375);
    out.m_83.x = _3427;
    out.m_83.y = _3429;
    out.m_83.z = _3433;
    out.m_83.w = _3431;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3011 = false;
    bool _2303 = false;
    bool _2111 = false;
    bool _1609 = false;
    bool _1293 = false;
    bool _915 = false;
    bool _813 = false;
    bool _635 = false;
    bool _307 = false;
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
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3489 = as_type<float>(_121);
        out.gl_Position.z = _3489;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_51.w;
    float _127 = in.m_53.x;
    bool _129 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_125);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_125;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.x = _127;
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
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3563 = as_type<float>(_163);
        out.gl_Position.z = _3563;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = in.m_57.w;
    float _167 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _169 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _171 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _173 = _169 || _171;
    bool _175 = isnan(1.0);
    bool _177 = _173 || _175;
    float _179 = in.m_51.x;
    float _181 = in.m_51.y;
    float _183 = in.m_51.z;
    float _185 = in.m_46.x;
    float _187 = in.m_46.y;
    float _189 = in.m_46.z;
    float _191 = 0.0;
    float _193 = _167;
    if (!_177)
    {
        float _195 = _167 * _167;
        float _197 = _195 * 0.5;
        _191 = _197;
    }
    float _199 = _191;
    float _201 = _199;
    if (!_177)
    {
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    bool _207 = !_177;
    float _209 = _205;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _167 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _167);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
    }
    float _241 = _209;
    bool _243 = !_177;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _167 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _193 = _263;
    }
    float _265 = _193;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _269 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _275 = fma(_265, _179, _269);
    float _277 = fma(_265, _181, _271);
    float _279 = fma(_265, _183, _273);
    float _281 = fma(_275, _165, _185);
    float _283 = fma(_277, _165, _187);
    float _285 = fma(_279, _165, _189);
    bool _287 = !_267;
    float _289 = _285;
    float _305;
    if (!_287)
    {
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _293 = _127 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_107);
        float _311 = 1.0 / _309;
        float _313 = _141 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _315 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _337 = 1.0 / _323;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _339;
    float _343 = 1.0 / _331;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = _315 + _345;
    bool _349 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _351 = isnan(_315);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    bool _361 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _363 = isnan(_315);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -_359;
    float _375 = _373 + 1.0;
    float _377 = 1.0 / _327;
    float _379 = _347 * _337;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = _315 + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _385;
    bool _389 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _391 = fma(_387, _379, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _393 = 1.0 / _335;
    float _395 = _383 * _343;
    bool _397 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _399 = isnan(_315);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _411 = _315 + _409;
    bool _413 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _415 = isnan(_315);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = 1.0 / _341;
    float _427 = _319 * _377;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _431 = _315 + _429;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _433;
    float _437 = -_423;
    float _439 = _437 + 1.0;
    float _441 = fma(_435, _379, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _443 = _411 * _393;
    float _445 = -_407;
    float _447 = _445 + 1.0;
    float _449 = _423 * _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _451;
    float _455 = _431 * _425;
    bool _457 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _459 = isnan(_315);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = fma(_453, _379, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _471 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _473 = isnan(_315);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = _467 * _439;
    float _485 = -_467;
    float _487 = _485 + 1.0;
    float _489 = _481 * _375;
    float _491 = -_481;
    float _493 = _491 + 1.0;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _499 = _359 * _487;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _509 = _371 * _493;
    float _511 = fma(_497, _427, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _513 = fma(_503, _427, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _515 = fma(_507, _427, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _517 = _469 * _509;
    float _519 = -_371;
    float _521 = _519 + 1.0;
    float _523 = _391 * _509;
    float _525 = _441 * _509;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _527;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _535;
    float _539 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[143].x, _517);
    float _541 = fma(_529, _395, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _543 = fma(_533, _395, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _545 = fma(_537, _395, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _551 = fma(_513, _489, _539);
    float _553 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[143].y, _523);
    float _555 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[143].z, _525);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _561 = fma(_549, _443, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _563 = fma(_543, _499, _551);
    float _565 = fma(_515, _489, _553);
    float _567 = fma(_559, _443, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _569 = fma(_511, _489, _555);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _575 = fma(_541, _499, _565);
    float _577 = fma(_545, _499, _569);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _583;
    float _587 = fma(_573, _443, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _589;
    float _593 = fma(_561, _483, _563);
    float _595 = fma(_581, _455, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _597 = fma(_585, _455, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _599 = fma(_591, _455, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _601 = fma(_567, _483, _575);
    float _603 = fma(_587, _483, _577);
    float _605 = fma(_595, _449, _593);
    float _607 = fma(_597, _449, _601);
    float _609 = fma(_599, _449, _603);
    float _611 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[148].x, _605);
    float _613 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[148].y, _607);
    float _615 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[148].z, _609);
    bool _617 = !_389;
    float _633;
    if (!_617)
    {
        float _619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _621 = _127 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _623 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[11].x, _141);
        float _625 = _623 * _619;
        float _627 = floor(_625);
        float _629 = -_627;
        float _631 = _625 + _629;
        _633 = _631;
        _635 = true;
    }
    else
    {
        float _637 = float(_107);
        float _639 = 1.0 / _637;
        float _641 = _141 * _639;
        _633 = _641;
    }
    _635 = false;
    float _643 = _633;
    float _645 = in.m_57.x;
    float _647 = in.m_57.y;
    float _649 = in.m_57.z;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _653 = _643 + _651;
    bool _655 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _657 = isnan(_643);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _667;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _675 = 1.0 / _669;
    bool _677 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _679 = 1.0 / _673;
    float _681 = _613 * _647;
    bool _683 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _685 = isnan(_643);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = _615 * _649;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _697;
    float _701 = _653 * _675;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _705 = _643 + _703;
    bool _707 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _709 = isnan(_643);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = -_693;
    float _721 = _719 + 1.0;
    float _723 = fma(_699, _701, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _725 = _717 * _721;
    float _727 = -_717;
    float _729 = _727 + 1.0;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _731;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _735;
    float _739 = _705 * _679;
    float _741 = _665 * _729;
    float _743 = fma(_733, _701, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _745 = fma(_737, _701, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _747 = -_665;
    float _749 = _747 + 1.0;
    float _751 = _723 * _741;
    float _753 = _743 * _741;
    float _755 = _745 * _741;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _769 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[107].x, _753);
    float _771 = fma(_759, _739, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _773 = fma(_763, _739, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _775 = fma(_767, _739, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _777 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[107].y, _751);
    float _779 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[107].z, _755);
    float _781 = fma(_771, _725, _769);
    float _783 = _611 * _645;
    float _785 = fma(_773, _725, _777);
    float _787 = fma(_775, _725, _779);
    float _789 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[109].x, _781);
    float _791 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[109].y, _785);
    float _793 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[109].z, _787);
    bool _795 = !_677;
    float _811;
    if (!_795)
    {
        float _797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _799 = _127 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _801 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _803 = _801 * _797;
        float _805 = floor(_803);
        float _807 = -_805;
        float _809 = _803 + _807;
        _811 = _809;
        _813 = true;
    }
    else
    {
        float _815 = float(_107);
        float _817 = 1.0 / _815;
        float _819 = _141 * _817;
        _811 = _819;
    }
    _813 = false;
    float _821 = _811;
    bool _823 = _821 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _825 = isnan(_821);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _839 = _821 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _841 = isnan(_821);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _851;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _857 = _821 + _855;
    float _859 = -_833;
    float _861 = _859 + 1.0;
    bool _863 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _865 = 1.0 / _837;
    float _867 = _849 * _861;
    float _869 = -_849;
    float _871 = _869 + 1.0;
    float _873 = _853 * _865;
    float _875 = _793 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _877 = fma(_873, _857, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _879 = _791 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _881 = _875 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = _877 * _867;
    float _885 = _789 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _887 = _879 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _889 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[115].x, _883);
    float _891 = _885 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[116].x, _889);
    float _895 = _893 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _891;
    out.m_59.y = _887;
    out.m_59.z = _881;
    out.m_59.w = _895;
    bool _897 = !_863;
    float _913;
    if (!_897)
    {
        float _899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _901 = _127 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _903 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[14].x, _141);
        float _905 = _903 * _899;
        float _907 = floor(_905);
        float _909 = -_907;
        float _911 = _905 + _909;
        _913 = _911;
        _915 = true;
    }
    else
    {
        float _917 = float(_107);
        float _919 = 1.0 / _917;
        float _921 = _141 * _919;
        _913 = _921;
    }
    _915 = false;
    float _923 = _913;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _927 = _923 + _925;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _931 = _923 + _929;
    bool _933 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _935 = isnan(_923);
    bool _937 = _933 || _935;
    bool _939 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _941 = _937 || _939;
    float _943 = float(_941);
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _945;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _953;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _961 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _963 = isnan(_923);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = 1.0 / _951;
    float _975 = -_943;
    float _977 = _975 + 1.0;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _981 = _923 + _979;
    bool _983 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _985 = isnan(_923);
    bool _987 = _983 || _985;
    bool _989 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _991 = _987 || _989;
    float _993 = float(_991);
    bool _995 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _997 = isnan(_923);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    float _1007 = 1.0 / _947;
    bool _1009 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1011 = 1.0 / _955;
    float _1013 = _931 * _973;
    bool _1015 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1017 = isnan(_923);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1023 = _1019 || _1021;
    float _1025 = float(_1023);
    float _1027 = -_1025;
    float _1029 = _1027 + 1.0;
    float _1031 = 1.0 / _959;
    float _1033 = _927 * _1007;
    float _1035 = _971 * _977;
    float _1037 = -_971;
    float _1039 = _1037 + 1.0;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1041;
    float _1045 = _993 * _1039;
    float _1047 = _981 * _1011;
    float _1049 = -_993;
    float _1051 = _1049 + 1.0;
    bool _1053 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1055 = isnan(_923);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1061 = _1057 || _1059;
    float _1063 = float(_1061);
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1067 = _923 + _1065;
    float _1069 = 1.0 / _1043;
    float _1071 = _1025 * _1051;
    bool _1073 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1075 = isnan(_923);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = -_1063;
    float _1087 = _1085 + 1.0;
    float _1089 = _1067 * _1031;
    float _1091 = _1063 * _1029;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1097 = -_1083;
    float _1099 = _1097 + 1.0;
    float _1101 = _1083 * _1087;
    bool _1103 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1105 = isnan(_923);
    bool _1107 = _1103 || _1105;
    bool _1109 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1111 = _1107 || _1109;
    float _1113 = float(_1111);
    float _1115 = -_1005;
    float _1117 = _1115 + 1.0;
    float _1119 = _1005 * _1099;
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1121;
    float _1125 = 1.0 / _1095;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1127;
    float _1131 = _1113 * _1117;
    float _1133 = fma(_1123, _1033, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1141 = _923 + _1139;
    float _1143 = _1133 * _1131;
    float _1145 = 1.0 / _1129;
    float _1147 = -_1113;
    float _1149 = _1147 + 1.0;
    float _1151 = fma(_1137, _1013, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1155 = _923 + _1153;
    float _1157 = _1141 * _1069;
    float _1159 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1143);
    float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1167 = _923 + _1165;
    float _1169 = _1155 * _1125;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1171;
    float _1175 = fma(_1151, _1119, _1159);
    float _1177 = fma(_1173, _1047, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1179;
    float _1183 = fma(_1177, _1101, _1175);
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1187 = _1185 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1189 = fma(_1163, _1089, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1191;
    float _1195 = fma(_1181, _1033, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1199 = _1197 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1201 = fma(_1189, _1091, _1183);
    float _1203 = fma(_1193, _1157, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1205 = fma(_1187, _1013, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1207 = _1167 * _1145;
    float _1209 = fma(_1203, _1071, _1201);
    float _1211 = fma(_1199, _1169, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1213;
    float _1217 = _1195 * _1131;
    float _1219 = fma(_1211, _1045, _1209);
    float _1221 = fma(_1215, _1207, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1223;
    float _1227 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1217);
    float _1229 = fma(_1221, _1035, _1219);
    float _1231 = fma(_1225, _1047, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1235 = _1233 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1237 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1229);
    float _1239 = fma(_1205, _1119, _1227);
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1241;
    float _1245 = fma(_1235, _1089, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1247 = fma(_1231, _1101, _1239);
    out.m_61.y = _1237;
    float _1249 = fma(_1243, _1157, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1253 = _1251 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1255 = fma(_1245, _1091, _1247);
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1257;
    float _1261 = fma(_1253, _1169, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1263 = fma(_1249, _1071, _1255);
    float _1265 = fma(_1259, _1207, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1267 = fma(_1261, _1045, _1263);
    float _1269 = fma(_1265, _1035, _1267);
    float _1271 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1269);
    float _1273 = precise::clamp(_1271, 0.0, 1.0);
    bool _1275 = !_1009;
    float _1291;
    if (!_1275)
    {
        float _1277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1279 = _127 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1281 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[14].y, _141);
        float _1283 = _1281 * _1277;
        float _1285 = floor(_1283);
        float _1287 = -_1285;
        float _1289 = _1283 + _1287;
        _1291 = _1289;
        _1293 = true;
    }
    else
    {
        float _1295 = float(_107);
        float _1297 = 1.0 / _1295;
        float _1299 = _141 * _1297;
        _1291 = _1299;
    }
    _1293 = false;
    float _1301 = _1291;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1305 = _1301 + _1303;
    bool _1307 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1309 = isnan(_1301);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1315 = _1311 || _1313;
    float _1317 = float(_1315);
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1321 = _1319 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1323;
    bool _1327 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1329 = isnan(_1301);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1335 = _1331 || _1333;
    float _1337 = float(_1335);
    bool _1339 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1341 = isnan(_1301);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1347 = _1343 || _1345;
    float _1349 = float(_1347);
    float _1351 = 1.0 / _1321;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1355 = _1353 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1357 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1359 = isnan(_1301);
    bool _1361 = _1357 || _1359;
    bool _1363 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1365 = _1361 || _1363;
    float _1367 = float(_1365);
    float _1369 = -_1349;
    float _1371 = _1369 + 1.0;
    bool _1373 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1375 = isnan(_1301);
    bool _1377 = _1373 || _1375;
    bool _1379 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1381 = _1377 || _1379;
    float _1383 = float(_1381);
    float _1385 = 1.0 / _1355;
    float _1387 = -_1367;
    float _1389 = _1387 + 1.0;
    bool _1391 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1393 = _1325 * _1351;
    float _1395 = -_1317;
    float _1397 = _1395 + 1.0;
    float _1399 = -_1337;
    float _1401 = _1399 + 1.0;
    float _1403 = -_1383;
    float _1405 = _1403 + 1.0;
    float _1407 = fma(_1393, _1305, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1409 = _1337 * _1397;
    float _1411 = _1349 * _1401;
    float _1413 = _1367 * _1371;
    bool _1415 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1417 = isnan(_1301);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1423 = _1419 || _1421;
    float _1425 = float(_1423);
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1429 = _1427 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1433 = _1431 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1435 = _1383 * _1389;
    bool _1437 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1439 = isnan(_1301);
    bool _1441 = _1437 || _1439;
    bool _1443 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1445 = _1441 || _1443;
    float _1447 = float(_1445);
    float _1449 = _1425 * _1405;
    float _1451 = 1.0 / _1433;
    float _1453 = -_1425;
    float _1455 = _1453 + 1.0;
    float _1457 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1459 = _1457 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1461 = _1447 * _1455;
    float _1463 = _1459 * _1385;
    float _1465 = 1.0 / _1429;
    float _1467 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1469 = _1467 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1471 = _1407 * _1461;
    float _1473 = -_1447;
    float _1475 = _1473 + 1.0;
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1479 = _1477 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1481;
    float _1485 = 1.0 / _1469;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1489 = _1301 + _1487;
    float _1491 = fma(_1475, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1471);
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1495 = _1493 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1497 = _1483 * _1451;
    float _1499 = fma(_1463, _1489, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1503 = _1301 + _1501;
    float _1505 = 1.0 / _1479;
    float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1509 = _1507 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1511 = fma(_1497, _1503, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1513 = fma(_1499, _1449, _1491);
    float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1517 = _1301 + _1515;
    float _1519 = _1509 * _1465;
    float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1523 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1521;
    float _1525 = 1.0 / _1495;
    float _1527 = fma(_1519, _1517, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1529 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1531 = _1529 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1533 = _1523 * _1485;
    float _1535 = fma(_1511, _1435, _1513);
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1539 = _1301 + _1537;
    bool _1541 = _1301 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1543 = isnan(_1301);
    bool _1545 = _1541 || _1543;
    bool _1547 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1549 = _1545 || _1547;
    float _1551 = float(_1549);
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1555 = _1301 + _1553;
    float _1557 = _1531 * _1505;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1561 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1559;
    float _1563 = fma(_1533, _1539, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1565 = fma(_1527, _1413, _1535);
    float _1567 = fma(_1557, _1555, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1569 = -_1551;
    float _1571 = _1569 + 1.0;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1575 = _1301 + _1573;
    float _1577 = fma(_1563, _1411, _1565);
    float _1579 = _1561 * _1525;
    float _1581 = _1317 * _1571;
    float _1583 = fma(_1567, _1409, _1577);
    float _1585 = fma(_1579, _1575, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1587 = fma(_1585, _1581, _1583);
    float _1589 = fma(_1551, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1587);
    out.m_63.x = _1589;
    bool _1591 = !_1391;
    float _1607;
    if (!_1591)
    {
        float _1593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1595 = _127 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1597 = fma(_1595, (*spvDescriptorSet0.vp_c9)._m0[14].z, _141);
        float _1599 = _1597 * _1593;
        float _1601 = floor(_1599);
        float _1603 = -_1601;
        float _1605 = _1599 + _1603;
        _1607 = _1605;
        _1609 = true;
    }
    else
    {
        float _1611 = float(_107);
        float _1613 = 1.0 / _1611;
        float _1615 = _141 * _1613;
        _1607 = _1615;
    }
    _1609 = false;
    float _1617 = _1607;
    int _1619 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1621 = _1619;
    int _1623 = 0;
    int _1625 = _98(_1621, _1623, (*spvDescriptorSet0.support_buffer));
    float _1627 = in.m_65.z;
    float _1629 = trunc(_1627);
    int _1631 = int(_1629);
    int _1633 = _1625 + (-1);
    float _1635 = float(_1633);
    float _1637 = _1273 * _1635;
    float _1639 = trunc(_1637);
    int _1641 = int(_1639);
    int _1643 = _1641;
    int _1645 = 0;
    int _1647 = _99(_1643, _1645, (*spvDescriptorSet0.support_buffer));
    int _1649 = _1631;
    int _1651 = 0;
    int _1653 = _99(_1649, _1651, (*spvDescriptorSet0.support_buffer));
    float4 _1656 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1647, _1653)), 0).xyzw;
    float _1658 = _1656.x;
    float _1660 = _1656.y;
    float _1662 = _1656.z;
    float _1664 = _1656.w;
    float _1666 = in.m_53.y;
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1670 = _1668 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1674 = _1672 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1676 = 1.0 / _1670;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1680 = _1678 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    int _1682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1684 = _1682 != 0;
    float _1686 = in.m_65.x;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1692 = _127 > 0.5;
    bool _1694 = _1692 && _1684;
    float _1696 = 1.0 / _1674;
    bool _1698 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1700 = isnan(_1617);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1706 = _1702 || _1704;
    float _1708 = float(_1706);
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1712 = _1710 != 0;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1714;
    bool _1718 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1720 = isnan(_1617);
    bool _1722 = _1718 || _1720;
    bool _1724 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1726 = _1722 || _1724;
    float _1728 = float(_1726);
    float _1730 = 1.0 / _1680;
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1732;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1738 = _1736 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    bool _1740 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1742 = isnan(_1617);
    bool _1744 = _1740 || _1742;
    bool _1746 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1748 = _1744 || _1746;
    float _1750 = float(_1748);
    float _1752 = _1734 * _1676;
    bool _1754 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1756 = isnan(_1617);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1762 = _1758 || _1760;
    float _1764 = float(_1762);
    float _1766 = -_1708;
    float _1768 = _1766 + 1.0;
    float _1770 = 1.0 / _1690;
    float _1772 = _1738 * _1696;
    bool _1774 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1776 = isnan(_1617);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1782 = _1778 || _1780;
    float _1784 = float(_1782);
    float _1786 = -_1764;
    float _1788 = _1786 + 1.0;
    float _1790 = _1764 * _1768;
    float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1794 = _1792 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1796 = -_1784;
    float _1798 = _1796 + 1.0;
    float _1800 = _1794 * _1730;
    bool _1802 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1804 = isnan(_1617);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1810 = _1806 || _1808;
    float _1812 = float(_1810);
    float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1816 = _1814 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1818 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1820 = isnan(_1617);
    bool _1822 = _1818 || _1820;
    bool _1824 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1826 = _1822 || _1824;
    float _1828 = float(_1826);
    bool _1830 = _1666 > 0.5;
    bool _1832 = _1830 && _1712;
    float _1834 = _1812 * _1788;
    float _1836 = -_1812;
    float _1838 = _1836 + 1.0;
    float _1840 = _1716 * _1770;
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1844 = _1617 + _1842;
    float _1846 = _1784 * _1838;
    float _1848 = _1728 * _1798;
    float _1850 = -_1728;
    float _1852 = _1850 + 1.0;
    float _1854 = 1.0 / _1816;
    float _1856 = fma(_1752, _1844, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    bool _1858 = _1617 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1860 = isnan(_1617);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1866 = _1862 || _1864;
    float _1868 = float(_1866);
    float _1870 = _1828 * _1852;
    float _1872 = -_1828;
    float _1874 = _1872 + 1.0;
    float _1876 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1878 = _1876 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1880 = _1868 * _1874;
    float _1882 = -_1868;
    float _1884 = _1882 + 1.0;
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1888 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1886;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1892 = _1617 + _1890;
    float _1894 = _1750 * _1884;
    float _1896 = 1.0 / _1878;
    float _1898 = _1888 * _1854;
    float _1900 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1902 = _1617 + _1900;
    float _1904 = _1856 * _1894;
    float _1906 = -_1750;
    float _1908 = _1906 + 1.0;
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1912 = _1910 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1914 = fma(_1840, _1902, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1916 = fma(_1772, _1892, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1918 = fma(_1908, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1904);
    float _1920 = in.m_65.y;
    float _1922 = 1.0 / _1912;
    float _1924 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1926 = _1617 + _1924;
    float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1930 = _1928 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1932 = fma(_1916, _1880, _1918);
    float _1934 = fma(_1800, _1926, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1936 = _1930 * _1896;
    float _1938 = fma(_1914, _1870, _1932);
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1942 = _1617 + _1940;
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1946 = _1617 + _1944;
    float _1948 = fma(_1934, _1848, _1938);
    float _1950 = fma(_1898, _1942, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1952 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1954 = _1617 + _1952;
    float _1956 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1956;
    float _1960 = fma(_1936, _1946, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1962 = fma(_1950, _1846, _1948);
    float _1964 = _1958 * _1922;
    float _1966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1968 = fma(_1960, _1834, _1962);
    float _1970 = _1834;
    int _1972 = as_type<int>(_1908);
    if (_1684)
    {
        _1970 = _1686;
    }
    float _1974 = _1970;
    float _1976 = fma(_1964, _1954, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1978 = _1920;
    float _1980 = _1974;
    float _1982 = _1976;
    if (_1832)
    {
        float _1984 = -_1920;
        float _1986 = _1984 + 1.0;
        _1978 = _1986;
    }
    float _1988 = _1978;
    float _1990 = fma(_1976, _1790, _1968);
    if (_1694)
    {
        float _1992 = -_1974;
        float _1994 = _1992 + 1.0;
        _1980 = _1994;
    }
    float _1996 = _1980;
    if (!_1684)
    {
        _1982 = _1686;
    }
    float _1998 = _1982;
    float _2000 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2002 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1990);
    float _2004 = _1988 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2006 = _1998;
    if (_1684)
    {
        _2006 = _1996;
    }
    float _2008 = _2006;
    int _2010 = _1641 + 1;
    float _2012 = _2004 * _1966;
    out.m_67.x = _2002;
    float _2014 = _2008 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2016 = min(_1633, _2010);
    float _2018 = _2014 * _2000;
    uint _2021 = as_type<uint>(half2(float2(_1664, 0.0)));
    uint _2023 = extract_bits(_2021, 0u, 8u);
    int _2025 = int(_2023) & 255;
    uint _2027 = extract_bits(_2021, 8u, 8u);
    int _2029 = int(_2027) & 255;
    int _2031 = _2029 << 8;
    int _2033 = _2025 | _2031;
    bool _2035 = _2033 >= 32768;
    int _2037 = _2033 + (-1024);
    int _2039 = _2037;
    float _2041 = _2018;
    float _2043 = _2012;
    if (_2035)
    {
        int _2045 = ~_2033;
        int _2047 = _2045 + 33792;
        int _2049 = _2047 + 1;
        _2039 = _2049;
    }
    int _2051 = _2039;
    int _2053 = _2051 + 30719;
    float _2055 = float(_2053);
    float _2057 = fma(_2055, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2059 = abs(_2057);
    float _2061 = -_2059;
    float _2063 = _2061 + 1.0;
    float _2065 = abs(_2057);
    float _2067 = fma(_2065, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2069 = _2057 < 0.0;
    float _2071 = float(_2069);
    int _2073 = as_type<int>(_2063) + (-218103808);
    float _2075 = abs(_2057);
    float _2077 = fma(_2075, _2067, -0.212114393711090087890625);
    bool _2079 = uint(_2073) >= 1920991232u;
    float _2081 = abs(_2057);
    float _2083 = fma(_2081, _2077, 1.570728778839111328125);
    bool _2085 = !_2079;
    float _2109;
    if (!_2085)
    {
        int _2087 = as_type<int>(_2063);
        int _2089 = as_type<int>(_1898);
        int _2091 = as_type<int>(_1908);
        int _2093 = 10224;
        int _2095;
        int _2097;
        int _2099;
        int _2101;
        int _2103;
        int _2105;
        int _2107;
        _96(_2087, _2089, _2091, _2093, _2095, _2097, _2099, _2101, _2103, _2105, _2107, out.gl_Position, out.gl_PointSize);
        _2109 = as_type<float>(_2099);
        _1972 = _2105;
        _2111 = true;
    }
    else
    {
        float _2113 = rsqrt(_2063);
        float _2115 = _2063 * _2113;
        float _2117 = _2113 * 0.5;
        float _2119 = -_2115;
        float _2121 = 0.0 + _2119;
        float _2123 = fma(_2117, _2121, 0.5);
        float _2125 = fma(_2115, _2123, _2115);
        float _2127 = -_2125;
        float _2129 = 0.0 + _2127;
        float _2131 = fma(_2125, _2129, _2063);
        float _2133 = fma(_2117, _2131, _2125);
        _2109 = _2133;
    }
    _2111 = false;
    float _2135 = _2109;
    int _2137 = _1972;
    int _2139 = _2016;
    int _2141 = 0;
    int _2143 = _99(_2139, _2141, (*spvDescriptorSet0.support_buffer));
    int _2145 = _1631;
    int _2147 = 0;
    int _2149 = _99(_2145, _2147, (*spvDescriptorSet0.support_buffer));
    float4 _2151 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2143, _2149)), 0).xyzw;
    float _2153 = _2151.x;
    float _2155 = _2151.y;
    float _2157 = _2151.z;
    float _2159 = _2151.w;
    float _2161 = _2083 * _2135;
    float _2163 = _2071 * 2.0;
    float _2165 = _2055 * 3.883221149444580078125;
    float _2167 = floor(_1637);
    float _2169 = -_2163;
    float _2171 = fma(_2161, _2169, _2161);
    float _2173 = _2165 * 0.15915493667125701904296875;
    float _2175 = fma(_2071, 3.1415927410125732421875, _2171);
    float _2177 = _2173 * 6.283185482025146484375;
    float _2179 = cos(_2177);
    float _2181 = _2175 * 0.15915493667125701904296875;
    float _2183 = _2181 * 6.283185482025146484375;
    float _2185 = sin(_2183);
    float _2187 = -_2167;
    float _2189 = _1637 + _2187;
    float _2191 = _2173 * 6.283185482025146484375;
    float _2193 = sin(_2191);
    float _2195 = _2185 * _2179;
    float _2197 = _2185 * _2193;
    uint _2199 = as_type<uint>(half2(float2(_2159, 0.0)));
    float _2201 = -_1660;
    float _2203 = _2201 + _2155;
    float _2205 = -_1658;
    float _2207 = _2205 + _2153;
    float _2209 = -_1662;
    float _2211 = _2209 + _2157;
    uint _2213 = extract_bits(_2199, 0u, 8u);
    int _2215 = int(_2213) & 255;
    uint _2217 = extract_bits(_2199, 8u, 8u);
    int _2219 = int(_2217) & 255;
    int _2221 = _2219 << 8;
    int _2223 = _2215 | _2221;
    float _2225 = fma(_2189, _2207, _1658);
    float _2227 = fma(_2189, _2211, _1662);
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
    float _2243 = fma(_2189, _2203, _1660);
    int _2245 = _2241 + 30719;
    float _2247 = float(_2245);
    float _2249 = fma(_2247, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2251 = abs(_2249);
    float _2253 = -_2251;
    float _2255 = _2253 + 1.0;
    float _2257 = abs(_2249);
    float _2259 = fma(_2257, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2261 = _2249 < 0.0;
    float _2263 = float(_2261);
    int _2265 = as_type<int>(_2255) + (-218103808);
    float _2267 = abs(_2249);
    float _2269 = fma(_2267, _2259, -0.212114393711090087890625);
    bool _2271 = uint(_2265) >= 1920991232u;
    float _2273 = abs(_2249);
    float _2275 = fma(_2273, _2269, 1.570728778839111328125);
    bool _2277 = !_2271;
    float _2301;
    if (!_2277)
    {
        int _2279 = as_type<int>(_2255);
        int _2281 = as_type<int>(_2161);
        int _2283 = _2137;
        int _2285 = 11120;
        int _2287;
        int _2289;
        int _2291;
        int _2293;
        int _2295;
        int _2297;
        int _2299;
        _96(_2279, _2281, _2283, _2285, _2287, _2289, _2291, _2293, _2295, _2297, _2299, out.gl_Position, out.gl_PointSize);
        _2301 = as_type<float>(_2291);
        _2303 = true;
    }
    else
    {
        float _2305 = rsqrt(_2255);
        float _2307 = _2255 * _2305;
        float _2309 = _2305 * 0.5;
        float _2311 = -_2307;
        float _2313 = 0.0 + _2311;
        float _2315 = fma(_2309, _2313, 0.5);
        float _2317 = fma(_2307, _2315, _2307);
        float _2319 = -_2317;
        float _2321 = 0.0 + _2319;
        float _2323 = fma(_2317, _2321, _2255);
        float _2325 = fma(_2309, _2323, _2317);
        _2301 = _2325;
    }
    _2303 = false;
    float _2327 = _2301;
    float _2329 = in.m_53.x;
    float _2331 = in.m_53.y;
    float _2333 = in.m_53.z;
    float _2335 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2337 = log2(_2335);
    float _2339 = _2275 * _2327;
    float _2341 = _783 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2345 = _2343 != 0;
    int _2347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2349 = _2347 != 0;
    int _2351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2353 = _2351 != 0;
    float _2355 = _681 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2357 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2359 = -_2057;
    float _2361 = _2359 + _2249;
    float _2363 = fma(_2189, _2361, _2057);
    float _2365 = _2337 * _141;
    float _2367 = exp2(_2365);
    float _2369 = _2333 * 2.0;
    float _2371 = _2329 * 2.0;
    float _2373 = _2333 + _2331;
    float _2375 = _2331 + _2329;
    float _2377 = _2331 * 2.0;
    float _2379 = _2331 + (-0.5);
    float _2381 = _2373 + (-1.0);
    float _2383 = floor(_2369);
    float _2385 = _2375 + (-1.0);
    float _2387 = floor(_2371);
    float _2389 = -_2367;
    float _2391 = _2389 + 1.0;
    bool _2393 = _2383 > 0.0;
    float _2395 = fma(_2381, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2397 = _2383 >= 0.0;
    bool _2399 = isnan(_2383);
    bool _2401 = _2397 || _2399;
    bool _2403 = isnan(0.0);
    bool _2405 = _2401 || _2403;
    float _2407 = fma(_2385, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2409 = !_2345;
    int _2411 = _2409 ? 0 : 1;
    float _2413 = floor(_2377);
    int _2415 = _2405 ? 0 : 1;
    int _2417 = abs(_2411);
    int _2419 = ~_2415;
    int _2421 = _2419 + 1;
    int _2423 = _2421 + 1;
    bool _2425 = _2387 > 0.0;
    int _2427 = _2423;
    float _2429 = _2363;
    if (!_2393)
    {
        int _2431 = ~_2415;
        int _2433 = _2431 + 1;
        _2427 = _2433;
    }
    int _2435 = _2427;
    float _2437 = in.m_69.x;
    float _2439 = in.m_69.y;
    float _2441 = in.m_69.z;
    bool _2443 = _2387 >= 0.0;
    bool _2445 = isnan(_2387);
    bool _2447 = _2443 || _2445;
    bool _2449 = isnan(0.0);
    bool _2451 = _2447 || _2449;
    float _2453 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2455 = 1.0 + _2453;
    bool _2457 = !_2349;
    int _2459 = _2457 ? 0 : 1;
    bool _2461 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2463 = isnan(1.0);
    bool _2465 = _2461 || _2463;
    bool _2467 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2469 = _2465 || _2467;
    float _2471 = 1.0 / _2455;
    float _2473 = float(_2435);
    int _2475 = _2451 ? 0 : 1;
    bool _2477 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2479 = isnan(0.0);
    bool _2481 = _2477 || _2479;
    bool _2483 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2485 = _2481 || _2483;
    int _2487 = abs(_2459);
    float _2489 = float(_2417);
    int _2491 = ~_2475;
    int _2493 = _2491 + 1;
    int _2495 = _2493 + 1;
    int _2497 = _2495;
    if (!_2425)
    {
        int _2499 = ~_2475;
        int _2501 = _2499 + 1;
        _2497 = _2501;
    }
    int _2503 = _2497;
    float _2505 = _2489 * _2473;
    float _2507 = _2485 ? _2391 : 0.0;
    bool _2509 = _2413 > 0.0;
    float _2511 = _2505 * (-2.0);
    float _2513 = float(_2487);
    if (_2469)
    {
        float _2515 = _2507 * _2471;
        _145 = _2515;
    }
    float _2517 = _145;
    float _2519 = float(_2503);
    float _2521 = _2329 + (-0.5);
    bool _2523 = _2413 >= 0.0;
    bool _2525 = isnan(_2413);
    bool _2527 = _2523 || _2525;
    bool _2529 = isnan(0.0);
    bool _2531 = _2527 || _2529;
    float _2533 = fma(_2511, _2437, _2437);
    bool _2535 = !_2353;
    int _2537 = _2535 ? 0 : 1;
    float _2539 = _2513 * _2519;
    int _2541 = _2531 ? 0 : 1;
    float _2543 = fma(_2521, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2533);
    int _2545 = abs(_2537);
    float _2547 = _2539 * (-2.0);
    float _2549 = fma(_2407, _2511, _2407);
    int _2551 = ~_2541;
    int _2553 = _2551 + 1;
    int _2555 = _2553 + 1;
    float _2557 = _2333 + _2329;
    int _2559 = _2555;
    if (!_2509)
    {
        int _2561 = ~_2541;
        int _2563 = _2561 + 1;
        _2559 = _2563;
    }
    int _2565 = _2559;
    float _2567 = fma(_2395, _2547, _2395);
    float _2569 = fma(_2547, _2439, _2439);
    float _2571 = float(_2545);
    float _2573 = _2557 + (-1.0);
    float _2575 = float(_2565);
    float _2577 = fma(_2379, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2569);
    float _2579 = _2333 + (-0.5);
    float _2581 = fma(_2549, _2517, _2543);
    float _2583 = _283 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2585 = _2571 * _2575;
    float _2587 = fma(_2567, _2517, _2577);
    float _2589 = _2581 * 0.15915493667125701904296875;
    float _2591 = _2585 * (-2.0);
    float _2593 = fma(_2573, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2595 = _2587 * 0.15915493667125701904296875;
    float _2597 = fma(_2591, _2441, _2441);
    float _2599 = _2589 * 6.283185482025146484375;
    float _2601 = sin(_2599);
    float _2603 = fma(_2593, _2591, _2593);
    float _2605 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2225);
    float _2607 = fma(_2579, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2597);
    float _2609 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2583);
    bool _2611 = _2243 != 0.0;
    bool _2613 = isnan(_2243);
    bool _2615 = _2611 || _2613;
    bool _2617 = isnan(0.0);
    bool _2619 = _2615 || _2617;
    float _2621 = _2341 * _2605;
    float _2623 = fma(_2603, _2517, _2607);
    float _2625 = _2589 * 6.283185482025146484375;
    float _2627 = cos(_2625);
    float _2629 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2243);
    bool _2631 = _2225 == 0.0;
    bool _2633 = !_2619;
    bool _2635 = _2631 && _2633;
    float _2637 = _2623 * 0.15915493667125701904296875;
    float _2639 = _2263 * 2.0;
    float _2641 = _2355 * _2629;
    float _2643 = _283 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2645 = _283 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2647 = _2595 * 6.283185482025146484375;
    float _2649 = sin(_2647);
    float _2651 = -_2639;
    float _2653 = fma(_2339, _2651, _2339);
    float _2655 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2643);
    bool _2657 = _2227 == 0.0;
    bool _2659 = _2657 && _2635;
    float _2661 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2645);
    float _2663 = fma(_2263, 3.1415927410125732421875, _2653);
    float _2665 = _2595 * 6.283185482025146484375;
    float _2667 = cos(_2665);
    float _2669 = _2663 * 0.15915493667125701904296875;
    float _2671 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2661);
    float _2673 = _2637 * 6.283185482025146484375;
    float _2675 = cos(_2673);
    float _2677 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2227);
    float _2679 = _2601 * _2649;
    float _2681 = _2671;
    if (!_2659)
    {
        float _2683 = fma(_2243, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2363);
        _2429 = _2683;
    }
    float _2685 = _2429;
    float _2687 = _2357 * _2677;
    float _2689 = _2637 * 6.283185482025146484375;
    float _2691 = sin(_2689);
    float _2693 = _2627 * _2667;
    float _2695 = _2601 * _2667;
    float _2697 = _2627 * _2675;
    float _2699 = _2627 * _2649;
    float _2701 = _2601 * _2675;
    float _2703 = _2667 * _2675;
    float _2705 = _2697 * _2641;
    float _2707 = _2649 * _2675;
    float _2709 = _2701 * _2641;
    float _2711 = _2669 * 6.283185482025146484375;
    float _2713 = sin(_2711);
    float _2715 = fma(_2691, _2693, _2679);
    float _2717 = fma(_2691, _2679, _2693);
    float _2719 = -_2699;
    float _2721 = fma(_2691, _2695, _2719);
    float _2723 = -_2641;
    float _2725 = _2691 * _2723;
    float _2727 = -_2695;
    float _2729 = fma(_2691, _2699, _2727);
    float _2731 = fma(_2715, _2621, _2705);
    float _2733 = _2701 * _2685;
    float _2735 = fma(_2703, _2621, _2725);
    float _2737 = fma(_2721, _2621, _2709);
    float _2739 = fma(_2729, _2687, _2731);
    float _2741 = _2247 * 3.883221149444580078125;
    float _2743 = fma(_2707, _2687, _2735);
    float _2745 = fma(_2717, _2687, _2737);
    float _2747 = _2739 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2749 = _2739 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2751 = _2741 * 0.15915493667125701904296875;
    float _2753 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2655);
    float _2755 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2609);
    float _2757 = fma(_2743, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2747);
    float _2759 = fma(_2743, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2749);
    float _2761 = _2753 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2763 = _2755 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2765 = fma(_2745, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2757);
    float _2767 = fma(_2745, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2759);
    float _2769 = _2751 * 6.283185482025146484375;
    float _2771 = cos(_2769);
    float _2773 = _2739 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2775 = _2761 + _2765;
    float _2777 = _2763 + _2767;
    float _2779 = fma(_2743, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2773);
    float _2781 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2783 = _2775 + _2781;
    float _2785 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2787 = _2777 + _2785;
    float _2789 = _2751 * 6.283185482025146484375;
    float _2791 = sin(_2789);
    float _2793 = fma(_2745, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2779);
    float _2795 = _2783 * _2783;
    float _2797 = _2787 * _2787;
    float _2799 = _2697 * _2685;
    float _2801 = _2795 + _2797;
    float _2803 = -_2195;
    float _2805 = fma(_2713, _2771, _2803);
    float _2807 = sqrt(_2801);
    float _2809 = fma(_2189, _2805, _2195);
    float _2811 = -_2197;
    float _2813 = fma(_2713, _2791, _2811);
    float _2815 = _2671 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2817 = _2809;
    float _2819 = _2685;
    float _2821 = _2779;
    float _2823 = _2691;
    if (!_2659)
    {
        float _2825 = fma(_2225, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2809);
        _2817 = _2825;
    }
    float _2827 = _2817;
    float _2829 = fma(_2189, _2813, _2197);
    float _2831 = _2815 + _2793;
    float _2833 = -_2685;
    float _2835 = _2691 * _2833;
    float _2837 = _2829;
    if (!_2659)
    {
        float _2839 = fma(_2227, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2829);
        _2837 = _2839;
    }
    float _2841 = _2837;
    bool _2843 = _2807 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_2843)
    {
        _2819 = _2797;
    }
    float _2845 = _2819;
    float _2847 = _2845;
    if (!_2843)
    {
        _289 = _2795;
    }
    float _2849 = _289;
    float _2851 = _2849;
    if (!_2843)
    {
        _2821 = _2775;
    }
    float _2853 = _2821;
    float _2855 = _2853;
    if (!_2843)
    {
        _2823 = _2777;
    }
    float _2857 = _2823;
    float _2859 = _2857;
    if (!_2843)
    {
        _2681 = _2831;
    }
    float _2861 = _2681;
    bool _2863 = !_2843;
    float _2865 = _2861;
    if (!_2863)
    {
        float _2867 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2871 = _2807 + _2869;
        float _2873 = _2831 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2875 = rsqrt(_2801);
        float _2877 = _2871 * _2867;
        float _2879 = _2877 * 0.15915493667125701904296875;
        float _2881 = _2879 * 6.283185482025146484375;
        float _2883 = sin(_2881);
        float _2885 = _2879 * 6.283185482025146484375;
        float _2887 = cos(_2885);
        float _2889 = fma(_2883, _2873, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2891 = _2875 * _2889;
        float _2893 = _2887 + (-1.0);
        float _2895 = _2783 * _2891;
        float _2897 = _2787 * _2891;
        float _2899 = _2893 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2901 = _2897 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2903 = _2897 * _2897;
        float _2905 = fma(_2831, _2887, _2899);
        float _2907 = _2895 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2909 = _2895 * _2895;
        _2865 = _2905;
        _2851 = _2909;
        _2847 = _2903;
        _2855 = _2907;
        _2859 = _2901;
    }
    float _2911 = _2865;
    float _2913 = _2851;
    float _2915 = _2847;
    float _2917 = _2855;
    float _2919 = _2859;
    float _2921 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2923 = _2911 + _2921;
    float _2925 = fma(_2715, _2827, _2799);
    float _2927 = fma(_2703, _2827, _2835);
    float _2929 = fma(_2721, _2827, _2733);
    float _2931 = fma(_2923, _2923, _2913);
    float _2933 = fma(_2729, _2841, _2925);
    float _2935 = fma(_2707, _2841, _2927);
    float _2937 = fma(_2717, _2841, _2929);
    float _2939 = _2931 + _2915;
    float _2941 = _2933 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2943 = _2933 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2945 = _2933 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_71.x = _2018;
    out.m_71.y = _2012;
    float _2947 = fma(_2935, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2941);
    float _2949 = sqrt(_2939);
    float _2951 = fma(_2935, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2943);
    float _2953 = fma(_2935, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2945);
    float _2955 = fma(_2937, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2947);
    float _2957 = fma(_2937, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2951);
    float _2959 = fma(_2937, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2953);
    out.m_73.x = _2955;
    out.m_73.y = _2957;
    out.m_73.z = _2959;
    bool _2961 = _2949 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2963 = isnan(_2949);
    bool _2965 = _2961 || _2963;
    bool _2967 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2969 = _2965 || _2967;
    float _2971 = _2931;
    float _2973 = _2937;
    float _2975 = _2923;
    if (!_2969)
    {
        _2971 = 1.0;
    }
    float _2977 = _2971;
    bool _2979 = !_2969;
    float _2981 = _2977;
    if (!_2979)
    {
        bool _2983 = _2949 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2985 = isnan(_2949);
        bool _2987 = _2983 || _2985;
        bool _2989 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2991 = _2987 || _2989;
        if (!_2991)
        {
            float _2993 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2995 = _2949 + _2993;
            float _2997 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2999 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2997;
            float _3001 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3003 = _3001 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3005 = 1.0 / _2999;
            float _3007 = _2995 * _3005;
            float _3009 = fma(_3007, _3003, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2981 = _3009;
            _2041 = _3005;
            _3011 = true;
        }
        else
        {
            bool _3013 = _2949 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3015 = isnan(_2949);
            bool _3017 = _3013 || _3015;
            bool _3019 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3021 = _3017 || _3019;
            if (!_3021)
            {
                float _3023 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3025 = _2949 + _3023;
                float _3027 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3029 = _3027 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3031 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3033 = _3031 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3035 = 1.0 / _3029;
                float _3037 = _3025 * _3035;
                float _3039 = fma(_3037, _3033, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2981 = _3039;
                _2041 = _3035;
                _3011 = true;
            }
            else
            {
                _2981 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3011 = false;
    float _3041 = _2981;
    float _3043 = _2041;
    float _3045 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3047 = _2911 + _3045;
    float _3049 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3051 = _2917 + _3049;
    float _3053 = fma(_3047, _3041, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3055 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3057 = _2919 + _3055;
    float _3059 = fma(_3051, _3041, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3061 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3063 = _3053 + _3061;
    float _3065 = fma(_3057, _3041, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3067 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3069 = _3059 + _3067;
    float _3071 = _3063 * _3063;
    float _3073 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3075 = _3065 + _3073;
    float _3077 = fma(_3069, _3069, _3071);
    float _3079 = fma(_3075, _3075, _3077);
    float _3081 = rsqrt(_3079);
    float _3083 = _3081 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3085 = _3069 * _3083;
    float _3087 = _3075 * _3083;
    float _3089 = _3085 * _3085;
    float _3091 = _3087 * _3087;
    float _3093 = _3089 + _3091;
    float _3095 = sqrt(_3093);
    bool _3097 = _3095 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3099 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3101 = _3095 + _3099;
    float _3103 = _3081;
    float _3105 = _3101;
    float _3107 = _3085;
    if (_3097)
    {
        float _3109 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3103 = _3109;
    }
    float _3111 = _3103;
    if (_3097)
    {
        float _3113 = rsqrt(_3093);
        _2973 = _3113;
    }
    float _3115 = _2973;
    float _3117 = _3115;
    if (_3097)
    {
        float _3119 = _3101 * _3111;
        _3105 = _3119;
    }
    float _3121 = _3105;
    if (_3097)
    {
        float _3123 = _3121 * 0.15915493667125701904296875;
        _2043 = _3123;
    }
    float _3125 = _2043;
    float _3127 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3129 = _3075;
    if (_3097)
    {
        float _3131 = _3125 * 6.283185482025146484375;
        float _3133 = sin(_3131);
        _3129 = _3133;
    }
    float _3135 = _3129;
    float _3137 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3139 = precise::max(0.0, _3137);
    float _3141 = _3043;
    float _3143 = _3139;
    float _3145 = _3137;
    if (_3097)
    {
        float _3147 = _3125 * 6.283185482025146484375;
        float _3149 = cos(_3147);
        _3141 = _3149;
    }
    float _3151 = _3141;
    float _3153 = -_3083;
    float _3155 = -_3139;
    float _3157 = fma(_3063, _3153, _3155);
    if (_3097)
    {
        float _3159 = _3157 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3143 = _3159;
    }
    float _3161 = _3143;
    float _3163 = sqrt(_3079);
    float _3165 = _3053 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3167 = _3161;
    float _3169 = _3135;
    if (_3097)
    {
        float _3171 = fma(_3135, _3161, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3167 = _3171;
    }
    float _3173 = _3167;
    float _3175 = _3173;
    if (!_3097)
    {
        _3169 = _3087;
    }
    float _3177 = _3169;
    float _3179 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3165);
    float _3181 = _3177;
    if (_3097)
    {
        float _3183 = _3151 + (-1.0);
        _3145 = _3183;
    }
    float _3185 = _3145;
    float _3187 = _3185;
    if (_3097)
    {
        float _3189 = _3115 * _3173;
        _2975 = _3189;
    }
    float _3191 = _2975;
    if (!_3097)
    {
        _3117 = _3157;
    }
    float _3193 = _3117;
    float _3195 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3179);
    float _3197 = _3193;
    if (_3097)
    {
        float _3199 = _3185 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3187 = _3199;
    }
    float _3201 = _3187;
    float _3203 = _3201;
    if (_3097)
    {
        float _3205 = _3085 * _3191;
        _3107 = _3205;
    }
    float _3207 = _3107;
    if (!_3097)
    {
        _3175 = _3089;
    }
    float _3209 = _3175;
    float _3211 = _3209;
    if (_3097)
    {
        float _3213 = _3087 * _3191;
        _3181 = _3213;
    }
    float _3215 = _3181;
    if (_3097)
    {
        float _3217 = fma(_3157, _3151, _3201);
        _3197 = _3217;
    }
    float _3219 = _3197;
    if (_3097)
    {
        float _3221 = _3207 * _3207;
        _3211 = _3221;
    }
    float _3223 = _3211;
    if (!_3097)
    {
        _3203 = _3091;
    }
    float _3225 = _3203;
    float _3227 = _3225;
    if (_3097)
    {
        float _3229 = _3215 * _3215;
        _3227 = _3229;
    }
    float _3231 = _3227;
    float _3233 = fma(_3219, _3219, _3223);
    float _3235 = _3053 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3237 = _3195 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3239 = _3233 + _3231;
    float _3241 = _3053 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3245 = fma(_3163, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3243);
    float _3247 = precise::clamp(_3245, 0.0, 1.0);
    float _3249 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3235);
    float _3251 = rsqrt(_3239);
    float _3253 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3241);
    float _3255 = _3053 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3257 = -_3247;
    float _3259 = _3257 + 1.0;
    float _3261 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3253);
    float _3263 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3255);
    float _3265 = _3261 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3267 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3263);
    float _3269 = abs(_3259);
    float _3271 = log2(_3269);
    float _3273 = _3265 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3275 = _3267 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3277 = _3251 * _3207;
    float _3279 = -_3273;
    float _3281 = fma(_3279, _3127, 1.0);
    float _3283 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3249);
    float _3285 = _3251 * _3219;
    float _3287 = _3275 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3289 = _3277 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3291 = _3251 * _3215;
    float _3293 = _3283 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3295 = fma(_3237, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3287);
    float _3297 = -_3289;
    float _3299 = fma(_3285, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3297);
    float _3301 = log2(_3281);
    float _3303 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3305 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3295);
    float _3307 = -_3291;
    float _3309 = fma(_3307, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3299);
    float _3311 = _3275 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3313 = _3275 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3315 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3305);
    float _3317 = fma(_3309, -0.5, 0.5);
    float _3319 = exp2(_3303);
    float _3321 = fma(_3237, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3311);
    float _3323 = fma(_3237, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3313);
    float _3325 = fma(_3309, 0.5, 0.5);
    float _3327 = _3285 + 1.0;
    float _3329 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3321);
    float _3331 = fma(_3325, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3333 = 1.0 / _3315;
    float _3335 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3323);
    float _3337 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3329);
    float _3339 = fma(_3325, _3331, -0.212114393711090087890625);
    float _3341 = _3301 * 0.693147182464599609375;
    float _3343 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3335);
    float _3345 = fma(_3325, _3339, 1.570728778839111328125);
    float _3347 = sqrt(_3317);
    float _3349 = -_3285;
    float _3351 = fma(_3319, _3327, _3349);
    float _3353 = _3341 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3355 = fma(_3351, 0.5, 0.5);
    float _3357 = _3337 * _3333;
    float _3359 = _3343 * _3333;
    float _3361 = fma(_3357, 0.5, 0.5);
    float _3363 = fma(_3359, -0.5, 0.5);
    float _3365 = _3347 * 0.636619746685028076171875;
    float3 _8477 = float3(_3361, _3363, _3353);
    float _3367 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8477, float3(0.0), isnan(_8477)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8477, float3(0.0), isnan(_8477)), level(0.0)).x;
    float3 _8488 = float3(_3361, _3363, _3353);
    float4 _3369 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8488, float3(0.0), isnan(_8488)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8488, float3(0.0), isnan(_8488)), level(0.0)).xyzw;
    float _3371 = _3369.x;
    float _3373 = _3369.y;
    float _3375 = _3369.z;
    float _3377 = _3369.w;
    float _3379 = -_3345;
    float _3381 = fma(_3365, _3379, 1.0);
    float2 _8509 = float2(_3381, _3355);
    float3 _3385 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8509, float2(0.0), isnan(_8509)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8509, float2(0.0), isnan(_8509)), level(0.0)).xyz;
    float _3387 = _3385.x;
    float _3389 = _3385.y;
    float _3391 = _3385.z;
    float _3393 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3395 = _3275 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2761;
    out.m_75.y = _2815;
    out.m_75.z = _2763;
    float _3397 = fma(_3237, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3395);
    float _3399 = exp2(_3393);
    out.m_77.x = _3059;
    out.m_77.y = _3053;
    out.m_77.z = _3065;
    float _3401 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3397);
    out.m_49.x = 1.0;
    float _3403 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3401);
    float _3405 = _3403 + _3315;
    out.gl_Position.x = _3337;
    out.gl_Position.y = _3343;
    out.gl_Position.z = _3403;
    out.gl_Position.w = _3315;
    float _3407 = _3405 * 0.5;
    float _3409 = -_3399;
    float _3411 = _3409 + 1.0;
    float _3413 = _3411 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3415 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.z = _3407;
    out.m_79.w = _3315;
    out.m_81.w = _3415;
    float _3417 = _3413 * _3367;
    float _3419 = -_3413;
    float _3421 = _3419 + 1.0;
    float _3423 = _3377 * _3417;
    float _3425 = _3391 * _3417;
    float _3427 = fma(_3387, _3423, _3371);
    float _3429 = fma(_3389, _3423, _3373);
    float _3431 = _3377 * _3421;
    float _3433 = fma(_3377, _3425, _3375);
    out.m_83.x = _3427;
    out.m_83.y = _3429;
    out.m_83.z = _3433;
    out.m_83.w = _3431;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

