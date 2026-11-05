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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c9 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_14 [[id(11)]];
    sampler vp_t_tcb_14Smplr [[id(12)]];
    texture2d_array<float> vp_t_tcb_16 [[id(13)]];
    sampler vp_t_tcb_16Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_32 [[id(15)]];
    sampler vp_t_tcb_32Smplr [[id(16)]];
    texture3d<float> vp_t_tcb_30 [[id(17)]];
    sampler vp_t_tcb_30Smplr [[id(18)]];
    texture2d<float> vp_t_tcb_1C [[id(19)]];
    sampler vp_t_tcb_1CSmplr [[id(20)]];
    sampler vp_t_tcb_24Smplr_w [[id(21)]];
    sampler vp_t_tcb_14Smplr_w [[id(22)]];
    sampler vp_t_tcb_32Smplr_w [[id(23)]];
    sampler vp_t_tcb_30Smplr_w [[id(24)]];
    sampler vp_t_tcb_1CSmplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
};

struct main0_out
{
    float4 m_73 [[user(locn0)]];
    float4 m_85 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_97 [[user(locn3)]];
    float4 m_89 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_87 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_95 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 m_93 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_71 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_67 [[attribute(6)]];
    float4 m_69 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_83 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _112(thread const int& _8075, thread const int& _8076, constant _10& support_buffer)
{
    float _8079 = as_type<float>(support_buffer._m4);
    int _8081 = _8076 + as_type<int>(_8079);
    int _8083 = 1 + _8081;
    float _8085 = support_buffer._m5[_8083].x;
    float _8087 = abs(_8085);
    bool _8089 = _8087 == 1.0;
    if (_8089)
    {
        return _8075;
    }
    float _8091 = float(_8075);
    float _8093 = _8091 / _8087;
    int _8095 = int(_8093);
    return _8095;
}

static inline __attribute__((always_inline))
int _113(thread const int& _8125, thread const int& _8126, constant _10& support_buffer)
{
    float _8129 = as_type<float>(support_buffer._m4);
    int _8131 = _8126 + as_type<int>(_8129);
    int _8133 = 1 + _8131;
    float _8135 = support_buffer._m5[_8133].x;
    bool _8137 = _8135 == 1.0;
    if (_8137)
    {
        return _8125;
    }
    float _8139 = float(_8125);
    float _8141 = _8139 * _8135;
    int _8143 = int(_8141);
    return _8143;
}

static inline __attribute__((always_inline))
void _110(thread const int& _7771, thread const int& _7772, thread const int& _7773, thread const int& _7774, thread int& _7775, thread int& _7776, thread int& _7777, thread int& _7778, thread int& _7779, thread int& _7780, thread int& _7781, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _7784 = _7772;
    int _7786 = _7774;
    float _7788 = 0.0 + as_type<float>(_7771);
    bool _7790 = _7788 != 0.0;
    bool _7792 = isnan(_7788);
    bool _7794 = _7790 || _7792;
    bool _7796 = isnan(0.0);
    bool _7798 = _7794 || _7796;
    int _7800 = 0;
    int _7802 = _7798 ? (-1) : 0;
    if (!_7798)
    {
        float _7804 = as_type<float>(_7771) * 1.0;
        _7784 = as_type<int>(_7804);
    }
    int _7806 = _7784;
    bool _7808 = !_7798;
    int _7810 = _7806;
    int _7812 = _7806;
    if (!_7808)
    {
        bool _7814 = _7788 >= 0.0;
        bool _7816 = isnan(_7788);
        bool _7818 = _7814 || _7816;
        bool _7820 = isnan(0.0);
        bool _7822 = _7818 || _7820;
        _7802 = _7822 ? (-1) : 0;
        if (!_7822)
        {
            _7810 = 2147483647;
        }
        int _7824 = _7810;
        bool _7826 = !_7822;
        int _7828 = _7824;
        _7812 = _7824;
        if (!_7826)
        {
            float _7830 = abs(as_type<float>(_7771));
            float _7832 = 0.0 + _7830;
            bool _7834 = _7832 > as_type<float>(0x7f800000u /* inf */);
            bool _7836 = isnan(_7832);
            bool _7838 = _7834 || _7836;
            bool _7840 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _7842 = _7838 || _7840;
            _7800 = 2139095040;
            _7802 = _7842 ? (-1) : 0;
            if (_7842)
            {
                float _7844 = as_type<float>(_7771) + 1.0;
                _7828 = as_type<int>(_7844);
            }
            int _7846 = _7828;
            int _7848 = _7846;
            _7812 = _7846;
            if (!_7842)
            {
                bool _7850 = _7832 != as_type<float>(0x7f800000u /* inf */);
                bool _7852 = isnan(_7832);
                bool _7854 = _7850 || _7852;
                bool _7856 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _7858 = _7854 || _7856;
                _7802 = _7858 ? (-1) : 0;
                if (!_7858)
                {
                    _7848 = _7771;
                }
                int _7860 = _7848;
                bool _7862 = !_7858;
                _7812 = _7860;
                if (!_7862)
                {
                    float _7864 = as_type<float>(_7771) * 18446744073709551616.0;
                    float _7866 = rsqrt(_7864);
                    float _7868 = _7864 * _7866;
                    float _7870 = _7866 * 0.5;
                    float _7872 = -_7868;
                    float _7874 = 0.0 + _7872;
                    float _7876 = fma(_7870, _7874, 0.5);
                    float _7878 = fma(_7868, _7876, _7868);
                    float _7880 = -_7878;
                    float _7882 = 0.0 + _7880;
                    float _7884 = fma(_7878, _7882, _7864);
                    float _7886 = fma(_7870, _7884, _7878);
                    float _7888 = _7886 * 2.3283064365386962890625e-10;
                    _7812 = as_type<int>(_7888);
                    _7800 = as_type<int>(_7874);
                    _7786 = as_type<int>(_7878);
                }
            }
        }
    }
    int _7890 = _7812;
    int _7892 = _7800;
    int _7894 = _7786;
    int _7896 = _7802;
    _7775 = _7890;
    _7776 = _7890;
    _7777 = _7892;
    _7778 = _7773;
    _7779 = 0;
    _7780 = _7894;
    _7781 = _7896;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2887 = false;
    bool _943 = false;
    bool _751 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_58.w;
    float _119 = trunc(_117);
    int _121 = int(_119);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    float _129 = as_type<float>(_121);
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _127;
    float _133 = _131;
    if (!_125)
    {
        out.m_61.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3136 = as_type<float>(_139);
        out.gl_Position.z = _3136;
    }
    if (!_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_63.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = _157;
    if (_153)
    {
        float _161 = float(_121);
        _133 = _161;
    }
    float _163 = _133;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    if (_169)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _129;
    if (_169)
    {
        out.m_61.x = 0.0;
    }
    if (_169)
    {
        float _173 = _171 * 5.0;
        _141 = as_type<int>(_173);
    }
    int _175 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3205 = as_type<float>(_175);
        out.gl_Position.z = _3205;
    }
    if (_169)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    int _177 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _179 = _177;
    int _181 = 0;
    int _183 = _112(_179, _181, (*spvDescriptorSet0.support_buffer));
    float _185 = _157 * 0.0500000007450580596923828125;
    float _187 = in.m_65.z;
    float _189 = trunc(_187);
    int _191 = int(_189);
    float _193 = float(_183);
    int _195 = abs(_183);
    bool _197 = _183 == 0;
    float _199 = _185 * _193;
    float _201 = float(uint(_195));
    float _203 = trunc(_199);
    int _205 = int(_203);
    float _207 = 1.0 / _201;
    int _209 = abs(_205);
    uint _212 = uint(int(uint(_205) >> uint(31)));
    float _214 = float(uint(_209));
    int _216 = ~int(_212);
    int _218 = _216 + 1;
    int _220 = as_type<int>(_207) + (-2);
    float _222 = as_type<float>(_220) * _214;
    float _224 = trunc(_222);
    float _226 = precise::max(_224, 0.0);
    uint _228 = uint(_226);
    int _230 = ~int(_228);
    int _232 = _230 + 1;
    int _234 = _232 * _195;
    int _236 = _234 + _209;
    float _238 = float(uint(_236));
    float _240 = as_type<float>(_220) * _238;
    float _242 = trunc(_240);
    float _244 = precise::max(_242, 0.0);
    uint _246 = uint(_244);
    int _248 = int(_228) + int(_246);
    int _250 = ~_248;
    int _252 = _250 + 1;
    int _254 = _252 * _195;
    int _256 = _254 + _209;
    bool _258 = uint(_256) >= uint(_195);
    bool _260 = !_258;
    int _262 = _260 ? 0 : (-1);
    int _264 = ~_248;
    int _266 = _264 + _262;
    int _268 = _266 + 1;
    int _270 = _268 * _195;
    int _272 = _270 + _209;
    int _274 = _272 ^ _218;
    int _276 = ~_218;
    int _278 = _276 + _274;
    int _280 = _278 + 1;
    bool _282 = !_197;
    int _284 = _282 ? _280 : (-1);
    int _286 = _284;
    int _288 = 0;
    int _290 = _113(_286, _288, (*spvDescriptorSet0.support_buffer));
    int _292 = _191;
    int _294 = 0;
    int _296 = _113(_292, _294, (*spvDescriptorSet0.support_buffer));
    float4 _299 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_290, _296)), 0).xyzw;
    float _301 = _299.x;
    float _303 = _299.y;
    float _305 = _299.z;
    float _307 = _299.w;
    float _309 = in.m_67.w;
    float _311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _315 = _313 != 0;
    float _317 = in.m_65.y;
    int _319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _321 = _319 != 0;
    float _323 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _327 = _325 != 0;
    float _329 = in.m_65.x;
    float _331 = in.m_69.w;
    float _333 = as_type<float>(_256);
    float _335 = _317;
    if (_315)
    {
        float _337 = in.m_67.z;
        _333 = _337;
    }
    float _339 = _333;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _343 = _311 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _345 = 0.0;
    if (!_321)
    {
        float _347 = in.m_67.z;
        _345 = _347;
    }
    float _349 = _345;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _353 = _309 > 0.5;
    bool _355 = _353 && _327;
    float _357 = 0.0;
    float _359 = _309;
    if (!_321)
    {
        float _361 = in.m_67.y;
        _357 = _361;
    }
    float _363 = _357;
    float _365 = _329;
    if (_315)
    {
        _359 = _329;
    }
    float _367 = _359;
    float _369 = _367;
    if (_355)
    {
        float _371 = -_317;
        float _373 = _371 + 1.0;
        _335 = _373;
    }
    float _375 = _335;
    bool _377 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _381 = _377 || _379;
    bool _383 = isnan(1.0);
    bool _385 = _381 || _383;
    bool _387 = _339 > 0.5;
    bool _389 = _387 && _315;
    float _391 = fma(_343, _375, -0.5);
    float _393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _395 = 0.0;
    float _397 = _349;
    if (!_321)
    {
        _395 = _349;
    }
    float _399 = _395;
    float _401 = _363;
    float _403 = _399;
    if (_321)
    {
        float _405 = in.m_67.x;
        float _407 = in.m_67.y;
        _401 = _405;
        _403 = _407;
    }
    float _409 = _401;
    float _411 = _403;
    if (_389)
    {
        float _413 = -_367;
        float _415 = _413 + 1.0;
        _369 = _415;
    }
    float _417 = _369;
    if (_315)
    {
        _365 = _417;
    }
    float _419 = _365;
    float _421 = _393 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _423 = in.m_63.x;
    float _425 = in.m_63.y;
    float _427 = in.m_63.z;
    float _429 = fma(_421, _419, -0.5);
    float _431 = in.m_58.x;
    float _433 = in.m_58.y;
    float _435 = in.m_58.z;
    if (_321)
    {
        _397 = _411;
    }
    float _437 = _397;
    float _439 = _411 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _441 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[83].z, _341);
    float _443 = _409 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _449 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[83].w, _351);
    float _451 = _437;
    float _453 = _445;
    if (!_385)
    {
        float _455 = _323 * _323;
        float _457 = _455 * 0.5;
        _451 = _457;
    }
    float _459 = _451;
    float _461 = -_445;
    float _463 = fma(_443, 2.0, _461);
    float _465 = fma(_439, -2.0, _447);
    float _467 = _459;
    if (!_385)
    {
        _453 = _323;
    }
    float _469 = _453;
    float _471 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _441);
    float _473 = -_157;
    float _475 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[81].x, _463);
    float _477 = _469;
    if (!_385)
    {
        float _479 = _459 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _467 = _479;
    }
    float _481 = _467;
    bool _483 = !_385;
    float _485 = _481;
    if (!_483)
    {
        float _487 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _489 = log2(_487);
        float _491 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _493 = _491 + 1.0;
        float _495 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _497 = _323 * _489;
        float _499 = 1.0 / _493;
        float _501 = _495 * 0.693147182464599609375;
        float _503 = exp2(_497);
        float _505 = 1.0 / _501;
        float _507 = _503 + (-1.0);
        float _509 = -_507;
        float _511 = fma(_509, _505, _323);
        float _513 = _511 * _499;
        float _515 = _513 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _485 = _515;
    }
    float _517 = _485;
    bool _519 = !_385;
    if (!_519)
    {
        float _521 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _523 = log2(_521);
        float _525 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _527 = _525 + 1.0;
        float _529 = 1.0 / _527;
        float _531 = _323 * _523;
        float _533 = exp2(_531);
        float _535 = -_533;
        float _537 = _535 + 1.0;
        float _539 = _537 * _529;
        _477 = _539;
    }
    float _541 = _477;
    float _543 = fma(_471, _429, _475);
    float _545 = _517 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _547 = _517 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _549 = _517 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _551 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _465);
    float _553 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _449);
    float _555 = fma(_541, _423, _545);
    float _557 = fma(_541, _425, _547);
    float _559 = fma(_541, _427, _549);
    int _561 = _284 + 1;
    float _563 = -_551;
    float _565 = fma(_553, _391, _563);
    float _567 = fma(_555, _331, _431);
    float _569 = fma(_559, _331, _435);
    int _571 = abs(_561);
    float _573 = fma(_557, _331, _433);
    uint _575 = as_type<uint>(half2(float2(_307, 0.0)));
    float _577 = float(uint(_571));
    float _579 = _543 + 0.5;
    uint _581 = extract_bits(_575, 0u, 8u);
    int _583 = int(_581) & 255;
    uint _585 = extract_bits(_575, 8u, 8u);
    int _587 = int(_585) & 255;
    int _589 = _587 << 8;
    int _591 = _583 | _589;
    float _593 = _565 + 0.5;
    uint _595 = uint(int(uint(_561) >> uint(31)));
    float _597 = as_type<float>(_220) * _577;
    int _599 = ~int(_595);
    int _601 = _599 + 1;
    float _603 = trunc(_597);
    float _605 = precise::max(_603, 0.0);
    uint _607 = uint(_605);
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _613 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _615 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _617 = ~int(_607);
    int _619 = _617 + 1;
    int _621 = _619 * _195;
    int _623 = _621 + _571;
    float _625 = float(uint(_623));
    float _627 = as_type<float>(_220) * _625;
    float _629 = trunc(_627);
    float _631 = precise::max(_629, 0.0);
    uint _633 = uint(_631);
    int _635 = int(_607) + int(_633);
    int _637 = ~_635;
    int _639 = _637 + 1;
    int _641 = _639 * _195;
    int _643 = _641 + _571;
    bool _645 = uint(_643) >= uint(_195);
    bool _647 = !_645;
    int _649 = _647 ? 0 : (-1);
    bool _651 = _591 >= 32768;
    int _653 = ~_635;
    int _655 = _653 + _649;
    int _657 = _655 + 1;
    int _659 = _591 + (-1024);
    int _661 = _657 * _195;
    int _663 = _661 + _571;
    int _665 = _663 ^ _601;
    int _667 = _659;
    if (_651)
    {
        int _669 = ~_591;
        int _671 = _669 + 33792;
        int _673 = _671 + 1;
        _667 = _673;
    }
    int _675 = _667;
    int _677 = _675 + 30719;
    int _679 = ~_601;
    int _681 = _679 + _665;
    int _683 = _681 + 1;
    float _685 = float(_677);
    bool _687 = !_197;
    int _689 = _687 ? _683 : (-1);
    float _691 = fma(_685, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _695 = abs(_691);
    float _697 = -_695;
    float _699 = _697 + 1.0;
    float _701 = abs(_691);
    float _703 = fma(_701, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _705 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _707 = _691 < 0.0;
    float _709 = float(_707);
    int _711 = as_type<int>(_699) + (-218103808);
    float _713 = abs(_691);
    float _715 = fma(_713, _703, -0.212114393711090087890625);
    bool _717 = uint(_711) >= 1920991232u;
    float _719 = abs(_691);
    float _721 = fma(_719, _715, 1.570728778839111328125);
    bool _723 = !_717;
    int _725 = as_type<int>(_699);
    float _749;
    if (!_723)
    {
        int _727 = as_type<int>(_699);
        int _729 = as_type<int>(_699);
        int _731 = 3136;
        int _733 = as_type<int>(_565);
        int _735;
        int _737;
        int _739;
        int _741;
        int _743;
        int _745;
        int _747;
        _110(_727, _729, _731, _733, _735, _737, _739, _741, _743, _745, _747, out.gl_Position, out.gl_PointSize);
        _749 = as_type<float>(_735);
        _725 = _737;
        _751 = true;
    }
    else
    {
        float _753 = rsqrt(_699);
        float _755 = _699 * _753;
        float _757 = _753 * 0.5;
        float _759 = -_755;
        float _761 = 0.0 + _759;
        float _763 = fma(_757, _761, 0.5);
        float _765 = fma(_755, _763, _755);
        float _767 = -_765;
        float _769 = 0.0 + _767;
        float _771 = fma(_765, _769, _699);
        float _773 = fma(_757, _771, _765);
        _749 = _773;
    }
    _751 = false;
    float _775 = _749;
    int _777 = _725;
    int _779 = _689;
    int _781 = 0;
    int _783 = _113(_779, _781, (*spvDescriptorSet0.support_buffer));
    int _785 = _191;
    int _787 = 0;
    int _789 = _113(_785, _787, (*spvDescriptorSet0.support_buffer));
    float4 _791 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_783, _789)), 0).xyzw;
    float _793 = _791.x;
    float _795 = _791.y;
    float _797 = _791.z;
    float _799 = _791.w;
    float _801 = _721 * _775;
    float _803 = _709 * 2.0;
    float _805 = _685 * 3.883221149444580078125;
    float _807 = floor(_199);
    float _809 = -_803;
    float _811 = fma(_801, _809, _801);
    float _813 = _805 * 0.15915493667125701904296875;
    float _815 = fma(_709, 3.1415927410125732421875, _811);
    float _817 = _813 * 6.283185482025146484375;
    float _819 = cos(_817);
    float _821 = _815 * 0.15915493667125701904296875;
    float _823 = _821 * 6.283185482025146484375;
    float _825 = sin(_823);
    float _827 = -_807;
    float _829 = _199 + _827;
    float _831 = _813 * 6.283185482025146484375;
    float _833 = sin(_831);
    float _835 = _825 * _819;
    float _837 = _825 * _833;
    uint _839 = as_type<uint>(half2(float2(_799, 0.0)));
    float _841 = -_301;
    float _843 = _841 + _793;
    uint _845 = extract_bits(_839, 0u, 8u);
    int _847 = int(_845) & 255;
    uint _849 = extract_bits(_839, 8u, 8u);
    int _851 = int(_849) & 255;
    int _853 = _851 << 8;
    int _855 = _847 | _853;
    float _857 = fma(_829, _843, _301);
    bool _859 = _855 >= 32768;
    int _861 = _855 + (-1024);
    int _863 = _861;
    if (_859)
    {
        int _865 = ~_855;
        int _867 = _865 + 33792;
        int _869 = _867 + 1;
        _863 = _869;
    }
    int _871 = _863;
    int _873 = _871 + 30719;
    float _875 = float(_873);
    float _877 = fma(_875, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _879 = -_303;
    float _881 = _879 + _795;
    float _883 = abs(_877);
    float _885 = -_883;
    float _887 = _885 + 1.0;
    float _889 = abs(_877);
    float _891 = fma(_889, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _893 = fma(_829, _881, _303);
    int _895 = as_type<int>(_887) + (-218103808);
    float _897 = abs(_877);
    float _899 = fma(_897, _891, -0.212114393711090087890625);
    bool _901 = uint(_895) >= 1920991232u;
    float _903 = -_305;
    float _905 = _903 + _797;
    bool _907 = _877 < 0.0;
    float _909 = float(_907);
    float _911 = abs(_877);
    float _913 = fma(_911, _899, 1.570728778839111328125);
    float _915 = fma(_829, _905, _305);
    bool _917 = !_901;
    float _941;
    if (!_917)
    {
        int _919 = as_type<int>(_887);
        int _921 = _777;
        int _923 = 4032;
        int _925 = as_type<int>(_887);
        int _927;
        int _929;
        int _931;
        int _933;
        int _935;
        int _937;
        int _939;
        _110(_919, _921, _923, _925, _927, _929, _931, _933, _935, _937, _939, out.gl_Position, out.gl_PointSize);
        _941 = as_type<float>(_927);
        _943 = true;
    }
    else
    {
        float _945 = rsqrt(_887);
        float _947 = _887 * _945;
        float _949 = _945 * 0.5;
        float _951 = -_947;
        float _953 = 0.0 + _951;
        float _955 = fma(_949, _953, 0.5);
        float _957 = fma(_947, _955, _947);
        float _959 = -_957;
        float _961 = 0.0 + _959;
        float _963 = fma(_957, _961, _887);
        float _965 = fma(_949, _963, _957);
        _941 = _965;
    }
    _943 = false;
    float _967 = _941;
    float _969 = _573 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _971 = _573 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _973 = fma(_567, (*spvDescriptorSet0.vp_c10)._m0[4].x, _969);
    float _975 = fma(_567, (*spvDescriptorSet0.vp_c10)._m0[6].x, _971);
    float _977 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[4].z, _973);
    float _979 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[6].z, _975);
    float _981 = _977 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _983 = _979 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _985 = fma(_981, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _987 = fma(_983, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _989 = floor(_985);
    float _991 = floor(_987);
    float _993 = -_989;
    float _995 = _985 + _993;
    float _997 = -_991;
    float _999 = _987 + _997;
    float2 _4329 = float2(_995, _999);
    float _1001 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4329, float2(0.0), isnan(_4329)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4329, float2(0.0), isnan(_4329)), level(0.0)).x;
    float _1003 = in.m_67.x;
    float _1005 = in.m_67.y;
    float _1007 = in.m_67.z;
    float _1009 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1011 = log2(_1009);
    float _1013 = _573 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1015 = fma(_567, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1013);
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1023 = _1021 != 0;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1027 = _1025 != 0;
    float _1029 = _1011 * _157;
    float _1031 = exp2(_1029);
    float _1033 = _1007 * 2.0;
    float _1035 = _1003 * 2.0;
    float _1037 = _1005 * 2.0;
    float _1039 = _1005 + _1007;
    float _1041 = _1003 + _1007;
    float _1043 = _1007 + (-0.5);
    float _1045 = _1005 + _1003;
    float _1047 = floor(_1033);
    float _1049 = _1003 + (-0.5);
    float _1051 = _1041 + (-1.0);
    float _1053 = _1045 + (-1.0);
    float _1055 = floor(_1035);
    float _1057 = _1005 + (-0.5);
    float _1059 = -_1031;
    float _1061 = _1059 + 1.0;
    bool _1063 = _1047 > 0.0;
    float _1065 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1015);
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1069 = 1.0 + _1067;
    bool _1071 = _1047 >= 0.0;
    bool _1073 = isnan(_1047);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan(0.0);
    bool _1079 = _1075 || _1077;
    float _1081 = floor(_1037);
    float _1083 = _1039 + (-1.0);
    float _1085 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1087 = _1079 ? 0 : 1;
    float _1089 = _1065 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1091 = _1055 >= 0.0;
    bool _1093 = isnan(_1055);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan(0.0);
    bool _1099 = _1095 || _1097;
    bool _1101 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1103 = isnan(1.0);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1109 = _1105 || _1107;
    float _1111 = 1.0 / _1069;
    bool _1113 = _1055 > 0.0;
    float _1115 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1117 = _1099 ? 0 : 1;
    float _1119 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1121 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1123 = isnan(0.0);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1129 = _1125 || _1127;
    float _1131 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1115);
    int _1133 = ~_1087;
    int _1135 = _1133 + 1;
    int _1137 = _1135 + 1;
    float _1139 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1119);
    float _1141 = _1129 ? _1061 : 0.0;
    float _1143 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1131);
    int _1145 = _1137;
    int _1147 = 2;
    if (!_1063)
    {
        int _1149 = ~_1087;
        int _1151 = _1149 + 1;
        _1145 = _1151;
    }
    int _1153 = _1145;
    float _1155 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1139);
    bool _1157 = !_1023;
    int _1159 = _1157 ? 0 : 1;
    float _1161 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1163 = _1081 > 0.0;
    if (_1109)
    {
        float _1165 = _1141 * _1111;
        _159 = _1165;
    }
    float _1167 = _159;
    bool _1169 = _1081 >= 0.0;
    bool _1171 = isnan(_1081);
    bool _1173 = _1169 || _1171;
    bool _1175 = isnan(0.0);
    bool _1177 = _1173 || _1175;
    float _1179 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _1181 = ~_1117;
    int _1183 = _1181 + 1;
    int _1185 = _1183 + 1;
    float _1187 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1189 = _1185;
    if (!_1113)
    {
        int _1191 = ~_1117;
        int _1193 = _1191 + 1;
        _1189 = _1193;
    }
    int _1195 = _1189;
    int _1197 = abs(_1159);
    float _1199 = in.m_71.x;
    float _1201 = in.m_71.y;
    float _1203 = in.m_71.z;
    bool _1205 = !_1019;
    int _1207 = _1205 ? 0 : 1;
    float _1209 = float(_1153);
    float _1211 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1213 = abs(_1207);
    float _1215 = _1089 + _1179;
    int _1217 = _1177 ? 0 : 1;
    float _1219 = float(_1213);
    float _1221 = float(_1197);
    int _1223 = ~_1217;
    int _1225 = _1223 + 1;
    int _1227 = _1225 + 1;
    float _1229 = _1219 * _1209;
    float _1231 = float(_1195);
    float _1233 = _1215 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _1235 = _1227;
    if (!_1163)
    {
        int _1237 = ~_1217;
        int _1239 = _1237 + 1;
        _1235 = _1239;
    }
    int _1241 = _1235;
    float _1243 = _1229 * (-2.0);
    float _1245 = _1215 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1247 = fma(_981, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1233);
    float _1249 = _1221 * _1231;
    float _1251 = fma(_1085, _1243, _1085);
    bool _1253 = !_1027;
    int _1255 = _1253 ? 0 : 1;
    float _1257 = fma(_1243, _1199, _1199);
    float _1259 = fma(_983, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1247);
    float _1261 = float(_1241);
    float _1263 = 1.0 / _1161;
    float _1265 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1257);
    int _1267 = abs(_1255);
    float _1269 = _1259 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1271 = _1249 * (-2.0);
    float _1273 = fma(_981, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1245);
    float _1275 = float(_1267);
    float _1277 = fma(_1251, _1167, _1265);
    float _1279 = fma(_1271, _1201, _1201);
    float _1281 = fma(_1211, _1271, _1211);
    float _1283 = _1275 * _1261;
    float _1285 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1279);
    float _1287 = fma(_983, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1273);
    float _1289 = trunc(_1269);
    int _1291 = int(_1289);
    float _1293 = _1283 * (-2.0);
    float _1295 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1297 = in.m_69.x;
    float _1299 = in.m_69.y;
    float _1301 = in.m_69.z;
    float _1303 = _1287 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1305 = fma(_1293, _1203, _1203);
    float _1307 = fma(_1295, _1293, _1295);
    float _1309 = _1187 + _1161;
    float _1311 = _1277 * 0.15915493667125701904296875;
    float _1313 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1305);
    float _1315 = trunc(_1303);
    int _1317 = int(_1315);
    float _1319 = _1309 * _1263;
    float _1321 = _1319 * 0.5;
    float _1323 = fma(_1281, _1167, _1285);
    float _1325 = fma(_1307, _1167, _1313);
    float _1327 = _1323 * 0.15915493667125701904296875;
    float _1329 = _1325 * 0.15915493667125701904296875;
    float _1331 = _1311 * 6.283185482025146484375;
    float _1333 = sin(_1331);
    float _1335 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1337 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1335);
    float _1339 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _915);
    int _1341 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1343 = _1291 + _1341;
    int _1345 = _1343 + 1;
    float _1347 = (*spvDescriptorSet0.vp_c10)._m0[9].x * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1349 = _1311 * 6.283185482025146484375;
    float _1351 = cos(_1349);
    int _1353 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1355 = _1317 + _1353;
    int _1357 = _1355 + 1;
    float _1359 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1361 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _1363 = _1345 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1365 = fma((*spvDescriptorSet0.vp_c10)._m0[8].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1347);
    int _1367 = _1345 | _1357;
    float _1369 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1371 = _1327 * 6.283185482025146484375;
    float _1373 = sin(_1371);
    float _1375 = in.m_65.y;
    float _1377 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _857);
    float _1379 = _1359 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1381 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1383 = _1369 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1385 = _1367 < 0;
    bool _1387 = _1385 || _1363;
    float _1389 = _1327 * 6.283185482025146484375;
    float _1391 = cos(_1389);
    float _1393 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _893);
    float _1395 = _1377 * _1379;
    float _1397 = _1339 * _1381;
    bool _1399 = _1357 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1401 = _1399 || _1387;
    float _1403 = _1393 * _1383;
    float _1405 = 1.0 / _1337;
    float _1407 = _1351 * _1373;
    float _1409 = _1333 * _1373;
    float _1411 = fma((*spvDescriptorSet0.vp_c10)._m0[10].x, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1365);
    float _1413 = _1329 * 6.283185482025146484375;
    float _1415 = cos(_1413);
    float _1417 = _1351 * _1391;
    float _1419 = _1333 * _1391;
    float _1421 = -_1375;
    float _1423 = _1421 + 0.85000002384185791015625;
    float _1425 = precise::clamp(_1423, 0.0, 1.0);
    int _1427 = _1345;
    int _1429 = as_type<int>(_1375);
    int _1431 = _1357;
    if (!_1401)
    {
        int _1433 = _1357 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1435 = _1433 + _1345;
        _1427 = _1435;
    }
    int _1437 = _1427;
    float _1439 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1441 = _1329 * 6.283185482025146484375;
    float _1443 = sin(_1441);
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1447 = _1405 * _1445;
    float _1449 = as_type<float>(_1437);
    if (!_1401)
    {
        int _1451 = _1437 << 2;
        _1429 = _1451;
    }
    int _1453 = _1429;
    float _1455 = _1439 * 0.15915493667125701904296875;
    int _1457 = _1453;
    if (!_1401)
    {
        uint _1459 = uint(int(uint(_1437) >> uint(2)));
        _1431 = int(_1459);
    }
    int _1461 = _1431;
    bool _1463 = _1447 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1465 = _1351 * _1415;
    float _1467 = _1333 * _1415;
    float _1469 = _1391 * _1415;
    bool _1471 = _1447 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1473 = _1373 * _1415;
    float _1475 = rsqrt(_1411);
    if (!_1401)
    {
        int _1477 = 12 & _1453;
        _1457 = _1477;
    }
    int _1479 = _1457;
    float _1481 = fma(_1443, _1417, _1409);
    float _1483 = -_1407;
    float _1485 = fma(_1443, _1419, _1483);
    float _1487 = fma(_1443, _1409, _1417);
    float _1489 = -_1419;
    float _1491 = fma(_1443, _1407, _1489);
    float _1493 = -_1403;
    float _1495 = _1443 * _1493;
    float _1497 = _1465 * _1403;
    float _1499 = _1467 * _1403;
    float _1501 = _1455 * 6.283185482025146484375;
    float _1503 = cos(_1501);
    float _1505 = fma(_1469, _1395, _1495);
    float _1507 = fma(_1481, _1395, _1497);
    float _1509 = fma(_1485, _1395, _1499);
    if (!_1463)
    {
        _1147 = 1;
    }
    int _1511 = _1147;
    float _1513 = fma(_1473, _1397, _1505);
    float _1515 = fma(_1491, _1397, _1507);
    float _1517 = fma(_1487, _1397, _1509);
    bool _1519 = !_1463;
    int _1521 = _1519 ? 0 : 1;
    float _1523 = _1455 * 6.283185482025146484375;
    float _1525 = sin(_1523);
    float _1527 = _1515 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1529 = _1515 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1531 = _1511;
    if (!_1471)
    {
        _1531 = _1521;
    }
    int _1533 = _1531;
    float _1535 = _1515 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1537 = _1475 * (*spvDescriptorSet0.vp_c10)._m0[10].x;
    float _1539 = fma(_1513, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1529);
    int _1541 = _1533 << 6;
    float _1543 = fma(_1513, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1527);
    float _1545 = fma(_1513, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1535);
    float _1547 = _1475 * (*spvDescriptorSet0.vp_c10)._m0[8].x;
    int _1549 = _1541 + 96;
    uint _1551 = uint(int(uint(_1549) >> uint(2)));
    uint _1553 = uint(int(uint(int(_1551)) >> uint(2)));
    int _1555 = int(_1551) & 3;
    float _1557 = (*spvDescriptorSet0.vp_c15)._m0[int(_1553)][_1555];
    int _1559 = int(_1551) + 1;
    uint _1561 = uint(int(uint(_1559) >> uint(2)));
    int _1563 = _1559 & 3;
    float _1565 = (*spvDescriptorSet0.vp_c15)._m0[int(_1561)][_1563];
    float _1567 = _1475 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1569 = -_1503;
    float _1571 = _1569 + 1.0;
    float _1573 = _1537 * _1537;
    float _1575 = fma(_1517, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1543);
    float _1577 = fma(_1517, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1539);
    float _1579 = fma(_1517, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1545);
    float _1581 = _1547 * _1571;
    float _1583 = fma(_1571, _1573, _1503);
    int _1585 = _1541 + 104;
    uint _1587 = uint(int(uint(_1585) >> uint(2)));
    uint _1589 = uint(int(uint(int(_1587)) >> uint(2)));
    int _1591 = int(_1587) & 3;
    float _1593 = (*spvDescriptorSet0.vp_c15)._m0[int(_1589)][_1591];
    int _1595 = int(_1587) + 1;
    uint _1597 = uint(int(uint(_1595) >> uint(2)));
    int _1599 = _1595 & 3;
    float _1601 = (*spvDescriptorSet0.vp_c15)._m0[int(_1597)][_1599];
    float _1603 = _1547 * _1525;
    float _1605 = _1567 * _1571;
    float _1607 = _1537 * _1525;
    float _1609 = _1567 * _1525;
    float _1611 = fma(_1547, _1581, _1503);
    float _1613 = fma(_1537, _1605, _1603);
    float _1615 = -_1607;
    float _1617 = fma(_1567, _1581, _1615);
    int _1619 = _1541 + 64;
    uint _1621 = uint(int(uint(_1619) >> uint(2)));
    uint _1623 = uint(int(uint(int(_1621)) >> uint(2)));
    int _1625 = int(_1621) & 3;
    float _1627 = (*spvDescriptorSet0.vp_c15)._m0[int(_1623)][_1625];
    int _1629 = int(_1621) + 1;
    uint _1631 = uint(int(uint(_1629) >> uint(2)));
    int _1633 = _1629 & 3;
    float _1635 = (*spvDescriptorSet0.vp_c15)._m0[int(_1631)][_1633];
    float _1637 = -_1609;
    float _1639 = fma(_1537, _1581, _1637);
    float _1641 = _1577 * _1613;
    float _1643 = _1577 * _1617;
    float _1645 = fma(_1537, _1581, _1609);
    float _1647 = 0.0;
    float _1649 = _1537;
    float _1651 = as_type<float>(_1533);
    if (!_1401)
    {
        int _1653 = _1461 << 4;
        int _1655 = _1653 + _1479;
        _1647 = as_type<float>(_1655);
    }
    float _1657 = _1647;
    float _1659 = fma(_1575, _1639, _1641);
    float _1661 = fma(_1575, _1611, _1643);
    int _1663 = _1541 + 48;
    uint _1665 = uint(int(uint(_1663) >> uint(2)));
    uint _1667 = uint(int(uint(int(_1665)) >> uint(2)));
    int _1669 = int(_1665) & 3;
    float _1671 = (*spvDescriptorSet0.vp_c15)._m0[int(_1667)][_1669];
    int _1673 = int(_1665) + 1;
    uint _1675 = uint(int(uint(_1673) >> uint(2)));
    int _1677 = _1673 & 3;
    float _1679 = (*spvDescriptorSet0.vp_c15)._m0[int(_1675)][_1677];
    float _1681 = fma(_1567, _1605, _1503);
    float _1683 = fma(_1579, _1583, _1659);
    float _1685 = fma(_1579, _1645, _1661);
    float _1687 = -_1603;
    float _1689 = fma(_1537, _1605, _1687);
    float _1691 = fma(_1567, _1581, _1607);
    float _1693 = _983 + _1683;
    float _1695 = _981 + _1685;
    int _1697 = _1541 + 56;
    uint _1699 = uint(int(uint(_1697) >> uint(2)));
    uint _1701 = uint(int(uint(int(_1699)) >> uint(2)));
    int _1703 = int(_1699) & 3;
    float _1705 = (*spvDescriptorSet0.vp_c15)._m0[int(_1701)][_1703];
    int _1707 = int(_1699) + 1;
    uint _1709 = uint(int(uint(_1707) >> uint(2)));
    int _1711 = _1707 & 3;
    float _1713 = (*spvDescriptorSet0.vp_c15)._m0[int(_1709)][_1711];
    float _1715 = _1693;
    if (!_1401)
    {
        float _1717 = floor(_1303);
        _1649 = _1717;
    }
    float _1719 = _1649;
    float _1721 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1723 = _1693 + _1721;
    float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1727 = _1695 + _1725;
    float _1729 = _1577 * _1681;
    float _1731 = _1723 * _1723;
    int _1733 = _1541 + 72;
    uint _1735 = uint(int(uint(_1733) >> uint(2)));
    uint _1737 = uint(int(uint(int(_1735)) >> uint(2)));
    int _1739 = int(_1735) & 3;
    float _1741 = (*spvDescriptorSet0.vp_c15)._m0[int(_1737)][_1739];
    int _1743 = int(_1735) + 1;
    uint _1745 = uint(int(uint(_1743) >> uint(2)));
    int _1747 = _1743 & 3;
    float _1749 = (*spvDescriptorSet0.vp_c15)._m0[int(_1745)][_1747];
    float _1751 = fma(_1575, _1691, _1729);
    float _1753 = fma(_1727, _1727, _1731);
    float _1755 = fma(_1579, _1689, _1751);
    float _1757 = sqrt(_1753);
    float _1759 = _1657;
    if (!_1401)
    {
        int _1761 = as_type<int>(_1657) + 400;
        uint _1763 = uint(int(uint(_1761) >> uint(2)));
        uint _1765 = uint(int(uint(int(_1763)) >> uint(2)));
        int _1767 = int(_1763) & 3;
        float _1769 = (*spvDescriptorSet0.vp_c15)._m0[int(_1765)][_1767];
        _1759 = _1769;
    }
    float _1771 = _1759;
    int _1773 = _1541 + 80;
    uint _1775 = uint(int(uint(_1773) >> uint(2)));
    uint _1777 = uint(int(uint(int(_1775)) >> uint(2)));
    int _1779 = int(_1775) & 3;
    float _1781 = (*spvDescriptorSet0.vp_c15)._m0[int(_1777)][_1779];
    int _1783 = int(_1775) + 1;
    uint _1785 = uint(int(uint(_1783) >> uint(2)));
    int _1787 = _1783 & 3;
    float _1789 = (*spvDescriptorSet0.vp_c15)._m0[int(_1785)][_1787];
    bool _1791 = _1757 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1793 = _1541 + 88;
    uint _1795 = uint(int(uint(_1793) >> uint(2)));
    uint _1797 = uint(int(uint(int(_1795)) >> uint(2)));
    int _1799 = int(_1795) & 3;
    float _1801 = (*spvDescriptorSet0.vp_c15)._m0[int(_1797)][_1799];
    int _1803 = int(_1795) + 1;
    uint _1805 = uint(int(uint(_1803) >> uint(2)));
    int _1807 = _1803 & 3;
    float _1809 = (*spvDescriptorSet0.vp_c15)._m0[int(_1805)][_1807];
    float _1811 = _1215 * _1635;
    float _1813 = _1215 * _1565;
    float _1815 = _1565;
    if (!_1401)
    {
        float _1817 = floor(_1269);
        _1815 = _1817;
    }
    float _1819 = _1815;
    float _1821 = fma(_981, _1557, _1813);
    float _1823 = fma(_983, _1593, _1821);
    float _1825 = _1215 * _1679;
    float _1827 = _1823 + _1601;
    float _1829 = fma(_981, _1627, _1811);
    float _1831 = fma(_981, _1671, _1825);
    float _1833 = 1.0 / _1827;
    float _1835 = fma(_983, _1741, _1829);
    float _1837 = fma(_983, _1705, _1831);
    float _1839 = _1089 + _1755;
    float _1841 = _1835 + _1749;
    float _1843 = _1837 + _1713;
    float _1845 = _1837;
    float _1847 = _1839;
    float _1849 = _1741;
    if (!_1791)
    {
        _1845 = _1695;
    }
    float _1851 = _1845;
    bool _1853 = !_1791;
    float _1855 = _1851;
    if (!_1853)
    {
        float _1857 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1861 = _1757 + _1859;
        float _1863 = rsqrt(_1753);
        float _1865 = _1861 * _1857;
        float _1867 = _1839 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1869 = _1865 * 0.15915493667125701904296875;
        float _1871 = _1869 * 6.283185482025146484375;
        float _1873 = cos(_1871);
        float _1875 = _1869 * 6.283185482025146484375;
        float _1877 = sin(_1875);
        float _1879 = _1873 + (-1.0);
        float _1881 = fma(_1877, _1867, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1883 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1885 = _1863 * _1881;
        float _1887 = fma(_1839, _1873, _1883);
        float _1889 = fma(_1727, _1885, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1891 = fma(_1723, _1885, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1847 = _1887;
        _1855 = _1889;
        _1715 = _1891;
    }
    float _1893 = _1847;
    float _1895 = _1855;
    float _1897 = _1715;
    float _1899 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1901 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1903 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1905 = _1843 * _1833;
    float _1907 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1899);
    float _1909 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1901);
    float _1911 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1903);
    if (!_1401)
    {
        float _1913 = rint(_1771);
        float _1915 = precise::max(_1913, 0.0);
        uint _1917 = uint(_1915);
        uint _1919 = clamp(_1917, 0u, 65535u);
        _1849 = as_type<float>(_1919);
    }
    float _1921 = _1849;
    float _1923 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1907);
    bool _1925 = _1905 >= 0.0;
    float _1927 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1929 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1911);
    float _1931 = _1841 * _1833;
    bool _1933 = _1905 <= 1.0;
    bool _1935 = _1933 && _1925;
    float _1937 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1939 = _1215 * _1789;
    float _1941 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1909);
    float _1943 = _1923 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1945 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1927);
    float _1947 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1949 = _1941 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1951 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1953 = _1931 >= 0.0;
    bool _1955 = _1953 && _1935;
    float _1957 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1945);
    float _1959 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1961 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1951);
    bool _1963 = _1931 <= 1.0;
    bool _1965 = _1963 && _1955;
    float _1967 = _1957 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1969 = -_1959;
    float _1971 = fma(_1969, _1937, 1.0);
    float _1973 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1961);
    float _1975 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1977 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1979 = fma(_981, _1781, _1939);
    float _1981 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1973);
    float _1983 = log2(_1971);
    float _1985 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1975);
    float _1987 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1977);
    float _1989 = fma(_983, _1801, _1979);
    float _1991 = _1939;
    if (!_1401)
    {
        float _1993 = -_1719;
        float _1995 = _1303 + _1993;
        _1991 = _1995;
    }
    float _1997 = _1991;
    if (_1965)
    {
        float _1999 = float(_1533);
        _1651 = _1999;
    }
    float _2001 = _1651;
    float _2003 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1985);
    float _2005 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1987);
    float _2007 = 1.0 / _1981;
    float _2009 = _1989 + _1809;
    float _2011 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2003);
    float _2013 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2005);
    float _2015 = _2005;
    float _2017 = _2001;
    if (!_1401)
    {
        float _2019 = -_1819;
        float _2021 = _1269 + _2019;
        _2015 = _2021;
    }
    float _2023 = _2015;
    float _2025 = _2009 * _1833;
    float _2027 = _1975;
    if (_1965)
    {
        float _2029 = rint(_2001);
        float _2031 = precise::max(_2029, 0.0);
        uint _2033 = uint(_2031);
        uint _2035 = clamp(_2033, 0u, 65535u);
        _2027 = as_type<float>(_2035);
    }
    float _2037 = _2027;
    float _2039 = _1983 * 0.693147182464599609375;
    float _2041 = _1997;
    if (!_1401)
    {
        float3 _6005 = float3(_2023, _1997, float(as_type<int>(_1921)));
        float3 _6009 = select(_6005, float3(0.0), isnan(_6005));
        float _2043 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6009.xy, uint(rint(_6009.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6009.xy, uint(rint(_6009.z)), level(0.0)).x;
        _2041 = _2043;
    }
    float _2045 = _2041;
    float _2047 = _2039 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2049 = _2011 * _2007;
    float _2051 = _2013 * _2007;
    float _2053 = fma(_2049, 0.5, 0.5);
    float _2055 = fma(_2051, -0.5, 0.5);
    float _2057 = _1931;
    float _2059 = _2047;
    if (_1965)
    {
        float3 _6039 = float3(_1905, _1931, float(as_type<int>(_2037)));
        float3 _6041 = select(_6039, float3(0.0), isnan(_6039));
        float _2061 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6041.xy, uint(rint(_6041.z)), _2025, level(0.0));
        _2057 = _2061;
    }
    float _2063 = _2057;
    float3 _6051 = float3(_2053, _2055, _2047);
    float _2065 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6051, float3(0.0), isnan(_6051)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6051, float3(0.0), isnan(_6051)), level(0.0)).x;
    float3 _6060 = float3(_2053, _2055, _2047);
    float4 _2067 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6060, float3(0.0), isnan(_6060)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6060, float3(0.0), isnan(_6060)), level(0.0)).xyzw;
    float _2069 = _2067.x;
    float _2071 = _2067.y;
    float _2073 = _2067.z;
    float _2075 = _2067.w;
    float _2077 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1401)
    {
        _2017 = 1.0;
    }
    float _2079 = _2017;
    bool _2081 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2083 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2085 = _2081 || _2083;
    bool _2087 = isnan(0.5);
    bool _2089 = _2085 || _2087;
    float _2091 = _2079;
    if (_2089)
    {
        _2077 = 1.0;
    }
    float _2093 = _2077;
    float _2095 = _2093;
    if (!_2089)
    {
        float _2097 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2099 = _2097 * 0.15915493667125701904296875;
        float _2101 = _2099 * 6.283185482025146484375;
        float _2103 = cos(_2101);
        float _2105 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2107 = _2105 * 0.15915493667125701904296875;
        float _2109 = _2099 * 6.283185482025146484375;
        float _2111 = sin(_2109);
        float _2113 = 1.0 / _2103;
        float _2115 = _2107 * 6.283185482025146484375;
        float _2117 = cos(_2115);
        float _2119 = _2111 * _2113;
        float _2121 = _2107 * 6.283185482025146484375;
        float _2123 = sin(_2121);
        float _2125 = _2117 * _2119;
        float _2127 = 1.0 / _2125;
        float _2129 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2131 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2129;
        float _2133 = 1.0 / _2131;
        float _2135 = _2123 * _2127;
        float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2139 = fma(_1447, _2135, _2137);
        float _2141 = _2139 * _2133;
        float _2143 = precise::clamp(_2141, 0.0, 1.0);
        _2095 = _2143;
    }
    float _2145 = _2095;
    if (!_1401)
    {
        int _2147 = _1437 << 4;
        int _2149 = _2147 + 2048;
        uint _2151 = uint(int(uint(_2149) >> uint(2)));
        uint _2153 = uint(int(uint(int(_2151)) >> uint(2)));
        int _2155 = int(_2151) & 3;
        float _2157 = (*spvDescriptorSet0.vp_c15)._m0[int(_2153)][_2155];
        int _2159 = int(_2151) + 1;
        uint _2161 = uint(int(uint(_2159) >> uint(2)));
        int _2163 = _2159 & 3;
        float _2165 = (*spvDescriptorSet0.vp_c15)._m0[int(_2161)][_2163];
        int _2167 = _2149 + 8;
        uint _2169 = uint(int(uint(_2167) >> uint(2)));
        uint _2171 = uint(int(uint(int(_2169)) >> uint(2)));
        int _2173 = int(_2169) & 3;
        float _2175 = (*spvDescriptorSet0.vp_c15)._m0[int(_2171)][_2173];
        int _2177 = int(_2169) + 1;
        uint _2179 = uint(int(uint(_2177) >> uint(2)));
        int _2181 = _2177 & 3;
        float _2183 = (*spvDescriptorSet0.vp_c15)._m0[int(_2179)][_2181];
        float _2185 = _1215 * _2165;
        float _2187 = fma(_981, _2157, _2185);
        float _2189 = fma(_983, _2175, _2187);
        float _2191 = _2189 + _2183;
        float _2193 = precise::clamp(_2191, 0.0, 1.0);
        float _2195 = -_2193;
        float _2197 = _2195 + _2045;
        float _2199 = fma(_2197, 500.0, 1.5);
        float _2201 = exp2(_2199);
        float _2203 = 0.0 + _2201;
        float _2205 = precise::clamp(_2203, 0.0, 1.0);
        _1449 = as_type<float>(_2149);
        _2091 = _2205;
    }
    float _2207 = _1449;
    float _2209 = _2091;
    float _2211 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2213 = _1893 + _2211;
    float _2215 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2217 = _1895 + _2215;
    float _2219 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2221 = _1897 + _2219;
    float _2223 = _2213 * _2213;
    float _2225 = fma(_2217, _2217, _2223);
    float _2227 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2229 = fma(_2221, _2221, _2225);
    float _2231 = rsqrt(_2229);
    float _2233 = sqrt(_2229);
    float _2235 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2237 = _2217 * _2235;
    float _2239 = _2221 * _2235;
    float _2241 = _2237 * _2237;
    float _2243 = _2239 * _2239;
    float _2245 = _2241 + _2243;
    float _2247 = sqrt(_2245);
    bool _2249 = _2247 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2253 = _2247 + _2251;
    float _2255 = _2045;
    float _2257 = _2253;
    float _2259 = _2227;
    float _2261 = _2235;
    float _2263 = _2239;
    float _2265 = _2243;
    float _2267 = _2241;
    if (_2249)
    {
        float _2269 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2255 = _2269;
    }
    float _2271 = _2255;
    if (_2249)
    {
        float _2273 = _2253 * _2271;
        _2257 = _2273;
    }
    float _2275 = _2257;
    float _2277 = precise::max(0.0, _2227);
    float _2279 = _2277;
    if (_2249)
    {
        float _2281 = rsqrt(_2245);
        _2259 = _2281;
    }
    float _2283 = _2259;
    float _2285 = _2283;
    if (_2249)
    {
        float _2287 = _2275 * 0.15915493667125701904296875;
        _2059 = _2287;
    }
    float _2289 = _2059;
    float _2291 = -_2235;
    float _2293 = -_2277;
    float _2295 = fma(_2213, _2291, _2293);
    float _2297 = _2295;
    if (_2249)
    {
        float _2299 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2261 = _2299;
    }
    float _2301 = _2261;
    float _2303 = _2207;
    float _2305 = _2301;
    if (_2249)
    {
        float _2307 = _2289 * 6.283185482025146484375;
        float _2309 = sin(_2307);
        _2303 = _2309;
    }
    float _2311 = _2303;
    float _2313 = _2275;
    if (_2249)
    {
        float _2315 = _2289 * 6.283185482025146484375;
        float _2317 = cos(_2315);
        _2313 = _2317;
    }
    float _2319 = _2313;
    if (_2249)
    {
        float _2321 = fma(_2311, _2301, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2279 = _2321;
    }
    float _2323 = _2279;
    float _2325 = _2323;
    if (_2249)
    {
        float _2327 = _2283 * _2323;
        _2285 = _2327;
    }
    float _2329 = _2285;
    if (_2249)
    {
        float _2331 = _2319 + (-1.0);
        _2305 = _2331;
    }
    float _2333 = _2305;
    float _2335 = _2333;
    if (_2249)
    {
        float _2337 = _2239 * _2329;
        _2263 = _2337;
    }
    float _2339 = _2263;
    if (_2249)
    {
        float _2341 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2325 = _2341;
    }
    float _2343 = _2325;
    if (!_2249)
    {
        _2335 = _2237;
    }
    float _2345 = _2335;
    float _2347 = _2345;
    if (_2249)
    {
        float _2349 = _2237 * _2329;
        _2347 = _2349;
    }
    float _2351 = _2347;
    if (_2249)
    {
        float _2353 = _2339 * _2339;
        _2265 = _2353;
    }
    float _2355 = _2265;
    if (_2249)
    {
        float _2357 = fma(_2295, _2319, _2343);
        _2297 = _2357;
    }
    float _2359 = _2297;
    if (_2249)
    {
        float _2361 = _2351 * _2351;
        _2267 = _2361;
    }
    float _2363 = _2267;
    float _2365 = fma(_2359, _2359, _2363);
    float _2367 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2369 = fma(_2233, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2367);
    float _2371 = precise::clamp(_2369, 0.0, 1.0);
    float _2373 = _2365 + _2355;
    float _2375 = -_2371;
    float _2377 = _2375 + 1.0;
    float _2379 = rsqrt(_2373);
    float _2381 = abs(_2377);
    float _2383 = log2(_2381);
    float _2385 = _2379 * _2351;
    float _2387 = _2379 * _2359;
    float _2389 = _2379 * _2339;
    float _2391 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2393 = -_2391;
    float _2395 = fma(_2387, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2393);
    float _2397 = _2383 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2399 = -_2389;
    float _2401 = fma(_2399, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2395);
    float _2403 = exp2(_2397);
    float _2405 = fma(_2401, -0.5, 0.5);
    float _2407 = fma(_2401, 0.5, 0.5);
    float _2409 = _2387 + 1.0;
    float _2411 = fma(_2407, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2413 = sqrt(_2405);
    float _2415 = fma(_2407, _2411, -0.212114393711090087890625);
    float _2417 = fma(_2407, _2415, 1.570728778839111328125);
    float _2419 = -_2387;
    float _2421 = fma(_2403, _2409, _2419);
    float _2423 = fma(_2421, 0.5, 0.5);
    float _2425 = _2413 * 0.636619746685028076171875;
    float _2427 = -_2417;
    float _2429 = fma(_2425, _2427, 1.0);
    float2 _6601 = float2(_2429, _2423);
    float3 _2433 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6601, float2(0.0), isnan(_6601)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6601, float2(0.0), isnan(_6601)), level(0.0)).xyz;
    float _2435 = _2433.x;
    float _2437 = _2433.y;
    float _2439 = _2433.z;
    float _2441 = _913 * _967;
    float _2443 = _909 * 2.0;
    float _2445 = _875 * 3.883221149444580078125;
    bool _2447 = _893 != 0.0;
    bool _2449 = isnan(_893);
    bool _2451 = _2447 || _2449;
    bool _2453 = isnan(0.0);
    bool _2455 = _2451 || _2453;
    float _2457 = -_691;
    float _2459 = _2457 + _877;
    float _2461 = -_2443;
    float _2463 = fma(_2441, _2461, _2441);
    float _2465 = _2445 * 0.15915493667125701904296875;
    bool _2467 = _857 == 0.0;
    bool _2469 = !_2455;
    bool _2471 = _2467 && _2469;
    float _2473 = fma(_829, _2459, _691);
    float _2475 = fma(_909, 3.1415927410125732421875, _2463);
    float _2477 = _2465 * 6.283185482025146484375;
    float _2479 = sin(_2477);
    bool _2481 = _915 == 0.0;
    bool _2483 = _2481 && _2471;
    float _2485 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2473);
    float _2487 = _2475 * 0.15915493667125701904296875;
    out.m_73.x = _705;
    out.m_73.y = _613;
    out.m_73.z = _615;
    float _2489 = _2383 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2491 = -_1001;
    float _2493 = _2491 + 1.0;
    float _2495 = _2487 * 6.283185482025146484375;
    float _2497 = sin(_2495);
    out.m_75.z = _579;
    out.m_75.w = _593;
    out.m_77.x = _1895;
    out.m_77.y = _1893;
    out.m_77.z = _1897;
    int _2499 = as_type<int>(_2441);
    int _2501 = as_type<int>(_2487);
    if (_2483)
    {
        _2499 = as_type<int>(_2485);
    }
    int _2503 = _2499;
    int _2505 = _2503;
    if (!_2483)
    {
        _2505 = as_type<int>(_2485);
    }
    int _2507 = _2505;
    float _2509 = abs(_1447);
    float _2511 = log2(_2509);
    float _2513 = -_837;
    float _2515 = fma(_2497, _2479, _2513);
    float _2517 = exp2(_2489);
    bool _2519 = _1447 <= 8000.0;
    bool _2521 = isnan(_1447);
    bool _2523 = _2519 || _2521;
    bool _2525 = isnan(8000.0);
    bool _2527 = _2523 || _2525;
    float _2529 = float(_2527);
    float _2531 = fma(_829, _2515, _837);
    float _2533 = _2483 ? _2473 : as_type<float>(_2507);
    float _2535 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2531);
    float _2537 = _2465 * 6.283185482025146484375;
    float _2539 = cos(_2537);
    float _2541 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2543 = _2497;
    if (_2483)
    {
        _2501 = as_type<int>(_2535);
    }
    int _2545 = _2501;
    int _2547 = _2545;
    if (!_2483)
    {
        _2547 = as_type<int>(_2535);
    }
    int _2549 = _2547;
    float _2551 = exp2(_2541);
    float _2553 = _2483 ? _2531 : as_type<float>(_2549);
    float _2555 = _2533 * _2533;
    float _2557 = fma(_2553, _2553, _2555);
    float _2559 = -_835;
    float _2561 = fma(_2497, _2539, _2559);
    float _2563 = _2555;
    if (_2483)
    {
        _2543 = _2473;
    }
    float _2565 = _2543;
    float _2567 = _2565;
    if (!_2483)
    {
        _2567 = _2485;
    }
    float _2569 = _2567;
    float _2571 = fma(_829, _2561, _835);
    float _2573 = rsqrt(_2557);
    float _2575 = _2571;
    if (_2483)
    {
        _2563 = _2531;
    }
    float _2577 = _2563;
    float _2579 = _2577;
    if (!_2483)
    {
        float _2581 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2571);
        _2575 = _2581;
    }
    float _2583 = _2575;
    float _2585 = _1465 * _2569;
    if (!_2483)
    {
        _2579 = _2535;
    }
    float _2587 = _2579;
    float _2589 = -_2569;
    float _2591 = _1443 * _2589;
    float _2593 = _1467 * _2569;
    float _2595 = fma(_2551, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2597 = precise::clamp(_2595, 0.0, 1.0);
    float _2599 = fma(_1481, _2583, _2585);
    float _2601 = fma(_1469, _2583, _2591);
    bool _2603 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2605 = isnan(_2233);
    bool _2607 = _2603 || _2605;
    bool _2609 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2611 = _2607 || _2609;
    float _2613 = fma(_1491, _2587, _2599);
    float _2615 = _2533 * _2573;
    float _2617 = _2553 * _2573;
    float _2619 = _2613 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2621 = -_2615;
    float _2623 = _1473 * _2621;
    float _2625 = fma(_1473, _2587, _2601);
    float _2627 = fma(_1485, _2583, _2593);
    float _2629 = -_2615;
    float _2631 = _1491 * _2629;
    float _2633 = -_1443;
    float _2635 = fma(_2633, _2617, _2623);
    float _2637 = _1481 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2639 = -_2615;
    float _2641 = _1487 * _2639;
    float _2643 = _1481 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2645 = _1481 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2647 = fma(_1469, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2637);
    float _2649 = _2613 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2651 = fma(_1465, _2617, _2631);
    float _2653 = fma(_1469, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2643);
    float _2655 = fma(_1469, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2645);
    float _2657 = _2613 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2659 = fma(_2625, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2649);
    float _2661 = fma(_1487, _2587, _2627);
    float _2663 = _2651 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2665 = fma(_1485, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2647);
    float _2667 = fma(_1485, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2653);
    float _2669 = fma(_1485, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2655);
    float _2671 = fma(_1467, _2617, _2641);
    float _2673 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2675 = fma(_2625, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2657);
    float _2677 = _2651 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2679 = fma(_2635, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2663);
    float _2681 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2673);
    out.m_79.x = _2665;
    out.m_79.y = _2667;
    out.m_79.z = _2669;
    float _2683 = _2651 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2685 = fma(_2635, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2677);
    float _2687 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2681);
    float _2689 = fma(_2625, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2619);
    float _2691 = fma(_2635, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2683);
    float _2693 = fma(_2661, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2659);
    float _2695 = fma(_2671, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2679);
    float _2697 = fma(_2661, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2675);
    float _2699 = fma(_2671, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2685);
    float _2701 = fma(_2671, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2691);
    float _2703 = _2011 + _1981;
    float _2705 = _2697 * _1617;
    float _2707 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2687);
    float _2709 = _2697 * _1681;
    float _2711 = _2697 * _1613;
    out.m_81.x = _2695;
    out.m_81.y = _2699;
    out.m_81.z = _2701;
    float _2713 = _2707 + _1981;
    float _2715 = fma(_2661, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2689);
    float _2717 = fma(_2693, _1611, _2705);
    float _2719 = fma(_2693, _1691, _2709);
    float _2721 = _1981 * 0.5;
    out.gl_Position.x = _2011;
    out.gl_Position.y = _2013;
    out.gl_Position.z = _2707;
    out.gl_Position.w = _1981;
    float _2723 = fma(_2715, _1689, _2719);
    float _2725 = _2713 * 0.5;
    float _2727 = _2703 * 0.5;
    float _2729 = fma(_2693, _1639, _2711);
    float _2731 = fma(_2715, _1645, _2717);
    float _2733 = fma(_2013, -0.5, _2721);
    float _2735 = fma(_2715, _1583, _2729);
    float _2737 = in.m_83.w;
    float _2739 = fma(_2597, -2.0, 3.0);
    float _2741 = _2597 * _2597;
    out.m_85.x = _2727;
    out.m_85.y = _2733;
    out.m_85.z = _2725;
    out.m_85.w = _1981;
    float _2743 = _2741 * _2739;
    out.m_87.x = _2731;
    out.m_87.y = _2723;
    out.m_87.z = _2735;
    float _2745 = -_2743;
    float _2747 = _2745 + 1.0;
    float _2749 = fma(_2747, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2743);
    float _2751 = _2743;
    if (!_1965)
    {
        _2751 = 1.0;
    }
    float _2753 = _2751;
    float _2755 = _2753;
    if (_1965)
    {
        bool _2757 = _2063 >= _2025;
        bool _2759 = isnan(_2063);
        bool _2761 = _2757 || _2759;
        bool _2763 = isnan(_2025);
        bool _2765 = _2761 || _2763;
        float _2767 = float(_2765);
        _2755 = _2767;
    }
    float _2769 = _2755;
    float _2771 = _2529 * _2749;
    float _2773 = -_2517;
    float _2775 = _2773 + 1.0;
    float _2777 = _2771 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2779 = _2775 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2781 = _2769 * _2209;
    out.m_89.w = _2737;
    float _2783 = _2493 * _2777;
    float _2785 = precise::clamp(_2783, 0.0, 1.0);
    float _2787 = _2779 * _2065;
    float _2789 = -_2785;
    float _2791 = fma(_2789, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2793 = _2075 * _2787;
    float _2795 = -_2779;
    float _2797 = _2795 + 1.0;
    float _2799 = _2145 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2801 = -_2781;
    float _2803 = fma(_2801, _2791, 1.0);
    float _2805 = precise::clamp(_2803, 0.0, 1.0);
    float _2807 = _2781;
    float _2809 = _2797;
    float _2811 = _2805;
    if (!_2611)
    {
        _2807 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2813 = _2807;
    float _2815 = _2075 * _2797;
    float _2817 = _2813;
    float _2819 = _2813;
    if (!_2611)
    {
        _2809 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2821 = _2809;
    float _2823 = _2439 * _2787;
    float _2825 = fma(_2435, _2793, _2069);
    float _2827 = fma(_2437, _2793, _2071);
    float _2829 = _2805 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2831 = fma(_2075, _2823, _2073);
    float _2833 = _2821;
    float _2835 = _2821;
    if (!_2611)
    {
        _2811 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2837 = _2811;
    out.m_91.x = _2829;
    out.m_93.x = _2825;
    out.m_93.y = _2827;
    out.m_93.z = _2831;
    out.m_93.w = _2815;
    bool _2839 = !_2611;
    float _2841 = _2837;
    float _2843 = _2837;
    if (!_2839)
    {
        bool _2845 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2847 = isnan(_2233);
        bool _2849 = _2845 || _2847;
        bool _2851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2853 = _2849 || _2851;
        if (!_2853)
        {
            float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2857 = _2233 + _2855;
            float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2861 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2859;
            float _2863 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2865 = _2863 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2867 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2869 = _2867 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2871 = 1.0 / _2861;
            float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2875 = _2873 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2877 = _2857 * _2871;
            float _2879 = precise::clamp(_2877, 0.0, 1.0);
            float _2881 = fma(_2879, _2865, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2883 = fma(_2879, _2869, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2885 = fma(_2879, _2875, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2843 = _2883;
            _2819 = _2881;
            _2835 = _2885;
            _2887 = true;
        }
        else
        {
            bool _2889 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2891 = isnan(_2233);
            bool _2893 = _2889 || _2891;
            bool _2895 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2897 = _2893 || _2895;
            if (!_2897)
            {
                _2817 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2899 = _2817;
            _2819 = _2899;
            if (!_2897)
            {
                _2841 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2901 = _2841;
            _2843 = _2901;
            if (!_2897)
            {
                _2833 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2903 = _2833;
            bool _2905 = !_2897;
            _2835 = _2903;
            if (!_2905)
            {
                bool _2907 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2909 = isnan(_2233);
                bool _2911 = _2907 || _2909;
                bool _2913 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2915 = _2911 || _2913;
                if (!_2915)
                {
                    float _2917 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2919 = _2233 + _2917;
                    float _2921 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2923 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2921;
                    float _2925 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2929 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2931 = _2929 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2933 = 1.0 / _2923;
                    float _2935 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2937 = _2935 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2939 = _2919 * _2933;
                    float _2941 = precise::clamp(_2939, 0.0, 1.0);
                    float _2943 = fma(_2941, _2927, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2945 = fma(_2941, _2931, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2947 = fma(_2941, _2937, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2843 = _2945;
                    _2819 = _2943;
                    _2835 = _2947;
                    _2887 = true;
                }
                else
                {
                    _2843 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2819 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2835 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2887 = false;
    float _2949 = _2843;
    float _2951 = _2819;
    float _2953 = _2835;
    float _2955 = _2799 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_95.x = 0.0;
    float _2957 = _2949 * 0.586610972881317138671875;
    bool _2959 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_61.x = _2955;
    float _2961 = fma(_2951, 0.298911988735198974609375, _2957);
    bool _2963 = _2145 > 0.0;
    bool _2965 = isnan(_2145);
    bool _2967 = _2963 || _2965;
    bool _2969 = isnan(0.0);
    bool _2971 = _2967 || _2969;
    float _2973 = fma(_2953, 0.114477999508380889892578125, _2961);
    float _2975 = -_2973;
    float _2977 = _2975 + _2951;
    float _2979 = -_2973;
    float _2981 = _2979 + _2949;
    float _2983 = -_2973;
    float _2985 = _2983 + _2953;
    float _2987 = fma(_2977, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2973);
    float _2989 = fma(_2981, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2973);
    float _2991 = fma(_2985, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2973);
    bool _2993 = !_2959;
    if (!_2993)
    {
        float _2995 = -_1893;
        float _2997 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2999 = -_1895;
        float _3001 = _2999 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3003 = -_1897;
        float _3005 = _3003 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3007 = _2997 * _2997;
        float _3009 = fma(_3001, _3001, _3007);
        float _3011 = fma(_3005, _3005, _3009);
        float _3013 = sqrt(_3011);
        float _3015 = rsqrt(_3011);
        float _3017 = -_3013;
        float _3019 = _3017 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3021 = _3019 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3023 = precise::clamp(_3021, 0.0, 1.0);
        float _3025 = _3001 * _3015;
        float _3027 = _2997 * _3015;
        float _3029 = abs(_3023);
        float _3031 = log2(_3029);
        float _3033 = _3005 * _3015;
        float _3035 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3037 = _2723 * _3027;
        float _3039 = -_3027;
        float _3041 = -_3035;
        float _3043 = fma(_3039, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3041);
        float _3045 = fma(_2731, _3025, _3037);
        float _3047 = -_3033;
        float _3049 = fma(_3047, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3043);
        float _3051 = fma(_2735, _3033, _3045);
        float _3053 = precise::clamp(_3051, 0.0, 1.0);
        float _3055 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3057 = _3049 + _3055;
        float _3059 = _3031 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3061 = _3057 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3063 = precise::clamp(_3061, 0.0, 1.0);
        float _3065 = exp2(_3059);
        float _3067 = _3065 * _3063;
        float _3069 = _3053 * _3067;
        float _3071 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3073 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3075 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _3071;
        out.m_95.y = _3073;
        out.m_95.z = _3075;
    }
    out.m_97.x = _2987;
    out.m_97.y = _2989;
    out.m_97.z = _2991;
    if (_2971)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _3077 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3077;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2887 = false;
    bool _943 = false;
    bool _751 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_58.w;
    float _119 = trunc(_117);
    int _121 = int(_119);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    float _129 = as_type<float>(_121);
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _127;
    float _133 = _131;
    if (!_125)
    {
        out.m_61.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3136 = as_type<float>(_139);
        out.gl_Position.z = _3136;
    }
    if (!_125)
    {
        return out;
    }
    float _143 = in.m_63.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = _157;
    if (_153)
    {
        float _161 = float(_121);
        _133 = _161;
    }
    float _163 = _133;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    if (_169)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _129;
    if (_169)
    {
        out.m_61.x = 0.0;
    }
    if (_169)
    {
        float _173 = _171 * 5.0;
        _141 = as_type<int>(_173);
    }
    int _175 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3205 = as_type<float>(_175);
        out.gl_Position.z = _3205;
    }
    if (_169)
    {
        return out;
    }
    int _177 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _179 = _177;
    int _181 = 0;
    int _183 = _112(_179, _181, (*spvDescriptorSet0.support_buffer));
    float _185 = _157 * 0.0500000007450580596923828125;
    float _187 = in.m_65.z;
    float _189 = trunc(_187);
    int _191 = int(_189);
    float _193 = float(_183);
    int _195 = abs(_183);
    bool _197 = _183 == 0;
    float _199 = _185 * _193;
    float _201 = float(uint(_195));
    float _203 = trunc(_199);
    int _205 = int(_203);
    float _207 = 1.0 / _201;
    int _209 = abs(_205);
    uint _212 = uint(int(uint(_205) >> uint(31)));
    float _214 = float(uint(_209));
    int _216 = ~int(_212);
    int _218 = _216 + 1;
    int _220 = as_type<int>(_207) + (-2);
    float _222 = as_type<float>(_220) * _214;
    float _224 = trunc(_222);
    float _226 = precise::max(_224, 0.0);
    uint _228 = uint(_226);
    int _230 = ~int(_228);
    int _232 = _230 + 1;
    int _234 = _232 * _195;
    int _236 = _234 + _209;
    float _238 = float(uint(_236));
    float _240 = as_type<float>(_220) * _238;
    float _242 = trunc(_240);
    float _244 = precise::max(_242, 0.0);
    uint _246 = uint(_244);
    int _248 = int(_228) + int(_246);
    int _250 = ~_248;
    int _252 = _250 + 1;
    int _254 = _252 * _195;
    int _256 = _254 + _209;
    bool _258 = uint(_256) >= uint(_195);
    bool _260 = !_258;
    int _262 = _260 ? 0 : (-1);
    int _264 = ~_248;
    int _266 = _264 + _262;
    int _268 = _266 + 1;
    int _270 = _268 * _195;
    int _272 = _270 + _209;
    int _274 = _272 ^ _218;
    int _276 = ~_218;
    int _278 = _276 + _274;
    int _280 = _278 + 1;
    bool _282 = !_197;
    int _284 = _282 ? _280 : (-1);
    int _286 = _284;
    int _288 = 0;
    int _290 = _113(_286, _288, (*spvDescriptorSet0.support_buffer));
    int _292 = _191;
    int _294 = 0;
    int _296 = _113(_292, _294, (*spvDescriptorSet0.support_buffer));
    float4 _299 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_290, _296)), 0).xyzw;
    float _301 = _299.x;
    float _303 = _299.y;
    float _305 = _299.z;
    float _307 = _299.w;
    float _309 = in.m_67.w;
    float _311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _315 = _313 != 0;
    float _317 = in.m_65.y;
    int _319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _321 = _319 != 0;
    float _323 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _327 = _325 != 0;
    float _329 = in.m_65.x;
    float _331 = in.m_69.w;
    float _333 = as_type<float>(_256);
    float _335 = _317;
    if (_315)
    {
        float _337 = in.m_67.z;
        _333 = _337;
    }
    float _339 = _333;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _343 = _311 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _345 = 0.0;
    if (!_321)
    {
        float _347 = in.m_67.z;
        _345 = _347;
    }
    float _349 = _345;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _353 = _309 > 0.5;
    bool _355 = _353 && _327;
    float _357 = 0.0;
    float _359 = _309;
    if (!_321)
    {
        float _361 = in.m_67.y;
        _357 = _361;
    }
    float _363 = _357;
    float _365 = _329;
    if (_315)
    {
        _359 = _329;
    }
    float _367 = _359;
    float _369 = _367;
    if (_355)
    {
        float _371 = -_317;
        float _373 = _371 + 1.0;
        _335 = _373;
    }
    float _375 = _335;
    bool _377 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _381 = _377 || _379;
    bool _383 = isnan(1.0);
    bool _385 = _381 || _383;
    bool _387 = _339 > 0.5;
    bool _389 = _387 && _315;
    float _391 = fma(_343, _375, -0.5);
    float _393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _395 = 0.0;
    float _397 = _349;
    if (!_321)
    {
        _395 = _349;
    }
    float _399 = _395;
    float _401 = _363;
    float _403 = _399;
    if (_321)
    {
        float _405 = in.m_67.x;
        float _407 = in.m_67.y;
        _401 = _405;
        _403 = _407;
    }
    float _409 = _401;
    float _411 = _403;
    if (_389)
    {
        float _413 = -_367;
        float _415 = _413 + 1.0;
        _369 = _415;
    }
    float _417 = _369;
    if (_315)
    {
        _365 = _417;
    }
    float _419 = _365;
    float _421 = _393 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _423 = in.m_63.x;
    float _425 = in.m_63.y;
    float _427 = in.m_63.z;
    float _429 = fma(_421, _419, -0.5);
    float _431 = in.m_58.x;
    float _433 = in.m_58.y;
    float _435 = in.m_58.z;
    if (_321)
    {
        _397 = _411;
    }
    float _437 = _397;
    float _439 = _411 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _441 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[83].z, _341);
    float _443 = _409 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _449 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[83].w, _351);
    float _451 = _437;
    float _453 = _445;
    if (!_385)
    {
        float _455 = _323 * _323;
        float _457 = _455 * 0.5;
        _451 = _457;
    }
    float _459 = _451;
    float _461 = -_445;
    float _463 = fma(_443, 2.0, _461);
    float _465 = fma(_439, -2.0, _447);
    float _467 = _459;
    if (!_385)
    {
        _453 = _323;
    }
    float _469 = _453;
    float _471 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _441);
    float _473 = -_157;
    float _475 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[81].x, _463);
    float _477 = _469;
    if (!_385)
    {
        float _479 = _459 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _467 = _479;
    }
    float _481 = _467;
    bool _483 = !_385;
    float _485 = _481;
    if (!_483)
    {
        float _487 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _489 = log2(_487);
        float _491 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _493 = _491 + 1.0;
        float _495 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _497 = _323 * _489;
        float _499 = 1.0 / _493;
        float _501 = _495 * 0.693147182464599609375;
        float _503 = exp2(_497);
        float _505 = 1.0 / _501;
        float _507 = _503 + (-1.0);
        float _509 = -_507;
        float _511 = fma(_509, _505, _323);
        float _513 = _511 * _499;
        float _515 = _513 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _485 = _515;
    }
    float _517 = _485;
    bool _519 = !_385;
    if (!_519)
    {
        float _521 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _523 = log2(_521);
        float _525 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _527 = _525 + 1.0;
        float _529 = 1.0 / _527;
        float _531 = _323 * _523;
        float _533 = exp2(_531);
        float _535 = -_533;
        float _537 = _535 + 1.0;
        float _539 = _537 * _529;
        _477 = _539;
    }
    float _541 = _477;
    float _543 = fma(_471, _429, _475);
    float _545 = _517 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _547 = _517 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _549 = _517 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _551 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _465);
    float _553 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _449);
    float _555 = fma(_541, _423, _545);
    float _557 = fma(_541, _425, _547);
    float _559 = fma(_541, _427, _549);
    int _561 = _284 + 1;
    float _563 = -_551;
    float _565 = fma(_553, _391, _563);
    float _567 = fma(_555, _331, _431);
    float _569 = fma(_559, _331, _435);
    int _571 = abs(_561);
    float _573 = fma(_557, _331, _433);
    uint _575 = as_type<uint>(half2(float2(_307, 0.0)));
    float _577 = float(uint(_571));
    float _579 = _543 + 0.5;
    uint _581 = extract_bits(_575, 0u, 8u);
    int _583 = int(_581) & 255;
    uint _585 = extract_bits(_575, 8u, 8u);
    int _587 = int(_585) & 255;
    int _589 = _587 << 8;
    int _591 = _583 | _589;
    float _593 = _565 + 0.5;
    uint _595 = uint(int(uint(_561) >> uint(31)));
    float _597 = as_type<float>(_220) * _577;
    int _599 = ~int(_595);
    int _601 = _599 + 1;
    float _603 = trunc(_597);
    float _605 = precise::max(_603, 0.0);
    uint _607 = uint(_605);
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _613 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _615 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _617 = ~int(_607);
    int _619 = _617 + 1;
    int _621 = _619 * _195;
    int _623 = _621 + _571;
    float _625 = float(uint(_623));
    float _627 = as_type<float>(_220) * _625;
    float _629 = trunc(_627);
    float _631 = precise::max(_629, 0.0);
    uint _633 = uint(_631);
    int _635 = int(_607) + int(_633);
    int _637 = ~_635;
    int _639 = _637 + 1;
    int _641 = _639 * _195;
    int _643 = _641 + _571;
    bool _645 = uint(_643) >= uint(_195);
    bool _647 = !_645;
    int _649 = _647 ? 0 : (-1);
    bool _651 = _591 >= 32768;
    int _653 = ~_635;
    int _655 = _653 + _649;
    int _657 = _655 + 1;
    int _659 = _591 + (-1024);
    int _661 = _657 * _195;
    int _663 = _661 + _571;
    int _665 = _663 ^ _601;
    int _667 = _659;
    if (_651)
    {
        int _669 = ~_591;
        int _671 = _669 + 33792;
        int _673 = _671 + 1;
        _667 = _673;
    }
    int _675 = _667;
    int _677 = _675 + 30719;
    int _679 = ~_601;
    int _681 = _679 + _665;
    int _683 = _681 + 1;
    float _685 = float(_677);
    bool _687 = !_197;
    int _689 = _687 ? _683 : (-1);
    float _691 = fma(_685, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _695 = abs(_691);
    float _697 = -_695;
    float _699 = _697 + 1.0;
    float _701 = abs(_691);
    float _703 = fma(_701, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _705 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _707 = _691 < 0.0;
    float _709 = float(_707);
    int _711 = as_type<int>(_699) + (-218103808);
    float _713 = abs(_691);
    float _715 = fma(_713, _703, -0.212114393711090087890625);
    bool _717 = uint(_711) >= 1920991232u;
    float _719 = abs(_691);
    float _721 = fma(_719, _715, 1.570728778839111328125);
    bool _723 = !_717;
    int _725 = as_type<int>(_699);
    float _749;
    if (!_723)
    {
        int _727 = as_type<int>(_699);
        int _729 = as_type<int>(_699);
        int _731 = 3136;
        int _733 = as_type<int>(_565);
        int _735;
        int _737;
        int _739;
        int _741;
        int _743;
        int _745;
        int _747;
        _110(_727, _729, _731, _733, _735, _737, _739, _741, _743, _745, _747, out.gl_Position, out.gl_PointSize);
        _749 = as_type<float>(_735);
        _725 = _737;
        _751 = true;
    }
    else
    {
        float _753 = rsqrt(_699);
        float _755 = _699 * _753;
        float _757 = _753 * 0.5;
        float _759 = -_755;
        float _761 = 0.0 + _759;
        float _763 = fma(_757, _761, 0.5);
        float _765 = fma(_755, _763, _755);
        float _767 = -_765;
        float _769 = 0.0 + _767;
        float _771 = fma(_765, _769, _699);
        float _773 = fma(_757, _771, _765);
        _749 = _773;
    }
    _751 = false;
    float _775 = _749;
    int _777 = _725;
    int _779 = _689;
    int _781 = 0;
    int _783 = _113(_779, _781, (*spvDescriptorSet0.support_buffer));
    int _785 = _191;
    int _787 = 0;
    int _789 = _113(_785, _787, (*spvDescriptorSet0.support_buffer));
    float4 _791 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_783, _789)), 0).xyzw;
    float _793 = _791.x;
    float _795 = _791.y;
    float _797 = _791.z;
    float _799 = _791.w;
    float _801 = _721 * _775;
    float _803 = _709 * 2.0;
    float _805 = _685 * 3.883221149444580078125;
    float _807 = floor(_199);
    float _809 = -_803;
    float _811 = fma(_801, _809, _801);
    float _813 = _805 * 0.15915493667125701904296875;
    float _815 = fma(_709, 3.1415927410125732421875, _811);
    float _817 = _813 * 6.283185482025146484375;
    float _819 = cos(_817);
    float _821 = _815 * 0.15915493667125701904296875;
    float _823 = _821 * 6.283185482025146484375;
    float _825 = sin(_823);
    float _827 = -_807;
    float _829 = _199 + _827;
    float _831 = _813 * 6.283185482025146484375;
    float _833 = sin(_831);
    float _835 = _825 * _819;
    float _837 = _825 * _833;
    uint _839 = as_type<uint>(half2(float2(_799, 0.0)));
    float _841 = -_301;
    float _843 = _841 + _793;
    uint _845 = extract_bits(_839, 0u, 8u);
    int _847 = int(_845) & 255;
    uint _849 = extract_bits(_839, 8u, 8u);
    int _851 = int(_849) & 255;
    int _853 = _851 << 8;
    int _855 = _847 | _853;
    float _857 = fma(_829, _843, _301);
    bool _859 = _855 >= 32768;
    int _861 = _855 + (-1024);
    int _863 = _861;
    if (_859)
    {
        int _865 = ~_855;
        int _867 = _865 + 33792;
        int _869 = _867 + 1;
        _863 = _869;
    }
    int _871 = _863;
    int _873 = _871 + 30719;
    float _875 = float(_873);
    float _877 = fma(_875, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _879 = -_303;
    float _881 = _879 + _795;
    float _883 = abs(_877);
    float _885 = -_883;
    float _887 = _885 + 1.0;
    float _889 = abs(_877);
    float _891 = fma(_889, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _893 = fma(_829, _881, _303);
    int _895 = as_type<int>(_887) + (-218103808);
    float _897 = abs(_877);
    float _899 = fma(_897, _891, -0.212114393711090087890625);
    bool _901 = uint(_895) >= 1920991232u;
    float _903 = -_305;
    float _905 = _903 + _797;
    bool _907 = _877 < 0.0;
    float _909 = float(_907);
    float _911 = abs(_877);
    float _913 = fma(_911, _899, 1.570728778839111328125);
    float _915 = fma(_829, _905, _305);
    bool _917 = !_901;
    float _941;
    if (!_917)
    {
        int _919 = as_type<int>(_887);
        int _921 = _777;
        int _923 = 4032;
        int _925 = as_type<int>(_887);
        int _927;
        int _929;
        int _931;
        int _933;
        int _935;
        int _937;
        int _939;
        _110(_919, _921, _923, _925, _927, _929, _931, _933, _935, _937, _939, out.gl_Position, out.gl_PointSize);
        _941 = as_type<float>(_927);
        _943 = true;
    }
    else
    {
        float _945 = rsqrt(_887);
        float _947 = _887 * _945;
        float _949 = _945 * 0.5;
        float _951 = -_947;
        float _953 = 0.0 + _951;
        float _955 = fma(_949, _953, 0.5);
        float _957 = fma(_947, _955, _947);
        float _959 = -_957;
        float _961 = 0.0 + _959;
        float _963 = fma(_957, _961, _887);
        float _965 = fma(_949, _963, _957);
        _941 = _965;
    }
    _943 = false;
    float _967 = _941;
    float _969 = _573 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _971 = _573 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _973 = fma(_567, (*spvDescriptorSet0.vp_c10)._m0[4].x, _969);
    float _975 = fma(_567, (*spvDescriptorSet0.vp_c10)._m0[6].x, _971);
    float _977 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[4].z, _973);
    float _979 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[6].z, _975);
    float _981 = _977 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _983 = _979 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _985 = fma(_981, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _987 = fma(_983, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _989 = floor(_985);
    float _991 = floor(_987);
    float _993 = -_989;
    float _995 = _985 + _993;
    float _997 = -_991;
    float _999 = _987 + _997;
    float2 _4329 = float2(_995, _999);
    float _1001 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4329, float2(0.0), isnan(_4329)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4329, float2(0.0), isnan(_4329)), level(0.0)).x;
    float _1003 = in.m_67.x;
    float _1005 = in.m_67.y;
    float _1007 = in.m_67.z;
    float _1009 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1011 = log2(_1009);
    float _1013 = _573 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1015 = fma(_567, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1013);
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1023 = _1021 != 0;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1027 = _1025 != 0;
    float _1029 = _1011 * _157;
    float _1031 = exp2(_1029);
    float _1033 = _1007 * 2.0;
    float _1035 = _1003 * 2.0;
    float _1037 = _1005 * 2.0;
    float _1039 = _1005 + _1007;
    float _1041 = _1003 + _1007;
    float _1043 = _1007 + (-0.5);
    float _1045 = _1005 + _1003;
    float _1047 = floor(_1033);
    float _1049 = _1003 + (-0.5);
    float _1051 = _1041 + (-1.0);
    float _1053 = _1045 + (-1.0);
    float _1055 = floor(_1035);
    float _1057 = _1005 + (-0.5);
    float _1059 = -_1031;
    float _1061 = _1059 + 1.0;
    bool _1063 = _1047 > 0.0;
    float _1065 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1015);
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1069 = 1.0 + _1067;
    bool _1071 = _1047 >= 0.0;
    bool _1073 = isnan(_1047);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan(0.0);
    bool _1079 = _1075 || _1077;
    float _1081 = floor(_1037);
    float _1083 = _1039 + (-1.0);
    float _1085 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1087 = _1079 ? 0 : 1;
    float _1089 = _1065 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1091 = _1055 >= 0.0;
    bool _1093 = isnan(_1055);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan(0.0);
    bool _1099 = _1095 || _1097;
    bool _1101 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1103 = isnan(1.0);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1109 = _1105 || _1107;
    float _1111 = 1.0 / _1069;
    bool _1113 = _1055 > 0.0;
    float _1115 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1117 = _1099 ? 0 : 1;
    float _1119 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1121 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1123 = isnan(0.0);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1129 = _1125 || _1127;
    float _1131 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1115);
    int _1133 = ~_1087;
    int _1135 = _1133 + 1;
    int _1137 = _1135 + 1;
    float _1139 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1119);
    float _1141 = _1129 ? _1061 : 0.0;
    float _1143 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1131);
    int _1145 = _1137;
    int _1147 = 2;
    if (!_1063)
    {
        int _1149 = ~_1087;
        int _1151 = _1149 + 1;
        _1145 = _1151;
    }
    int _1153 = _1145;
    float _1155 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1139);
    bool _1157 = !_1023;
    int _1159 = _1157 ? 0 : 1;
    float _1161 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1163 = _1081 > 0.0;
    if (_1109)
    {
        float _1165 = _1141 * _1111;
        _159 = _1165;
    }
    float _1167 = _159;
    bool _1169 = _1081 >= 0.0;
    bool _1171 = isnan(_1081);
    bool _1173 = _1169 || _1171;
    bool _1175 = isnan(0.0);
    bool _1177 = _1173 || _1175;
    float _1179 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _1181 = ~_1117;
    int _1183 = _1181 + 1;
    int _1185 = _1183 + 1;
    float _1187 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1189 = _1185;
    if (!_1113)
    {
        int _1191 = ~_1117;
        int _1193 = _1191 + 1;
        _1189 = _1193;
    }
    int _1195 = _1189;
    int _1197 = abs(_1159);
    float _1199 = in.m_71.x;
    float _1201 = in.m_71.y;
    float _1203 = in.m_71.z;
    bool _1205 = !_1019;
    int _1207 = _1205 ? 0 : 1;
    float _1209 = float(_1153);
    float _1211 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1213 = abs(_1207);
    float _1215 = _1089 + _1179;
    int _1217 = _1177 ? 0 : 1;
    float _1219 = float(_1213);
    float _1221 = float(_1197);
    int _1223 = ~_1217;
    int _1225 = _1223 + 1;
    int _1227 = _1225 + 1;
    float _1229 = _1219 * _1209;
    float _1231 = float(_1195);
    float _1233 = _1215 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _1235 = _1227;
    if (!_1163)
    {
        int _1237 = ~_1217;
        int _1239 = _1237 + 1;
        _1235 = _1239;
    }
    int _1241 = _1235;
    float _1243 = _1229 * (-2.0);
    float _1245 = _1215 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1247 = fma(_981, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1233);
    float _1249 = _1221 * _1231;
    float _1251 = fma(_1085, _1243, _1085);
    bool _1253 = !_1027;
    int _1255 = _1253 ? 0 : 1;
    float _1257 = fma(_1243, _1199, _1199);
    float _1259 = fma(_983, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1247);
    float _1261 = float(_1241);
    float _1263 = 1.0 / _1161;
    float _1265 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1257);
    int _1267 = abs(_1255);
    float _1269 = _1259 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1271 = _1249 * (-2.0);
    float _1273 = fma(_981, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1245);
    float _1275 = float(_1267);
    float _1277 = fma(_1251, _1167, _1265);
    float _1279 = fma(_1271, _1201, _1201);
    float _1281 = fma(_1211, _1271, _1211);
    float _1283 = _1275 * _1261;
    float _1285 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1279);
    float _1287 = fma(_983, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1273);
    float _1289 = trunc(_1269);
    int _1291 = int(_1289);
    float _1293 = _1283 * (-2.0);
    float _1295 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1297 = in.m_69.x;
    float _1299 = in.m_69.y;
    float _1301 = in.m_69.z;
    float _1303 = _1287 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1305 = fma(_1293, _1203, _1203);
    float _1307 = fma(_1295, _1293, _1295);
    float _1309 = _1187 + _1161;
    float _1311 = _1277 * 0.15915493667125701904296875;
    float _1313 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1305);
    float _1315 = trunc(_1303);
    int _1317 = int(_1315);
    float _1319 = _1309 * _1263;
    float _1321 = _1319 * 0.5;
    float _1323 = fma(_1281, _1167, _1285);
    float _1325 = fma(_1307, _1167, _1313);
    float _1327 = _1323 * 0.15915493667125701904296875;
    float _1329 = _1325 * 0.15915493667125701904296875;
    float _1331 = _1311 * 6.283185482025146484375;
    float _1333 = sin(_1331);
    float _1335 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1337 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1335);
    float _1339 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _915);
    int _1341 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1343 = _1291 + _1341;
    int _1345 = _1343 + 1;
    float _1347 = (*spvDescriptorSet0.vp_c10)._m0[9].x * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1349 = _1311 * 6.283185482025146484375;
    float _1351 = cos(_1349);
    int _1353 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1355 = _1317 + _1353;
    int _1357 = _1355 + 1;
    float _1359 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1361 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _1363 = _1345 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1365 = fma((*spvDescriptorSet0.vp_c10)._m0[8].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1347);
    int _1367 = _1345 | _1357;
    float _1369 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1371 = _1327 * 6.283185482025146484375;
    float _1373 = sin(_1371);
    float _1375 = in.m_65.y;
    float _1377 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _857);
    float _1379 = _1359 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1381 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1383 = _1369 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1385 = _1367 < 0;
    bool _1387 = _1385 || _1363;
    float _1389 = _1327 * 6.283185482025146484375;
    float _1391 = cos(_1389);
    float _1393 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _893);
    float _1395 = _1377 * _1379;
    float _1397 = _1339 * _1381;
    bool _1399 = _1357 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1401 = _1399 || _1387;
    float _1403 = _1393 * _1383;
    float _1405 = 1.0 / _1337;
    float _1407 = _1351 * _1373;
    float _1409 = _1333 * _1373;
    float _1411 = fma((*spvDescriptorSet0.vp_c10)._m0[10].x, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1365);
    float _1413 = _1329 * 6.283185482025146484375;
    float _1415 = cos(_1413);
    float _1417 = _1351 * _1391;
    float _1419 = _1333 * _1391;
    float _1421 = -_1375;
    float _1423 = _1421 + 0.85000002384185791015625;
    float _1425 = precise::clamp(_1423, 0.0, 1.0);
    int _1427 = _1345;
    int _1429 = as_type<int>(_1375);
    int _1431 = _1357;
    if (!_1401)
    {
        int _1433 = _1357 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1435 = _1433 + _1345;
        _1427 = _1435;
    }
    int _1437 = _1427;
    float _1439 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1441 = _1329 * 6.283185482025146484375;
    float _1443 = sin(_1441);
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1447 = _1405 * _1445;
    float _1449 = as_type<float>(_1437);
    if (!_1401)
    {
        int _1451 = _1437 << 2;
        _1429 = _1451;
    }
    int _1453 = _1429;
    float _1455 = _1439 * 0.15915493667125701904296875;
    int _1457 = _1453;
    if (!_1401)
    {
        uint _1459 = uint(int(uint(_1437) >> uint(2)));
        _1431 = int(_1459);
    }
    int _1461 = _1431;
    bool _1463 = _1447 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1465 = _1351 * _1415;
    float _1467 = _1333 * _1415;
    float _1469 = _1391 * _1415;
    bool _1471 = _1447 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1473 = _1373 * _1415;
    float _1475 = rsqrt(_1411);
    if (!_1401)
    {
        int _1477 = 12 & _1453;
        _1457 = _1477;
    }
    int _1479 = _1457;
    float _1481 = fma(_1443, _1417, _1409);
    float _1483 = -_1407;
    float _1485 = fma(_1443, _1419, _1483);
    float _1487 = fma(_1443, _1409, _1417);
    float _1489 = -_1419;
    float _1491 = fma(_1443, _1407, _1489);
    float _1493 = -_1403;
    float _1495 = _1443 * _1493;
    float _1497 = _1465 * _1403;
    float _1499 = _1467 * _1403;
    float _1501 = _1455 * 6.283185482025146484375;
    float _1503 = cos(_1501);
    float _1505 = fma(_1469, _1395, _1495);
    float _1507 = fma(_1481, _1395, _1497);
    float _1509 = fma(_1485, _1395, _1499);
    if (!_1463)
    {
        _1147 = 1;
    }
    int _1511 = _1147;
    float _1513 = fma(_1473, _1397, _1505);
    float _1515 = fma(_1491, _1397, _1507);
    float _1517 = fma(_1487, _1397, _1509);
    bool _1519 = !_1463;
    int _1521 = _1519 ? 0 : 1;
    float _1523 = _1455 * 6.283185482025146484375;
    float _1525 = sin(_1523);
    float _1527 = _1515 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1529 = _1515 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1531 = _1511;
    if (!_1471)
    {
        _1531 = _1521;
    }
    int _1533 = _1531;
    float _1535 = _1515 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1537 = _1475 * (*spvDescriptorSet0.vp_c10)._m0[10].x;
    float _1539 = fma(_1513, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1529);
    int _1541 = _1533 << 6;
    float _1543 = fma(_1513, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1527);
    float _1545 = fma(_1513, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1535);
    float _1547 = _1475 * (*spvDescriptorSet0.vp_c10)._m0[8].x;
    int _1549 = _1541 + 96;
    uint _1551 = uint(int(uint(_1549) >> uint(2)));
    uint _1553 = uint(int(uint(int(_1551)) >> uint(2)));
    int _1555 = int(_1551) & 3;
    float _1557 = (*spvDescriptorSet0.vp_c15)._m0[int(_1553)][_1555];
    int _1559 = int(_1551) + 1;
    uint _1561 = uint(int(uint(_1559) >> uint(2)));
    int _1563 = _1559 & 3;
    float _1565 = (*spvDescriptorSet0.vp_c15)._m0[int(_1561)][_1563];
    float _1567 = _1475 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1569 = -_1503;
    float _1571 = _1569 + 1.0;
    float _1573 = _1537 * _1537;
    float _1575 = fma(_1517, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1543);
    float _1577 = fma(_1517, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1539);
    float _1579 = fma(_1517, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1545);
    float _1581 = _1547 * _1571;
    float _1583 = fma(_1571, _1573, _1503);
    int _1585 = _1541 + 104;
    uint _1587 = uint(int(uint(_1585) >> uint(2)));
    uint _1589 = uint(int(uint(int(_1587)) >> uint(2)));
    int _1591 = int(_1587) & 3;
    float _1593 = (*spvDescriptorSet0.vp_c15)._m0[int(_1589)][_1591];
    int _1595 = int(_1587) + 1;
    uint _1597 = uint(int(uint(_1595) >> uint(2)));
    int _1599 = _1595 & 3;
    float _1601 = (*spvDescriptorSet0.vp_c15)._m0[int(_1597)][_1599];
    float _1603 = _1547 * _1525;
    float _1605 = _1567 * _1571;
    float _1607 = _1537 * _1525;
    float _1609 = _1567 * _1525;
    float _1611 = fma(_1547, _1581, _1503);
    float _1613 = fma(_1537, _1605, _1603);
    float _1615 = -_1607;
    float _1617 = fma(_1567, _1581, _1615);
    int _1619 = _1541 + 64;
    uint _1621 = uint(int(uint(_1619) >> uint(2)));
    uint _1623 = uint(int(uint(int(_1621)) >> uint(2)));
    int _1625 = int(_1621) & 3;
    float _1627 = (*spvDescriptorSet0.vp_c15)._m0[int(_1623)][_1625];
    int _1629 = int(_1621) + 1;
    uint _1631 = uint(int(uint(_1629) >> uint(2)));
    int _1633 = _1629 & 3;
    float _1635 = (*spvDescriptorSet0.vp_c15)._m0[int(_1631)][_1633];
    float _1637 = -_1609;
    float _1639 = fma(_1537, _1581, _1637);
    float _1641 = _1577 * _1613;
    float _1643 = _1577 * _1617;
    float _1645 = fma(_1537, _1581, _1609);
    float _1647 = 0.0;
    float _1649 = _1537;
    float _1651 = as_type<float>(_1533);
    if (!_1401)
    {
        int _1653 = _1461 << 4;
        int _1655 = _1653 + _1479;
        _1647 = as_type<float>(_1655);
    }
    float _1657 = _1647;
    float _1659 = fma(_1575, _1639, _1641);
    float _1661 = fma(_1575, _1611, _1643);
    int _1663 = _1541 + 48;
    uint _1665 = uint(int(uint(_1663) >> uint(2)));
    uint _1667 = uint(int(uint(int(_1665)) >> uint(2)));
    int _1669 = int(_1665) & 3;
    float _1671 = (*spvDescriptorSet0.vp_c15)._m0[int(_1667)][_1669];
    int _1673 = int(_1665) + 1;
    uint _1675 = uint(int(uint(_1673) >> uint(2)));
    int _1677 = _1673 & 3;
    float _1679 = (*spvDescriptorSet0.vp_c15)._m0[int(_1675)][_1677];
    float _1681 = fma(_1567, _1605, _1503);
    float _1683 = fma(_1579, _1583, _1659);
    float _1685 = fma(_1579, _1645, _1661);
    float _1687 = -_1603;
    float _1689 = fma(_1537, _1605, _1687);
    float _1691 = fma(_1567, _1581, _1607);
    float _1693 = _983 + _1683;
    float _1695 = _981 + _1685;
    int _1697 = _1541 + 56;
    uint _1699 = uint(int(uint(_1697) >> uint(2)));
    uint _1701 = uint(int(uint(int(_1699)) >> uint(2)));
    int _1703 = int(_1699) & 3;
    float _1705 = (*spvDescriptorSet0.vp_c15)._m0[int(_1701)][_1703];
    int _1707 = int(_1699) + 1;
    uint _1709 = uint(int(uint(_1707) >> uint(2)));
    int _1711 = _1707 & 3;
    float _1713 = (*spvDescriptorSet0.vp_c15)._m0[int(_1709)][_1711];
    float _1715 = _1693;
    if (!_1401)
    {
        float _1717 = floor(_1303);
        _1649 = _1717;
    }
    float _1719 = _1649;
    float _1721 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1723 = _1693 + _1721;
    float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1727 = _1695 + _1725;
    float _1729 = _1577 * _1681;
    float _1731 = _1723 * _1723;
    int _1733 = _1541 + 72;
    uint _1735 = uint(int(uint(_1733) >> uint(2)));
    uint _1737 = uint(int(uint(int(_1735)) >> uint(2)));
    int _1739 = int(_1735) & 3;
    float _1741 = (*spvDescriptorSet0.vp_c15)._m0[int(_1737)][_1739];
    int _1743 = int(_1735) + 1;
    uint _1745 = uint(int(uint(_1743) >> uint(2)));
    int _1747 = _1743 & 3;
    float _1749 = (*spvDescriptorSet0.vp_c15)._m0[int(_1745)][_1747];
    float _1751 = fma(_1575, _1691, _1729);
    float _1753 = fma(_1727, _1727, _1731);
    float _1755 = fma(_1579, _1689, _1751);
    float _1757 = sqrt(_1753);
    float _1759 = _1657;
    if (!_1401)
    {
        int _1761 = as_type<int>(_1657) + 400;
        uint _1763 = uint(int(uint(_1761) >> uint(2)));
        uint _1765 = uint(int(uint(int(_1763)) >> uint(2)));
        int _1767 = int(_1763) & 3;
        float _1769 = (*spvDescriptorSet0.vp_c15)._m0[int(_1765)][_1767];
        _1759 = _1769;
    }
    float _1771 = _1759;
    int _1773 = _1541 + 80;
    uint _1775 = uint(int(uint(_1773) >> uint(2)));
    uint _1777 = uint(int(uint(int(_1775)) >> uint(2)));
    int _1779 = int(_1775) & 3;
    float _1781 = (*spvDescriptorSet0.vp_c15)._m0[int(_1777)][_1779];
    int _1783 = int(_1775) + 1;
    uint _1785 = uint(int(uint(_1783) >> uint(2)));
    int _1787 = _1783 & 3;
    float _1789 = (*spvDescriptorSet0.vp_c15)._m0[int(_1785)][_1787];
    bool _1791 = _1757 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1793 = _1541 + 88;
    uint _1795 = uint(int(uint(_1793) >> uint(2)));
    uint _1797 = uint(int(uint(int(_1795)) >> uint(2)));
    int _1799 = int(_1795) & 3;
    float _1801 = (*spvDescriptorSet0.vp_c15)._m0[int(_1797)][_1799];
    int _1803 = int(_1795) + 1;
    uint _1805 = uint(int(uint(_1803) >> uint(2)));
    int _1807 = _1803 & 3;
    float _1809 = (*spvDescriptorSet0.vp_c15)._m0[int(_1805)][_1807];
    float _1811 = _1215 * _1635;
    float _1813 = _1215 * _1565;
    float _1815 = _1565;
    if (!_1401)
    {
        float _1817 = floor(_1269);
        _1815 = _1817;
    }
    float _1819 = _1815;
    float _1821 = fma(_981, _1557, _1813);
    float _1823 = fma(_983, _1593, _1821);
    float _1825 = _1215 * _1679;
    float _1827 = _1823 + _1601;
    float _1829 = fma(_981, _1627, _1811);
    float _1831 = fma(_981, _1671, _1825);
    float _1833 = 1.0 / _1827;
    float _1835 = fma(_983, _1741, _1829);
    float _1837 = fma(_983, _1705, _1831);
    float _1839 = _1089 + _1755;
    float _1841 = _1835 + _1749;
    float _1843 = _1837 + _1713;
    float _1845 = _1837;
    float _1847 = _1839;
    float _1849 = _1741;
    if (!_1791)
    {
        _1845 = _1695;
    }
    float _1851 = _1845;
    bool _1853 = !_1791;
    float _1855 = _1851;
    if (!_1853)
    {
        float _1857 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1861 = _1757 + _1859;
        float _1863 = rsqrt(_1753);
        float _1865 = _1861 * _1857;
        float _1867 = _1839 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1869 = _1865 * 0.15915493667125701904296875;
        float _1871 = _1869 * 6.283185482025146484375;
        float _1873 = cos(_1871);
        float _1875 = _1869 * 6.283185482025146484375;
        float _1877 = sin(_1875);
        float _1879 = _1873 + (-1.0);
        float _1881 = fma(_1877, _1867, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1883 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1885 = _1863 * _1881;
        float _1887 = fma(_1839, _1873, _1883);
        float _1889 = fma(_1727, _1885, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1891 = fma(_1723, _1885, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1847 = _1887;
        _1855 = _1889;
        _1715 = _1891;
    }
    float _1893 = _1847;
    float _1895 = _1855;
    float _1897 = _1715;
    float _1899 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1901 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1903 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1905 = _1843 * _1833;
    float _1907 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1899);
    float _1909 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1901);
    float _1911 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1903);
    if (!_1401)
    {
        float _1913 = rint(_1771);
        float _1915 = precise::max(_1913, 0.0);
        uint _1917 = uint(_1915);
        uint _1919 = clamp(_1917, 0u, 65535u);
        _1849 = as_type<float>(_1919);
    }
    float _1921 = _1849;
    float _1923 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1907);
    bool _1925 = _1905 >= 0.0;
    float _1927 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1929 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1911);
    float _1931 = _1841 * _1833;
    bool _1933 = _1905 <= 1.0;
    bool _1935 = _1933 && _1925;
    float _1937 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1939 = _1215 * _1789;
    float _1941 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1909);
    float _1943 = _1923 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1945 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1927);
    float _1947 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1949 = _1941 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1951 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1953 = _1931 >= 0.0;
    bool _1955 = _1953 && _1935;
    float _1957 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1945);
    float _1959 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1961 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1951);
    bool _1963 = _1931 <= 1.0;
    bool _1965 = _1963 && _1955;
    float _1967 = _1957 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1969 = -_1959;
    float _1971 = fma(_1969, _1937, 1.0);
    float _1973 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1961);
    float _1975 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1977 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1979 = fma(_981, _1781, _1939);
    float _1981 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1973);
    float _1983 = log2(_1971);
    float _1985 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1975);
    float _1987 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1977);
    float _1989 = fma(_983, _1801, _1979);
    float _1991 = _1939;
    if (!_1401)
    {
        float _1993 = -_1719;
        float _1995 = _1303 + _1993;
        _1991 = _1995;
    }
    float _1997 = _1991;
    if (_1965)
    {
        float _1999 = float(_1533);
        _1651 = _1999;
    }
    float _2001 = _1651;
    float _2003 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1985);
    float _2005 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1987);
    float _2007 = 1.0 / _1981;
    float _2009 = _1989 + _1809;
    float _2011 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2003);
    float _2013 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2005);
    float _2015 = _2005;
    float _2017 = _2001;
    if (!_1401)
    {
        float _2019 = -_1819;
        float _2021 = _1269 + _2019;
        _2015 = _2021;
    }
    float _2023 = _2015;
    float _2025 = _2009 * _1833;
    float _2027 = _1975;
    if (_1965)
    {
        float _2029 = rint(_2001);
        float _2031 = precise::max(_2029, 0.0);
        uint _2033 = uint(_2031);
        uint _2035 = clamp(_2033, 0u, 65535u);
        _2027 = as_type<float>(_2035);
    }
    float _2037 = _2027;
    float _2039 = _1983 * 0.693147182464599609375;
    float _2041 = _1997;
    if (!_1401)
    {
        float3 _6005 = float3(_2023, _1997, float(as_type<int>(_1921)));
        float3 _6009 = select(_6005, float3(0.0), isnan(_6005));
        float _2043 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6009.xy, uint(rint(_6009.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6009.xy, uint(rint(_6009.z)), level(0.0)).x;
        _2041 = _2043;
    }
    float _2045 = _2041;
    float _2047 = _2039 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2049 = _2011 * _2007;
    float _2051 = _2013 * _2007;
    float _2053 = fma(_2049, 0.5, 0.5);
    float _2055 = fma(_2051, -0.5, 0.5);
    float _2057 = _1931;
    float _2059 = _2047;
    if (_1965)
    {
        float3 _6039 = float3(_1905, _1931, float(as_type<int>(_2037)));
        float3 _6041 = select(_6039, float3(0.0), isnan(_6039));
        float _2061 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6041.xy, uint(rint(_6041.z)), _2025, level(0.0));
        _2057 = _2061;
    }
    float _2063 = _2057;
    float3 _6051 = float3(_2053, _2055, _2047);
    float _2065 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6051, float3(0.0), isnan(_6051)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6051, float3(0.0), isnan(_6051)), level(0.0)).x;
    float3 _6060 = float3(_2053, _2055, _2047);
    float4 _2067 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6060, float3(0.0), isnan(_6060)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6060, float3(0.0), isnan(_6060)), level(0.0)).xyzw;
    float _2069 = _2067.x;
    float _2071 = _2067.y;
    float _2073 = _2067.z;
    float _2075 = _2067.w;
    float _2077 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1401)
    {
        _2017 = 1.0;
    }
    float _2079 = _2017;
    bool _2081 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2083 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2085 = _2081 || _2083;
    bool _2087 = isnan(0.5);
    bool _2089 = _2085 || _2087;
    float _2091 = _2079;
    if (_2089)
    {
        _2077 = 1.0;
    }
    float _2093 = _2077;
    float _2095 = _2093;
    if (!_2089)
    {
        float _2097 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2099 = _2097 * 0.15915493667125701904296875;
        float _2101 = _2099 * 6.283185482025146484375;
        float _2103 = cos(_2101);
        float _2105 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2107 = _2105 * 0.15915493667125701904296875;
        float _2109 = _2099 * 6.283185482025146484375;
        float _2111 = sin(_2109);
        float _2113 = 1.0 / _2103;
        float _2115 = _2107 * 6.283185482025146484375;
        float _2117 = cos(_2115);
        float _2119 = _2111 * _2113;
        float _2121 = _2107 * 6.283185482025146484375;
        float _2123 = sin(_2121);
        float _2125 = _2117 * _2119;
        float _2127 = 1.0 / _2125;
        float _2129 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2131 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2129;
        float _2133 = 1.0 / _2131;
        float _2135 = _2123 * _2127;
        float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2139 = fma(_1447, _2135, _2137);
        float _2141 = _2139 * _2133;
        float _2143 = precise::clamp(_2141, 0.0, 1.0);
        _2095 = _2143;
    }
    float _2145 = _2095;
    if (!_1401)
    {
        int _2147 = _1437 << 4;
        int _2149 = _2147 + 2048;
        uint _2151 = uint(int(uint(_2149) >> uint(2)));
        uint _2153 = uint(int(uint(int(_2151)) >> uint(2)));
        int _2155 = int(_2151) & 3;
        float _2157 = (*spvDescriptorSet0.vp_c15)._m0[int(_2153)][_2155];
        int _2159 = int(_2151) + 1;
        uint _2161 = uint(int(uint(_2159) >> uint(2)));
        int _2163 = _2159 & 3;
        float _2165 = (*spvDescriptorSet0.vp_c15)._m0[int(_2161)][_2163];
        int _2167 = _2149 + 8;
        uint _2169 = uint(int(uint(_2167) >> uint(2)));
        uint _2171 = uint(int(uint(int(_2169)) >> uint(2)));
        int _2173 = int(_2169) & 3;
        float _2175 = (*spvDescriptorSet0.vp_c15)._m0[int(_2171)][_2173];
        int _2177 = int(_2169) + 1;
        uint _2179 = uint(int(uint(_2177) >> uint(2)));
        int _2181 = _2177 & 3;
        float _2183 = (*spvDescriptorSet0.vp_c15)._m0[int(_2179)][_2181];
        float _2185 = _1215 * _2165;
        float _2187 = fma(_981, _2157, _2185);
        float _2189 = fma(_983, _2175, _2187);
        float _2191 = _2189 + _2183;
        float _2193 = precise::clamp(_2191, 0.0, 1.0);
        float _2195 = -_2193;
        float _2197 = _2195 + _2045;
        float _2199 = fma(_2197, 500.0, 1.5);
        float _2201 = exp2(_2199);
        float _2203 = 0.0 + _2201;
        float _2205 = precise::clamp(_2203, 0.0, 1.0);
        _1449 = as_type<float>(_2149);
        _2091 = _2205;
    }
    float _2207 = _1449;
    float _2209 = _2091;
    float _2211 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2213 = _1893 + _2211;
    float _2215 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2217 = _1895 + _2215;
    float _2219 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2221 = _1897 + _2219;
    float _2223 = _2213 * _2213;
    float _2225 = fma(_2217, _2217, _2223);
    float _2227 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2229 = fma(_2221, _2221, _2225);
    float _2231 = rsqrt(_2229);
    float _2233 = sqrt(_2229);
    float _2235 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2237 = _2217 * _2235;
    float _2239 = _2221 * _2235;
    float _2241 = _2237 * _2237;
    float _2243 = _2239 * _2239;
    float _2245 = _2241 + _2243;
    float _2247 = sqrt(_2245);
    bool _2249 = _2247 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2253 = _2247 + _2251;
    float _2255 = _2045;
    float _2257 = _2253;
    float _2259 = _2227;
    float _2261 = _2235;
    float _2263 = _2239;
    float _2265 = _2243;
    float _2267 = _2241;
    if (_2249)
    {
        float _2269 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2255 = _2269;
    }
    float _2271 = _2255;
    if (_2249)
    {
        float _2273 = _2253 * _2271;
        _2257 = _2273;
    }
    float _2275 = _2257;
    float _2277 = precise::max(0.0, _2227);
    float _2279 = _2277;
    if (_2249)
    {
        float _2281 = rsqrt(_2245);
        _2259 = _2281;
    }
    float _2283 = _2259;
    float _2285 = _2283;
    if (_2249)
    {
        float _2287 = _2275 * 0.15915493667125701904296875;
        _2059 = _2287;
    }
    float _2289 = _2059;
    float _2291 = -_2235;
    float _2293 = -_2277;
    float _2295 = fma(_2213, _2291, _2293);
    float _2297 = _2295;
    if (_2249)
    {
        float _2299 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2261 = _2299;
    }
    float _2301 = _2261;
    float _2303 = _2207;
    float _2305 = _2301;
    if (_2249)
    {
        float _2307 = _2289 * 6.283185482025146484375;
        float _2309 = sin(_2307);
        _2303 = _2309;
    }
    float _2311 = _2303;
    float _2313 = _2275;
    if (_2249)
    {
        float _2315 = _2289 * 6.283185482025146484375;
        float _2317 = cos(_2315);
        _2313 = _2317;
    }
    float _2319 = _2313;
    if (_2249)
    {
        float _2321 = fma(_2311, _2301, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2279 = _2321;
    }
    float _2323 = _2279;
    float _2325 = _2323;
    if (_2249)
    {
        float _2327 = _2283 * _2323;
        _2285 = _2327;
    }
    float _2329 = _2285;
    if (_2249)
    {
        float _2331 = _2319 + (-1.0);
        _2305 = _2331;
    }
    float _2333 = _2305;
    float _2335 = _2333;
    if (_2249)
    {
        float _2337 = _2239 * _2329;
        _2263 = _2337;
    }
    float _2339 = _2263;
    if (_2249)
    {
        float _2341 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2325 = _2341;
    }
    float _2343 = _2325;
    if (!_2249)
    {
        _2335 = _2237;
    }
    float _2345 = _2335;
    float _2347 = _2345;
    if (_2249)
    {
        float _2349 = _2237 * _2329;
        _2347 = _2349;
    }
    float _2351 = _2347;
    if (_2249)
    {
        float _2353 = _2339 * _2339;
        _2265 = _2353;
    }
    float _2355 = _2265;
    if (_2249)
    {
        float _2357 = fma(_2295, _2319, _2343);
        _2297 = _2357;
    }
    float _2359 = _2297;
    if (_2249)
    {
        float _2361 = _2351 * _2351;
        _2267 = _2361;
    }
    float _2363 = _2267;
    float _2365 = fma(_2359, _2359, _2363);
    float _2367 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2369 = fma(_2233, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2367);
    float _2371 = precise::clamp(_2369, 0.0, 1.0);
    float _2373 = _2365 + _2355;
    float _2375 = -_2371;
    float _2377 = _2375 + 1.0;
    float _2379 = rsqrt(_2373);
    float _2381 = abs(_2377);
    float _2383 = log2(_2381);
    float _2385 = _2379 * _2351;
    float _2387 = _2379 * _2359;
    float _2389 = _2379 * _2339;
    float _2391 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2393 = -_2391;
    float _2395 = fma(_2387, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2393);
    float _2397 = _2383 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2399 = -_2389;
    float _2401 = fma(_2399, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2395);
    float _2403 = exp2(_2397);
    float _2405 = fma(_2401, -0.5, 0.5);
    float _2407 = fma(_2401, 0.5, 0.5);
    float _2409 = _2387 + 1.0;
    float _2411 = fma(_2407, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2413 = sqrt(_2405);
    float _2415 = fma(_2407, _2411, -0.212114393711090087890625);
    float _2417 = fma(_2407, _2415, 1.570728778839111328125);
    float _2419 = -_2387;
    float _2421 = fma(_2403, _2409, _2419);
    float _2423 = fma(_2421, 0.5, 0.5);
    float _2425 = _2413 * 0.636619746685028076171875;
    float _2427 = -_2417;
    float _2429 = fma(_2425, _2427, 1.0);
    float2 _6601 = float2(_2429, _2423);
    float3 _2433 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6601, float2(0.0), isnan(_6601)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6601, float2(0.0), isnan(_6601)), level(0.0)).xyz;
    float _2435 = _2433.x;
    float _2437 = _2433.y;
    float _2439 = _2433.z;
    float _2441 = _913 * _967;
    float _2443 = _909 * 2.0;
    float _2445 = _875 * 3.883221149444580078125;
    bool _2447 = _893 != 0.0;
    bool _2449 = isnan(_893);
    bool _2451 = _2447 || _2449;
    bool _2453 = isnan(0.0);
    bool _2455 = _2451 || _2453;
    float _2457 = -_691;
    float _2459 = _2457 + _877;
    float _2461 = -_2443;
    float _2463 = fma(_2441, _2461, _2441);
    float _2465 = _2445 * 0.15915493667125701904296875;
    bool _2467 = _857 == 0.0;
    bool _2469 = !_2455;
    bool _2471 = _2467 && _2469;
    float _2473 = fma(_829, _2459, _691);
    float _2475 = fma(_909, 3.1415927410125732421875, _2463);
    float _2477 = _2465 * 6.283185482025146484375;
    float _2479 = sin(_2477);
    bool _2481 = _915 == 0.0;
    bool _2483 = _2481 && _2471;
    float _2485 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2473);
    float _2487 = _2475 * 0.15915493667125701904296875;
    out.m_73.x = _705;
    out.m_73.y = _613;
    out.m_73.z = _615;
    float _2489 = _2383 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2491 = -_1001;
    float _2493 = _2491 + 1.0;
    float _2495 = _2487 * 6.283185482025146484375;
    float _2497 = sin(_2495);
    out.m_75.z = _579;
    out.m_75.w = _593;
    out.m_77.x = _1895;
    out.m_77.y = _1893;
    out.m_77.z = _1897;
    int _2499 = as_type<int>(_2441);
    int _2501 = as_type<int>(_2487);
    if (_2483)
    {
        _2499 = as_type<int>(_2485);
    }
    int _2503 = _2499;
    int _2505 = _2503;
    if (!_2483)
    {
        _2505 = as_type<int>(_2485);
    }
    int _2507 = _2505;
    float _2509 = abs(_1447);
    float _2511 = log2(_2509);
    float _2513 = -_837;
    float _2515 = fma(_2497, _2479, _2513);
    float _2517 = exp2(_2489);
    bool _2519 = _1447 <= 8000.0;
    bool _2521 = isnan(_1447);
    bool _2523 = _2519 || _2521;
    bool _2525 = isnan(8000.0);
    bool _2527 = _2523 || _2525;
    float _2529 = float(_2527);
    float _2531 = fma(_829, _2515, _837);
    float _2533 = _2483 ? _2473 : as_type<float>(_2507);
    float _2535 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2531);
    float _2537 = _2465 * 6.283185482025146484375;
    float _2539 = cos(_2537);
    float _2541 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2543 = _2497;
    if (_2483)
    {
        _2501 = as_type<int>(_2535);
    }
    int _2545 = _2501;
    int _2547 = _2545;
    if (!_2483)
    {
        _2547 = as_type<int>(_2535);
    }
    int _2549 = _2547;
    float _2551 = exp2(_2541);
    float _2553 = _2483 ? _2531 : as_type<float>(_2549);
    float _2555 = _2533 * _2533;
    float _2557 = fma(_2553, _2553, _2555);
    float _2559 = -_835;
    float _2561 = fma(_2497, _2539, _2559);
    float _2563 = _2555;
    if (_2483)
    {
        _2543 = _2473;
    }
    float _2565 = _2543;
    float _2567 = _2565;
    if (!_2483)
    {
        _2567 = _2485;
    }
    float _2569 = _2567;
    float _2571 = fma(_829, _2561, _835);
    float _2573 = rsqrt(_2557);
    float _2575 = _2571;
    if (_2483)
    {
        _2563 = _2531;
    }
    float _2577 = _2563;
    float _2579 = _2577;
    if (!_2483)
    {
        float _2581 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2571);
        _2575 = _2581;
    }
    float _2583 = _2575;
    float _2585 = _1465 * _2569;
    if (!_2483)
    {
        _2579 = _2535;
    }
    float _2587 = _2579;
    float _2589 = -_2569;
    float _2591 = _1443 * _2589;
    float _2593 = _1467 * _2569;
    float _2595 = fma(_2551, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2597 = precise::clamp(_2595, 0.0, 1.0);
    float _2599 = fma(_1481, _2583, _2585);
    float _2601 = fma(_1469, _2583, _2591);
    bool _2603 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2605 = isnan(_2233);
    bool _2607 = _2603 || _2605;
    bool _2609 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2611 = _2607 || _2609;
    float _2613 = fma(_1491, _2587, _2599);
    float _2615 = _2533 * _2573;
    float _2617 = _2553 * _2573;
    float _2619 = _2613 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2621 = -_2615;
    float _2623 = _1473 * _2621;
    float _2625 = fma(_1473, _2587, _2601);
    float _2627 = fma(_1485, _2583, _2593);
    float _2629 = -_2615;
    float _2631 = _1491 * _2629;
    float _2633 = -_1443;
    float _2635 = fma(_2633, _2617, _2623);
    float _2637 = _1481 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2639 = -_2615;
    float _2641 = _1487 * _2639;
    float _2643 = _1481 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2645 = _1481 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2647 = fma(_1469, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2637);
    float _2649 = _2613 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2651 = fma(_1465, _2617, _2631);
    float _2653 = fma(_1469, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2643);
    float _2655 = fma(_1469, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2645);
    float _2657 = _2613 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2659 = fma(_2625, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2649);
    float _2661 = fma(_1487, _2587, _2627);
    float _2663 = _2651 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2665 = fma(_1485, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2647);
    float _2667 = fma(_1485, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2653);
    float _2669 = fma(_1485, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2655);
    float _2671 = fma(_1467, _2617, _2641);
    float _2673 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2675 = fma(_2625, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2657);
    float _2677 = _2651 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2679 = fma(_2635, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2663);
    float _2681 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2673);
    out.m_79.x = _2665;
    out.m_79.y = _2667;
    out.m_79.z = _2669;
    float _2683 = _2651 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2685 = fma(_2635, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2677);
    float _2687 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2681);
    float _2689 = fma(_2625, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2619);
    float _2691 = fma(_2635, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2683);
    float _2693 = fma(_2661, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2659);
    float _2695 = fma(_2671, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2679);
    float _2697 = fma(_2661, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2675);
    float _2699 = fma(_2671, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2685);
    float _2701 = fma(_2671, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2691);
    float _2703 = _2011 + _1981;
    float _2705 = _2697 * _1617;
    float _2707 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2687);
    float _2709 = _2697 * _1681;
    float _2711 = _2697 * _1613;
    out.m_81.x = _2695;
    out.m_81.y = _2699;
    out.m_81.z = _2701;
    float _2713 = _2707 + _1981;
    float _2715 = fma(_2661, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2689);
    float _2717 = fma(_2693, _1611, _2705);
    float _2719 = fma(_2693, _1691, _2709);
    float _2721 = _1981 * 0.5;
    out.gl_Position.x = _2011;
    out.gl_Position.y = _2013;
    out.gl_Position.z = _2707;
    out.gl_Position.w = _1981;
    float _2723 = fma(_2715, _1689, _2719);
    float _2725 = _2713 * 0.5;
    float _2727 = _2703 * 0.5;
    float _2729 = fma(_2693, _1639, _2711);
    float _2731 = fma(_2715, _1645, _2717);
    float _2733 = fma(_2013, -0.5, _2721);
    float _2735 = fma(_2715, _1583, _2729);
    float _2737 = in.m_83.w;
    float _2739 = fma(_2597, -2.0, 3.0);
    float _2741 = _2597 * _2597;
    out.m_85.x = _2727;
    out.m_85.y = _2733;
    out.m_85.z = _2725;
    out.m_85.w = _1981;
    float _2743 = _2741 * _2739;
    out.m_87.x = _2731;
    out.m_87.y = _2723;
    out.m_87.z = _2735;
    float _2745 = -_2743;
    float _2747 = _2745 + 1.0;
    float _2749 = fma(_2747, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2743);
    float _2751 = _2743;
    if (!_1965)
    {
        _2751 = 1.0;
    }
    float _2753 = _2751;
    float _2755 = _2753;
    if (_1965)
    {
        bool _2757 = _2063 >= _2025;
        bool _2759 = isnan(_2063);
        bool _2761 = _2757 || _2759;
        bool _2763 = isnan(_2025);
        bool _2765 = _2761 || _2763;
        float _2767 = float(_2765);
        _2755 = _2767;
    }
    float _2769 = _2755;
    float _2771 = _2529 * _2749;
    float _2773 = -_2517;
    float _2775 = _2773 + 1.0;
    float _2777 = _2771 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2779 = _2775 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2781 = _2769 * _2209;
    out.m_89.w = _2737;
    float _2783 = _2493 * _2777;
    float _2785 = precise::clamp(_2783, 0.0, 1.0);
    float _2787 = _2779 * _2065;
    float _2789 = -_2785;
    float _2791 = fma(_2789, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2793 = _2075 * _2787;
    float _2795 = -_2779;
    float _2797 = _2795 + 1.0;
    float _2799 = _2145 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2801 = -_2781;
    float _2803 = fma(_2801, _2791, 1.0);
    float _2805 = precise::clamp(_2803, 0.0, 1.0);
    float _2807 = _2781;
    float _2809 = _2797;
    float _2811 = _2805;
    if (!_2611)
    {
        _2807 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2813 = _2807;
    float _2815 = _2075 * _2797;
    float _2817 = _2813;
    float _2819 = _2813;
    if (!_2611)
    {
        _2809 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2821 = _2809;
    float _2823 = _2439 * _2787;
    float _2825 = fma(_2435, _2793, _2069);
    float _2827 = fma(_2437, _2793, _2071);
    float _2829 = _2805 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2831 = fma(_2075, _2823, _2073);
    float _2833 = _2821;
    float _2835 = _2821;
    if (!_2611)
    {
        _2811 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2837 = _2811;
    out.m_91.x = _2829;
    out.m_93.x = _2825;
    out.m_93.y = _2827;
    out.m_93.z = _2831;
    out.m_93.w = _2815;
    bool _2839 = !_2611;
    float _2841 = _2837;
    float _2843 = _2837;
    if (!_2839)
    {
        bool _2845 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2847 = isnan(_2233);
        bool _2849 = _2845 || _2847;
        bool _2851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2853 = _2849 || _2851;
        if (!_2853)
        {
            float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2857 = _2233 + _2855;
            float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2861 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2859;
            float _2863 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2865 = _2863 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2867 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2869 = _2867 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2871 = 1.0 / _2861;
            float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2875 = _2873 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2877 = _2857 * _2871;
            float _2879 = precise::clamp(_2877, 0.0, 1.0);
            float _2881 = fma(_2879, _2865, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2883 = fma(_2879, _2869, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2885 = fma(_2879, _2875, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2843 = _2883;
            _2819 = _2881;
            _2835 = _2885;
            _2887 = true;
        }
        else
        {
            bool _2889 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2891 = isnan(_2233);
            bool _2893 = _2889 || _2891;
            bool _2895 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2897 = _2893 || _2895;
            if (!_2897)
            {
                _2817 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2899 = _2817;
            _2819 = _2899;
            if (!_2897)
            {
                _2841 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2901 = _2841;
            _2843 = _2901;
            if (!_2897)
            {
                _2833 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2903 = _2833;
            bool _2905 = !_2897;
            _2835 = _2903;
            if (!_2905)
            {
                bool _2907 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2909 = isnan(_2233);
                bool _2911 = _2907 || _2909;
                bool _2913 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2915 = _2911 || _2913;
                if (!_2915)
                {
                    float _2917 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2919 = _2233 + _2917;
                    float _2921 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2923 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2921;
                    float _2925 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2929 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2931 = _2929 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2933 = 1.0 / _2923;
                    float _2935 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2937 = _2935 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2939 = _2919 * _2933;
                    float _2941 = precise::clamp(_2939, 0.0, 1.0);
                    float _2943 = fma(_2941, _2927, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2945 = fma(_2941, _2931, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2947 = fma(_2941, _2937, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2843 = _2945;
                    _2819 = _2943;
                    _2835 = _2947;
                    _2887 = true;
                }
                else
                {
                    _2843 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2819 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2835 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2887 = false;
    float _2949 = _2843;
    float _2951 = _2819;
    float _2953 = _2835;
    float _2955 = _2799 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_95.x = 0.0;
    float _2957 = _2949 * 0.586610972881317138671875;
    bool _2959 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_61.x = _2955;
    float _2961 = fma(_2951, 0.298911988735198974609375, _2957);
    bool _2963 = _2145 > 0.0;
    bool _2965 = isnan(_2145);
    bool _2967 = _2963 || _2965;
    bool _2969 = isnan(0.0);
    bool _2971 = _2967 || _2969;
    float _2973 = fma(_2953, 0.114477999508380889892578125, _2961);
    float _2975 = -_2973;
    float _2977 = _2975 + _2951;
    float _2979 = -_2973;
    float _2981 = _2979 + _2949;
    float _2983 = -_2973;
    float _2985 = _2983 + _2953;
    float _2987 = fma(_2977, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2973);
    float _2989 = fma(_2981, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2973);
    float _2991 = fma(_2985, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2973);
    bool _2993 = !_2959;
    if (!_2993)
    {
        float _2995 = -_1893;
        float _2997 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2999 = -_1895;
        float _3001 = _2999 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3003 = -_1897;
        float _3005 = _3003 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3007 = _2997 * _2997;
        float _3009 = fma(_3001, _3001, _3007);
        float _3011 = fma(_3005, _3005, _3009);
        float _3013 = sqrt(_3011);
        float _3015 = rsqrt(_3011);
        float _3017 = -_3013;
        float _3019 = _3017 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3021 = _3019 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3023 = precise::clamp(_3021, 0.0, 1.0);
        float _3025 = _3001 * _3015;
        float _3027 = _2997 * _3015;
        float _3029 = abs(_3023);
        float _3031 = log2(_3029);
        float _3033 = _3005 * _3015;
        float _3035 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3037 = _2723 * _3027;
        float _3039 = -_3027;
        float _3041 = -_3035;
        float _3043 = fma(_3039, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3041);
        float _3045 = fma(_2731, _3025, _3037);
        float _3047 = -_3033;
        float _3049 = fma(_3047, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3043);
        float _3051 = fma(_2735, _3033, _3045);
        float _3053 = precise::clamp(_3051, 0.0, 1.0);
        float _3055 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3057 = _3049 + _3055;
        float _3059 = _3031 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3061 = _3057 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3063 = precise::clamp(_3061, 0.0, 1.0);
        float _3065 = exp2(_3059);
        float _3067 = _3065 * _3063;
        float _3069 = _3053 * _3067;
        float _3071 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3073 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3075 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _3071;
        out.m_95.y = _3073;
        out.m_95.z = _3075;
    }
    out.m_97.x = _2987;
    out.m_97.y = _2989;
    out.m_97.z = _2991;
    if (_2971)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _3077 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3077;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2887 = false;
    bool _943 = false;
    bool _751 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_58.w;
    float _119 = trunc(_117);
    int _121 = int(_119);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    float _129 = as_type<float>(_121);
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _127;
    float _133 = _131;
    if (!_125)
    {
        out.m_61.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3136 = as_type<float>(_139);
        out.gl_Position.z = _3136;
    }
    if (!_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_63.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = _157;
    if (_153)
    {
        float _161 = float(_121);
        _133 = _161;
    }
    float _163 = _133;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    if (_169)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _129;
    if (_169)
    {
        out.m_61.x = 0.0;
    }
    if (_169)
    {
        float _173 = _171 * 5.0;
        _141 = as_type<int>(_173);
    }
    int _175 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3205 = as_type<float>(_175);
        out.gl_Position.z = _3205;
    }
    if (_169)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    int _177 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _179 = _177;
    int _181 = 0;
    int _183 = _112(_179, _181, (*spvDescriptorSet0.support_buffer));
    float _185 = _157 * 0.0500000007450580596923828125;
    float _187 = in.m_65.z;
    float _189 = trunc(_187);
    int _191 = int(_189);
    float _193 = float(_183);
    int _195 = abs(_183);
    bool _197 = _183 == 0;
    float _199 = _185 * _193;
    float _201 = float(uint(_195));
    float _203 = trunc(_199);
    int _205 = int(_203);
    float _207 = 1.0 / _201;
    int _209 = abs(_205);
    uint _212 = uint(int(uint(_205) >> uint(31)));
    float _214 = float(uint(_209));
    int _216 = ~int(_212);
    int _218 = _216 + 1;
    int _220 = as_type<int>(_207) + (-2);
    float _222 = as_type<float>(_220) * _214;
    float _224 = trunc(_222);
    float _226 = precise::max(_224, 0.0);
    uint _228 = uint(_226);
    int _230 = ~int(_228);
    int _232 = _230 + 1;
    int _234 = _232 * _195;
    int _236 = _234 + _209;
    float _238 = float(uint(_236));
    float _240 = as_type<float>(_220) * _238;
    float _242 = trunc(_240);
    float _244 = precise::max(_242, 0.0);
    uint _246 = uint(_244);
    int _248 = int(_228) + int(_246);
    int _250 = ~_248;
    int _252 = _250 + 1;
    int _254 = _252 * _195;
    int _256 = _254 + _209;
    bool _258 = uint(_256) >= uint(_195);
    bool _260 = !_258;
    int _262 = _260 ? 0 : (-1);
    int _264 = ~_248;
    int _266 = _264 + _262;
    int _268 = _266 + 1;
    int _270 = _268 * _195;
    int _272 = _270 + _209;
    int _274 = _272 ^ _218;
    int _276 = ~_218;
    int _278 = _276 + _274;
    int _280 = _278 + 1;
    bool _282 = !_197;
    int _284 = _282 ? _280 : (-1);
    int _286 = _284;
    int _288 = 0;
    int _290 = _113(_286, _288, (*spvDescriptorSet0.support_buffer));
    int _292 = _191;
    int _294 = 0;
    int _296 = _113(_292, _294, (*spvDescriptorSet0.support_buffer));
    float4 _299 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_290, _296)), 0).xyzw;
    float _301 = _299.x;
    float _303 = _299.y;
    float _305 = _299.z;
    float _307 = _299.w;
    float _309 = in.m_67.w;
    float _311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _315 = _313 != 0;
    float _317 = in.m_65.y;
    int _319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _321 = _319 != 0;
    float _323 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _327 = _325 != 0;
    float _329 = in.m_65.x;
    float _331 = in.m_69.w;
    float _333 = as_type<float>(_256);
    float _335 = _317;
    if (_315)
    {
        float _337 = in.m_67.z;
        _333 = _337;
    }
    float _339 = _333;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _343 = _311 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _345 = 0.0;
    if (!_321)
    {
        float _347 = in.m_67.z;
        _345 = _347;
    }
    float _349 = _345;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _353 = _309 > 0.5;
    bool _355 = _353 && _327;
    float _357 = 0.0;
    float _359 = _309;
    if (!_321)
    {
        float _361 = in.m_67.y;
        _357 = _361;
    }
    float _363 = _357;
    float _365 = _329;
    if (_315)
    {
        _359 = _329;
    }
    float _367 = _359;
    float _369 = _367;
    if (_355)
    {
        float _371 = -_317;
        float _373 = _371 + 1.0;
        _335 = _373;
    }
    float _375 = _335;
    bool _377 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _381 = _377 || _379;
    bool _383 = isnan(1.0);
    bool _385 = _381 || _383;
    bool _387 = _339 > 0.5;
    bool _389 = _387 && _315;
    float _391 = fma(_343, _375, -0.5);
    float _393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _395 = 0.0;
    float _397 = _349;
    if (!_321)
    {
        _395 = _349;
    }
    float _399 = _395;
    float _401 = _363;
    float _403 = _399;
    if (_321)
    {
        float _405 = in.m_67.x;
        float _407 = in.m_67.y;
        _401 = _405;
        _403 = _407;
    }
    float _409 = _401;
    float _411 = _403;
    if (_389)
    {
        float _413 = -_367;
        float _415 = _413 + 1.0;
        _369 = _415;
    }
    float _417 = _369;
    if (_315)
    {
        _365 = _417;
    }
    float _419 = _365;
    float _421 = _393 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _423 = in.m_63.x;
    float _425 = in.m_63.y;
    float _427 = in.m_63.z;
    float _429 = fma(_421, _419, -0.5);
    float _431 = in.m_58.x;
    float _433 = in.m_58.y;
    float _435 = in.m_58.z;
    if (_321)
    {
        _397 = _411;
    }
    float _437 = _397;
    float _439 = _411 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _441 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[83].z, _341);
    float _443 = _409 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _449 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[83].w, _351);
    float _451 = _437;
    float _453 = _445;
    if (!_385)
    {
        float _455 = _323 * _323;
        float _457 = _455 * 0.5;
        _451 = _457;
    }
    float _459 = _451;
    float _461 = -_445;
    float _463 = fma(_443, 2.0, _461);
    float _465 = fma(_439, -2.0, _447);
    float _467 = _459;
    if (!_385)
    {
        _453 = _323;
    }
    float _469 = _453;
    float _471 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _441);
    float _473 = -_157;
    float _475 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[81].x, _463);
    float _477 = _469;
    if (!_385)
    {
        float _479 = _459 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _467 = _479;
    }
    float _481 = _467;
    bool _483 = !_385;
    float _485 = _481;
    if (!_483)
    {
        float _487 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _489 = log2(_487);
        float _491 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _493 = _491 + 1.0;
        float _495 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _497 = _323 * _489;
        float _499 = 1.0 / _493;
        float _501 = _495 * 0.693147182464599609375;
        float _503 = exp2(_497);
        float _505 = 1.0 / _501;
        float _507 = _503 + (-1.0);
        float _509 = -_507;
        float _511 = fma(_509, _505, _323);
        float _513 = _511 * _499;
        float _515 = _513 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _485 = _515;
    }
    float _517 = _485;
    bool _519 = !_385;
    if (!_519)
    {
        float _521 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _523 = log2(_521);
        float _525 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _527 = _525 + 1.0;
        float _529 = 1.0 / _527;
        float _531 = _323 * _523;
        float _533 = exp2(_531);
        float _535 = -_533;
        float _537 = _535 + 1.0;
        float _539 = _537 * _529;
        _477 = _539;
    }
    float _541 = _477;
    float _543 = fma(_471, _429, _475);
    float _545 = _517 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _547 = _517 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _549 = _517 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _551 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _465);
    float _553 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _449);
    float _555 = fma(_541, _423, _545);
    float _557 = fma(_541, _425, _547);
    float _559 = fma(_541, _427, _549);
    int _561 = _284 + 1;
    float _563 = -_551;
    float _565 = fma(_553, _391, _563);
    float _567 = fma(_555, _331, _431);
    float _569 = fma(_559, _331, _435);
    int _571 = abs(_561);
    float _573 = fma(_557, _331, _433);
    uint _575 = as_type<uint>(half2(float2(_307, 0.0)));
    float _577 = float(uint(_571));
    float _579 = _543 + 0.5;
    uint _581 = extract_bits(_575, 0u, 8u);
    int _583 = int(_581) & 255;
    uint _585 = extract_bits(_575, 8u, 8u);
    int _587 = int(_585) & 255;
    int _589 = _587 << 8;
    int _591 = _583 | _589;
    float _593 = _565 + 0.5;
    uint _595 = uint(int(uint(_561) >> uint(31)));
    float _597 = as_type<float>(_220) * _577;
    int _599 = ~int(_595);
    int _601 = _599 + 1;
    float _603 = trunc(_597);
    float _605 = precise::max(_603, 0.0);
    uint _607 = uint(_605);
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _613 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _615 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _617 = ~int(_607);
    int _619 = _617 + 1;
    int _621 = _619 * _195;
    int _623 = _621 + _571;
    float _625 = float(uint(_623));
    float _627 = as_type<float>(_220) * _625;
    float _629 = trunc(_627);
    float _631 = precise::max(_629, 0.0);
    uint _633 = uint(_631);
    int _635 = int(_607) + int(_633);
    int _637 = ~_635;
    int _639 = _637 + 1;
    int _641 = _639 * _195;
    int _643 = _641 + _571;
    bool _645 = uint(_643) >= uint(_195);
    bool _647 = !_645;
    int _649 = _647 ? 0 : (-1);
    bool _651 = _591 >= 32768;
    int _653 = ~_635;
    int _655 = _653 + _649;
    int _657 = _655 + 1;
    int _659 = _591 + (-1024);
    int _661 = _657 * _195;
    int _663 = _661 + _571;
    int _665 = _663 ^ _601;
    int _667 = _659;
    if (_651)
    {
        int _669 = ~_591;
        int _671 = _669 + 33792;
        int _673 = _671 + 1;
        _667 = _673;
    }
    int _675 = _667;
    int _677 = _675 + 30719;
    int _679 = ~_601;
    int _681 = _679 + _665;
    int _683 = _681 + 1;
    float _685 = float(_677);
    bool _687 = !_197;
    int _689 = _687 ? _683 : (-1);
    float _691 = fma(_685, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _695 = abs(_691);
    float _697 = -_695;
    float _699 = _697 + 1.0;
    float _701 = abs(_691);
    float _703 = fma(_701, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _705 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _707 = _691 < 0.0;
    float _709 = float(_707);
    int _711 = as_type<int>(_699) + (-218103808);
    float _713 = abs(_691);
    float _715 = fma(_713, _703, -0.212114393711090087890625);
    bool _717 = uint(_711) >= 1920991232u;
    float _719 = abs(_691);
    float _721 = fma(_719, _715, 1.570728778839111328125);
    bool _723 = !_717;
    int _725 = as_type<int>(_699);
    float _749;
    if (!_723)
    {
        int _727 = as_type<int>(_699);
        int _729 = as_type<int>(_699);
        int _731 = 3136;
        int _733 = as_type<int>(_565);
        int _735;
        int _737;
        int _739;
        int _741;
        int _743;
        int _745;
        int _747;
        _110(_727, _729, _731, _733, _735, _737, _739, _741, _743, _745, _747, out.gl_Position, out.gl_PointSize);
        _749 = as_type<float>(_735);
        _725 = _737;
        _751 = true;
    }
    else
    {
        float _753 = rsqrt(_699);
        float _755 = _699 * _753;
        float _757 = _753 * 0.5;
        float _759 = -_755;
        float _761 = 0.0 + _759;
        float _763 = fma(_757, _761, 0.5);
        float _765 = fma(_755, _763, _755);
        float _767 = -_765;
        float _769 = 0.0 + _767;
        float _771 = fma(_765, _769, _699);
        float _773 = fma(_757, _771, _765);
        _749 = _773;
    }
    _751 = false;
    float _775 = _749;
    int _777 = _725;
    int _779 = _689;
    int _781 = 0;
    int _783 = _113(_779, _781, (*spvDescriptorSet0.support_buffer));
    int _785 = _191;
    int _787 = 0;
    int _789 = _113(_785, _787, (*spvDescriptorSet0.support_buffer));
    float4 _791 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_783, _789)), 0).xyzw;
    float _793 = _791.x;
    float _795 = _791.y;
    float _797 = _791.z;
    float _799 = _791.w;
    float _801 = _721 * _775;
    float _803 = _709 * 2.0;
    float _805 = _685 * 3.883221149444580078125;
    float _807 = floor(_199);
    float _809 = -_803;
    float _811 = fma(_801, _809, _801);
    float _813 = _805 * 0.15915493667125701904296875;
    float _815 = fma(_709, 3.1415927410125732421875, _811);
    float _817 = _813 * 6.283185482025146484375;
    float _819 = cos(_817);
    float _821 = _815 * 0.15915493667125701904296875;
    float _823 = _821 * 6.283185482025146484375;
    float _825 = sin(_823);
    float _827 = -_807;
    float _829 = _199 + _827;
    float _831 = _813 * 6.283185482025146484375;
    float _833 = sin(_831);
    float _835 = _825 * _819;
    float _837 = _825 * _833;
    uint _839 = as_type<uint>(half2(float2(_799, 0.0)));
    float _841 = -_301;
    float _843 = _841 + _793;
    uint _845 = extract_bits(_839, 0u, 8u);
    int _847 = int(_845) & 255;
    uint _849 = extract_bits(_839, 8u, 8u);
    int _851 = int(_849) & 255;
    int _853 = _851 << 8;
    int _855 = _847 | _853;
    float _857 = fma(_829, _843, _301);
    bool _859 = _855 >= 32768;
    int _861 = _855 + (-1024);
    int _863 = _861;
    if (_859)
    {
        int _865 = ~_855;
        int _867 = _865 + 33792;
        int _869 = _867 + 1;
        _863 = _869;
    }
    int _871 = _863;
    int _873 = _871 + 30719;
    float _875 = float(_873);
    float _877 = fma(_875, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _879 = -_303;
    float _881 = _879 + _795;
    float _883 = abs(_877);
    float _885 = -_883;
    float _887 = _885 + 1.0;
    float _889 = abs(_877);
    float _891 = fma(_889, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _893 = fma(_829, _881, _303);
    int _895 = as_type<int>(_887) + (-218103808);
    float _897 = abs(_877);
    float _899 = fma(_897, _891, -0.212114393711090087890625);
    bool _901 = uint(_895) >= 1920991232u;
    float _903 = -_305;
    float _905 = _903 + _797;
    bool _907 = _877 < 0.0;
    float _909 = float(_907);
    float _911 = abs(_877);
    float _913 = fma(_911, _899, 1.570728778839111328125);
    float _915 = fma(_829, _905, _305);
    bool _917 = !_901;
    float _941;
    if (!_917)
    {
        int _919 = as_type<int>(_887);
        int _921 = _777;
        int _923 = 4032;
        int _925 = as_type<int>(_887);
        int _927;
        int _929;
        int _931;
        int _933;
        int _935;
        int _937;
        int _939;
        _110(_919, _921, _923, _925, _927, _929, _931, _933, _935, _937, _939, out.gl_Position, out.gl_PointSize);
        _941 = as_type<float>(_927);
        _943 = true;
    }
    else
    {
        float _945 = rsqrt(_887);
        float _947 = _887 * _945;
        float _949 = _945 * 0.5;
        float _951 = -_947;
        float _953 = 0.0 + _951;
        float _955 = fma(_949, _953, 0.5);
        float _957 = fma(_947, _955, _947);
        float _959 = -_957;
        float _961 = 0.0 + _959;
        float _963 = fma(_957, _961, _887);
        float _965 = fma(_949, _963, _957);
        _941 = _965;
    }
    _943 = false;
    float _967 = _941;
    float _969 = _573 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _971 = _573 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _973 = fma(_567, (*spvDescriptorSet0.vp_c10)._m0[4].x, _969);
    float _975 = fma(_567, (*spvDescriptorSet0.vp_c10)._m0[6].x, _971);
    float _977 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[4].z, _973);
    float _979 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[6].z, _975);
    float _981 = _977 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _983 = _979 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _985 = fma(_981, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _987 = fma(_983, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _989 = floor(_985);
    float _991 = floor(_987);
    float _993 = -_989;
    float _995 = _985 + _993;
    float _997 = -_991;
    float _999 = _987 + _997;
    float2 _4329 = float2(_995, _999);
    float _1001 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4329, float2(0.0), isnan(_4329)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4329, float2(0.0), isnan(_4329)), level(0.0)).x;
    float _1003 = in.m_67.x;
    float _1005 = in.m_67.y;
    float _1007 = in.m_67.z;
    float _1009 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1011 = log2(_1009);
    float _1013 = _573 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1015 = fma(_567, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1013);
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1023 = _1021 != 0;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1027 = _1025 != 0;
    float _1029 = _1011 * _157;
    float _1031 = exp2(_1029);
    float _1033 = _1007 * 2.0;
    float _1035 = _1003 * 2.0;
    float _1037 = _1005 * 2.0;
    float _1039 = _1005 + _1007;
    float _1041 = _1003 + _1007;
    float _1043 = _1007 + (-0.5);
    float _1045 = _1005 + _1003;
    float _1047 = floor(_1033);
    float _1049 = _1003 + (-0.5);
    float _1051 = _1041 + (-1.0);
    float _1053 = _1045 + (-1.0);
    float _1055 = floor(_1035);
    float _1057 = _1005 + (-0.5);
    float _1059 = -_1031;
    float _1061 = _1059 + 1.0;
    bool _1063 = _1047 > 0.0;
    float _1065 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1015);
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1069 = 1.0 + _1067;
    bool _1071 = _1047 >= 0.0;
    bool _1073 = isnan(_1047);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan(0.0);
    bool _1079 = _1075 || _1077;
    float _1081 = floor(_1037);
    float _1083 = _1039 + (-1.0);
    float _1085 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1087 = _1079 ? 0 : 1;
    float _1089 = _1065 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1091 = _1055 >= 0.0;
    bool _1093 = isnan(_1055);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan(0.0);
    bool _1099 = _1095 || _1097;
    bool _1101 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1103 = isnan(1.0);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1109 = _1105 || _1107;
    float _1111 = 1.0 / _1069;
    bool _1113 = _1055 > 0.0;
    float _1115 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1117 = _1099 ? 0 : 1;
    float _1119 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1121 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1123 = isnan(0.0);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1129 = _1125 || _1127;
    float _1131 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1115);
    int _1133 = ~_1087;
    int _1135 = _1133 + 1;
    int _1137 = _1135 + 1;
    float _1139 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1119);
    float _1141 = _1129 ? _1061 : 0.0;
    float _1143 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1131);
    int _1145 = _1137;
    int _1147 = 2;
    if (!_1063)
    {
        int _1149 = ~_1087;
        int _1151 = _1149 + 1;
        _1145 = _1151;
    }
    int _1153 = _1145;
    float _1155 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1139);
    bool _1157 = !_1023;
    int _1159 = _1157 ? 0 : 1;
    float _1161 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1163 = _1081 > 0.0;
    if (_1109)
    {
        float _1165 = _1141 * _1111;
        _159 = _1165;
    }
    float _1167 = _159;
    bool _1169 = _1081 >= 0.0;
    bool _1171 = isnan(_1081);
    bool _1173 = _1169 || _1171;
    bool _1175 = isnan(0.0);
    bool _1177 = _1173 || _1175;
    float _1179 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _1181 = ~_1117;
    int _1183 = _1181 + 1;
    int _1185 = _1183 + 1;
    float _1187 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1189 = _1185;
    if (!_1113)
    {
        int _1191 = ~_1117;
        int _1193 = _1191 + 1;
        _1189 = _1193;
    }
    int _1195 = _1189;
    int _1197 = abs(_1159);
    float _1199 = in.m_71.x;
    float _1201 = in.m_71.y;
    float _1203 = in.m_71.z;
    bool _1205 = !_1019;
    int _1207 = _1205 ? 0 : 1;
    float _1209 = float(_1153);
    float _1211 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1213 = abs(_1207);
    float _1215 = _1089 + _1179;
    int _1217 = _1177 ? 0 : 1;
    float _1219 = float(_1213);
    float _1221 = float(_1197);
    int _1223 = ~_1217;
    int _1225 = _1223 + 1;
    int _1227 = _1225 + 1;
    float _1229 = _1219 * _1209;
    float _1231 = float(_1195);
    float _1233 = _1215 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _1235 = _1227;
    if (!_1163)
    {
        int _1237 = ~_1217;
        int _1239 = _1237 + 1;
        _1235 = _1239;
    }
    int _1241 = _1235;
    float _1243 = _1229 * (-2.0);
    float _1245 = _1215 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1247 = fma(_981, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1233);
    float _1249 = _1221 * _1231;
    float _1251 = fma(_1085, _1243, _1085);
    bool _1253 = !_1027;
    int _1255 = _1253 ? 0 : 1;
    float _1257 = fma(_1243, _1199, _1199);
    float _1259 = fma(_983, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1247);
    float _1261 = float(_1241);
    float _1263 = 1.0 / _1161;
    float _1265 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1257);
    int _1267 = abs(_1255);
    float _1269 = _1259 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1271 = _1249 * (-2.0);
    float _1273 = fma(_981, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1245);
    float _1275 = float(_1267);
    float _1277 = fma(_1251, _1167, _1265);
    float _1279 = fma(_1271, _1201, _1201);
    float _1281 = fma(_1211, _1271, _1211);
    float _1283 = _1275 * _1261;
    float _1285 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1279);
    float _1287 = fma(_983, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1273);
    float _1289 = trunc(_1269);
    int _1291 = int(_1289);
    float _1293 = _1283 * (-2.0);
    float _1295 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1297 = in.m_69.x;
    float _1299 = in.m_69.y;
    float _1301 = in.m_69.z;
    float _1303 = _1287 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1305 = fma(_1293, _1203, _1203);
    float _1307 = fma(_1295, _1293, _1295);
    float _1309 = _1187 + _1161;
    float _1311 = _1277 * 0.15915493667125701904296875;
    float _1313 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1305);
    float _1315 = trunc(_1303);
    int _1317 = int(_1315);
    float _1319 = _1309 * _1263;
    float _1321 = _1319 * 0.5;
    float _1323 = fma(_1281, _1167, _1285);
    float _1325 = fma(_1307, _1167, _1313);
    float _1327 = _1323 * 0.15915493667125701904296875;
    float _1329 = _1325 * 0.15915493667125701904296875;
    float _1331 = _1311 * 6.283185482025146484375;
    float _1333 = sin(_1331);
    float _1335 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1337 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1335);
    float _1339 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _915);
    int _1341 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1343 = _1291 + _1341;
    int _1345 = _1343 + 1;
    float _1347 = (*spvDescriptorSet0.vp_c10)._m0[9].x * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1349 = _1311 * 6.283185482025146484375;
    float _1351 = cos(_1349);
    int _1353 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1355 = _1317 + _1353;
    int _1357 = _1355 + 1;
    float _1359 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1361 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _1363 = _1345 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1365 = fma((*spvDescriptorSet0.vp_c10)._m0[8].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1347);
    int _1367 = _1345 | _1357;
    float _1369 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1371 = _1327 * 6.283185482025146484375;
    float _1373 = sin(_1371);
    float _1375 = in.m_65.y;
    float _1377 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _857);
    float _1379 = _1359 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1381 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1383 = _1369 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1385 = _1367 < 0;
    bool _1387 = _1385 || _1363;
    float _1389 = _1327 * 6.283185482025146484375;
    float _1391 = cos(_1389);
    float _1393 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _893);
    float _1395 = _1377 * _1379;
    float _1397 = _1339 * _1381;
    bool _1399 = _1357 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1401 = _1399 || _1387;
    float _1403 = _1393 * _1383;
    float _1405 = 1.0 / _1337;
    float _1407 = _1351 * _1373;
    float _1409 = _1333 * _1373;
    float _1411 = fma((*spvDescriptorSet0.vp_c10)._m0[10].x, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1365);
    float _1413 = _1329 * 6.283185482025146484375;
    float _1415 = cos(_1413);
    float _1417 = _1351 * _1391;
    float _1419 = _1333 * _1391;
    float _1421 = -_1375;
    float _1423 = _1421 + 0.85000002384185791015625;
    float _1425 = precise::clamp(_1423, 0.0, 1.0);
    int _1427 = _1345;
    int _1429 = as_type<int>(_1375);
    int _1431 = _1357;
    if (!_1401)
    {
        int _1433 = _1357 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1435 = _1433 + _1345;
        _1427 = _1435;
    }
    int _1437 = _1427;
    float _1439 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1441 = _1329 * 6.283185482025146484375;
    float _1443 = sin(_1441);
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1447 = _1405 * _1445;
    float _1449 = as_type<float>(_1437);
    if (!_1401)
    {
        int _1451 = _1437 << 2;
        _1429 = _1451;
    }
    int _1453 = _1429;
    float _1455 = _1439 * 0.15915493667125701904296875;
    int _1457 = _1453;
    if (!_1401)
    {
        uint _1459 = uint(int(uint(_1437) >> uint(2)));
        _1431 = int(_1459);
    }
    int _1461 = _1431;
    bool _1463 = _1447 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1465 = _1351 * _1415;
    float _1467 = _1333 * _1415;
    float _1469 = _1391 * _1415;
    bool _1471 = _1447 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1473 = _1373 * _1415;
    float _1475 = rsqrt(_1411);
    if (!_1401)
    {
        int _1477 = 12 & _1453;
        _1457 = _1477;
    }
    int _1479 = _1457;
    float _1481 = fma(_1443, _1417, _1409);
    float _1483 = -_1407;
    float _1485 = fma(_1443, _1419, _1483);
    float _1487 = fma(_1443, _1409, _1417);
    float _1489 = -_1419;
    float _1491 = fma(_1443, _1407, _1489);
    float _1493 = -_1403;
    float _1495 = _1443 * _1493;
    float _1497 = _1465 * _1403;
    float _1499 = _1467 * _1403;
    float _1501 = _1455 * 6.283185482025146484375;
    float _1503 = cos(_1501);
    float _1505 = fma(_1469, _1395, _1495);
    float _1507 = fma(_1481, _1395, _1497);
    float _1509 = fma(_1485, _1395, _1499);
    if (!_1463)
    {
        _1147 = 1;
    }
    int _1511 = _1147;
    float _1513 = fma(_1473, _1397, _1505);
    float _1515 = fma(_1491, _1397, _1507);
    float _1517 = fma(_1487, _1397, _1509);
    bool _1519 = !_1463;
    int _1521 = _1519 ? 0 : 1;
    float _1523 = _1455 * 6.283185482025146484375;
    float _1525 = sin(_1523);
    float _1527 = _1515 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1529 = _1515 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1531 = _1511;
    if (!_1471)
    {
        _1531 = _1521;
    }
    int _1533 = _1531;
    float _1535 = _1515 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1537 = _1475 * (*spvDescriptorSet0.vp_c10)._m0[10].x;
    float _1539 = fma(_1513, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1529);
    int _1541 = _1533 << 6;
    float _1543 = fma(_1513, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1527);
    float _1545 = fma(_1513, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1535);
    float _1547 = _1475 * (*spvDescriptorSet0.vp_c10)._m0[8].x;
    int _1549 = _1541 + 96;
    uint _1551 = uint(int(uint(_1549) >> uint(2)));
    uint _1553 = uint(int(uint(int(_1551)) >> uint(2)));
    int _1555 = int(_1551) & 3;
    float _1557 = (*spvDescriptorSet0.vp_c15)._m0[int(_1553)][_1555];
    int _1559 = int(_1551) + 1;
    uint _1561 = uint(int(uint(_1559) >> uint(2)));
    int _1563 = _1559 & 3;
    float _1565 = (*spvDescriptorSet0.vp_c15)._m0[int(_1561)][_1563];
    float _1567 = _1475 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1569 = -_1503;
    float _1571 = _1569 + 1.0;
    float _1573 = _1537 * _1537;
    float _1575 = fma(_1517, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1543);
    float _1577 = fma(_1517, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1539);
    float _1579 = fma(_1517, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1545);
    float _1581 = _1547 * _1571;
    float _1583 = fma(_1571, _1573, _1503);
    int _1585 = _1541 + 104;
    uint _1587 = uint(int(uint(_1585) >> uint(2)));
    uint _1589 = uint(int(uint(int(_1587)) >> uint(2)));
    int _1591 = int(_1587) & 3;
    float _1593 = (*spvDescriptorSet0.vp_c15)._m0[int(_1589)][_1591];
    int _1595 = int(_1587) + 1;
    uint _1597 = uint(int(uint(_1595) >> uint(2)));
    int _1599 = _1595 & 3;
    float _1601 = (*spvDescriptorSet0.vp_c15)._m0[int(_1597)][_1599];
    float _1603 = _1547 * _1525;
    float _1605 = _1567 * _1571;
    float _1607 = _1537 * _1525;
    float _1609 = _1567 * _1525;
    float _1611 = fma(_1547, _1581, _1503);
    float _1613 = fma(_1537, _1605, _1603);
    float _1615 = -_1607;
    float _1617 = fma(_1567, _1581, _1615);
    int _1619 = _1541 + 64;
    uint _1621 = uint(int(uint(_1619) >> uint(2)));
    uint _1623 = uint(int(uint(int(_1621)) >> uint(2)));
    int _1625 = int(_1621) & 3;
    float _1627 = (*spvDescriptorSet0.vp_c15)._m0[int(_1623)][_1625];
    int _1629 = int(_1621) + 1;
    uint _1631 = uint(int(uint(_1629) >> uint(2)));
    int _1633 = _1629 & 3;
    float _1635 = (*spvDescriptorSet0.vp_c15)._m0[int(_1631)][_1633];
    float _1637 = -_1609;
    float _1639 = fma(_1537, _1581, _1637);
    float _1641 = _1577 * _1613;
    float _1643 = _1577 * _1617;
    float _1645 = fma(_1537, _1581, _1609);
    float _1647 = 0.0;
    float _1649 = _1537;
    float _1651 = as_type<float>(_1533);
    if (!_1401)
    {
        int _1653 = _1461 << 4;
        int _1655 = _1653 + _1479;
        _1647 = as_type<float>(_1655);
    }
    float _1657 = _1647;
    float _1659 = fma(_1575, _1639, _1641);
    float _1661 = fma(_1575, _1611, _1643);
    int _1663 = _1541 + 48;
    uint _1665 = uint(int(uint(_1663) >> uint(2)));
    uint _1667 = uint(int(uint(int(_1665)) >> uint(2)));
    int _1669 = int(_1665) & 3;
    float _1671 = (*spvDescriptorSet0.vp_c15)._m0[int(_1667)][_1669];
    int _1673 = int(_1665) + 1;
    uint _1675 = uint(int(uint(_1673) >> uint(2)));
    int _1677 = _1673 & 3;
    float _1679 = (*spvDescriptorSet0.vp_c15)._m0[int(_1675)][_1677];
    float _1681 = fma(_1567, _1605, _1503);
    float _1683 = fma(_1579, _1583, _1659);
    float _1685 = fma(_1579, _1645, _1661);
    float _1687 = -_1603;
    float _1689 = fma(_1537, _1605, _1687);
    float _1691 = fma(_1567, _1581, _1607);
    float _1693 = _983 + _1683;
    float _1695 = _981 + _1685;
    int _1697 = _1541 + 56;
    uint _1699 = uint(int(uint(_1697) >> uint(2)));
    uint _1701 = uint(int(uint(int(_1699)) >> uint(2)));
    int _1703 = int(_1699) & 3;
    float _1705 = (*spvDescriptorSet0.vp_c15)._m0[int(_1701)][_1703];
    int _1707 = int(_1699) + 1;
    uint _1709 = uint(int(uint(_1707) >> uint(2)));
    int _1711 = _1707 & 3;
    float _1713 = (*spvDescriptorSet0.vp_c15)._m0[int(_1709)][_1711];
    float _1715 = _1693;
    if (!_1401)
    {
        float _1717 = floor(_1303);
        _1649 = _1717;
    }
    float _1719 = _1649;
    float _1721 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1723 = _1693 + _1721;
    float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1727 = _1695 + _1725;
    float _1729 = _1577 * _1681;
    float _1731 = _1723 * _1723;
    int _1733 = _1541 + 72;
    uint _1735 = uint(int(uint(_1733) >> uint(2)));
    uint _1737 = uint(int(uint(int(_1735)) >> uint(2)));
    int _1739 = int(_1735) & 3;
    float _1741 = (*spvDescriptorSet0.vp_c15)._m0[int(_1737)][_1739];
    int _1743 = int(_1735) + 1;
    uint _1745 = uint(int(uint(_1743) >> uint(2)));
    int _1747 = _1743 & 3;
    float _1749 = (*spvDescriptorSet0.vp_c15)._m0[int(_1745)][_1747];
    float _1751 = fma(_1575, _1691, _1729);
    float _1753 = fma(_1727, _1727, _1731);
    float _1755 = fma(_1579, _1689, _1751);
    float _1757 = sqrt(_1753);
    float _1759 = _1657;
    if (!_1401)
    {
        int _1761 = as_type<int>(_1657) + 400;
        uint _1763 = uint(int(uint(_1761) >> uint(2)));
        uint _1765 = uint(int(uint(int(_1763)) >> uint(2)));
        int _1767 = int(_1763) & 3;
        float _1769 = (*spvDescriptorSet0.vp_c15)._m0[int(_1765)][_1767];
        _1759 = _1769;
    }
    float _1771 = _1759;
    int _1773 = _1541 + 80;
    uint _1775 = uint(int(uint(_1773) >> uint(2)));
    uint _1777 = uint(int(uint(int(_1775)) >> uint(2)));
    int _1779 = int(_1775) & 3;
    float _1781 = (*spvDescriptorSet0.vp_c15)._m0[int(_1777)][_1779];
    int _1783 = int(_1775) + 1;
    uint _1785 = uint(int(uint(_1783) >> uint(2)));
    int _1787 = _1783 & 3;
    float _1789 = (*spvDescriptorSet0.vp_c15)._m0[int(_1785)][_1787];
    bool _1791 = _1757 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1793 = _1541 + 88;
    uint _1795 = uint(int(uint(_1793) >> uint(2)));
    uint _1797 = uint(int(uint(int(_1795)) >> uint(2)));
    int _1799 = int(_1795) & 3;
    float _1801 = (*spvDescriptorSet0.vp_c15)._m0[int(_1797)][_1799];
    int _1803 = int(_1795) + 1;
    uint _1805 = uint(int(uint(_1803) >> uint(2)));
    int _1807 = _1803 & 3;
    float _1809 = (*spvDescriptorSet0.vp_c15)._m0[int(_1805)][_1807];
    float _1811 = _1215 * _1635;
    float _1813 = _1215 * _1565;
    float _1815 = _1565;
    if (!_1401)
    {
        float _1817 = floor(_1269);
        _1815 = _1817;
    }
    float _1819 = _1815;
    float _1821 = fma(_981, _1557, _1813);
    float _1823 = fma(_983, _1593, _1821);
    float _1825 = _1215 * _1679;
    float _1827 = _1823 + _1601;
    float _1829 = fma(_981, _1627, _1811);
    float _1831 = fma(_981, _1671, _1825);
    float _1833 = 1.0 / _1827;
    float _1835 = fma(_983, _1741, _1829);
    float _1837 = fma(_983, _1705, _1831);
    float _1839 = _1089 + _1755;
    float _1841 = _1835 + _1749;
    float _1843 = _1837 + _1713;
    float _1845 = _1837;
    float _1847 = _1839;
    float _1849 = _1741;
    if (!_1791)
    {
        _1845 = _1695;
    }
    float _1851 = _1845;
    bool _1853 = !_1791;
    float _1855 = _1851;
    if (!_1853)
    {
        float _1857 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1861 = _1757 + _1859;
        float _1863 = rsqrt(_1753);
        float _1865 = _1861 * _1857;
        float _1867 = _1839 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1869 = _1865 * 0.15915493667125701904296875;
        float _1871 = _1869 * 6.283185482025146484375;
        float _1873 = cos(_1871);
        float _1875 = _1869 * 6.283185482025146484375;
        float _1877 = sin(_1875);
        float _1879 = _1873 + (-1.0);
        float _1881 = fma(_1877, _1867, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1883 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1885 = _1863 * _1881;
        float _1887 = fma(_1839, _1873, _1883);
        float _1889 = fma(_1727, _1885, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1891 = fma(_1723, _1885, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1847 = _1887;
        _1855 = _1889;
        _1715 = _1891;
    }
    float _1893 = _1847;
    float _1895 = _1855;
    float _1897 = _1715;
    float _1899 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1901 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1903 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1905 = _1843 * _1833;
    float _1907 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1899);
    float _1909 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1901);
    float _1911 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1903);
    if (!_1401)
    {
        float _1913 = rint(_1771);
        float _1915 = precise::max(_1913, 0.0);
        uint _1917 = uint(_1915);
        uint _1919 = clamp(_1917, 0u, 65535u);
        _1849 = as_type<float>(_1919);
    }
    float _1921 = _1849;
    float _1923 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1907);
    bool _1925 = _1905 >= 0.0;
    float _1927 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1929 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1911);
    float _1931 = _1841 * _1833;
    bool _1933 = _1905 <= 1.0;
    bool _1935 = _1933 && _1925;
    float _1937 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1939 = _1215 * _1789;
    float _1941 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1909);
    float _1943 = _1923 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1945 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1927);
    float _1947 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1949 = _1941 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1951 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1953 = _1931 >= 0.0;
    bool _1955 = _1953 && _1935;
    float _1957 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1945);
    float _1959 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1961 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1951);
    bool _1963 = _1931 <= 1.0;
    bool _1965 = _1963 && _1955;
    float _1967 = _1957 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1969 = -_1959;
    float _1971 = fma(_1969, _1937, 1.0);
    float _1973 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1961);
    float _1975 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1977 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1979 = fma(_981, _1781, _1939);
    float _1981 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1973);
    float _1983 = log2(_1971);
    float _1985 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1975);
    float _1987 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1977);
    float _1989 = fma(_983, _1801, _1979);
    float _1991 = _1939;
    if (!_1401)
    {
        float _1993 = -_1719;
        float _1995 = _1303 + _1993;
        _1991 = _1995;
    }
    float _1997 = _1991;
    if (_1965)
    {
        float _1999 = float(_1533);
        _1651 = _1999;
    }
    float _2001 = _1651;
    float _2003 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1985);
    float _2005 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1987);
    float _2007 = 1.0 / _1981;
    float _2009 = _1989 + _1809;
    float _2011 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2003);
    float _2013 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2005);
    float _2015 = _2005;
    float _2017 = _2001;
    if (!_1401)
    {
        float _2019 = -_1819;
        float _2021 = _1269 + _2019;
        _2015 = _2021;
    }
    float _2023 = _2015;
    float _2025 = _2009 * _1833;
    float _2027 = _1975;
    if (_1965)
    {
        float _2029 = rint(_2001);
        float _2031 = precise::max(_2029, 0.0);
        uint _2033 = uint(_2031);
        uint _2035 = clamp(_2033, 0u, 65535u);
        _2027 = as_type<float>(_2035);
    }
    float _2037 = _2027;
    float _2039 = _1983 * 0.693147182464599609375;
    float _2041 = _1997;
    if (!_1401)
    {
        float3 _6005 = float3(_2023, _1997, float(as_type<int>(_1921)));
        float3 _6009 = select(_6005, float3(0.0), isnan(_6005));
        float _2043 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6009.xy, uint(rint(_6009.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6009.xy, uint(rint(_6009.z)), level(0.0)).x;
        _2041 = _2043;
    }
    float _2045 = _2041;
    float _2047 = _2039 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2049 = _2011 * _2007;
    float _2051 = _2013 * _2007;
    float _2053 = fma(_2049, 0.5, 0.5);
    float _2055 = fma(_2051, -0.5, 0.5);
    float _2057 = _1931;
    float _2059 = _2047;
    if (_1965)
    {
        float3 _6039 = float3(_1905, _1931, float(as_type<int>(_2037)));
        float3 _6041 = select(_6039, float3(0.0), isnan(_6039));
        float _2061 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6041.xy, uint(rint(_6041.z)), _2025, level(0.0));
        _2057 = _2061;
    }
    float _2063 = _2057;
    float3 _6051 = float3(_2053, _2055, _2047);
    float _2065 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6051, float3(0.0), isnan(_6051)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6051, float3(0.0), isnan(_6051)), level(0.0)).x;
    float3 _6060 = float3(_2053, _2055, _2047);
    float4 _2067 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6060, float3(0.0), isnan(_6060)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6060, float3(0.0), isnan(_6060)), level(0.0)).xyzw;
    float _2069 = _2067.x;
    float _2071 = _2067.y;
    float _2073 = _2067.z;
    float _2075 = _2067.w;
    float _2077 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1401)
    {
        _2017 = 1.0;
    }
    float _2079 = _2017;
    bool _2081 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2083 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2085 = _2081 || _2083;
    bool _2087 = isnan(0.5);
    bool _2089 = _2085 || _2087;
    float _2091 = _2079;
    if (_2089)
    {
        _2077 = 1.0;
    }
    float _2093 = _2077;
    float _2095 = _2093;
    if (!_2089)
    {
        float _2097 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2099 = _2097 * 0.15915493667125701904296875;
        float _2101 = _2099 * 6.283185482025146484375;
        float _2103 = cos(_2101);
        float _2105 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2107 = _2105 * 0.15915493667125701904296875;
        float _2109 = _2099 * 6.283185482025146484375;
        float _2111 = sin(_2109);
        float _2113 = 1.0 / _2103;
        float _2115 = _2107 * 6.283185482025146484375;
        float _2117 = cos(_2115);
        float _2119 = _2111 * _2113;
        float _2121 = _2107 * 6.283185482025146484375;
        float _2123 = sin(_2121);
        float _2125 = _2117 * _2119;
        float _2127 = 1.0 / _2125;
        float _2129 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2131 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2129;
        float _2133 = 1.0 / _2131;
        float _2135 = _2123 * _2127;
        float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2139 = fma(_1447, _2135, _2137);
        float _2141 = _2139 * _2133;
        float _2143 = precise::clamp(_2141, 0.0, 1.0);
        _2095 = _2143;
    }
    float _2145 = _2095;
    if (!_1401)
    {
        int _2147 = _1437 << 4;
        int _2149 = _2147 + 2048;
        uint _2151 = uint(int(uint(_2149) >> uint(2)));
        uint _2153 = uint(int(uint(int(_2151)) >> uint(2)));
        int _2155 = int(_2151) & 3;
        float _2157 = (*spvDescriptorSet0.vp_c15)._m0[int(_2153)][_2155];
        int _2159 = int(_2151) + 1;
        uint _2161 = uint(int(uint(_2159) >> uint(2)));
        int _2163 = _2159 & 3;
        float _2165 = (*spvDescriptorSet0.vp_c15)._m0[int(_2161)][_2163];
        int _2167 = _2149 + 8;
        uint _2169 = uint(int(uint(_2167) >> uint(2)));
        uint _2171 = uint(int(uint(int(_2169)) >> uint(2)));
        int _2173 = int(_2169) & 3;
        float _2175 = (*spvDescriptorSet0.vp_c15)._m0[int(_2171)][_2173];
        int _2177 = int(_2169) + 1;
        uint _2179 = uint(int(uint(_2177) >> uint(2)));
        int _2181 = _2177 & 3;
        float _2183 = (*spvDescriptorSet0.vp_c15)._m0[int(_2179)][_2181];
        float _2185 = _1215 * _2165;
        float _2187 = fma(_981, _2157, _2185);
        float _2189 = fma(_983, _2175, _2187);
        float _2191 = _2189 + _2183;
        float _2193 = precise::clamp(_2191, 0.0, 1.0);
        float _2195 = -_2193;
        float _2197 = _2195 + _2045;
        float _2199 = fma(_2197, 500.0, 1.5);
        float _2201 = exp2(_2199);
        float _2203 = 0.0 + _2201;
        float _2205 = precise::clamp(_2203, 0.0, 1.0);
        _1449 = as_type<float>(_2149);
        _2091 = _2205;
    }
    float _2207 = _1449;
    float _2209 = _2091;
    float _2211 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2213 = _1893 + _2211;
    float _2215 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2217 = _1895 + _2215;
    float _2219 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2221 = _1897 + _2219;
    float _2223 = _2213 * _2213;
    float _2225 = fma(_2217, _2217, _2223);
    float _2227 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2229 = fma(_2221, _2221, _2225);
    float _2231 = rsqrt(_2229);
    float _2233 = sqrt(_2229);
    float _2235 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2237 = _2217 * _2235;
    float _2239 = _2221 * _2235;
    float _2241 = _2237 * _2237;
    float _2243 = _2239 * _2239;
    float _2245 = _2241 + _2243;
    float _2247 = sqrt(_2245);
    bool _2249 = _2247 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2253 = _2247 + _2251;
    float _2255 = _2045;
    float _2257 = _2253;
    float _2259 = _2227;
    float _2261 = _2235;
    float _2263 = _2239;
    float _2265 = _2243;
    float _2267 = _2241;
    if (_2249)
    {
        float _2269 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2255 = _2269;
    }
    float _2271 = _2255;
    if (_2249)
    {
        float _2273 = _2253 * _2271;
        _2257 = _2273;
    }
    float _2275 = _2257;
    float _2277 = precise::max(0.0, _2227);
    float _2279 = _2277;
    if (_2249)
    {
        float _2281 = rsqrt(_2245);
        _2259 = _2281;
    }
    float _2283 = _2259;
    float _2285 = _2283;
    if (_2249)
    {
        float _2287 = _2275 * 0.15915493667125701904296875;
        _2059 = _2287;
    }
    float _2289 = _2059;
    float _2291 = -_2235;
    float _2293 = -_2277;
    float _2295 = fma(_2213, _2291, _2293);
    float _2297 = _2295;
    if (_2249)
    {
        float _2299 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2261 = _2299;
    }
    float _2301 = _2261;
    float _2303 = _2207;
    float _2305 = _2301;
    if (_2249)
    {
        float _2307 = _2289 * 6.283185482025146484375;
        float _2309 = sin(_2307);
        _2303 = _2309;
    }
    float _2311 = _2303;
    float _2313 = _2275;
    if (_2249)
    {
        float _2315 = _2289 * 6.283185482025146484375;
        float _2317 = cos(_2315);
        _2313 = _2317;
    }
    float _2319 = _2313;
    if (_2249)
    {
        float _2321 = fma(_2311, _2301, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2279 = _2321;
    }
    float _2323 = _2279;
    float _2325 = _2323;
    if (_2249)
    {
        float _2327 = _2283 * _2323;
        _2285 = _2327;
    }
    float _2329 = _2285;
    if (_2249)
    {
        float _2331 = _2319 + (-1.0);
        _2305 = _2331;
    }
    float _2333 = _2305;
    float _2335 = _2333;
    if (_2249)
    {
        float _2337 = _2239 * _2329;
        _2263 = _2337;
    }
    float _2339 = _2263;
    if (_2249)
    {
        float _2341 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2325 = _2341;
    }
    float _2343 = _2325;
    if (!_2249)
    {
        _2335 = _2237;
    }
    float _2345 = _2335;
    float _2347 = _2345;
    if (_2249)
    {
        float _2349 = _2237 * _2329;
        _2347 = _2349;
    }
    float _2351 = _2347;
    if (_2249)
    {
        float _2353 = _2339 * _2339;
        _2265 = _2353;
    }
    float _2355 = _2265;
    if (_2249)
    {
        float _2357 = fma(_2295, _2319, _2343);
        _2297 = _2357;
    }
    float _2359 = _2297;
    if (_2249)
    {
        float _2361 = _2351 * _2351;
        _2267 = _2361;
    }
    float _2363 = _2267;
    float _2365 = fma(_2359, _2359, _2363);
    float _2367 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2369 = fma(_2233, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2367);
    float _2371 = precise::clamp(_2369, 0.0, 1.0);
    float _2373 = _2365 + _2355;
    float _2375 = -_2371;
    float _2377 = _2375 + 1.0;
    float _2379 = rsqrt(_2373);
    float _2381 = abs(_2377);
    float _2383 = log2(_2381);
    float _2385 = _2379 * _2351;
    float _2387 = _2379 * _2359;
    float _2389 = _2379 * _2339;
    float _2391 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2393 = -_2391;
    float _2395 = fma(_2387, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2393);
    float _2397 = _2383 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2399 = -_2389;
    float _2401 = fma(_2399, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2395);
    float _2403 = exp2(_2397);
    float _2405 = fma(_2401, -0.5, 0.5);
    float _2407 = fma(_2401, 0.5, 0.5);
    float _2409 = _2387 + 1.0;
    float _2411 = fma(_2407, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2413 = sqrt(_2405);
    float _2415 = fma(_2407, _2411, -0.212114393711090087890625);
    float _2417 = fma(_2407, _2415, 1.570728778839111328125);
    float _2419 = -_2387;
    float _2421 = fma(_2403, _2409, _2419);
    float _2423 = fma(_2421, 0.5, 0.5);
    float _2425 = _2413 * 0.636619746685028076171875;
    float _2427 = -_2417;
    float _2429 = fma(_2425, _2427, 1.0);
    float2 _6601 = float2(_2429, _2423);
    float3 _2433 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6601, float2(0.0), isnan(_6601)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6601, float2(0.0), isnan(_6601)), level(0.0)).xyz;
    float _2435 = _2433.x;
    float _2437 = _2433.y;
    float _2439 = _2433.z;
    float _2441 = _913 * _967;
    float _2443 = _909 * 2.0;
    float _2445 = _875 * 3.883221149444580078125;
    bool _2447 = _893 != 0.0;
    bool _2449 = isnan(_893);
    bool _2451 = _2447 || _2449;
    bool _2453 = isnan(0.0);
    bool _2455 = _2451 || _2453;
    float _2457 = -_691;
    float _2459 = _2457 + _877;
    float _2461 = -_2443;
    float _2463 = fma(_2441, _2461, _2441);
    float _2465 = _2445 * 0.15915493667125701904296875;
    bool _2467 = _857 == 0.0;
    bool _2469 = !_2455;
    bool _2471 = _2467 && _2469;
    float _2473 = fma(_829, _2459, _691);
    float _2475 = fma(_909, 3.1415927410125732421875, _2463);
    float _2477 = _2465 * 6.283185482025146484375;
    float _2479 = sin(_2477);
    bool _2481 = _915 == 0.0;
    bool _2483 = _2481 && _2471;
    float _2485 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2473);
    float _2487 = _2475 * 0.15915493667125701904296875;
    out.m_73.x = _705;
    out.m_73.y = _613;
    out.m_73.z = _615;
    float _2489 = _2383 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2491 = -_1001;
    float _2493 = _2491 + 1.0;
    float _2495 = _2487 * 6.283185482025146484375;
    float _2497 = sin(_2495);
    out.m_75.z = _579;
    out.m_75.w = _593;
    out.m_77.x = _1895;
    out.m_77.y = _1893;
    out.m_77.z = _1897;
    int _2499 = as_type<int>(_2441);
    int _2501 = as_type<int>(_2487);
    if (_2483)
    {
        _2499 = as_type<int>(_2485);
    }
    int _2503 = _2499;
    int _2505 = _2503;
    if (!_2483)
    {
        _2505 = as_type<int>(_2485);
    }
    int _2507 = _2505;
    float _2509 = abs(_1447);
    float _2511 = log2(_2509);
    float _2513 = -_837;
    float _2515 = fma(_2497, _2479, _2513);
    float _2517 = exp2(_2489);
    bool _2519 = _1447 <= 8000.0;
    bool _2521 = isnan(_1447);
    bool _2523 = _2519 || _2521;
    bool _2525 = isnan(8000.0);
    bool _2527 = _2523 || _2525;
    float _2529 = float(_2527);
    float _2531 = fma(_829, _2515, _837);
    float _2533 = _2483 ? _2473 : as_type<float>(_2507);
    float _2535 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2531);
    float _2537 = _2465 * 6.283185482025146484375;
    float _2539 = cos(_2537);
    float _2541 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2543 = _2497;
    if (_2483)
    {
        _2501 = as_type<int>(_2535);
    }
    int _2545 = _2501;
    int _2547 = _2545;
    if (!_2483)
    {
        _2547 = as_type<int>(_2535);
    }
    int _2549 = _2547;
    float _2551 = exp2(_2541);
    float _2553 = _2483 ? _2531 : as_type<float>(_2549);
    float _2555 = _2533 * _2533;
    float _2557 = fma(_2553, _2553, _2555);
    float _2559 = -_835;
    float _2561 = fma(_2497, _2539, _2559);
    float _2563 = _2555;
    if (_2483)
    {
        _2543 = _2473;
    }
    float _2565 = _2543;
    float _2567 = _2565;
    if (!_2483)
    {
        _2567 = _2485;
    }
    float _2569 = _2567;
    float _2571 = fma(_829, _2561, _835);
    float _2573 = rsqrt(_2557);
    float _2575 = _2571;
    if (_2483)
    {
        _2563 = _2531;
    }
    float _2577 = _2563;
    float _2579 = _2577;
    if (!_2483)
    {
        float _2581 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2571);
        _2575 = _2581;
    }
    float _2583 = _2575;
    float _2585 = _1465 * _2569;
    if (!_2483)
    {
        _2579 = _2535;
    }
    float _2587 = _2579;
    float _2589 = -_2569;
    float _2591 = _1443 * _2589;
    float _2593 = _1467 * _2569;
    float _2595 = fma(_2551, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2597 = precise::clamp(_2595, 0.0, 1.0);
    float _2599 = fma(_1481, _2583, _2585);
    float _2601 = fma(_1469, _2583, _2591);
    bool _2603 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2605 = isnan(_2233);
    bool _2607 = _2603 || _2605;
    bool _2609 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2611 = _2607 || _2609;
    float _2613 = fma(_1491, _2587, _2599);
    float _2615 = _2533 * _2573;
    float _2617 = _2553 * _2573;
    float _2619 = _2613 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2621 = -_2615;
    float _2623 = _1473 * _2621;
    float _2625 = fma(_1473, _2587, _2601);
    float _2627 = fma(_1485, _2583, _2593);
    float _2629 = -_2615;
    float _2631 = _1491 * _2629;
    float _2633 = -_1443;
    float _2635 = fma(_2633, _2617, _2623);
    float _2637 = _1481 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2639 = -_2615;
    float _2641 = _1487 * _2639;
    float _2643 = _1481 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2645 = _1481 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2647 = fma(_1469, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2637);
    float _2649 = _2613 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2651 = fma(_1465, _2617, _2631);
    float _2653 = fma(_1469, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2643);
    float _2655 = fma(_1469, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2645);
    float _2657 = _2613 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2659 = fma(_2625, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2649);
    float _2661 = fma(_1487, _2587, _2627);
    float _2663 = _2651 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2665 = fma(_1485, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2647);
    float _2667 = fma(_1485, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2653);
    float _2669 = fma(_1485, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2655);
    float _2671 = fma(_1467, _2617, _2641);
    float _2673 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2675 = fma(_2625, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2657);
    float _2677 = _2651 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2679 = fma(_2635, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2663);
    float _2681 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2673);
    out.m_79.x = _2665;
    out.m_79.y = _2667;
    out.m_79.z = _2669;
    float _2683 = _2651 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2685 = fma(_2635, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2677);
    float _2687 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2681);
    float _2689 = fma(_2625, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2619);
    float _2691 = fma(_2635, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2683);
    float _2693 = fma(_2661, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2659);
    float _2695 = fma(_2671, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2679);
    float _2697 = fma(_2661, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2675);
    float _2699 = fma(_2671, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2685);
    float _2701 = fma(_2671, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2691);
    float _2703 = _2011 + _1981;
    float _2705 = _2697 * _1617;
    float _2707 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2687);
    float _2709 = _2697 * _1681;
    float _2711 = _2697 * _1613;
    out.m_81.x = _2695;
    out.m_81.y = _2699;
    out.m_81.z = _2701;
    float _2713 = _2707 + _1981;
    float _2715 = fma(_2661, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2689);
    float _2717 = fma(_2693, _1611, _2705);
    float _2719 = fma(_2693, _1691, _2709);
    float _2721 = _1981 * 0.5;
    out.gl_Position.x = _2011;
    out.gl_Position.y = _2013;
    out.gl_Position.z = _2707;
    out.gl_Position.w = _1981;
    float _2723 = fma(_2715, _1689, _2719);
    float _2725 = _2713 * 0.5;
    float _2727 = _2703 * 0.5;
    float _2729 = fma(_2693, _1639, _2711);
    float _2731 = fma(_2715, _1645, _2717);
    float _2733 = fma(_2013, -0.5, _2721);
    float _2735 = fma(_2715, _1583, _2729);
    float _2737 = in.m_83.w;
    float _2739 = fma(_2597, -2.0, 3.0);
    float _2741 = _2597 * _2597;
    out.m_85.x = _2727;
    out.m_85.y = _2733;
    out.m_85.z = _2725;
    out.m_85.w = _1981;
    float _2743 = _2741 * _2739;
    out.m_87.x = _2731;
    out.m_87.y = _2723;
    out.m_87.z = _2735;
    float _2745 = -_2743;
    float _2747 = _2745 + 1.0;
    float _2749 = fma(_2747, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2743);
    float _2751 = _2743;
    if (!_1965)
    {
        _2751 = 1.0;
    }
    float _2753 = _2751;
    float _2755 = _2753;
    if (_1965)
    {
        bool _2757 = _2063 >= _2025;
        bool _2759 = isnan(_2063);
        bool _2761 = _2757 || _2759;
        bool _2763 = isnan(_2025);
        bool _2765 = _2761 || _2763;
        float _2767 = float(_2765);
        _2755 = _2767;
    }
    float _2769 = _2755;
    float _2771 = _2529 * _2749;
    float _2773 = -_2517;
    float _2775 = _2773 + 1.0;
    float _2777 = _2771 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2779 = _2775 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2781 = _2769 * _2209;
    out.m_89.w = _2737;
    float _2783 = _2493 * _2777;
    float _2785 = precise::clamp(_2783, 0.0, 1.0);
    float _2787 = _2779 * _2065;
    float _2789 = -_2785;
    float _2791 = fma(_2789, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2793 = _2075 * _2787;
    float _2795 = -_2779;
    float _2797 = _2795 + 1.0;
    float _2799 = _2145 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2801 = -_2781;
    float _2803 = fma(_2801, _2791, 1.0);
    float _2805 = precise::clamp(_2803, 0.0, 1.0);
    float _2807 = _2781;
    float _2809 = _2797;
    float _2811 = _2805;
    if (!_2611)
    {
        _2807 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2813 = _2807;
    float _2815 = _2075 * _2797;
    float _2817 = _2813;
    float _2819 = _2813;
    if (!_2611)
    {
        _2809 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2821 = _2809;
    float _2823 = _2439 * _2787;
    float _2825 = fma(_2435, _2793, _2069);
    float _2827 = fma(_2437, _2793, _2071);
    float _2829 = _2805 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2831 = fma(_2075, _2823, _2073);
    float _2833 = _2821;
    float _2835 = _2821;
    if (!_2611)
    {
        _2811 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2837 = _2811;
    out.m_91.x = _2829;
    out.m_93.x = _2825;
    out.m_93.y = _2827;
    out.m_93.z = _2831;
    out.m_93.w = _2815;
    bool _2839 = !_2611;
    float _2841 = _2837;
    float _2843 = _2837;
    if (!_2839)
    {
        bool _2845 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2847 = isnan(_2233);
        bool _2849 = _2845 || _2847;
        bool _2851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2853 = _2849 || _2851;
        if (!_2853)
        {
            float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2857 = _2233 + _2855;
            float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2861 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2859;
            float _2863 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2865 = _2863 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2867 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2869 = _2867 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2871 = 1.0 / _2861;
            float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2875 = _2873 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2877 = _2857 * _2871;
            float _2879 = precise::clamp(_2877, 0.0, 1.0);
            float _2881 = fma(_2879, _2865, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2883 = fma(_2879, _2869, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2885 = fma(_2879, _2875, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2843 = _2883;
            _2819 = _2881;
            _2835 = _2885;
            _2887 = true;
        }
        else
        {
            bool _2889 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2891 = isnan(_2233);
            bool _2893 = _2889 || _2891;
            bool _2895 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2897 = _2893 || _2895;
            if (!_2897)
            {
                _2817 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2899 = _2817;
            _2819 = _2899;
            if (!_2897)
            {
                _2841 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2901 = _2841;
            _2843 = _2901;
            if (!_2897)
            {
                _2833 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2903 = _2833;
            bool _2905 = !_2897;
            _2835 = _2903;
            if (!_2905)
            {
                bool _2907 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2909 = isnan(_2233);
                bool _2911 = _2907 || _2909;
                bool _2913 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2915 = _2911 || _2913;
                if (!_2915)
                {
                    float _2917 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2919 = _2233 + _2917;
                    float _2921 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2923 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2921;
                    float _2925 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2929 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2931 = _2929 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2933 = 1.0 / _2923;
                    float _2935 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2937 = _2935 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2939 = _2919 * _2933;
                    float _2941 = precise::clamp(_2939, 0.0, 1.0);
                    float _2943 = fma(_2941, _2927, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2945 = fma(_2941, _2931, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2947 = fma(_2941, _2937, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2843 = _2945;
                    _2819 = _2943;
                    _2835 = _2947;
                    _2887 = true;
                }
                else
                {
                    _2843 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2819 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2835 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2887 = false;
    float _2949 = _2843;
    float _2951 = _2819;
    float _2953 = _2835;
    float _2955 = _2799 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_95.x = 0.0;
    float _2957 = _2949 * 0.586610972881317138671875;
    bool _2959 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_61.x = _2955;
    float _2961 = fma(_2951, 0.298911988735198974609375, _2957);
    bool _2963 = _2145 > 0.0;
    bool _2965 = isnan(_2145);
    bool _2967 = _2963 || _2965;
    bool _2969 = isnan(0.0);
    bool _2971 = _2967 || _2969;
    float _2973 = fma(_2953, 0.114477999508380889892578125, _2961);
    float _2975 = -_2973;
    float _2977 = _2975 + _2951;
    float _2979 = -_2973;
    float _2981 = _2979 + _2949;
    float _2983 = -_2973;
    float _2985 = _2983 + _2953;
    float _2987 = fma(_2977, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2973);
    float _2989 = fma(_2981, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2973);
    float _2991 = fma(_2985, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2973);
    bool _2993 = !_2959;
    if (!_2993)
    {
        float _2995 = -_1893;
        float _2997 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2999 = -_1895;
        float _3001 = _2999 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3003 = -_1897;
        float _3005 = _3003 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3007 = _2997 * _2997;
        float _3009 = fma(_3001, _3001, _3007);
        float _3011 = fma(_3005, _3005, _3009);
        float _3013 = sqrt(_3011);
        float _3015 = rsqrt(_3011);
        float _3017 = -_3013;
        float _3019 = _3017 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3021 = _3019 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3023 = precise::clamp(_3021, 0.0, 1.0);
        float _3025 = _3001 * _3015;
        float _3027 = _2997 * _3015;
        float _3029 = abs(_3023);
        float _3031 = log2(_3029);
        float _3033 = _3005 * _3015;
        float _3035 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3037 = _2723 * _3027;
        float _3039 = -_3027;
        float _3041 = -_3035;
        float _3043 = fma(_3039, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3041);
        float _3045 = fma(_2731, _3025, _3037);
        float _3047 = -_3033;
        float _3049 = fma(_3047, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3043);
        float _3051 = fma(_2735, _3033, _3045);
        float _3053 = precise::clamp(_3051, 0.0, 1.0);
        float _3055 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3057 = _3049 + _3055;
        float _3059 = _3031 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3061 = _3057 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3063 = precise::clamp(_3061, 0.0, 1.0);
        float _3065 = exp2(_3059);
        float _3067 = _3065 * _3063;
        float _3069 = _3053 * _3067;
        float _3071 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3073 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3075 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _3071;
        out.m_95.y = _3073;
        out.m_95.z = _3075;
    }
    out.m_97.x = _2987;
    out.m_97.y = _2989;
    out.m_97.z = _2991;
    if (_2971)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _3077 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3077;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

