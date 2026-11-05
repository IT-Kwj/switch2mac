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
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c15 [[id(2)]];
    constant _16* vp_c8 [[id(3)]];
    constant _16* vp_c10 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d_array<float> vp_t_tcb_14 [[id(17)]];
    sampler vp_t_tcb_14Smplr [[id(18)]];
    texture2d<float> vp_t_tcb_1C [[id(19)]];
    sampler vp_t_tcb_1CSmplr [[id(20)]];
    sampler vp_t_tcb_24Smplr_w [[id(21)]];
    sampler vp_t_tcb_32Smplr_w [[id(22)]];
    sampler vp_t_tcb_30Smplr_w [[id(23)]];
    sampler vp_t_tcb_14Smplr_w [[id(24)]];
    sampler vp_t_tcb_1CSmplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
};

struct main0_out
{
    float4 m_75 [[user(locn0)]];
    float4 m_61 [[user(locn2)]];
    float4 m_95 [[user(locn3)]];
    float4 m_83 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_87 [[user(locn6)]];
    float4 m_85 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_65 [[attribute(2)]];
    float4 m_69 [[attribute(3)]];
    float4 m_77 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_71 [[attribute(9)]];
    float4 m_79 [[attribute(10)]];
    float4 m_73 [[attribute(12)]];
};

static inline __attribute__((always_inline))
int _110(thread const int& _8058, thread const int& _8059, constant _10& support_buffer)
{
    float _8062 = as_type<float>(support_buffer._m4);
    int _8064 = _8059 + as_type<int>(_8062);
    int _8066 = 1 + _8064;
    float _8068 = support_buffer._m5[_8066].x;
    float _8070 = abs(_8068);
    bool _8072 = _8070 == 1.0;
    if (_8072)
    {
        return _8058;
    }
    float _8074 = float(_8058);
    float _8076 = _8074 / _8070;
    int _8078 = int(_8076);
    return _8078;
}

static inline __attribute__((always_inline))
int _111(thread const int& _8108, thread const int& _8109, constant _10& support_buffer)
{
    float _8112 = as_type<float>(support_buffer._m4);
    int _8114 = _8109 + as_type<int>(_8112);
    int _8116 = 1 + _8114;
    float _8118 = support_buffer._m5[_8116].x;
    bool _8120 = _8118 == 1.0;
    if (_8120)
    {
        return _8108;
    }
    float _8122 = float(_8108);
    float _8124 = _8122 * _8118;
    int _8126 = int(_8124);
    return _8126;
}

static inline __attribute__((always_inline))
void _108(thread const int& _7756, thread const int& _7757, thread const int& _7758, thread const int& _7759, thread int& _7760, thread int& _7761, thread int& _7762, thread int& _7763, thread int& _7764, thread int& _7765, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _7768 = _7759;
    int _7770 = _7756;
    float _7772 = 0.0 + as_type<float>(_7756);
    bool _7774 = _7772 != 0.0;
    bool _7776 = isnan(_7772);
    bool _7778 = _7774 || _7776;
    bool _7780 = isnan(0.0);
    bool _7782 = _7778 || _7780;
    int _7784 = 0;
    int _7786 = _7782 ? (-1) : 0;
    if (!_7782)
    {
        float _7788 = as_type<float>(_7756) * 1.0;
        _7768 = as_type<int>(_7788);
    }
    int _7790 = _7768;
    bool _7792 = !_7782;
    int _7794 = _7790;
    int _7796 = _7790;
    if (!_7792)
    {
        bool _7798 = _7772 >= 0.0;
        bool _7800 = isnan(_7772);
        bool _7802 = _7798 || _7800;
        bool _7804 = isnan(0.0);
        bool _7806 = _7802 || _7804;
        _7786 = _7806 ? (-1) : 0;
        if (!_7806)
        {
            _7794 = 2147483647;
        }
        int _7808 = _7794;
        bool _7810 = !_7806;
        int _7812 = _7808;
        _7796 = _7808;
        if (!_7810)
        {
            float _7814 = abs(as_type<float>(_7756));
            float _7816 = 0.0 + _7814;
            bool _7818 = _7816 > as_type<float>(0x7f800000u /* inf */);
            bool _7820 = isnan(_7816);
            bool _7822 = _7818 || _7820;
            bool _7824 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _7826 = _7822 || _7824;
            _7784 = 2139095040;
            _7786 = _7826 ? (-1) : 0;
            if (_7826)
            {
                float _7828 = as_type<float>(_7756) + 1.0;
                _7812 = as_type<int>(_7828);
            }
            int _7830 = _7812;
            int _7832 = _7830;
            _7796 = _7830;
            if (!_7826)
            {
                bool _7834 = _7816 != as_type<float>(0x7f800000u /* inf */);
                bool _7836 = isnan(_7816);
                bool _7838 = _7834 || _7836;
                bool _7840 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _7842 = _7838 || _7840;
                _7786 = _7842 ? (-1) : 0;
                if (!_7842)
                {
                    _7832 = _7756;
                }
                int _7844 = _7832;
                bool _7846 = !_7842;
                _7796 = _7844;
                if (!_7846)
                {
                    float _7848 = as_type<float>(_7756) * 18446744073709551616.0;
                    float _7850 = rsqrt(_7848);
                    float _7852 = _7848 * _7850;
                    float _7854 = _7850 * 0.5;
                    float _7856 = -_7852;
                    float _7858 = 0.0 + _7856;
                    float _7860 = fma(_7854, _7858, 0.5);
                    float _7862 = fma(_7852, _7860, _7852);
                    float _7864 = -_7862;
                    float _7866 = 0.0 + _7864;
                    float _7868 = fma(_7862, _7866, _7848);
                    float _7870 = fma(_7854, _7868, _7862);
                    float _7872 = _7870 * 2.3283064365386962890625e-10;
                    _7770 = as_type<int>(_7848);
                    _7784 = as_type<int>(_7854);
                    _7796 = as_type<int>(_7872);
                }
            }
        }
    }
    int _7874 = _7770;
    int _7876 = _7784;
    int _7878 = _7796;
    int _7880 = _7786;
    _7760 = _7874;
    _7761 = _7876;
    _7762 = _7758;
    _7763 = 0;
    _7764 = _7878;
    _7765 = _7880;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2871 = false;
    bool _1145 = false;
    bool _957 = false;
    bool _365 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_58.w;
    float _117 = trunc(_115);
    int _119 = int(_117);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_61.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3156 = as_type<float>(_135);
        out.gl_Position.z = _3156;
    }
    if (!_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_63.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = _153;
    if (_149)
    {
        float _157 = float(_119);
        _129 = _157;
    }
    float _159 = _129;
    bool _161 = _153 >= _159;
    bool _163 = !_149;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_61.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3226 = as_type<float>(_173);
        out.gl_Position.z = _3226;
    }
    if (_165)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _175 = in.m_65.x;
    float _177 = in.m_65.y;
    float _179 = in.m_65.z;
    float _181 = in.m_67.x;
    float _183 = in.m_67.y;
    float _185 = in.m_67.z;
    float _187 = in.m_69.x;
    float _189 = in.m_69.y;
    float _191 = in.m_69.z;
    float _193 = in.m_71.x;
    float _195 = _175 * _175;
    float _197 = _177 * _177;
    float _199 = fma(_181, _181, _195);
    float _201 = fma(_183, _183, _197);
    float _203 = fma(_187, _187, _199);
    float _205 = _179 * _179;
    float _207 = fma(_189, _189, _201);
    float _209 = sqrt(_203);
    float _211 = fma(_185, _185, _205);
    float _213 = fma(_191, _191, _211);
    float _215 = sqrt(_207);
    float _217 = sqrt(_213);
    bool _219 = _209 > 0.0;
    bool _221 = _215 > 0.0;
    float _223 = 0.0;
    float _225 = _215;
    float _227 = _209;
    float _229 = _203;
    float _231 = _211;
    float _233 = _207;
    float _235 = _213;
    float _237 = _183;
    float _239 = _181;
    if (_219)
    {
        float _241 = rsqrt(_203);
        _223 = _241;
    }
    float _243 = _223;
    if (!_219)
    {
        _225 = 0.0;
    }
    float _245 = _225;
    bool _247 = _217 > 0.0;
    float _249 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _251 = 0.0;
    float _253 = _249;
    float _255 = _245;
    if (_221)
    {
        float _257 = rsqrt(_207);
        _251 = _257;
    }
    float _259 = _251;
    if (!_221)
    {
        _227 = 0.0;
        _229 = 0.0;
    }
    float _261 = _227;
    float _263 = _229;
    float _265 = _249 * _193;
    float _267 = _261;
    float _269 = _263;
    if (!_219)
    {
        _231 = 0.0;
        _253 = 0.0;
    }
    float _271 = _231;
    float _273 = _253;
    float _275 = 0.0;
    float _277 = _273;
    float _279 = _271;
    if (_247)
    {
        float _281 = rsqrt(_213);
        _275 = _281;
    }
    float _283 = _275;
    if (_219)
    {
        float _285 = _243 * _181;
        _255 = _285;
    }
    float _287 = _255;
    if (_219)
    {
        float _289 = _243 * _175;
        _277 = _289;
    }
    float _291 = _277;
    if (_219)
    {
        float _293 = _243 * _187;
        _279 = _293;
    }
    float _295 = _279;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    if (!_221)
    {
        _233 = 0.0;
    }
    float _299 = _233;
    float _301 = trunc(_265);
    int _303 = int(_301);
    float _305 = _299;
    if (_221)
    {
        float _307 = _259 * _183;
        _267 = _307;
    }
    float _309 = _267;
    if (!_247)
    {
        _235 = 0.0;
    }
    float _311 = _235;
    float _313 = _311;
    if (!_247)
    {
        _237 = 0.0;
        _239 = 0.0;
    }
    float _315 = _237;
    float _317 = _239;
    float _319 = _317;
    float _321 = _315;
    if (_221)
    {
        float _323 = _259 * _177;
        _269 = _323;
    }
    float _325 = _269;
    if (_221)
    {
        float _327 = _259 * _189;
        _305 = _327;
    }
    float _329 = _305;
    if (_247)
    {
        float _331 = _283 * _185;
        _313 = _331;
    }
    float _333 = _313;
    if (_247)
    {
        float _335 = _283 * _179;
        _319 = _335;
    }
    float _337 = _319;
    if (_247)
    {
        float _339 = _283 * _191;
        _321 = _339;
    }
    float _341 = _321;
    int _343 = _303 << 4;
    int _345 = _343 + 1712;
    bool _347 = !_297;
    float _363;
    if (!_347)
    {
        float _349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _351 = _193 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _353 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[11].y, _153);
        float _355 = _353 * _349;
        float _357 = floor(_355);
        float _359 = -_357;
        float _361 = _355 + _359;
        _363 = _361;
        _365 = true;
    }
    else
    {
        float _367 = float(_119);
        float _369 = 1.0 / _367;
        float _371 = _153 * _369;
        _363 = _371;
    }
    _365 = false;
    float _373 = _363;
    int _375 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _377 = _375;
    int _379 = 0;
    int _381 = _110(_377, _379, (*spvDescriptorSet0.support_buffer));
    float _383 = in.m_71.y;
    float _385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _387 = in.m_73.z;
    float _389 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _193);
    float _391 = _389 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _393 = -_385;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _397 = fma(_395, _383, _385);
    float _399 = _391 * _397;
    float _401 = trunc(_387);
    int _403 = int(_401);
    float _405 = float(_381);
    int _407 = abs(_381);
    bool _409 = _381 == 0;
    float _411 = _399 * _405;
    float _413 = float(uint(_407));
    float _415 = trunc(_411);
    int _417 = int(_415);
    float _419 = 1.0 / _413;
    int _421 = abs(_417);
    uint _424 = uint(int(uint(_417) >> uint(31)));
    float _426 = float(uint(_421));
    int _428 = ~int(_424);
    int _430 = _428 + 1;
    int _432 = as_type<int>(_419) + (-2);
    float _434 = as_type<float>(_432) * _426;
    float _436 = trunc(_434);
    float _438 = precise::max(_436, 0.0);
    uint _440 = uint(_438);
    int _442 = ~int(_440);
    int _444 = _442 + 1;
    int _446 = _444 * _407;
    int _448 = _446 + _421;
    float _450 = float(uint(_448));
    float _452 = as_type<float>(_432) * _450;
    float _454 = trunc(_452);
    float _456 = precise::max(_454, 0.0);
    uint _458 = uint(_456);
    int _460 = int(_440) + int(_458);
    int _462 = ~_460;
    int _464 = _462 + 1;
    int _466 = _464 * _407;
    int _468 = _466 + _421;
    bool _470 = uint(_468) >= uint(_407);
    bool _472 = !_470;
    int _474 = _472 ? 0 : (-1);
    int _476 = ~_460;
    int _478 = _476 + _474;
    int _480 = _478 + 1;
    int _482 = _480 * _407;
    int _484 = _482 + _421;
    int _486 = _484 ^ _430;
    int _488 = ~_430;
    int _490 = _488 + _486;
    int _492 = _490 + 1;
    bool _494 = !_409;
    int _496 = _494 ? _492 : (-1);
    int _498 = _496;
    int _500 = 0;
    int _502 = _111(_498, _500, (*spvDescriptorSet0.support_buffer));
    int _504 = _403;
    int _506 = 0;
    int _508 = _111(_504, _506, (*spvDescriptorSet0.support_buffer));
    float4 _511 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_502, _508)), 0).xyzw;
    float _513 = _511.x;
    float _515 = _511.y;
    float _517 = _511.z;
    float _519 = _511.w;
    float _521 = _193 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _523 = _383 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _535 = _533 != 0;
    float _537 = 1.0 / _527;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _541 = _539 != 0;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _545 = in.m_73.x;
    int _547 = _345 + 8;
    uint _549 = uint(int(uint(_547) >> uint(2)));
    uint _551 = uint(int(uint(int(_549)) >> uint(2)));
    int _553 = int(_549) & 3;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[int(_551)][_553];
    bool _557 = _193 > 0.5;
    bool _559 = _557 && _535;
    float _561 = 1.0 / _531;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _565 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[78].z, _543);
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    uint _571 = uint(int(uint(_345) >> uint(2)));
    uint _573 = uint(int(uint(int(_571)) >> uint(2)));
    int _575 = int(_571) & 3;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[int(_573)][_575];
    int _579 = int(_571) + 1;
    uint _581 = uint(int(uint(_579) >> uint(2)));
    int _583 = _579 & 3;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[int(_581)][_583];
    float _587 = -_563;
    float _589 = fma(_521, 2.0, _587);
    float _591 = 1.0 / _569;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _593;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _603 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _605 = isnan(_373);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = in.m_73.y;
    float _617 = fma(_523, -2.0, _597);
    float _619 = _595 * _537;
    float _621 = _601 * _561;
    float _623 = -_613;
    float _625 = _623 + 1.0;
    bool _627 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _629 = isnan(_373);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _641 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _643 = isnan(_373);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _653;
    bool _657 = _383 > 0.5;
    bool _659 = _657 && _541;
    float _661 = -_637;
    float _663 = _661 + 1.0;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _667 = _373 + _665;
    float _669 = _655 * _591;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _673 = _373 + _671;
    float _675 = _613 * _663;
    bool _677 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _679 = isnan(_373);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = _651 * _625;
    float _691 = -_651;
    float _693 = _691 + 1.0;
    float _695 = fma(_619, _673, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _699 = _373 + _697;
    float _701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _703 = _687 * _693;
    float _705 = -_687;
    float _707 = _705 + 1.0;
    float _709 = fma(_621, _699, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _711 = _695 * _703;
    float _713 = _591;
    float _715 = _615;
    float _717 = _373;
    if (_535)
    {
        _713 = _545;
    }
    float _719 = _713;
    float _721 = fma(_669, _667, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _723 = _639 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _725 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[115].x, _711);
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _729 = _719;
    if (_559)
    {
        float _731 = -_719;
        float _733 = _731 + 1.0;
        _729 = _733;
    }
    float _735 = _729;
    if (_659)
    {
        float _737 = -_615;
        float _739 = _737 + 1.0;
        _715 = _739;
    }
    float _741 = _715;
    float _743 = fma(_709, _689, _725);
    float _745 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[78].w, _727);
    if (!_535)
    {
        _717 = _545;
    }
    float _747 = _717;
    float _749 = _701 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _751 = _747;
    if (_535)
    {
        _751 = _735;
    }
    float _753 = _751;
    float _755 = fma(_721, _675, _743);
    float _757 = fma(_723, _741, -0.5);
    float _759 = _577 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _761 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _745);
    float _763 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _617);
    int _765 = _496 + 1;
    float _767 = _759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _769 = fma(_749, _753, -0.5);
    float _771 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _565);
    float _773 = -_153;
    float _775 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[76].x, _589);
    float _777 = -_763;
    float _779 = fma(_761, _757, _777);
    int _781 = abs(_765);
    float _783 = _585 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _785 = fma(_771, _769, _775);
    float _787 = _555 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _789 = float(uint(_781));
    float _791 = _783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _793 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[118].x, _755);
    float _795 = _787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _797 = uint(int(uint(_765) >> uint(31)));
    float _799 = as_type<float>(_432) * _789;
    float _801 = _793 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _803 = ~int(_797);
    int _805 = _803 + 1;
    float _807 = _779 + 0.5;
    float _809 = _785 + 0.5;
    float _811 = trunc(_799);
    float _813 = precise::max(_811, 0.0);
    uint _815 = uint(_813);
    out.m_75.x = _767;
    out.m_75.y = _791;
    out.m_75.z = _795;
    out.m_75.w = _801;
    int _817 = ~int(_815);
    int _819 = _817 + 1;
    int _821 = _819 * _407;
    int _823 = _821 + _781;
    float _825 = float(uint(_823));
    float _827 = as_type<float>(_432) * _825;
    float _829 = trunc(_827);
    float _831 = precise::max(_829, 0.0);
    uint _833 = uint(_831);
    int _835 = int(_815) + int(_833);
    int _837 = ~_835;
    int _839 = _837 + 1;
    int _841 = _839 * _407;
    int _843 = _841 + _781;
    bool _845 = uint(_843) >= uint(_407);
    bool _847 = !_845;
    int _849 = _847 ? 0 : (-1);
    int _851 = ~_835;
    int _853 = _851 + _849;
    int _855 = _853 + 1;
    int _857 = _855 * _407;
    int _859 = _857 + _781;
    int _861 = _859 ^ _805;
    int _863 = ~_805;
    int _865 = _863 + _861;
    int _867 = _865 + 1;
    bool _869 = !_409;
    int _871 = _869 ? _867 : (-1);
    uint _873 = as_type<uint>(half2(float2(_519, 0.0)));
    uint _875 = extract_bits(_873, 0u, 8u);
    int _877 = int(_875) & 255;
    uint _879 = extract_bits(_873, 8u, 8u);
    int _881 = int(_879) & 255;
    int _883 = _881 << 8;
    int _885 = _877 | _883;
    bool _887 = _885 >= 32768;
    int _889 = _885 + (-1024);
    int _891 = _889;
    if (_887)
    {
        int _893 = ~_885;
        int _895 = _893 + 33792;
        int _897 = _895 + 1;
        _891 = _897;
    }
    int _899 = _891;
    int _901 = _899 + 30719;
    float _903 = float(_901);
    float _905 = fma(_903, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _907 = abs(_905);
    float _909 = -_907;
    float _911 = _909 + 1.0;
    bool _913 = _905 < 0.0;
    float _915 = float(_913);
    float _917 = abs(_905);
    float _919 = fma(_917, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _921 = as_type<int>(_911) + (-218103808);
    float _923 = abs(_905);
    float _925 = fma(_923, _919, -0.212114393711090087890625);
    bool _927 = uint(_921) >= 1920991232u;
    float _929 = abs(_905);
    float _931 = fma(_929, _925, 1.570728778839111328125);
    bool _933 = !_927;
    float _955;
    if (!_933)
    {
        int _935 = as_type<int>(_911);
        int _937 = as_type<int>(_779);
        int _939 = 3968;
        int _941 = as_type<int>(_689);
        int _943;
        int _945;
        int _947;
        int _949;
        int _951;
        int _953;
        _108(_935, _937, _939, _941, _943, _945, _947, _949, _951, _953, out.gl_Position, out.gl_PointSize);
        _955 = as_type<float>(_951);
        _957 = true;
    }
    else
    {
        float _959 = rsqrt(_911);
        float _961 = _911 * _959;
        float _963 = _959 * 0.5;
        float _965 = -_961;
        float _967 = 0.0 + _965;
        float _969 = fma(_963, _967, 0.5);
        float _971 = fma(_961, _969, _961);
        float _973 = -_971;
        float _975 = 0.0 + _973;
        float _977 = fma(_971, _975, _911);
        float _979 = fma(_963, _977, _971);
        _955 = _979;
    }
    _957 = false;
    float _981 = _955;
    int _983 = _871;
    int _985 = 0;
    int _987 = _111(_983, _985, (*spvDescriptorSet0.support_buffer));
    int _989 = _403;
    int _991 = 0;
    int _993 = _111(_989, _991, (*spvDescriptorSet0.support_buffer));
    float4 _995 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_987, _993)), 0).xyzw;
    float _997 = _995.x;
    float _999 = _995.y;
    float _1001 = _995.z;
    float _1003 = _995.w;
    float _1005 = _931 * _981;
    float _1007 = _915 * 2.0;
    float _1009 = floor(_411);
    float _1011 = _903 * 3.883221149444580078125;
    float _1013 = -_1007;
    float _1015 = fma(_1005, _1013, _1005);
    float _1017 = _1011 * 0.15915493667125701904296875;
    float _1019 = fma(_915, 3.1415927410125732421875, _1015);
    float _1021 = _1017 * 6.283185482025146484375;
    float _1023 = cos(_1021);
    float _1025 = _1019 * 0.15915493667125701904296875;
    float _1027 = -_1009;
    float _1029 = _411 + _1027;
    float _1031 = _1025 * 6.283185482025146484375;
    float _1033 = sin(_1031);
    float _1035 = _1017 * 6.283185482025146484375;
    float _1037 = sin(_1035);
    float _1039 = _1033 * _1023;
    float _1041 = _1033 * _1037;
    uint _1043 = as_type<uint>(half2(float2(_1003, 0.0)));
    float _1045 = -_513;
    float _1047 = _1045 + _997;
    float _1049 = -_515;
    float _1051 = _1049 + _999;
    float _1053 = -_517;
    float _1055 = _1053 + _1001;
    uint _1057 = extract_bits(_1043, 0u, 8u);
    int _1059 = int(_1057) & 255;
    uint _1061 = extract_bits(_1043, 8u, 8u);
    int _1063 = int(_1061) & 255;
    int _1065 = _1063 << 8;
    int _1067 = _1059 | _1065;
    float _1069 = fma(_1029, _1047, _513);
    float _1071 = fma(_1029, _1051, _515);
    float _1073 = fma(_1029, _1055, _517);
    bool _1075 = _1067 >= 32768;
    int _1077 = _1067 + (-1024);
    int _1079 = _1077;
    if (_1075)
    {
        int _1081 = ~_1067;
        int _1083 = _1081 + 33792;
        int _1085 = _1083 + 1;
        _1079 = _1085;
    }
    int _1087 = _1079;
    int _1089 = _1087 + 30719;
    float _1091 = float(_1089);
    float _1093 = fma(_1091, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1095 = abs(_1093);
    float _1097 = -_1095;
    float _1099 = _1097 + 1.0;
    float _1101 = abs(_1093);
    float _1103 = fma(_1101, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1105 = _1093 < 0.0;
    float _1107 = float(_1105);
    int _1109 = as_type<int>(_1099) + (-218103808);
    float _1111 = abs(_1093);
    float _1113 = fma(_1111, _1103, -0.212114393711090087890625);
    bool _1115 = uint(_1109) >= 1920991232u;
    float _1117 = abs(_1093);
    float _1119 = fma(_1117, _1113, 1.570728778839111328125);
    bool _1121 = !_1115;
    float _1143;
    if (!_1121)
    {
        int _1123 = as_type<int>(_1099);
        int _1125 = as_type<int>(_1099);
        int _1127 = 4864;
        int _1129 = as_type<int>(_1005);
        int _1131;
        int _1133;
        int _1135;
        int _1137;
        int _1139;
        int _1141;
        _108(_1123, _1125, _1127, _1129, _1131, _1133, _1135, _1137, _1139, _1141, out.gl_Position, out.gl_PointSize);
        _1143 = as_type<float>(_1139);
        _1145 = true;
    }
    else
    {
        float _1147 = rsqrt(_1099);
        float _1149 = _1099 * _1147;
        float _1151 = _1147 * 0.5;
        float _1153 = -_1149;
        float _1155 = 0.0 + _1153;
        float _1157 = fma(_1151, _1155, 0.5);
        float _1159 = fma(_1149, _1157, _1149);
        float _1161 = -_1159;
        float _1163 = 0.0 + _1161;
        float _1165 = fma(_1159, _1163, _1099);
        float _1167 = fma(_1151, _1165, _1159);
        _1143 = _1167;
    }
    _1145 = false;
    float _1169 = _1143;
    float _1171 = in.m_58.x;
    float _1173 = in.m_58.y;
    float _1175 = in.m_58.z;
    float _1177 = in.m_67.x;
    float _1179 = in.m_67.y;
    float _1181 = in.m_67.z;
    float _1183 = in.m_67.w;
    float _1185 = in.m_69.x;
    float _1187 = in.m_69.y;
    float _1189 = in.m_69.z;
    float _1191 = in.m_69.w;
    float _1193 = _1173 * _1179;
    float _1195 = _1173 * _1187;
    float _1197 = fma(_1171, _1177, _1193);
    float _1199 = fma(_1171, _1185, _1195);
    float _1201 = fma(_1175, _1181, _1197);
    float _1203 = fma(_1175, _1189, _1199);
    float _1205 = _1201 + _1183;
    float _1207 = _1203 + _1191;
    float _1209 = fma(_1205, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1211 = fma(_1207, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1213 = floor(_1209);
    float _1215 = floor(_1211);
    float _1217 = -_1213;
    float _1219 = _1209 + _1217;
    float _1221 = -_1215;
    float _1223 = _1211 + _1221;
    float2 _4682 = float2(_1219, _1223);
    float _1225 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4682, float2(0.0), isnan(_4682)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4682, float2(0.0), isnan(_4682)), level(0.0)).x;
    float _1227 = in.m_71.x;
    float _1229 = in.m_71.y;
    float _1231 = in.m_71.z;
    float _1233 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1235 = log2(_1233);
    float _1237 = in.m_65.x;
    float _1239 = in.m_65.y;
    float _1241 = in.m_65.z;
    float _1243 = in.m_65.w;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1247 = 1.0 + _1245;
    float _1249 = 1.0 / _1247;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1253 = _1251 != 0;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1257 = _1255 != 0;
    int _1259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1261 = _1259 != 0;
    bool _1263 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1265 = isnan(1.0);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1271 = _1267 || _1269;
    float _1273 = _1235 * _153;
    bool _1275 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1277 = isnan(0.0);
    bool _1279 = _1275 || _1277;
    bool _1281 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1283 = _1279 || _1281;
    float _1285 = exp2(_1273);
    float _1287 = _1231 * 2.0;
    float _1289 = _1173 * _1239;
    float _1291 = _1227 * 2.0;
    float _1293 = floor(_1287);
    float _1295 = _1231 + _1229;
    float _1297 = fma(_1171, _1237, _1289);
    float _1299 = _1229 * 2.0;
    float _1301 = _1295 + (-1.0);
    float _1303 = fma(_1175, _1241, _1297);
    float _1305 = -_1285;
    float _1307 = _1305 + 1.0;
    float _1309 = floor(_1291);
    float _1311 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1313 = _1229 + _1227;
    float _1315 = _1303 + _1243;
    float _1317 = _1283 ? _1307 : 0.0;
    float _1319 = _1313 + (-1.0);
    bool _1321 = !_1261;
    int _1323 = _1321 ? 0 : 1;
    float _1325 = floor(_1299);
    bool _1327 = _1293 > 0.0;
    int _1329 = 2;
    float _1331 = _1315;
    if (_1271)
    {
        float _1333 = _1317 * _1249;
        _155 = _1333;
    }
    float _1335 = _155;
    float _1337 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1339 = _1293 >= 0.0;
    bool _1341 = isnan(_1293);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan(0.0);
    bool _1347 = _1343 || _1345;
    float _1349 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1351 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1353 = _1309 > 0.0;
    float _1355 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1349);
    bool _1357 = _1309 >= 0.0;
    bool _1359 = isnan(_1309);
    bool _1361 = _1357 || _1359;
    bool _1363 = isnan(0.0);
    bool _1365 = _1361 || _1363;
    int _1367 = _1347 ? 0 : 1;
    float _1369 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1355);
    int _1371 = _1365 ? 0 : 1;
    int _1373 = ~_1367;
    int _1375 = _1373 + 1;
    int _1377 = _1375 + 1;
    float _1379 = _1369 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1381 = _1325 > 0.0;
    bool _1383 = _1325 >= 0.0;
    bool _1385 = isnan(_1325);
    bool _1387 = _1383 || _1385;
    bool _1389 = isnan(0.0);
    bool _1391 = _1387 || _1389;
    float _1393 = 1.0 / _1379;
    int _1395 = _1377;
    if (!_1327)
    {
        int _1397 = ~_1367;
        int _1399 = _1397 + 1;
        _1395 = _1399;
    }
    int _1401 = _1395;
    bool _1403 = !_1257;
    int _1405 = _1403 ? 0 : 1;
    float _1407 = in.m_77.x;
    float _1409 = in.m_77.y;
    float _1411 = in.m_77.z;
    int _1413 = ~_1371;
    int _1415 = _1413 + 1;
    int _1417 = _1415 + 1;
    int _1419 = _1417;
    if (!_1353)
    {
        int _1421 = ~_1371;
        int _1423 = _1421 + 1;
        _1419 = _1423;
    }
    int _1425 = _1419;
    bool _1427 = !_1253;
    int _1429 = _1427 ? 0 : 1;
    int _1431 = abs(_1405);
    float _1433 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1351);
    int _1435 = abs(_1429);
    float _1437 = float(_1401);
    float _1439 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1433);
    float _1441 = float(_1435);
    int _1443 = _1391 ? 0 : 1;
    float _1445 = _1439 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1447 = float(_1431);
    float _1449 = _1441 * _1437;
    float _1451 = float(_1425);
    float _1453 = _1445 + _1379;
    int _1455 = abs(_1323);
    float _1457 = _1449 * (-2.0);
    float _1459 = _1227 + (-0.5);
    float _1461 = _1447 * _1451;
    int _1463 = ~_1443;
    int _1465 = _1463 + 1;
    int _1467 = _1465 + 1;
    float _1469 = fma(_1457, _1407, _1407);
    int _1471 = _1467;
    if (!_1381)
    {
        int _1473 = ~_1443;
        int _1475 = _1473 + 1;
        _1471 = _1475;
    }
    int _1477 = _1471;
    float _1479 = _1461 * (-2.0);
    float _1481 = fma(_1337, _1457, _1337);
    float _1483 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1469);
    float _1485 = float(_1455);
    float _1487 = fma(_1311, _1479, _1311);
    float _1489 = fma(_1479, _1409, _1409);
    float _1491 = float(_1477);
    float _1493 = in.m_79.x;
    float _1495 = in.m_79.y;
    float _1497 = in.m_79.z;
    float _1499 = _1453 * _1393;
    float _1501 = _1499 * 0.5;
    float _1503 = _1231 + _1227;
    float _1505 = _1485 * _1491;
    float _1507 = _1229 + (-0.5);
    float _1509 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1511 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1509);
    float _1513 = _1503 + (-1.0);
    float _1515 = _1505 * (-2.0);
    float _1517 = fma(_1507, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1489);
    float _1519 = _1231 + (-0.5);
    float _1521 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1523 = fma(_1515, _1411, _1411);
    float _1525 = fma(_1481, _1335, _1483);
    float _1527 = fma(_1487, _1335, _1517);
    float _1529 = 1.0 / _1511;
    float _1531 = fma(_1521, _1515, _1521);
    float _1533 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1523);
    float _1535 = _1527 * 0.15915493667125701904296875;
    float _1537 = _1525 * 0.15915493667125701904296875;
    float _1539 = fma(_1531, _1335, _1533);
    float _1541 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1543 = _1495 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1545 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1071);
    float _1547 = _1539 * 0.15915493667125701904296875;
    float _1549 = _1537 * 6.283185482025146484375;
    float _1551 = sin(_1549);
    float _1553 = _1543 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1555 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1069);
    float _1559 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1561 = _1553 * _1545;
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1565 = _1529 * _1563;
    float _1567 = _1555 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1569 = _1535 * 6.283185482025146484375;
    float _1571 = cos(_1569);
    float _1573 = _1559 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1575 = _1315 + _1541;
    bool _1577 = _1565 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1579 = _1567 * _1557;
    bool _1581 = _1565 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1583 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1073);
    float _1585 = _1575 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1587 = _1547 * 6.283185482025146484375;
    float _1589 = sin(_1587);
    float _1591 = _1573 * _1583;
    float _1593 = fma(_1205, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1585);
    float _1595 = _1547 * 6.283185482025146484375;
    float _1597 = cos(_1595);
    if (!_1577)
    {
        _1329 = 1;
    }
    int _1599 = _1329;
    float _1601 = _1537 * 6.283185482025146484375;
    float _1603 = cos(_1601);
    float _1605 = _1551 * _1589;
    float _1607 = _1551 * _1571;
    float _1609 = _1571 * _1589;
    float _1611 = _1607 * _1561;
    float _1613 = _1535 * 6.283185482025146484375;
    float _1615 = sin(_1613);
    float _1617 = _1551 * _1597;
    bool _1619 = !_1577;
    int _1621 = _1619 ? 0 : 1;
    float _1623 = _1575 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _1625 = _1599;
    if (!_1581)
    {
        _1625 = _1621;
    }
    int _1627 = _1625;
    float _1629 = fma(_1207, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1593);
    float _1631 = _1603 * _1589;
    float _1633 = _1603 * _1597;
    int _1635 = _1627 << 6;
    float _1637 = _1571 * _1597;
    float _1639 = _1603 * _1571;
    float _1641 = fma(_1205, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1623);
    float _1643 = _1629 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1645 = _1635 + 72;
    uint _1647 = uint(int(uint(_1645) >> uint(2)));
    uint _1649 = uint(int(uint(int(_1647)) >> uint(2)));
    int _1651 = int(_1647) & 3;
    float _1653 = (*spvDescriptorSet0.vp_c15)._m0[int(_1649)][_1651];
    int _1655 = int(_1647) + 1;
    uint _1657 = uint(int(uint(_1655) >> uint(2)));
    int _1659 = _1655 & 3;
    float _1661 = (*spvDescriptorSet0.vp_c15)._m0[int(_1657)][_1659];
    float _1663 = fma(_1615, _1605, _1633);
    float _1665 = -_1631;
    float _1667 = fma(_1615, _1617, _1665);
    float _1669 = -_1617;
    float _1671 = fma(_1615, _1631, _1669);
    float _1673 = fma(_1615, _1633, _1605);
    float _1675 = _1663 * _1561;
    float _1677 = fma(_1207, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1641);
    float _1679 = _1667 * _1561;
    int _1681 = _1635 + 96;
    uint _1683 = uint(int(uint(_1681) >> uint(2)));
    uint _1685 = uint(int(uint(int(_1683)) >> uint(2)));
    int _1687 = int(_1683) & 3;
    float _1689 = (*spvDescriptorSet0.vp_c15)._m0[int(_1685)][_1687];
    int _1691 = int(_1683) + 1;
    uint _1693 = uint(int(uint(_1691) >> uint(2)));
    int _1695 = _1691 & 3;
    float _1697 = (*spvDescriptorSet0.vp_c15)._m0[int(_1693)][_1695];
    float _1699 = fma(_1609, _1579, _1675);
    float _1701 = _1677 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1703 = trunc(_1643);
    int _1705 = int(_1703);
    float _1707 = -_1615;
    float _1709 = fma(_1707, _1579, _1611);
    float _1711 = fma(_1637, _1579, _1679);
    float _1713 = fma(_1671, _1591, _1699);
    int _1715 = _1635 + 48;
    uint _1717 = uint(int(uint(_1715) >> uint(2)));
    uint _1719 = uint(int(uint(int(_1717)) >> uint(2)));
    int _1721 = int(_1717) & 3;
    float _1723 = (*spvDescriptorSet0.vp_c15)._m0[int(_1719)][_1721];
    int _1725 = int(_1717) + 1;
    uint _1727 = uint(int(uint(_1725) >> uint(2)));
    int _1729 = _1725 & 3;
    float _1731 = (*spvDescriptorSet0.vp_c15)._m0[int(_1727)][_1729];
    float _1733 = fma(_1639, _1591, _1709);
    float _1735 = fma(_1673, _1591, _1711);
    float _1737 = trunc(_1701);
    int _1739 = int(_1737);
    float _1741 = _1713 * _329;
    float _1743 = _1713 * _309;
    float _1745 = _1713 * _325;
    int _1747 = _1635 + 104;
    uint _1749 = uint(int(uint(_1747) >> uint(2)));
    uint _1751 = uint(int(uint(int(_1749)) >> uint(2)));
    int _1753 = int(_1749) & 3;
    float _1755 = (*spvDescriptorSet0.vp_c15)._m0[int(_1751)][_1753];
    int _1757 = int(_1749) + 1;
    uint _1759 = uint(int(uint(_1757) >> uint(2)));
    int _1761 = _1757 & 3;
    float _1763 = (*spvDescriptorSet0.vp_c15)._m0[int(_1759)][_1761];
    float _1765 = fma(_1735, _295, _1741);
    float _1767 = fma(_1735, _287, _1743);
    int _1769 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1771 = _1705 + _1769;
    int _1773 = _1771 + 1;
    float _1775 = fma(_1735, _291, _1745);
    float _1777 = fma(_1733, _341, _1765);
    float _1779 = fma(_1733, _333, _1767);
    int _1781 = _1635 + 64;
    uint _1783 = uint(int(uint(_1781) >> uint(2)));
    uint _1785 = uint(int(uint(int(_1783)) >> uint(2)));
    int _1787 = int(_1783) & 3;
    float _1789 = (*spvDescriptorSet0.vp_c15)._m0[int(_1785)][_1787];
    int _1791 = int(_1783) + 1;
    uint _1793 = uint(int(uint(_1791) >> uint(2)));
    int _1795 = _1791 & 3;
    float _1797 = (*spvDescriptorSet0.vp_c15)._m0[int(_1793)][_1795];
    float _1799 = _1207 + _1777;
    float _1801 = _1205 + _1779;
    int _1803 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1805 = _1739 + _1803;
    int _1807 = _1805 + 1;
    float _1809 = fma(_1733, _337, _1775);
    float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1813 = _1799 + _1811;
    float _1815 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1817 = _1801 + _1815;
    bool _1819 = _1807 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1821 = _1635 + 56;
    uint _1823 = uint(int(uint(_1821) >> uint(2)));
    uint _1825 = uint(int(uint(int(_1823)) >> uint(2)));
    int _1827 = int(_1823) & 3;
    float _1829 = (*spvDescriptorSet0.vp_c15)._m0[int(_1825)][_1827];
    int _1831 = int(_1823) + 1;
    uint _1833 = uint(int(uint(_1831) >> uint(2)));
    int _1835 = _1831 & 3;
    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[int(_1833)][_1835];
    int _1839 = _1807 | _1773;
    float _1841 = _1315 + _1809;
    bool _1843 = _1839 < 0;
    bool _1845 = _1843 || _1819;
    float _1847 = _1813 * _1813;
    int _1849 = _1635 + 80;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    uint _1853 = uint(int(uint(int(_1851)) >> uint(2)));
    int _1855 = int(_1851) & 3;
    float _1857 = (*spvDescriptorSet0.vp_c15)._m0[int(_1853)][_1855];
    int _1859 = int(_1851) + 1;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    int _1863 = _1859 & 3;
    float _1865 = (*spvDescriptorSet0.vp_c15)._m0[int(_1861)][_1863];
    bool _1867 = _1773 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1869 = _1867 || _1845;
    float _1871 = fma(_1817, _1817, _1847);
    float _1873 = sqrt(_1871);
    float _1875 = _1575 * _1697;
    float _1877 = fma(_1205, _1689, _1875);
    int _1879 = as_type<int>(_1689);
    int _1881 = as_type<int>(_1877);
    float _1883 = _1841;
    float _1885 = _1799;
    float _1887 = _1809;
    if (!_1869)
    {
        int _1889 = _1773 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1891 = _1889 + _1807;
        _1879 = _1891;
    }
    int _1893 = _1879;
    float _1895 = _1575 * _1731;
    float _1897 = as_type<float>(_1807);
    if (!_1869)
    {
        float _1899 = floor(_1701);
        _1897 = _1899;
    }
    float _1901 = _1897;
    float _1903 = fma(_1205, _1723, _1895);
    bool _1905 = _1873 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1907 = fma(_1207, _1755, _1877);
    int _1909 = as_type<int>(_1907);
    if (!_1869)
    {
        int _1911 = _1893 << 2;
        _1881 = _1911;
    }
    int _1913 = _1881;
    float _1915 = _1907 + _1763;
    int _1917 = _1913;
    if (!_1869)
    {
        uint _1919 = uint(int(uint(_1893) >> uint(2)));
        _1909 = int(_1919);
    }
    int _1921 = _1909;
    float _1923 = as_type<float>(_1921);
    if (!_1869)
    {
        int _1925 = 12 & _1913;
        _1917 = _1925;
    }
    int _1927 = _1917;
    float _1929 = _1575 * _1797;
    float _1931 = 1.0 / _1915;
    if (!_1869)
    {
        int _1933 = _1921 << 4;
        int _1935 = _1933 + _1927;
        _1923 = as_type<float>(_1935);
    }
    float _1937 = _1923;
    float _1939 = fma(_1205, _1789, _1929);
    if (!_1905)
    {
        _1331 = _1801;
    }
    float _1941 = _1331;
    float _1943 = fma(_1207, _1829, _1903);
    float _1945 = fma(_1207, _1653, _1939);
    float _1947 = _1943 + _1837;
    float _1949 = _1945 + _1661;
    bool _1951 = !_1905;
    float _1953 = _1941;
    float _1955 = _1901;
    if (!_1951)
    {
        float _1957 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1961 = _1873 + _1959;
        float _1963 = _1841 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1965 = rsqrt(_1871);
        float _1967 = _1961 * _1957;
        float _1969 = _1967 * 0.15915493667125701904296875;
        float _1971 = _1969 * 6.283185482025146484375;
        float _1973 = cos(_1971);
        float _1975 = _1969 * 6.283185482025146484375;
        float _1977 = sin(_1975);
        float _1979 = _1973 + (-1.0);
        float _1981 = _1979 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1983 = fma(_1977, _1963, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1985 = fma(_1841, _1973, _1981);
        float _1987 = _1965 * _1983;
        float _1989 = fma(_1817, _1987, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1991 = fma(_1813, _1987, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1883 = _1985;
        _1953 = _1989;
        _1885 = _1991;
    }
    float _1993 = _1883;
    float _1995 = _1953;
    float _1997 = _1885;
    float _1999 = _1937;
    if (!_1869)
    {
        int _2001 = as_type<int>(_1937) + 400;
        uint _2003 = uint(int(uint(_2001) >> uint(2)));
        uint _2005 = uint(int(uint(int(_2003)) >> uint(2)));
        int _2007 = int(_2003) & 3;
        float _2009 = (*spvDescriptorSet0.vp_c15)._m0[int(_2005)][_2007];
        _1999 = _2009;
    }
    float _2011 = _1999;
    float _2013 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2015 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2017 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2019 = _1947 * _1931;
    float _2021 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2013);
    float _2023 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2015);
    float _2025 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2017);
    int _2027 = _1635 + 88;
    uint _2029 = uint(int(uint(_2027) >> uint(2)));
    uint _2031 = uint(int(uint(int(_2029)) >> uint(2)));
    int _2033 = int(_2029) & 3;
    float _2035 = (*spvDescriptorSet0.vp_c15)._m0[int(_2031)][_2033];
    int _2037 = int(_2029) + 1;
    uint _2039 = uint(int(uint(_2037) >> uint(2)));
    int _2041 = _2037 & 3;
    float _2043 = (*spvDescriptorSet0.vp_c15)._m0[int(_2039)][_2041];
    float _2045 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2021);
    bool _2047 = _2019 >= 0.0;
    float _2049 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2023);
    float _2051 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2053 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2025);
    float _2055 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2057 = _1949 * _1931;
    bool _2059 = _2019 <= 1.0;
    bool _2061 = _2059 && _2047;
    float _2063 = _2049 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2065 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2051);
    float _2067 = _2053 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2069 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2071 = _2057 >= 0.0;
    bool _2073 = _2071 && _2061;
    float _2075 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2077 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2079 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2065);
    float _2081 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2069);
    bool _2083 = _2057 <= 1.0;
    bool _2085 = _2083 && _2073;
    float _2087 = -_2077;
    float _2089 = fma(_2087, _2075, 1.0);
    float _2091 = _2079 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2093 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2081);
    float _2095 = _1653;
    if (!_1869)
    {
        float _2097 = floor(_1643);
        _2095 = _2097;
    }
    float _2099 = _2095;
    float _2101 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2103 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2105 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2093);
    float _2107 = _1575 * _1865;
    float _2109 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2101);
    float _2111 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2103);
    float _2113 = log2(_2089);
    float _2115 = _2109;
    if (_2085)
    {
        float _2117 = float(_1627);
        _1887 = _2117;
    }
    float _2119 = _1887;
    float _2121 = fma(_1205, _1857, _2107);
    float _2123 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2109);
    float _2125 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2111);
    float _2127 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2123);
    float _2129 = 1.0 / _2105;
    if (!_1869)
    {
        float _2131 = -_2099;
        float _2133 = _1643 + _2131;
        _2115 = _2133;
    }
    float _2135 = _2115;
    float _2137 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2125);
    float _2139 = _2107;
    if (_2085)
    {
        float _2141 = rint(_2119);
        float _2143 = precise::max(_2141, 0.0);
        uint _2145 = uint(_2143);
        uint _2147 = clamp(_2145, 0u, 65535u);
        _2139 = as_type<float>(_2147);
    }
    float _2149 = _2139;
    float _2151 = _2113 * 0.693147182464599609375;
    float _2153 = fma(_1207, _2035, _2121);
    float _2155 = _2153 + _2043;
    float _2157 = _2011;
    float _2159 = _2151;
    if (!_1869)
    {
        float _2161 = rint(_2011);
        float _2163 = precise::max(_2161, 0.0);
        uint _2165 = uint(_2163);
        uint _2167 = clamp(_2165, 0u, 65535u);
        _2157 = as_type<float>(_2167);
    }
    float _2169 = _2157;
    float _2171 = _2127 * _2129;
    float _2173 = _2137 * _2129;
    float _2175 = _2155 * _1931;
    float _2177 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2179 = fma(_2171, 0.5, 0.5);
    float _2181 = fma(_2173, -0.5, 0.5);
    if (!_1869)
    {
        float _2183 = -_1901;
        float _2185 = _1701 + _2183;
        _2159 = _2185;
    }
    float _2187 = _2159;
    float _2189 = _2057;
    if (_2085)
    {
        float3 _6215 = float3(_2019, _2057, float(as_type<int>(_2149)));
        float3 _6219 = select(_6215, float3(0.0), isnan(_6215));
        float _2191 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6219.xy, uint(rint(_6219.z)), _2175, level(0.0));
        _2189 = _2191;
    }
    float _2193 = _2189;
    float3 _6229 = float3(_2179, _2181, _2177);
    float _2195 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6229, float3(0.0), isnan(_6229)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6229, float3(0.0), isnan(_6229)), level(0.0)).x;
    float3 _6238 = float3(_2179, _2181, _2177);
    float4 _2197 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6238, float3(0.0), isnan(_6238)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6238, float3(0.0), isnan(_6238)), level(0.0)).xyzw;
    float _2199 = _2197.x;
    float _2201 = _2197.y;
    float _2203 = _2197.z;
    float _2205 = _2197.w;
    float _2207 = _2103;
    if (!_1869)
    {
        float3 _6261 = float3(_2187, _2135, float(as_type<int>(_2169)));
        float3 _6263 = select(_6261, float3(0.0), isnan(_6261));
        float _2209 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6263.xy, uint(rint(_6263.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6263.xy, uint(rint(_6263.z)), level(0.0)).x;
        _2207 = _2209;
    }
    float _2211 = _2207;
    if (_1869)
    {
        _1955 = 1.0;
    }
    float _2213 = _1955;
    float _2215 = _2213;
    float _2217 = _2211;
    if (!_1869)
    {
        int _2219 = _1893 << 4;
        int _2221 = _2219 + 2048;
        uint _2223 = uint(int(uint(_2221) >> uint(2)));
        uint _2225 = uint(int(uint(int(_2223)) >> uint(2)));
        int _2227 = int(_2223) & 3;
        float _2229 = (*spvDescriptorSet0.vp_c15)._m0[int(_2225)][_2227];
        int _2231 = int(_2223) + 1;
        uint _2233 = uint(int(uint(_2231) >> uint(2)));
        int _2235 = _2231 & 3;
        float _2237 = (*spvDescriptorSet0.vp_c15)._m0[int(_2233)][_2235];
        int _2239 = _2221 + 8;
        uint _2241 = uint(int(uint(_2239) >> uint(2)));
        uint _2243 = uint(int(uint(int(_2241)) >> uint(2)));
        int _2245 = int(_2241) & 3;
        float _2247 = (*spvDescriptorSet0.vp_c15)._m0[int(_2243)][_2245];
        int _2249 = int(_2241) + 1;
        uint _2251 = uint(int(uint(_2249) >> uint(2)));
        int _2253 = _2249 & 3;
        float _2255 = (*spvDescriptorSet0.vp_c15)._m0[int(_2251)][_2253];
        float _2257 = _1575 * _2237;
        float _2259 = fma(_1205, _2229, _2257);
        float _2261 = fma(_1207, _2247, _2259);
        float _2263 = _2261 + _2255;
        float _2265 = precise::clamp(_2263, 0.0, 1.0);
        float _2267 = -_2265;
        float _2269 = _2267 + _2211;
        float _2271 = fma(_2269, 500.0, 1.5);
        float _2273 = exp2(_2271);
        float _2275 = 0.0 + _2273;
        float _2277 = precise::clamp(_2275, 0.0, 1.0);
        _2215 = _2277;
    }
    float _2279 = _2215;
    float _2281 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2283 = _1993 + _2281;
    float _2285 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2287 = _1995 + _2285;
    float _2289 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2291 = _1997 + _2289;
    float _2293 = _2283 * _2283;
    float _2295 = fma(_2287, _2287, _2293);
    float _2297 = fma(_2291, _2291, _2295);
    float _2299 = rsqrt(_2297);
    float _2301 = sqrt(_2297);
    float _2303 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2305 = _2287 * _2303;
    float _2307 = _2291 * _2303;
    float _2309 = _2305 * _2305;
    float _2311 = _2307 * _2307;
    float _2313 = _2309 + _2311;
    float _2315 = sqrt(_2313);
    bool _2317 = _2315 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2319 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2321 = _2315 + _2319;
    float _2323 = _2181;
    float _2325 = _2313;
    float _2327 = _2321;
    float _2329 = _2303;
    float _2331 = _2305;
    float _2333 = _2307;
    float _2335 = _2309;
    float _2337 = _2311;
    if (_2317)
    {
        float _2339 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2323 = _2339;
    }
    float _2341 = _2323;
    if (_2317)
    {
        float _2343 = rsqrt(_2313);
        _2325 = _2343;
    }
    float _2345 = _2325;
    if (_2317)
    {
        float _2347 = _2321 * _2341;
        _2327 = _2347;
    }
    float _2349 = _2327;
    if (_2317)
    {
        float _2351 = _2349 * 0.15915493667125701904296875;
        _2217 = _2351;
    }
    float _2353 = _2217;
    float _2355 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2357 = _2135;
    if (_2317)
    {
        float _2359 = _2353 * 6.283185482025146484375;
        float _2361 = sin(_2359);
        _2357 = _2361;
    }
    float _2363 = _2357;
    float _2365 = precise::max(0.0, _2355);
    float _2367 = _2349;
    float _2369 = _2365;
    if (_2317)
    {
        float _2371 = _2353 * 6.283185482025146484375;
        float _2373 = cos(_2371);
        _2367 = _2373;
    }
    float _2375 = _2367;
    float _2377 = -_2303;
    float _2379 = -_2365;
    float _2381 = fma(_2283, _2377, _2379);
    float _2383 = _2381;
    if (_2317)
    {
        float _2385 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2329 = _2385;
    }
    float _2387 = _2329;
    float _2389 = _2387;
    if (_2317)
    {
        float _2391 = fma(_2363, _2387, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2369 = _2391;
    }
    float _2393 = _2369;
    float _2395 = _2393;
    if (_2317)
    {
        float _2397 = _2345 * _2393;
        _2395 = _2397;
    }
    float _2399 = _2395;
    if (_2317)
    {
        float _2401 = _2375 + (-1.0);
        _2389 = _2401;
    }
    float _2403 = _2389;
    float _2405 = _2403;
    if (_2317)
    {
        float _2407 = _2305 * _2399;
        _2331 = _2407;
    }
    float _2409 = _2331;
    if (_2317)
    {
        float _2411 = _2307 * _2399;
        _2333 = _2411;
    }
    float _2413 = _2333;
    if (_2317)
    {
        float _2415 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2405 = _2415;
    }
    float _2417 = _2405;
    if (_2317)
    {
        float _2419 = _2409 * _2409;
        _2335 = _2419;
    }
    float _2421 = _2335;
    if (_2317)
    {
        float _2423 = _2413 * _2413;
        _2337 = _2423;
    }
    float _2425 = _2337;
    if (_2317)
    {
        float _2427 = fma(_2381, _2375, _2417);
        _2383 = _2427;
    }
    float _2429 = _2383;
    float _2431 = fma(_2429, _2429, _2421);
    float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2435 = fma(_2301, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2433);
    float _2437 = precise::clamp(_2435, 0.0, 1.0);
    float _2439 = _2431 + _2425;
    float _2441 = -_2437;
    float _2443 = _2441 + 1.0;
    float _2445 = rsqrt(_2439);
    float _2447 = _2445 * _2409;
    float _2449 = _2445 * _2429;
    float _2451 = _2445 * _2413;
    float _2453 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2455 = abs(_2443);
    float _2457 = log2(_2455);
    float _2459 = -_2453;
    float _2461 = fma(_2449, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2459);
    float _2463 = -_2451;
    float _2465 = fma(_2463, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2461);
    float _2467 = fma(_2465, -0.5, 0.5);
    float _2469 = fma(_2465, 0.5, 0.5);
    float _2471 = fma(_2469, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2473 = _2457 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2475 = sqrt(_2467);
    float _2477 = fma(_2469, _2471, -0.212114393711090087890625);
    float _2479 = _2449 + 1.0;
    float _2481 = fma(_2469, _2477, 1.570728778839111328125);
    float _2483 = exp2(_2473);
    float _2485 = _2475 * 0.636619746685028076171875;
    float _2487 = -_2449;
    float _2489 = fma(_2483, _2479, _2487);
    float _2491 = -_2481;
    float _2493 = fma(_2485, _2491, 1.0);
    float _2495 = fma(_2489, 0.5, 0.5);
    float2 _6700 = float2(_2493, _2495);
    float3 _2499 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6700, float2(0.0), isnan(_6700)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6700, float2(0.0), isnan(_6700)), level(0.0)).xyz;
    float _2501 = _2499.x;
    float _2503 = _2499.y;
    float _2505 = _2499.z;
    float _2507 = _1119 * _1169;
    float _2509 = _1107 * 2.0;
    float _2511 = _1091 * 3.883221149444580078125;
    bool _2513 = _1071 != 0.0;
    bool _2515 = isnan(_1071);
    bool _2517 = _2513 || _2515;
    bool _2519 = isnan(0.0);
    bool _2521 = _2517 || _2519;
    float _2523 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2525 = -_2509;
    float _2527 = fma(_2507, _2525, _2507);
    float _2529 = _2511 * 0.15915493667125701904296875;
    float _2531 = abs(_1565);
    float _2533 = log2(_2531);
    bool _2535 = _1069 == 0.0;
    bool _2537 = !_2521;
    bool _2539 = _2535 && _2537;
    float _2541 = fma(_1107, 3.1415927410125732421875, _2527);
    float _2543 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2523);
    float _2545 = -_1225;
    float _2547 = _2545 + 1.0;
    bool _2549 = _1073 == 0.0;
    bool _2551 = _2549 && _2539;
    float _2553 = _2541 * 0.15915493667125701904296875;
    float _2555 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2543);
    float _2557 = _2529 * 6.283185482025146484375;
    float _2559 = cos(_2557);
    out.m_81.x = _809;
    out.m_81.y = _807;
    float _2561 = _2553 * 6.283185482025146484375;
    float _2563 = sin(_2561);
    float _2565 = _2533 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2567 = -_905;
    float _2569 = _2567 + _1093;
    float _2571 = _2529 * 6.283185482025146484375;
    float _2573 = sin(_2571);
    float _2575 = -_1039;
    float _2577 = fma(_2563, _2559, _2575);
    float _2579 = exp2(_2565);
    float _2581 = fma(_1029, _2577, _1039);
    float _2583 = -_1041;
    float _2585 = fma(_2563, _2573, _2583);
    float _2587 = fma(_1029, _2569, _905);
    float _2589 = _2581;
    float _2591 = _2587;
    if (!_2551)
    {
        float _2593 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2581);
        _2589 = _2593;
    }
    float _2595 = _2589;
    float _2597 = fma(_1029, _2585, _1041);
    float _2599 = _2597;
    if (!_2551)
    {
        float _2601 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2587);
        _2591 = _2601;
    }
    float _2603 = _2591;
    if (!_2551)
    {
        float _2605 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2597);
        _2599 = _2605;
    }
    float _2607 = _2599;
    float _2609 = _1663 * _2603;
    float _2611 = _1667 * _2603;
    float _2613 = _1607 * _2603;
    float _2615 = fma(_2579, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2617 = precise::clamp(_2615, 0.0, 1.0);
    float _2619 = fma(_1609, _2595, _2609);
    float _2621 = fma(_1637, _2595, _2611);
    float _2623 = -_1615;
    float _2625 = fma(_2623, _2595, _2613);
    float _2627 = fma(_2617, -2.0, 3.0);
    float _2629 = fma(_1671, _2607, _2619);
    float _2631 = fma(_1673, _2607, _2621);
    float _2633 = fma(_1639, _2607, _2625);
    float _2635 = _2617 * _2617;
    float _2637 = _2629 * _329;
    float _2639 = _2629 * _309;
    float _2641 = _2629 * _325;
    float _2643 = _2635 * _2627;
    float _2645 = fma(_2631, _295, _2637);
    float _2647 = fma(_2631, _287, _2639);
    float _2649 = fma(_2631, _291, _2641);
    float _2651 = -_2643;
    float _2653 = _2651 + 1.0;
    float _2655 = fma(_2633, _341, _2645);
    float _2657 = _2457 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2659 = fma(_2633, _333, _2647);
    float _2661 = fma(_2633, _337, _2649);
    bool _2663 = _1565 <= 8000.0;
    bool _2665 = isnan(_1565);
    bool _2667 = _2663 || _2665;
    bool _2669 = isnan(8000.0);
    bool _2671 = _2667 || _2669;
    float _2673 = float(_2671);
    float _2675 = fma(_2653, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2643);
    float _2677 = exp2(_2657);
    float _2679 = _2673 * _2675;
    float _2681 = _2675;
    float _2683 = _2679;
    float _2685 = 1.0;
    if (!_2085)
    {
        _2681 = 1.0;
    }
    float _2687 = _2681;
    float _2689 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2555);
    float _2691 = _2687;
    if (_2085)
    {
        bool _2693 = _2193 >= _2175;
        bool _2695 = isnan(_2193);
        bool _2697 = _2693 || _2695;
        bool _2699 = isnan(_2175);
        bool _2701 = _2697 || _2699;
        float _2703 = float(_2701);
        _2691 = _2703;
    }
    float _2705 = _2691;
    float _2707 = _2679 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    float _2709 = _2689 + _2105;
    float _2711 = _2547 * _2707;
    float _2713 = precise::clamp(_2711, 0.0, 1.0);
    float _2715 = _2705 * _2279;
    float _2717 = _2709 * 0.5;
    float _2719 = -_2713;
    float _2721 = fma(_2719, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_85.x = _2659;
    out.m_85.y = _2661;
    out.m_85.z = _2655;
    float _2723 = -_2677;
    float _2725 = _2723 + 1.0;
    bool _2727 = _2301 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2729 = isnan(_2301);
    bool _2731 = _2727 || _2729;
    bool _2733 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2735 = _2731 || _2733;
    float _2737 = -_2715;
    float _2739 = fma(_2737, _2721, 1.0);
    float _2741 = precise::clamp(_2739, 0.0, 1.0);
    out.gl_Position.x = _2127;
    out.gl_Position.y = _2137;
    out.gl_Position.z = _2689;
    out.gl_Position.w = _2105;
    float _2743 = _2725 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_87.z = _2717;
    out.m_87.w = _2105;
    float _2745 = _2743 * _2195;
    float _2747 = -_2743;
    float _2749 = _2747 + 1.0;
    float _2751 = _2741 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2753 = _2205 * _2745;
    float _2755 = _2205 * _2749;
    float _2757 = _2741;
    float _2759 = _2709;
    float _2761 = _2749;
    float _2763 = _2753;
    if (!_2735)
    {
        _2683 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2765 = _2683;
    out.m_89.x = _2751;
    float _2767 = _2765;
    float _2769 = _2765;
    if (!_2735)
    {
        _2757 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2771 = _2757;
    float _2773 = _2771;
    float _2775 = _2771;
    if (!_2735)
    {
        _2759 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2777 = _2759;
    float _2779 = _2777;
    float _2781 = _2777;
    if (!_2735)
    {
        _2685 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2783 = _2685;
    float _2785 = _2783;
    float _2787 = _2783;
    if (!_2735)
    {
        _2761 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2789 = _2761;
    float _2791 = _2505 * _2745;
    float _2793 = fma(_2501, _2753, _2199);
    float _2795 = fma(_2503, _2753, _2201);
    float _2797 = _2789;
    float _2799 = _2789;
    if (!_2735)
    {
        _2763 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2801 = _2763;
    float _2803 = fma(_2205, _2791, _2203);
    out.m_91.x = _2793;
    out.m_91.y = _2795;
    out.m_91.z = _2803;
    out.m_91.w = _2755;
    bool _2805 = !_2735;
    float _2807 = _2801;
    float _2809 = _2801;
    if (!_2805)
    {
        bool _2811 = _2301 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2813 = isnan(_2301);
        bool _2815 = _2811 || _2813;
        bool _2817 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2819 = _2815 || _2817;
        if (!_2819)
        {
            float _2821 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2823 = _2301 + _2821;
            float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2827 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2825;
            float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2831 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2833 = 1.0 / _2827;
            float _2835 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2837 = _2835 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2839 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2841 = _2839 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2843 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2845 = _2843 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2847 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2851 = _2823 * _2833;
            float _2853 = precise::clamp(_2851, 0.0, 1.0);
            float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2857 = _2855 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2859 = fma(_2853, _2831, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2861 = fma(_2853, _2857, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2863 = fma(_2853, _2837, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2865 = fma(_2853, _2841, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2867 = fma(_2853, _2845, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2869 = fma(_2853, _2849, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2775 = _2863;
            _2809 = _2867;
            _2769 = _2859;
            _2787 = _2865;
            _2781 = _2861;
            _2799 = _2869;
            _2871 = true;
        }
        else
        {
            bool _2873 = _2301 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2875 = isnan(_2301);
            bool _2877 = _2873 || _2875;
            bool _2879 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2881 = _2877 || _2879;
            if (!_2881)
            {
                _2767 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2883 = _2767;
            _2769 = _2883;
            if (!_2881)
            {
                _2773 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2885 = _2773;
            _2775 = _2885;
            if (!_2881)
            {
                _2779 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2887 = _2779;
            _2781 = _2887;
            if (!_2881)
            {
                _2785 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2889 = _2785;
            _2787 = _2889;
            if (!_2881)
            {
                _2807 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2891 = _2807;
            _2809 = _2891;
            if (!_2881)
            {
                _2797 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2893 = _2797;
            bool _2895 = !_2881;
            _2799 = _2893;
            if (!_2895)
            {
                bool _2897 = _2301 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2899 = isnan(_2301);
                bool _2901 = _2897 || _2899;
                bool _2903 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2905 = _2901 || _2903;
                if (!_2905)
                {
                    float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2909 = _2301 + _2907;
                    float _2911 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2913 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2911;
                    float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2917 = _2915 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2919 = 1.0 / _2913;
                    float _2921 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2923 = _2921 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2925 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2929 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2931 = _2929 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2933 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2935 = _2933 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2937 = _2909 * _2919;
                    float _2939 = precise::clamp(_2937, 0.0, 1.0);
                    float _2941 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2943 = _2941 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2945 = fma(_2939, _2917, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2947 = fma(_2939, _2943, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2949 = fma(_2939, _2923, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2951 = fma(_2939, _2927, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2953 = fma(_2939, _2931, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2955 = fma(_2939, _2935, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2775 = _2949;
                    _2809 = _2953;
                    _2769 = _2945;
                    _2787 = _2951;
                    _2781 = _2947;
                    _2799 = _2955;
                    _2871 = true;
                }
                else
                {
                    _2775 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2809 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2769 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2787 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2781 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2799 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2871 = false;
    float _2957 = _2775;
    float _2959 = _2809;
    float _2961 = _2769;
    float _2963 = _2787;
    float _2965 = _2781;
    float _2967 = _2799;
    float _2969 = fma(_2661, -0.5, 0.5);
    float _2971 = precise::clamp(_2969, 0.0, 1.0);
    float _2973 = -_2957;
    float _2975 = _2973 + _2959;
    float _2977 = -_2961;
    float _2979 = _2977 + _2963;
    float _2981 = -_2965;
    float _2983 = _2981 + _2967;
    bool _2985 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2987 = fma(_2971, _2975, _2957);
    float _2989 = fma(_2971, _2979, _2961);
    float _2991 = fma(_2971, _2983, _2965);
    float _2993 = _2987 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _2995 = fma(_2989, 0.298911988735198974609375, _2993);
    float _2997 = fma(_2991, 0.114477999508380889892578125, _2995);
    float _2999 = -_2997;
    float _3001 = _2989 + _2999;
    float _3003 = -_2997;
    float _3005 = _2987 + _3003;
    float _3007 = -_2997;
    float _3009 = _2991 + _3007;
    float _3011 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3013 = fma(_3001, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2997);
    float _3015 = fma(_3005, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2997);
    float _3017 = fma(_3009, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2997);
    out.m_61.x = _3011;
    out.m_95.x = _3013;
    out.m_95.y = _3015;
    out.m_95.z = _3017;
    if (!_2985)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3019 = -_1993;
    float _3021 = _3019 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3023 = -_1995;
    float _3025 = _3023 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3027 = -_1997;
    float _3029 = _3027 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3031 = _3021 * _3021;
    float _3033 = fma(_3025, _3025, _3031);
    float _3035 = fma(_3029, _3029, _3033);
    float _3037 = sqrt(_3035);
    float _3039 = rsqrt(_3035);
    float _3041 = -_3037;
    float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3045 = _3043 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3047 = precise::clamp(_3045, 0.0, 1.0);
    float _3049 = _3025 * _3039;
    float _3051 = _3021 * _3039;
    float _3053 = abs(_3047);
    float _3055 = log2(_3053);
    float _3057 = _3029 * _3039;
    float _3059 = _3049 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3061 = _2661 * _3051;
    float _3063 = -_3051;
    float _3065 = -_3059;
    float _3067 = fma(_3063, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3065);
    float _3069 = fma(_2659, _3049, _3061);
    float _3071 = -_3057;
    float _3073 = fma(_3071, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3067);
    float _3075 = fma(_2655, _3057, _3069);
    float _3077 = precise::clamp(_3075, 0.0, 1.0);
    float _3079 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3081 = _3073 + _3079;
    float _3083 = _3055 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3085 = _3081 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3087 = precise::clamp(_3085, 0.0, 1.0);
    float _3089 = exp2(_3083);
    float _3091 = _3089 * _3087;
    float _3093 = _3077 * _3091;
    float _3095 = _3093 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3097 = _3093 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3099 = _3093 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _3095;
    out.m_93.y = _3097;
    out.m_93.z = _3099;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2871 = false;
    bool _1145 = false;
    bool _957 = false;
    bool _365 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_58.w;
    float _117 = trunc(_115);
    int _119 = int(_117);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_61.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3156 = as_type<float>(_135);
        out.gl_Position.z = _3156;
    }
    if (!_123)
    {
        return out;
    }
    float _139 = in.m_63.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = _153;
    if (_149)
    {
        float _157 = float(_119);
        _129 = _157;
    }
    float _159 = _129;
    bool _161 = _153 >= _159;
    bool _163 = !_149;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_61.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3226 = as_type<float>(_173);
        out.gl_Position.z = _3226;
    }
    if (_165)
    {
        return out;
    }
    float _175 = in.m_65.x;
    float _177 = in.m_65.y;
    float _179 = in.m_65.z;
    float _181 = in.m_67.x;
    float _183 = in.m_67.y;
    float _185 = in.m_67.z;
    float _187 = in.m_69.x;
    float _189 = in.m_69.y;
    float _191 = in.m_69.z;
    float _193 = in.m_71.x;
    float _195 = _175 * _175;
    float _197 = _177 * _177;
    float _199 = fma(_181, _181, _195);
    float _201 = fma(_183, _183, _197);
    float _203 = fma(_187, _187, _199);
    float _205 = _179 * _179;
    float _207 = fma(_189, _189, _201);
    float _209 = sqrt(_203);
    float _211 = fma(_185, _185, _205);
    float _213 = fma(_191, _191, _211);
    float _215 = sqrt(_207);
    float _217 = sqrt(_213);
    bool _219 = _209 > 0.0;
    bool _221 = _215 > 0.0;
    float _223 = 0.0;
    float _225 = _215;
    float _227 = _209;
    float _229 = _203;
    float _231 = _211;
    float _233 = _207;
    float _235 = _213;
    float _237 = _183;
    float _239 = _181;
    if (_219)
    {
        float _241 = rsqrt(_203);
        _223 = _241;
    }
    float _243 = _223;
    if (!_219)
    {
        _225 = 0.0;
    }
    float _245 = _225;
    bool _247 = _217 > 0.0;
    float _249 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _251 = 0.0;
    float _253 = _249;
    float _255 = _245;
    if (_221)
    {
        float _257 = rsqrt(_207);
        _251 = _257;
    }
    float _259 = _251;
    if (!_221)
    {
        _227 = 0.0;
        _229 = 0.0;
    }
    float _261 = _227;
    float _263 = _229;
    float _265 = _249 * _193;
    float _267 = _261;
    float _269 = _263;
    if (!_219)
    {
        _231 = 0.0;
        _253 = 0.0;
    }
    float _271 = _231;
    float _273 = _253;
    float _275 = 0.0;
    float _277 = _273;
    float _279 = _271;
    if (_247)
    {
        float _281 = rsqrt(_213);
        _275 = _281;
    }
    float _283 = _275;
    if (_219)
    {
        float _285 = _243 * _181;
        _255 = _285;
    }
    float _287 = _255;
    if (_219)
    {
        float _289 = _243 * _175;
        _277 = _289;
    }
    float _291 = _277;
    if (_219)
    {
        float _293 = _243 * _187;
        _279 = _293;
    }
    float _295 = _279;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    if (!_221)
    {
        _233 = 0.0;
    }
    float _299 = _233;
    float _301 = trunc(_265);
    int _303 = int(_301);
    float _305 = _299;
    if (_221)
    {
        float _307 = _259 * _183;
        _267 = _307;
    }
    float _309 = _267;
    if (!_247)
    {
        _235 = 0.0;
    }
    float _311 = _235;
    float _313 = _311;
    if (!_247)
    {
        _237 = 0.0;
        _239 = 0.0;
    }
    float _315 = _237;
    float _317 = _239;
    float _319 = _317;
    float _321 = _315;
    if (_221)
    {
        float _323 = _259 * _177;
        _269 = _323;
    }
    float _325 = _269;
    if (_221)
    {
        float _327 = _259 * _189;
        _305 = _327;
    }
    float _329 = _305;
    if (_247)
    {
        float _331 = _283 * _185;
        _313 = _331;
    }
    float _333 = _313;
    if (_247)
    {
        float _335 = _283 * _179;
        _319 = _335;
    }
    float _337 = _319;
    if (_247)
    {
        float _339 = _283 * _191;
        _321 = _339;
    }
    float _341 = _321;
    int _343 = _303 << 4;
    int _345 = _343 + 1712;
    bool _347 = !_297;
    float _363;
    if (!_347)
    {
        float _349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _351 = _193 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _353 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[11].y, _153);
        float _355 = _353 * _349;
        float _357 = floor(_355);
        float _359 = -_357;
        float _361 = _355 + _359;
        _363 = _361;
        _365 = true;
    }
    else
    {
        float _367 = float(_119);
        float _369 = 1.0 / _367;
        float _371 = _153 * _369;
        _363 = _371;
    }
    _365 = false;
    float _373 = _363;
    int _375 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _377 = _375;
    int _379 = 0;
    int _381 = _110(_377, _379, (*spvDescriptorSet0.support_buffer));
    float _383 = in.m_71.y;
    float _385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _387 = in.m_73.z;
    float _389 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _193);
    float _391 = _389 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _393 = -_385;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _397 = fma(_395, _383, _385);
    float _399 = _391 * _397;
    float _401 = trunc(_387);
    int _403 = int(_401);
    float _405 = float(_381);
    int _407 = abs(_381);
    bool _409 = _381 == 0;
    float _411 = _399 * _405;
    float _413 = float(uint(_407));
    float _415 = trunc(_411);
    int _417 = int(_415);
    float _419 = 1.0 / _413;
    int _421 = abs(_417);
    uint _424 = uint(int(uint(_417) >> uint(31)));
    float _426 = float(uint(_421));
    int _428 = ~int(_424);
    int _430 = _428 + 1;
    int _432 = as_type<int>(_419) + (-2);
    float _434 = as_type<float>(_432) * _426;
    float _436 = trunc(_434);
    float _438 = precise::max(_436, 0.0);
    uint _440 = uint(_438);
    int _442 = ~int(_440);
    int _444 = _442 + 1;
    int _446 = _444 * _407;
    int _448 = _446 + _421;
    float _450 = float(uint(_448));
    float _452 = as_type<float>(_432) * _450;
    float _454 = trunc(_452);
    float _456 = precise::max(_454, 0.0);
    uint _458 = uint(_456);
    int _460 = int(_440) + int(_458);
    int _462 = ~_460;
    int _464 = _462 + 1;
    int _466 = _464 * _407;
    int _468 = _466 + _421;
    bool _470 = uint(_468) >= uint(_407);
    bool _472 = !_470;
    int _474 = _472 ? 0 : (-1);
    int _476 = ~_460;
    int _478 = _476 + _474;
    int _480 = _478 + 1;
    int _482 = _480 * _407;
    int _484 = _482 + _421;
    int _486 = _484 ^ _430;
    int _488 = ~_430;
    int _490 = _488 + _486;
    int _492 = _490 + 1;
    bool _494 = !_409;
    int _496 = _494 ? _492 : (-1);
    int _498 = _496;
    int _500 = 0;
    int _502 = _111(_498, _500, (*spvDescriptorSet0.support_buffer));
    int _504 = _403;
    int _506 = 0;
    int _508 = _111(_504, _506, (*spvDescriptorSet0.support_buffer));
    float4 _511 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_502, _508)), 0).xyzw;
    float _513 = _511.x;
    float _515 = _511.y;
    float _517 = _511.z;
    float _519 = _511.w;
    float _521 = _193 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _523 = _383 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _535 = _533 != 0;
    float _537 = 1.0 / _527;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _541 = _539 != 0;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _545 = in.m_73.x;
    int _547 = _345 + 8;
    uint _549 = uint(int(uint(_547) >> uint(2)));
    uint _551 = uint(int(uint(int(_549)) >> uint(2)));
    int _553 = int(_549) & 3;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[int(_551)][_553];
    bool _557 = _193 > 0.5;
    bool _559 = _557 && _535;
    float _561 = 1.0 / _531;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _565 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[78].z, _543);
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    uint _571 = uint(int(uint(_345) >> uint(2)));
    uint _573 = uint(int(uint(int(_571)) >> uint(2)));
    int _575 = int(_571) & 3;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[int(_573)][_575];
    int _579 = int(_571) + 1;
    uint _581 = uint(int(uint(_579) >> uint(2)));
    int _583 = _579 & 3;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[int(_581)][_583];
    float _587 = -_563;
    float _589 = fma(_521, 2.0, _587);
    float _591 = 1.0 / _569;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _593;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _603 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _605 = isnan(_373);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = in.m_73.y;
    float _617 = fma(_523, -2.0, _597);
    float _619 = _595 * _537;
    float _621 = _601 * _561;
    float _623 = -_613;
    float _625 = _623 + 1.0;
    bool _627 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _629 = isnan(_373);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _641 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _643 = isnan(_373);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _653;
    bool _657 = _383 > 0.5;
    bool _659 = _657 && _541;
    float _661 = -_637;
    float _663 = _661 + 1.0;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _667 = _373 + _665;
    float _669 = _655 * _591;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _673 = _373 + _671;
    float _675 = _613 * _663;
    bool _677 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _679 = isnan(_373);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = _651 * _625;
    float _691 = -_651;
    float _693 = _691 + 1.0;
    float _695 = fma(_619, _673, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _699 = _373 + _697;
    float _701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _703 = _687 * _693;
    float _705 = -_687;
    float _707 = _705 + 1.0;
    float _709 = fma(_621, _699, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _711 = _695 * _703;
    float _713 = _591;
    float _715 = _615;
    float _717 = _373;
    if (_535)
    {
        _713 = _545;
    }
    float _719 = _713;
    float _721 = fma(_669, _667, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _723 = _639 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _725 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[115].x, _711);
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _729 = _719;
    if (_559)
    {
        float _731 = -_719;
        float _733 = _731 + 1.0;
        _729 = _733;
    }
    float _735 = _729;
    if (_659)
    {
        float _737 = -_615;
        float _739 = _737 + 1.0;
        _715 = _739;
    }
    float _741 = _715;
    float _743 = fma(_709, _689, _725);
    float _745 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[78].w, _727);
    if (!_535)
    {
        _717 = _545;
    }
    float _747 = _717;
    float _749 = _701 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _751 = _747;
    if (_535)
    {
        _751 = _735;
    }
    float _753 = _751;
    float _755 = fma(_721, _675, _743);
    float _757 = fma(_723, _741, -0.5);
    float _759 = _577 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _761 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _745);
    float _763 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _617);
    int _765 = _496 + 1;
    float _767 = _759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _769 = fma(_749, _753, -0.5);
    float _771 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _565);
    float _773 = -_153;
    float _775 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[76].x, _589);
    float _777 = -_763;
    float _779 = fma(_761, _757, _777);
    int _781 = abs(_765);
    float _783 = _585 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _785 = fma(_771, _769, _775);
    float _787 = _555 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _789 = float(uint(_781));
    float _791 = _783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _793 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[118].x, _755);
    float _795 = _787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _797 = uint(int(uint(_765) >> uint(31)));
    float _799 = as_type<float>(_432) * _789;
    float _801 = _793 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _803 = ~int(_797);
    int _805 = _803 + 1;
    float _807 = _779 + 0.5;
    float _809 = _785 + 0.5;
    float _811 = trunc(_799);
    float _813 = precise::max(_811, 0.0);
    uint _815 = uint(_813);
    out.m_75.x = _767;
    out.m_75.y = _791;
    out.m_75.z = _795;
    out.m_75.w = _801;
    int _817 = ~int(_815);
    int _819 = _817 + 1;
    int _821 = _819 * _407;
    int _823 = _821 + _781;
    float _825 = float(uint(_823));
    float _827 = as_type<float>(_432) * _825;
    float _829 = trunc(_827);
    float _831 = precise::max(_829, 0.0);
    uint _833 = uint(_831);
    int _835 = int(_815) + int(_833);
    int _837 = ~_835;
    int _839 = _837 + 1;
    int _841 = _839 * _407;
    int _843 = _841 + _781;
    bool _845 = uint(_843) >= uint(_407);
    bool _847 = !_845;
    int _849 = _847 ? 0 : (-1);
    int _851 = ~_835;
    int _853 = _851 + _849;
    int _855 = _853 + 1;
    int _857 = _855 * _407;
    int _859 = _857 + _781;
    int _861 = _859 ^ _805;
    int _863 = ~_805;
    int _865 = _863 + _861;
    int _867 = _865 + 1;
    bool _869 = !_409;
    int _871 = _869 ? _867 : (-1);
    uint _873 = as_type<uint>(half2(float2(_519, 0.0)));
    uint _875 = extract_bits(_873, 0u, 8u);
    int _877 = int(_875) & 255;
    uint _879 = extract_bits(_873, 8u, 8u);
    int _881 = int(_879) & 255;
    int _883 = _881 << 8;
    int _885 = _877 | _883;
    bool _887 = _885 >= 32768;
    int _889 = _885 + (-1024);
    int _891 = _889;
    if (_887)
    {
        int _893 = ~_885;
        int _895 = _893 + 33792;
        int _897 = _895 + 1;
        _891 = _897;
    }
    int _899 = _891;
    int _901 = _899 + 30719;
    float _903 = float(_901);
    float _905 = fma(_903, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _907 = abs(_905);
    float _909 = -_907;
    float _911 = _909 + 1.0;
    bool _913 = _905 < 0.0;
    float _915 = float(_913);
    float _917 = abs(_905);
    float _919 = fma(_917, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _921 = as_type<int>(_911) + (-218103808);
    float _923 = abs(_905);
    float _925 = fma(_923, _919, -0.212114393711090087890625);
    bool _927 = uint(_921) >= 1920991232u;
    float _929 = abs(_905);
    float _931 = fma(_929, _925, 1.570728778839111328125);
    bool _933 = !_927;
    float _955;
    if (!_933)
    {
        int _935 = as_type<int>(_911);
        int _937 = as_type<int>(_779);
        int _939 = 3968;
        int _941 = as_type<int>(_689);
        int _943;
        int _945;
        int _947;
        int _949;
        int _951;
        int _953;
        _108(_935, _937, _939, _941, _943, _945, _947, _949, _951, _953, out.gl_Position, out.gl_PointSize);
        _955 = as_type<float>(_951);
        _957 = true;
    }
    else
    {
        float _959 = rsqrt(_911);
        float _961 = _911 * _959;
        float _963 = _959 * 0.5;
        float _965 = -_961;
        float _967 = 0.0 + _965;
        float _969 = fma(_963, _967, 0.5);
        float _971 = fma(_961, _969, _961);
        float _973 = -_971;
        float _975 = 0.0 + _973;
        float _977 = fma(_971, _975, _911);
        float _979 = fma(_963, _977, _971);
        _955 = _979;
    }
    _957 = false;
    float _981 = _955;
    int _983 = _871;
    int _985 = 0;
    int _987 = _111(_983, _985, (*spvDescriptorSet0.support_buffer));
    int _989 = _403;
    int _991 = 0;
    int _993 = _111(_989, _991, (*spvDescriptorSet0.support_buffer));
    float4 _995 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_987, _993)), 0).xyzw;
    float _997 = _995.x;
    float _999 = _995.y;
    float _1001 = _995.z;
    float _1003 = _995.w;
    float _1005 = _931 * _981;
    float _1007 = _915 * 2.0;
    float _1009 = floor(_411);
    float _1011 = _903 * 3.883221149444580078125;
    float _1013 = -_1007;
    float _1015 = fma(_1005, _1013, _1005);
    float _1017 = _1011 * 0.15915493667125701904296875;
    float _1019 = fma(_915, 3.1415927410125732421875, _1015);
    float _1021 = _1017 * 6.283185482025146484375;
    float _1023 = cos(_1021);
    float _1025 = _1019 * 0.15915493667125701904296875;
    float _1027 = -_1009;
    float _1029 = _411 + _1027;
    float _1031 = _1025 * 6.283185482025146484375;
    float _1033 = sin(_1031);
    float _1035 = _1017 * 6.283185482025146484375;
    float _1037 = sin(_1035);
    float _1039 = _1033 * _1023;
    float _1041 = _1033 * _1037;
    uint _1043 = as_type<uint>(half2(float2(_1003, 0.0)));
    float _1045 = -_513;
    float _1047 = _1045 + _997;
    float _1049 = -_515;
    float _1051 = _1049 + _999;
    float _1053 = -_517;
    float _1055 = _1053 + _1001;
    uint _1057 = extract_bits(_1043, 0u, 8u);
    int _1059 = int(_1057) & 255;
    uint _1061 = extract_bits(_1043, 8u, 8u);
    int _1063 = int(_1061) & 255;
    int _1065 = _1063 << 8;
    int _1067 = _1059 | _1065;
    float _1069 = fma(_1029, _1047, _513);
    float _1071 = fma(_1029, _1051, _515);
    float _1073 = fma(_1029, _1055, _517);
    bool _1075 = _1067 >= 32768;
    int _1077 = _1067 + (-1024);
    int _1079 = _1077;
    if (_1075)
    {
        int _1081 = ~_1067;
        int _1083 = _1081 + 33792;
        int _1085 = _1083 + 1;
        _1079 = _1085;
    }
    int _1087 = _1079;
    int _1089 = _1087 + 30719;
    float _1091 = float(_1089);
    float _1093 = fma(_1091, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1095 = abs(_1093);
    float _1097 = -_1095;
    float _1099 = _1097 + 1.0;
    float _1101 = abs(_1093);
    float _1103 = fma(_1101, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1105 = _1093 < 0.0;
    float _1107 = float(_1105);
    int _1109 = as_type<int>(_1099) + (-218103808);
    float _1111 = abs(_1093);
    float _1113 = fma(_1111, _1103, -0.212114393711090087890625);
    bool _1115 = uint(_1109) >= 1920991232u;
    float _1117 = abs(_1093);
    float _1119 = fma(_1117, _1113, 1.570728778839111328125);
    bool _1121 = !_1115;
    float _1143;
    if (!_1121)
    {
        int _1123 = as_type<int>(_1099);
        int _1125 = as_type<int>(_1099);
        int _1127 = 4864;
        int _1129 = as_type<int>(_1005);
        int _1131;
        int _1133;
        int _1135;
        int _1137;
        int _1139;
        int _1141;
        _108(_1123, _1125, _1127, _1129, _1131, _1133, _1135, _1137, _1139, _1141, out.gl_Position, out.gl_PointSize);
        _1143 = as_type<float>(_1139);
        _1145 = true;
    }
    else
    {
        float _1147 = rsqrt(_1099);
        float _1149 = _1099 * _1147;
        float _1151 = _1147 * 0.5;
        float _1153 = -_1149;
        float _1155 = 0.0 + _1153;
        float _1157 = fma(_1151, _1155, 0.5);
        float _1159 = fma(_1149, _1157, _1149);
        float _1161 = -_1159;
        float _1163 = 0.0 + _1161;
        float _1165 = fma(_1159, _1163, _1099);
        float _1167 = fma(_1151, _1165, _1159);
        _1143 = _1167;
    }
    _1145 = false;
    float _1169 = _1143;
    float _1171 = in.m_58.x;
    float _1173 = in.m_58.y;
    float _1175 = in.m_58.z;
    float _1177 = in.m_67.x;
    float _1179 = in.m_67.y;
    float _1181 = in.m_67.z;
    float _1183 = in.m_67.w;
    float _1185 = in.m_69.x;
    float _1187 = in.m_69.y;
    float _1189 = in.m_69.z;
    float _1191 = in.m_69.w;
    float _1193 = _1173 * _1179;
    float _1195 = _1173 * _1187;
    float _1197 = fma(_1171, _1177, _1193);
    float _1199 = fma(_1171, _1185, _1195);
    float _1201 = fma(_1175, _1181, _1197);
    float _1203 = fma(_1175, _1189, _1199);
    float _1205 = _1201 + _1183;
    float _1207 = _1203 + _1191;
    float _1209 = fma(_1205, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1211 = fma(_1207, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1213 = floor(_1209);
    float _1215 = floor(_1211);
    float _1217 = -_1213;
    float _1219 = _1209 + _1217;
    float _1221 = -_1215;
    float _1223 = _1211 + _1221;
    float2 _4682 = float2(_1219, _1223);
    float _1225 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4682, float2(0.0), isnan(_4682)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4682, float2(0.0), isnan(_4682)), level(0.0)).x;
    float _1227 = in.m_71.x;
    float _1229 = in.m_71.y;
    float _1231 = in.m_71.z;
    float _1233 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1235 = log2(_1233);
    float _1237 = in.m_65.x;
    float _1239 = in.m_65.y;
    float _1241 = in.m_65.z;
    float _1243 = in.m_65.w;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1247 = 1.0 + _1245;
    float _1249 = 1.0 / _1247;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1253 = _1251 != 0;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1257 = _1255 != 0;
    int _1259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1261 = _1259 != 0;
    bool _1263 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1265 = isnan(1.0);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1271 = _1267 || _1269;
    float _1273 = _1235 * _153;
    bool _1275 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1277 = isnan(0.0);
    bool _1279 = _1275 || _1277;
    bool _1281 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1283 = _1279 || _1281;
    float _1285 = exp2(_1273);
    float _1287 = _1231 * 2.0;
    float _1289 = _1173 * _1239;
    float _1291 = _1227 * 2.0;
    float _1293 = floor(_1287);
    float _1295 = _1231 + _1229;
    float _1297 = fma(_1171, _1237, _1289);
    float _1299 = _1229 * 2.0;
    float _1301 = _1295 + (-1.0);
    float _1303 = fma(_1175, _1241, _1297);
    float _1305 = -_1285;
    float _1307 = _1305 + 1.0;
    float _1309 = floor(_1291);
    float _1311 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1313 = _1229 + _1227;
    float _1315 = _1303 + _1243;
    float _1317 = _1283 ? _1307 : 0.0;
    float _1319 = _1313 + (-1.0);
    bool _1321 = !_1261;
    int _1323 = _1321 ? 0 : 1;
    float _1325 = floor(_1299);
    bool _1327 = _1293 > 0.0;
    int _1329 = 2;
    float _1331 = _1315;
    if (_1271)
    {
        float _1333 = _1317 * _1249;
        _155 = _1333;
    }
    float _1335 = _155;
    float _1337 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1339 = _1293 >= 0.0;
    bool _1341 = isnan(_1293);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan(0.0);
    bool _1347 = _1343 || _1345;
    float _1349 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1351 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1353 = _1309 > 0.0;
    float _1355 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1349);
    bool _1357 = _1309 >= 0.0;
    bool _1359 = isnan(_1309);
    bool _1361 = _1357 || _1359;
    bool _1363 = isnan(0.0);
    bool _1365 = _1361 || _1363;
    int _1367 = _1347 ? 0 : 1;
    float _1369 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1355);
    int _1371 = _1365 ? 0 : 1;
    int _1373 = ~_1367;
    int _1375 = _1373 + 1;
    int _1377 = _1375 + 1;
    float _1379 = _1369 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1381 = _1325 > 0.0;
    bool _1383 = _1325 >= 0.0;
    bool _1385 = isnan(_1325);
    bool _1387 = _1383 || _1385;
    bool _1389 = isnan(0.0);
    bool _1391 = _1387 || _1389;
    float _1393 = 1.0 / _1379;
    int _1395 = _1377;
    if (!_1327)
    {
        int _1397 = ~_1367;
        int _1399 = _1397 + 1;
        _1395 = _1399;
    }
    int _1401 = _1395;
    bool _1403 = !_1257;
    int _1405 = _1403 ? 0 : 1;
    float _1407 = in.m_77.x;
    float _1409 = in.m_77.y;
    float _1411 = in.m_77.z;
    int _1413 = ~_1371;
    int _1415 = _1413 + 1;
    int _1417 = _1415 + 1;
    int _1419 = _1417;
    if (!_1353)
    {
        int _1421 = ~_1371;
        int _1423 = _1421 + 1;
        _1419 = _1423;
    }
    int _1425 = _1419;
    bool _1427 = !_1253;
    int _1429 = _1427 ? 0 : 1;
    int _1431 = abs(_1405);
    float _1433 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1351);
    int _1435 = abs(_1429);
    float _1437 = float(_1401);
    float _1439 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1433);
    float _1441 = float(_1435);
    int _1443 = _1391 ? 0 : 1;
    float _1445 = _1439 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1447 = float(_1431);
    float _1449 = _1441 * _1437;
    float _1451 = float(_1425);
    float _1453 = _1445 + _1379;
    int _1455 = abs(_1323);
    float _1457 = _1449 * (-2.0);
    float _1459 = _1227 + (-0.5);
    float _1461 = _1447 * _1451;
    int _1463 = ~_1443;
    int _1465 = _1463 + 1;
    int _1467 = _1465 + 1;
    float _1469 = fma(_1457, _1407, _1407);
    int _1471 = _1467;
    if (!_1381)
    {
        int _1473 = ~_1443;
        int _1475 = _1473 + 1;
        _1471 = _1475;
    }
    int _1477 = _1471;
    float _1479 = _1461 * (-2.0);
    float _1481 = fma(_1337, _1457, _1337);
    float _1483 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1469);
    float _1485 = float(_1455);
    float _1487 = fma(_1311, _1479, _1311);
    float _1489 = fma(_1479, _1409, _1409);
    float _1491 = float(_1477);
    float _1493 = in.m_79.x;
    float _1495 = in.m_79.y;
    float _1497 = in.m_79.z;
    float _1499 = _1453 * _1393;
    float _1501 = _1499 * 0.5;
    float _1503 = _1231 + _1227;
    float _1505 = _1485 * _1491;
    float _1507 = _1229 + (-0.5);
    float _1509 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1511 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1509);
    float _1513 = _1503 + (-1.0);
    float _1515 = _1505 * (-2.0);
    float _1517 = fma(_1507, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1489);
    float _1519 = _1231 + (-0.5);
    float _1521 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1523 = fma(_1515, _1411, _1411);
    float _1525 = fma(_1481, _1335, _1483);
    float _1527 = fma(_1487, _1335, _1517);
    float _1529 = 1.0 / _1511;
    float _1531 = fma(_1521, _1515, _1521);
    float _1533 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1523);
    float _1535 = _1527 * 0.15915493667125701904296875;
    float _1537 = _1525 * 0.15915493667125701904296875;
    float _1539 = fma(_1531, _1335, _1533);
    float _1541 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1543 = _1495 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1545 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1071);
    float _1547 = _1539 * 0.15915493667125701904296875;
    float _1549 = _1537 * 6.283185482025146484375;
    float _1551 = sin(_1549);
    float _1553 = _1543 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1555 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1069);
    float _1559 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1561 = _1553 * _1545;
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1565 = _1529 * _1563;
    float _1567 = _1555 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1569 = _1535 * 6.283185482025146484375;
    float _1571 = cos(_1569);
    float _1573 = _1559 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1575 = _1315 + _1541;
    bool _1577 = _1565 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1579 = _1567 * _1557;
    bool _1581 = _1565 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1583 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1073);
    float _1585 = _1575 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1587 = _1547 * 6.283185482025146484375;
    float _1589 = sin(_1587);
    float _1591 = _1573 * _1583;
    float _1593 = fma(_1205, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1585);
    float _1595 = _1547 * 6.283185482025146484375;
    float _1597 = cos(_1595);
    if (!_1577)
    {
        _1329 = 1;
    }
    int _1599 = _1329;
    float _1601 = _1537 * 6.283185482025146484375;
    float _1603 = cos(_1601);
    float _1605 = _1551 * _1589;
    float _1607 = _1551 * _1571;
    float _1609 = _1571 * _1589;
    float _1611 = _1607 * _1561;
    float _1613 = _1535 * 6.283185482025146484375;
    float _1615 = sin(_1613);
    float _1617 = _1551 * _1597;
    bool _1619 = !_1577;
    int _1621 = _1619 ? 0 : 1;
    float _1623 = _1575 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _1625 = _1599;
    if (!_1581)
    {
        _1625 = _1621;
    }
    int _1627 = _1625;
    float _1629 = fma(_1207, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1593);
    float _1631 = _1603 * _1589;
    float _1633 = _1603 * _1597;
    int _1635 = _1627 << 6;
    float _1637 = _1571 * _1597;
    float _1639 = _1603 * _1571;
    float _1641 = fma(_1205, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1623);
    float _1643 = _1629 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1645 = _1635 + 72;
    uint _1647 = uint(int(uint(_1645) >> uint(2)));
    uint _1649 = uint(int(uint(int(_1647)) >> uint(2)));
    int _1651 = int(_1647) & 3;
    float _1653 = (*spvDescriptorSet0.vp_c15)._m0[int(_1649)][_1651];
    int _1655 = int(_1647) + 1;
    uint _1657 = uint(int(uint(_1655) >> uint(2)));
    int _1659 = _1655 & 3;
    float _1661 = (*spvDescriptorSet0.vp_c15)._m0[int(_1657)][_1659];
    float _1663 = fma(_1615, _1605, _1633);
    float _1665 = -_1631;
    float _1667 = fma(_1615, _1617, _1665);
    float _1669 = -_1617;
    float _1671 = fma(_1615, _1631, _1669);
    float _1673 = fma(_1615, _1633, _1605);
    float _1675 = _1663 * _1561;
    float _1677 = fma(_1207, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1641);
    float _1679 = _1667 * _1561;
    int _1681 = _1635 + 96;
    uint _1683 = uint(int(uint(_1681) >> uint(2)));
    uint _1685 = uint(int(uint(int(_1683)) >> uint(2)));
    int _1687 = int(_1683) & 3;
    float _1689 = (*spvDescriptorSet0.vp_c15)._m0[int(_1685)][_1687];
    int _1691 = int(_1683) + 1;
    uint _1693 = uint(int(uint(_1691) >> uint(2)));
    int _1695 = _1691 & 3;
    float _1697 = (*spvDescriptorSet0.vp_c15)._m0[int(_1693)][_1695];
    float _1699 = fma(_1609, _1579, _1675);
    float _1701 = _1677 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1703 = trunc(_1643);
    int _1705 = int(_1703);
    float _1707 = -_1615;
    float _1709 = fma(_1707, _1579, _1611);
    float _1711 = fma(_1637, _1579, _1679);
    float _1713 = fma(_1671, _1591, _1699);
    int _1715 = _1635 + 48;
    uint _1717 = uint(int(uint(_1715) >> uint(2)));
    uint _1719 = uint(int(uint(int(_1717)) >> uint(2)));
    int _1721 = int(_1717) & 3;
    float _1723 = (*spvDescriptorSet0.vp_c15)._m0[int(_1719)][_1721];
    int _1725 = int(_1717) + 1;
    uint _1727 = uint(int(uint(_1725) >> uint(2)));
    int _1729 = _1725 & 3;
    float _1731 = (*spvDescriptorSet0.vp_c15)._m0[int(_1727)][_1729];
    float _1733 = fma(_1639, _1591, _1709);
    float _1735 = fma(_1673, _1591, _1711);
    float _1737 = trunc(_1701);
    int _1739 = int(_1737);
    float _1741 = _1713 * _329;
    float _1743 = _1713 * _309;
    float _1745 = _1713 * _325;
    int _1747 = _1635 + 104;
    uint _1749 = uint(int(uint(_1747) >> uint(2)));
    uint _1751 = uint(int(uint(int(_1749)) >> uint(2)));
    int _1753 = int(_1749) & 3;
    float _1755 = (*spvDescriptorSet0.vp_c15)._m0[int(_1751)][_1753];
    int _1757 = int(_1749) + 1;
    uint _1759 = uint(int(uint(_1757) >> uint(2)));
    int _1761 = _1757 & 3;
    float _1763 = (*spvDescriptorSet0.vp_c15)._m0[int(_1759)][_1761];
    float _1765 = fma(_1735, _295, _1741);
    float _1767 = fma(_1735, _287, _1743);
    int _1769 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1771 = _1705 + _1769;
    int _1773 = _1771 + 1;
    float _1775 = fma(_1735, _291, _1745);
    float _1777 = fma(_1733, _341, _1765);
    float _1779 = fma(_1733, _333, _1767);
    int _1781 = _1635 + 64;
    uint _1783 = uint(int(uint(_1781) >> uint(2)));
    uint _1785 = uint(int(uint(int(_1783)) >> uint(2)));
    int _1787 = int(_1783) & 3;
    float _1789 = (*spvDescriptorSet0.vp_c15)._m0[int(_1785)][_1787];
    int _1791 = int(_1783) + 1;
    uint _1793 = uint(int(uint(_1791) >> uint(2)));
    int _1795 = _1791 & 3;
    float _1797 = (*spvDescriptorSet0.vp_c15)._m0[int(_1793)][_1795];
    float _1799 = _1207 + _1777;
    float _1801 = _1205 + _1779;
    int _1803 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1805 = _1739 + _1803;
    int _1807 = _1805 + 1;
    float _1809 = fma(_1733, _337, _1775);
    float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1813 = _1799 + _1811;
    float _1815 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1817 = _1801 + _1815;
    bool _1819 = _1807 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1821 = _1635 + 56;
    uint _1823 = uint(int(uint(_1821) >> uint(2)));
    uint _1825 = uint(int(uint(int(_1823)) >> uint(2)));
    int _1827 = int(_1823) & 3;
    float _1829 = (*spvDescriptorSet0.vp_c15)._m0[int(_1825)][_1827];
    int _1831 = int(_1823) + 1;
    uint _1833 = uint(int(uint(_1831) >> uint(2)));
    int _1835 = _1831 & 3;
    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[int(_1833)][_1835];
    int _1839 = _1807 | _1773;
    float _1841 = _1315 + _1809;
    bool _1843 = _1839 < 0;
    bool _1845 = _1843 || _1819;
    float _1847 = _1813 * _1813;
    int _1849 = _1635 + 80;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    uint _1853 = uint(int(uint(int(_1851)) >> uint(2)));
    int _1855 = int(_1851) & 3;
    float _1857 = (*spvDescriptorSet0.vp_c15)._m0[int(_1853)][_1855];
    int _1859 = int(_1851) + 1;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    int _1863 = _1859 & 3;
    float _1865 = (*spvDescriptorSet0.vp_c15)._m0[int(_1861)][_1863];
    bool _1867 = _1773 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1869 = _1867 || _1845;
    float _1871 = fma(_1817, _1817, _1847);
    float _1873 = sqrt(_1871);
    float _1875 = _1575 * _1697;
    float _1877 = fma(_1205, _1689, _1875);
    int _1879 = as_type<int>(_1689);
    int _1881 = as_type<int>(_1877);
    float _1883 = _1841;
    float _1885 = _1799;
    float _1887 = _1809;
    if (!_1869)
    {
        int _1889 = _1773 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1891 = _1889 + _1807;
        _1879 = _1891;
    }
    int _1893 = _1879;
    float _1895 = _1575 * _1731;
    float _1897 = as_type<float>(_1807);
    if (!_1869)
    {
        float _1899 = floor(_1701);
        _1897 = _1899;
    }
    float _1901 = _1897;
    float _1903 = fma(_1205, _1723, _1895);
    bool _1905 = _1873 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1907 = fma(_1207, _1755, _1877);
    int _1909 = as_type<int>(_1907);
    if (!_1869)
    {
        int _1911 = _1893 << 2;
        _1881 = _1911;
    }
    int _1913 = _1881;
    float _1915 = _1907 + _1763;
    int _1917 = _1913;
    if (!_1869)
    {
        uint _1919 = uint(int(uint(_1893) >> uint(2)));
        _1909 = int(_1919);
    }
    int _1921 = _1909;
    float _1923 = as_type<float>(_1921);
    if (!_1869)
    {
        int _1925 = 12 & _1913;
        _1917 = _1925;
    }
    int _1927 = _1917;
    float _1929 = _1575 * _1797;
    float _1931 = 1.0 / _1915;
    if (!_1869)
    {
        int _1933 = _1921 << 4;
        int _1935 = _1933 + _1927;
        _1923 = as_type<float>(_1935);
    }
    float _1937 = _1923;
    float _1939 = fma(_1205, _1789, _1929);
    if (!_1905)
    {
        _1331 = _1801;
    }
    float _1941 = _1331;
    float _1943 = fma(_1207, _1829, _1903);
    float _1945 = fma(_1207, _1653, _1939);
    float _1947 = _1943 + _1837;
    float _1949 = _1945 + _1661;
    bool _1951 = !_1905;
    float _1953 = _1941;
    float _1955 = _1901;
    if (!_1951)
    {
        float _1957 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1961 = _1873 + _1959;
        float _1963 = _1841 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1965 = rsqrt(_1871);
        float _1967 = _1961 * _1957;
        float _1969 = _1967 * 0.15915493667125701904296875;
        float _1971 = _1969 * 6.283185482025146484375;
        float _1973 = cos(_1971);
        float _1975 = _1969 * 6.283185482025146484375;
        float _1977 = sin(_1975);
        float _1979 = _1973 + (-1.0);
        float _1981 = _1979 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1983 = fma(_1977, _1963, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1985 = fma(_1841, _1973, _1981);
        float _1987 = _1965 * _1983;
        float _1989 = fma(_1817, _1987, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1991 = fma(_1813, _1987, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1883 = _1985;
        _1953 = _1989;
        _1885 = _1991;
    }
    float _1993 = _1883;
    float _1995 = _1953;
    float _1997 = _1885;
    float _1999 = _1937;
    if (!_1869)
    {
        int _2001 = as_type<int>(_1937) + 400;
        uint _2003 = uint(int(uint(_2001) >> uint(2)));
        uint _2005 = uint(int(uint(int(_2003)) >> uint(2)));
        int _2007 = int(_2003) & 3;
        float _2009 = (*spvDescriptorSet0.vp_c15)._m0[int(_2005)][_2007];
        _1999 = _2009;
    }
    float _2011 = _1999;
    float _2013 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2015 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2017 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2019 = _1947 * _1931;
    float _2021 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2013);
    float _2023 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2015);
    float _2025 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2017);
    int _2027 = _1635 + 88;
    uint _2029 = uint(int(uint(_2027) >> uint(2)));
    uint _2031 = uint(int(uint(int(_2029)) >> uint(2)));
    int _2033 = int(_2029) & 3;
    float _2035 = (*spvDescriptorSet0.vp_c15)._m0[int(_2031)][_2033];
    int _2037 = int(_2029) + 1;
    uint _2039 = uint(int(uint(_2037) >> uint(2)));
    int _2041 = _2037 & 3;
    float _2043 = (*spvDescriptorSet0.vp_c15)._m0[int(_2039)][_2041];
    float _2045 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2021);
    bool _2047 = _2019 >= 0.0;
    float _2049 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2023);
    float _2051 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2053 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2025);
    float _2055 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2057 = _1949 * _1931;
    bool _2059 = _2019 <= 1.0;
    bool _2061 = _2059 && _2047;
    float _2063 = _2049 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2065 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2051);
    float _2067 = _2053 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2069 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2071 = _2057 >= 0.0;
    bool _2073 = _2071 && _2061;
    float _2075 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2077 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2079 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2065);
    float _2081 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2069);
    bool _2083 = _2057 <= 1.0;
    bool _2085 = _2083 && _2073;
    float _2087 = -_2077;
    float _2089 = fma(_2087, _2075, 1.0);
    float _2091 = _2079 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2093 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2081);
    float _2095 = _1653;
    if (!_1869)
    {
        float _2097 = floor(_1643);
        _2095 = _2097;
    }
    float _2099 = _2095;
    float _2101 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2103 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2105 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2093);
    float _2107 = _1575 * _1865;
    float _2109 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2101);
    float _2111 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2103);
    float _2113 = log2(_2089);
    float _2115 = _2109;
    if (_2085)
    {
        float _2117 = float(_1627);
        _1887 = _2117;
    }
    float _2119 = _1887;
    float _2121 = fma(_1205, _1857, _2107);
    float _2123 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2109);
    float _2125 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2111);
    float _2127 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2123);
    float _2129 = 1.0 / _2105;
    if (!_1869)
    {
        float _2131 = -_2099;
        float _2133 = _1643 + _2131;
        _2115 = _2133;
    }
    float _2135 = _2115;
    float _2137 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2125);
    float _2139 = _2107;
    if (_2085)
    {
        float _2141 = rint(_2119);
        float _2143 = precise::max(_2141, 0.0);
        uint _2145 = uint(_2143);
        uint _2147 = clamp(_2145, 0u, 65535u);
        _2139 = as_type<float>(_2147);
    }
    float _2149 = _2139;
    float _2151 = _2113 * 0.693147182464599609375;
    float _2153 = fma(_1207, _2035, _2121);
    float _2155 = _2153 + _2043;
    float _2157 = _2011;
    float _2159 = _2151;
    if (!_1869)
    {
        float _2161 = rint(_2011);
        float _2163 = precise::max(_2161, 0.0);
        uint _2165 = uint(_2163);
        uint _2167 = clamp(_2165, 0u, 65535u);
        _2157 = as_type<float>(_2167);
    }
    float _2169 = _2157;
    float _2171 = _2127 * _2129;
    float _2173 = _2137 * _2129;
    float _2175 = _2155 * _1931;
    float _2177 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2179 = fma(_2171, 0.5, 0.5);
    float _2181 = fma(_2173, -0.5, 0.5);
    if (!_1869)
    {
        float _2183 = -_1901;
        float _2185 = _1701 + _2183;
        _2159 = _2185;
    }
    float _2187 = _2159;
    float _2189 = _2057;
    if (_2085)
    {
        float3 _6215 = float3(_2019, _2057, float(as_type<int>(_2149)));
        float3 _6219 = select(_6215, float3(0.0), isnan(_6215));
        float _2191 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6219.xy, uint(rint(_6219.z)), _2175, level(0.0));
        _2189 = _2191;
    }
    float _2193 = _2189;
    float3 _6229 = float3(_2179, _2181, _2177);
    float _2195 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6229, float3(0.0), isnan(_6229)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6229, float3(0.0), isnan(_6229)), level(0.0)).x;
    float3 _6238 = float3(_2179, _2181, _2177);
    float4 _2197 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6238, float3(0.0), isnan(_6238)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6238, float3(0.0), isnan(_6238)), level(0.0)).xyzw;
    float _2199 = _2197.x;
    float _2201 = _2197.y;
    float _2203 = _2197.z;
    float _2205 = _2197.w;
    float _2207 = _2103;
    if (!_1869)
    {
        float3 _6261 = float3(_2187, _2135, float(as_type<int>(_2169)));
        float3 _6263 = select(_6261, float3(0.0), isnan(_6261));
        float _2209 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6263.xy, uint(rint(_6263.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6263.xy, uint(rint(_6263.z)), level(0.0)).x;
        _2207 = _2209;
    }
    float _2211 = _2207;
    if (_1869)
    {
        _1955 = 1.0;
    }
    float _2213 = _1955;
    float _2215 = _2213;
    float _2217 = _2211;
    if (!_1869)
    {
        int _2219 = _1893 << 4;
        int _2221 = _2219 + 2048;
        uint _2223 = uint(int(uint(_2221) >> uint(2)));
        uint _2225 = uint(int(uint(int(_2223)) >> uint(2)));
        int _2227 = int(_2223) & 3;
        float _2229 = (*spvDescriptorSet0.vp_c15)._m0[int(_2225)][_2227];
        int _2231 = int(_2223) + 1;
        uint _2233 = uint(int(uint(_2231) >> uint(2)));
        int _2235 = _2231 & 3;
        float _2237 = (*spvDescriptorSet0.vp_c15)._m0[int(_2233)][_2235];
        int _2239 = _2221 + 8;
        uint _2241 = uint(int(uint(_2239) >> uint(2)));
        uint _2243 = uint(int(uint(int(_2241)) >> uint(2)));
        int _2245 = int(_2241) & 3;
        float _2247 = (*spvDescriptorSet0.vp_c15)._m0[int(_2243)][_2245];
        int _2249 = int(_2241) + 1;
        uint _2251 = uint(int(uint(_2249) >> uint(2)));
        int _2253 = _2249 & 3;
        float _2255 = (*spvDescriptorSet0.vp_c15)._m0[int(_2251)][_2253];
        float _2257 = _1575 * _2237;
        float _2259 = fma(_1205, _2229, _2257);
        float _2261 = fma(_1207, _2247, _2259);
        float _2263 = _2261 + _2255;
        float _2265 = precise::clamp(_2263, 0.0, 1.0);
        float _2267 = -_2265;
        float _2269 = _2267 + _2211;
        float _2271 = fma(_2269, 500.0, 1.5);
        float _2273 = exp2(_2271);
        float _2275 = 0.0 + _2273;
        float _2277 = precise::clamp(_2275, 0.0, 1.0);
        _2215 = _2277;
    }
    float _2279 = _2215;
    float _2281 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2283 = _1993 + _2281;
    float _2285 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2287 = _1995 + _2285;
    float _2289 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2291 = _1997 + _2289;
    float _2293 = _2283 * _2283;
    float _2295 = fma(_2287, _2287, _2293);
    float _2297 = fma(_2291, _2291, _2295);
    float _2299 = rsqrt(_2297);
    float _2301 = sqrt(_2297);
    float _2303 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2305 = _2287 * _2303;
    float _2307 = _2291 * _2303;
    float _2309 = _2305 * _2305;
    float _2311 = _2307 * _2307;
    float _2313 = _2309 + _2311;
    float _2315 = sqrt(_2313);
    bool _2317 = _2315 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2319 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2321 = _2315 + _2319;
    float _2323 = _2181;
    float _2325 = _2313;
    float _2327 = _2321;
    float _2329 = _2303;
    float _2331 = _2305;
    float _2333 = _2307;
    float _2335 = _2309;
    float _2337 = _2311;
    if (_2317)
    {
        float _2339 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2323 = _2339;
    }
    float _2341 = _2323;
    if (_2317)
    {
        float _2343 = rsqrt(_2313);
        _2325 = _2343;
    }
    float _2345 = _2325;
    if (_2317)
    {
        float _2347 = _2321 * _2341;
        _2327 = _2347;
    }
    float _2349 = _2327;
    if (_2317)
    {
        float _2351 = _2349 * 0.15915493667125701904296875;
        _2217 = _2351;
    }
    float _2353 = _2217;
    float _2355 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2357 = _2135;
    if (_2317)
    {
        float _2359 = _2353 * 6.283185482025146484375;
        float _2361 = sin(_2359);
        _2357 = _2361;
    }
    float _2363 = _2357;
    float _2365 = precise::max(0.0, _2355);
    float _2367 = _2349;
    float _2369 = _2365;
    if (_2317)
    {
        float _2371 = _2353 * 6.283185482025146484375;
        float _2373 = cos(_2371);
        _2367 = _2373;
    }
    float _2375 = _2367;
    float _2377 = -_2303;
    float _2379 = -_2365;
    float _2381 = fma(_2283, _2377, _2379);
    float _2383 = _2381;
    if (_2317)
    {
        float _2385 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2329 = _2385;
    }
    float _2387 = _2329;
    float _2389 = _2387;
    if (_2317)
    {
        float _2391 = fma(_2363, _2387, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2369 = _2391;
    }
    float _2393 = _2369;
    float _2395 = _2393;
    if (_2317)
    {
        float _2397 = _2345 * _2393;
        _2395 = _2397;
    }
    float _2399 = _2395;
    if (_2317)
    {
        float _2401 = _2375 + (-1.0);
        _2389 = _2401;
    }
    float _2403 = _2389;
    float _2405 = _2403;
    if (_2317)
    {
        float _2407 = _2305 * _2399;
        _2331 = _2407;
    }
    float _2409 = _2331;
    if (_2317)
    {
        float _2411 = _2307 * _2399;
        _2333 = _2411;
    }
    float _2413 = _2333;
    if (_2317)
    {
        float _2415 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2405 = _2415;
    }
    float _2417 = _2405;
    if (_2317)
    {
        float _2419 = _2409 * _2409;
        _2335 = _2419;
    }
    float _2421 = _2335;
    if (_2317)
    {
        float _2423 = _2413 * _2413;
        _2337 = _2423;
    }
    float _2425 = _2337;
    if (_2317)
    {
        float _2427 = fma(_2381, _2375, _2417);
        _2383 = _2427;
    }
    float _2429 = _2383;
    float _2431 = fma(_2429, _2429, _2421);
    float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2435 = fma(_2301, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2433);
    float _2437 = precise::clamp(_2435, 0.0, 1.0);
    float _2439 = _2431 + _2425;
    float _2441 = -_2437;
    float _2443 = _2441 + 1.0;
    float _2445 = rsqrt(_2439);
    float _2447 = _2445 * _2409;
    float _2449 = _2445 * _2429;
    float _2451 = _2445 * _2413;
    float _2453 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2455 = abs(_2443);
    float _2457 = log2(_2455);
    float _2459 = -_2453;
    float _2461 = fma(_2449, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2459);
    float _2463 = -_2451;
    float _2465 = fma(_2463, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2461);
    float _2467 = fma(_2465, -0.5, 0.5);
    float _2469 = fma(_2465, 0.5, 0.5);
    float _2471 = fma(_2469, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2473 = _2457 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2475 = sqrt(_2467);
    float _2477 = fma(_2469, _2471, -0.212114393711090087890625);
    float _2479 = _2449 + 1.0;
    float _2481 = fma(_2469, _2477, 1.570728778839111328125);
    float _2483 = exp2(_2473);
    float _2485 = _2475 * 0.636619746685028076171875;
    float _2487 = -_2449;
    float _2489 = fma(_2483, _2479, _2487);
    float _2491 = -_2481;
    float _2493 = fma(_2485, _2491, 1.0);
    float _2495 = fma(_2489, 0.5, 0.5);
    float2 _6700 = float2(_2493, _2495);
    float3 _2499 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6700, float2(0.0), isnan(_6700)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6700, float2(0.0), isnan(_6700)), level(0.0)).xyz;
    float _2501 = _2499.x;
    float _2503 = _2499.y;
    float _2505 = _2499.z;
    float _2507 = _1119 * _1169;
    float _2509 = _1107 * 2.0;
    float _2511 = _1091 * 3.883221149444580078125;
    bool _2513 = _1071 != 0.0;
    bool _2515 = isnan(_1071);
    bool _2517 = _2513 || _2515;
    bool _2519 = isnan(0.0);
    bool _2521 = _2517 || _2519;
    float _2523 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2525 = -_2509;
    float _2527 = fma(_2507, _2525, _2507);
    float _2529 = _2511 * 0.15915493667125701904296875;
    float _2531 = abs(_1565);
    float _2533 = log2(_2531);
    bool _2535 = _1069 == 0.0;
    bool _2537 = !_2521;
    bool _2539 = _2535 && _2537;
    float _2541 = fma(_1107, 3.1415927410125732421875, _2527);
    float _2543 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2523);
    float _2545 = -_1225;
    float _2547 = _2545 + 1.0;
    bool _2549 = _1073 == 0.0;
    bool _2551 = _2549 && _2539;
    float _2553 = _2541 * 0.15915493667125701904296875;
    float _2555 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2543);
    float _2557 = _2529 * 6.283185482025146484375;
    float _2559 = cos(_2557);
    out.m_81.x = _809;
    out.m_81.y = _807;
    float _2561 = _2553 * 6.283185482025146484375;
    float _2563 = sin(_2561);
    float _2565 = _2533 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2567 = -_905;
    float _2569 = _2567 + _1093;
    float _2571 = _2529 * 6.283185482025146484375;
    float _2573 = sin(_2571);
    float _2575 = -_1039;
    float _2577 = fma(_2563, _2559, _2575);
    float _2579 = exp2(_2565);
    float _2581 = fma(_1029, _2577, _1039);
    float _2583 = -_1041;
    float _2585 = fma(_2563, _2573, _2583);
    float _2587 = fma(_1029, _2569, _905);
    float _2589 = _2581;
    float _2591 = _2587;
    if (!_2551)
    {
        float _2593 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2581);
        _2589 = _2593;
    }
    float _2595 = _2589;
    float _2597 = fma(_1029, _2585, _1041);
    float _2599 = _2597;
    if (!_2551)
    {
        float _2601 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2587);
        _2591 = _2601;
    }
    float _2603 = _2591;
    if (!_2551)
    {
        float _2605 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2597);
        _2599 = _2605;
    }
    float _2607 = _2599;
    float _2609 = _1663 * _2603;
    float _2611 = _1667 * _2603;
    float _2613 = _1607 * _2603;
    float _2615 = fma(_2579, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2617 = precise::clamp(_2615, 0.0, 1.0);
    float _2619 = fma(_1609, _2595, _2609);
    float _2621 = fma(_1637, _2595, _2611);
    float _2623 = -_1615;
    float _2625 = fma(_2623, _2595, _2613);
    float _2627 = fma(_2617, -2.0, 3.0);
    float _2629 = fma(_1671, _2607, _2619);
    float _2631 = fma(_1673, _2607, _2621);
    float _2633 = fma(_1639, _2607, _2625);
    float _2635 = _2617 * _2617;
    float _2637 = _2629 * _329;
    float _2639 = _2629 * _309;
    float _2641 = _2629 * _325;
    float _2643 = _2635 * _2627;
    float _2645 = fma(_2631, _295, _2637);
    float _2647 = fma(_2631, _287, _2639);
    float _2649 = fma(_2631, _291, _2641);
    float _2651 = -_2643;
    float _2653 = _2651 + 1.0;
    float _2655 = fma(_2633, _341, _2645);
    float _2657 = _2457 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2659 = fma(_2633, _333, _2647);
    float _2661 = fma(_2633, _337, _2649);
    bool _2663 = _1565 <= 8000.0;
    bool _2665 = isnan(_1565);
    bool _2667 = _2663 || _2665;
    bool _2669 = isnan(8000.0);
    bool _2671 = _2667 || _2669;
    float _2673 = float(_2671);
    float _2675 = fma(_2653, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2643);
    float _2677 = exp2(_2657);
    float _2679 = _2673 * _2675;
    float _2681 = _2675;
    float _2683 = _2679;
    float _2685 = 1.0;
    if (!_2085)
    {
        _2681 = 1.0;
    }
    float _2687 = _2681;
    float _2689 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2555);
    float _2691 = _2687;
    if (_2085)
    {
        bool _2693 = _2193 >= _2175;
        bool _2695 = isnan(_2193);
        bool _2697 = _2693 || _2695;
        bool _2699 = isnan(_2175);
        bool _2701 = _2697 || _2699;
        float _2703 = float(_2701);
        _2691 = _2703;
    }
    float _2705 = _2691;
    float _2707 = _2679 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    float _2709 = _2689 + _2105;
    float _2711 = _2547 * _2707;
    float _2713 = precise::clamp(_2711, 0.0, 1.0);
    float _2715 = _2705 * _2279;
    float _2717 = _2709 * 0.5;
    float _2719 = -_2713;
    float _2721 = fma(_2719, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_85.x = _2659;
    out.m_85.y = _2661;
    out.m_85.z = _2655;
    float _2723 = -_2677;
    float _2725 = _2723 + 1.0;
    bool _2727 = _2301 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2729 = isnan(_2301);
    bool _2731 = _2727 || _2729;
    bool _2733 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2735 = _2731 || _2733;
    float _2737 = -_2715;
    float _2739 = fma(_2737, _2721, 1.0);
    float _2741 = precise::clamp(_2739, 0.0, 1.0);
    out.gl_Position.x = _2127;
    out.gl_Position.y = _2137;
    out.gl_Position.z = _2689;
    out.gl_Position.w = _2105;
    float _2743 = _2725 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_87.z = _2717;
    out.m_87.w = _2105;
    float _2745 = _2743 * _2195;
    float _2747 = -_2743;
    float _2749 = _2747 + 1.0;
    float _2751 = _2741 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2753 = _2205 * _2745;
    float _2755 = _2205 * _2749;
    float _2757 = _2741;
    float _2759 = _2709;
    float _2761 = _2749;
    float _2763 = _2753;
    if (!_2735)
    {
        _2683 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2765 = _2683;
    out.m_89.x = _2751;
    float _2767 = _2765;
    float _2769 = _2765;
    if (!_2735)
    {
        _2757 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2771 = _2757;
    float _2773 = _2771;
    float _2775 = _2771;
    if (!_2735)
    {
        _2759 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2777 = _2759;
    float _2779 = _2777;
    float _2781 = _2777;
    if (!_2735)
    {
        _2685 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2783 = _2685;
    float _2785 = _2783;
    float _2787 = _2783;
    if (!_2735)
    {
        _2761 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2789 = _2761;
    float _2791 = _2505 * _2745;
    float _2793 = fma(_2501, _2753, _2199);
    float _2795 = fma(_2503, _2753, _2201);
    float _2797 = _2789;
    float _2799 = _2789;
    if (!_2735)
    {
        _2763 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2801 = _2763;
    float _2803 = fma(_2205, _2791, _2203);
    out.m_91.x = _2793;
    out.m_91.y = _2795;
    out.m_91.z = _2803;
    out.m_91.w = _2755;
    bool _2805 = !_2735;
    float _2807 = _2801;
    float _2809 = _2801;
    if (!_2805)
    {
        bool _2811 = _2301 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2813 = isnan(_2301);
        bool _2815 = _2811 || _2813;
        bool _2817 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2819 = _2815 || _2817;
        if (!_2819)
        {
            float _2821 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2823 = _2301 + _2821;
            float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2827 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2825;
            float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2831 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2833 = 1.0 / _2827;
            float _2835 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2837 = _2835 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2839 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2841 = _2839 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2843 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2845 = _2843 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2847 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2851 = _2823 * _2833;
            float _2853 = precise::clamp(_2851, 0.0, 1.0);
            float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2857 = _2855 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2859 = fma(_2853, _2831, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2861 = fma(_2853, _2857, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2863 = fma(_2853, _2837, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2865 = fma(_2853, _2841, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2867 = fma(_2853, _2845, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2869 = fma(_2853, _2849, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2775 = _2863;
            _2809 = _2867;
            _2769 = _2859;
            _2787 = _2865;
            _2781 = _2861;
            _2799 = _2869;
            _2871 = true;
        }
        else
        {
            bool _2873 = _2301 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2875 = isnan(_2301);
            bool _2877 = _2873 || _2875;
            bool _2879 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2881 = _2877 || _2879;
            if (!_2881)
            {
                _2767 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2883 = _2767;
            _2769 = _2883;
            if (!_2881)
            {
                _2773 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2885 = _2773;
            _2775 = _2885;
            if (!_2881)
            {
                _2779 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2887 = _2779;
            _2781 = _2887;
            if (!_2881)
            {
                _2785 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2889 = _2785;
            _2787 = _2889;
            if (!_2881)
            {
                _2807 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2891 = _2807;
            _2809 = _2891;
            if (!_2881)
            {
                _2797 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2893 = _2797;
            bool _2895 = !_2881;
            _2799 = _2893;
            if (!_2895)
            {
                bool _2897 = _2301 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2899 = isnan(_2301);
                bool _2901 = _2897 || _2899;
                bool _2903 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2905 = _2901 || _2903;
                if (!_2905)
                {
                    float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2909 = _2301 + _2907;
                    float _2911 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2913 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2911;
                    float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2917 = _2915 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2919 = 1.0 / _2913;
                    float _2921 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2923 = _2921 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2925 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2929 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2931 = _2929 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2933 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2935 = _2933 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2937 = _2909 * _2919;
                    float _2939 = precise::clamp(_2937, 0.0, 1.0);
                    float _2941 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2943 = _2941 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2945 = fma(_2939, _2917, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2947 = fma(_2939, _2943, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2949 = fma(_2939, _2923, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2951 = fma(_2939, _2927, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2953 = fma(_2939, _2931, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2955 = fma(_2939, _2935, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2775 = _2949;
                    _2809 = _2953;
                    _2769 = _2945;
                    _2787 = _2951;
                    _2781 = _2947;
                    _2799 = _2955;
                    _2871 = true;
                }
                else
                {
                    _2775 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2809 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2769 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2787 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2781 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2799 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2871 = false;
    float _2957 = _2775;
    float _2959 = _2809;
    float _2961 = _2769;
    float _2963 = _2787;
    float _2965 = _2781;
    float _2967 = _2799;
    float _2969 = fma(_2661, -0.5, 0.5);
    float _2971 = precise::clamp(_2969, 0.0, 1.0);
    float _2973 = -_2957;
    float _2975 = _2973 + _2959;
    float _2977 = -_2961;
    float _2979 = _2977 + _2963;
    float _2981 = -_2965;
    float _2983 = _2981 + _2967;
    bool _2985 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2987 = fma(_2971, _2975, _2957);
    float _2989 = fma(_2971, _2979, _2961);
    float _2991 = fma(_2971, _2983, _2965);
    float _2993 = _2987 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _2995 = fma(_2989, 0.298911988735198974609375, _2993);
    float _2997 = fma(_2991, 0.114477999508380889892578125, _2995);
    float _2999 = -_2997;
    float _3001 = _2989 + _2999;
    float _3003 = -_2997;
    float _3005 = _2987 + _3003;
    float _3007 = -_2997;
    float _3009 = _2991 + _3007;
    float _3011 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3013 = fma(_3001, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2997);
    float _3015 = fma(_3005, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2997);
    float _3017 = fma(_3009, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2997);
    out.m_61.x = _3011;
    out.m_95.x = _3013;
    out.m_95.y = _3015;
    out.m_95.z = _3017;
    if (!_2985)
    {
        return out;
    }
    float _3019 = -_1993;
    float _3021 = _3019 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3023 = -_1995;
    float _3025 = _3023 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3027 = -_1997;
    float _3029 = _3027 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3031 = _3021 * _3021;
    float _3033 = fma(_3025, _3025, _3031);
    float _3035 = fma(_3029, _3029, _3033);
    float _3037 = sqrt(_3035);
    float _3039 = rsqrt(_3035);
    float _3041 = -_3037;
    float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3045 = _3043 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3047 = precise::clamp(_3045, 0.0, 1.0);
    float _3049 = _3025 * _3039;
    float _3051 = _3021 * _3039;
    float _3053 = abs(_3047);
    float _3055 = log2(_3053);
    float _3057 = _3029 * _3039;
    float _3059 = _3049 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3061 = _2661 * _3051;
    float _3063 = -_3051;
    float _3065 = -_3059;
    float _3067 = fma(_3063, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3065);
    float _3069 = fma(_2659, _3049, _3061);
    float _3071 = -_3057;
    float _3073 = fma(_3071, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3067);
    float _3075 = fma(_2655, _3057, _3069);
    float _3077 = precise::clamp(_3075, 0.0, 1.0);
    float _3079 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3081 = _3073 + _3079;
    float _3083 = _3055 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3085 = _3081 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3087 = precise::clamp(_3085, 0.0, 1.0);
    float _3089 = exp2(_3083);
    float _3091 = _3089 * _3087;
    float _3093 = _3077 * _3091;
    float _3095 = _3093 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3097 = _3093 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3099 = _3093 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _3095;
    out.m_93.y = _3097;
    out.m_93.z = _3099;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2871 = false;
    bool _1145 = false;
    bool _957 = false;
    bool _365 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_58.w;
    float _117 = trunc(_115);
    int _119 = int(_117);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_61.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3156 = as_type<float>(_135);
        out.gl_Position.z = _3156;
    }
    if (!_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_63.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = _153;
    if (_149)
    {
        float _157 = float(_119);
        _129 = _157;
    }
    float _159 = _129;
    bool _161 = _153 >= _159;
    bool _163 = !_149;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_61.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3226 = as_type<float>(_173);
        out.gl_Position.z = _3226;
    }
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _175 = in.m_65.x;
    float _177 = in.m_65.y;
    float _179 = in.m_65.z;
    float _181 = in.m_67.x;
    float _183 = in.m_67.y;
    float _185 = in.m_67.z;
    float _187 = in.m_69.x;
    float _189 = in.m_69.y;
    float _191 = in.m_69.z;
    float _193 = in.m_71.x;
    float _195 = _175 * _175;
    float _197 = _177 * _177;
    float _199 = fma(_181, _181, _195);
    float _201 = fma(_183, _183, _197);
    float _203 = fma(_187, _187, _199);
    float _205 = _179 * _179;
    float _207 = fma(_189, _189, _201);
    float _209 = sqrt(_203);
    float _211 = fma(_185, _185, _205);
    float _213 = fma(_191, _191, _211);
    float _215 = sqrt(_207);
    float _217 = sqrt(_213);
    bool _219 = _209 > 0.0;
    bool _221 = _215 > 0.0;
    float _223 = 0.0;
    float _225 = _215;
    float _227 = _209;
    float _229 = _203;
    float _231 = _211;
    float _233 = _207;
    float _235 = _213;
    float _237 = _183;
    float _239 = _181;
    if (_219)
    {
        float _241 = rsqrt(_203);
        _223 = _241;
    }
    float _243 = _223;
    if (!_219)
    {
        _225 = 0.0;
    }
    float _245 = _225;
    bool _247 = _217 > 0.0;
    float _249 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _251 = 0.0;
    float _253 = _249;
    float _255 = _245;
    if (_221)
    {
        float _257 = rsqrt(_207);
        _251 = _257;
    }
    float _259 = _251;
    if (!_221)
    {
        _227 = 0.0;
        _229 = 0.0;
    }
    float _261 = _227;
    float _263 = _229;
    float _265 = _249 * _193;
    float _267 = _261;
    float _269 = _263;
    if (!_219)
    {
        _231 = 0.0;
        _253 = 0.0;
    }
    float _271 = _231;
    float _273 = _253;
    float _275 = 0.0;
    float _277 = _273;
    float _279 = _271;
    if (_247)
    {
        float _281 = rsqrt(_213);
        _275 = _281;
    }
    float _283 = _275;
    if (_219)
    {
        float _285 = _243 * _181;
        _255 = _285;
    }
    float _287 = _255;
    if (_219)
    {
        float _289 = _243 * _175;
        _277 = _289;
    }
    float _291 = _277;
    if (_219)
    {
        float _293 = _243 * _187;
        _279 = _293;
    }
    float _295 = _279;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    if (!_221)
    {
        _233 = 0.0;
    }
    float _299 = _233;
    float _301 = trunc(_265);
    int _303 = int(_301);
    float _305 = _299;
    if (_221)
    {
        float _307 = _259 * _183;
        _267 = _307;
    }
    float _309 = _267;
    if (!_247)
    {
        _235 = 0.0;
    }
    float _311 = _235;
    float _313 = _311;
    if (!_247)
    {
        _237 = 0.0;
        _239 = 0.0;
    }
    float _315 = _237;
    float _317 = _239;
    float _319 = _317;
    float _321 = _315;
    if (_221)
    {
        float _323 = _259 * _177;
        _269 = _323;
    }
    float _325 = _269;
    if (_221)
    {
        float _327 = _259 * _189;
        _305 = _327;
    }
    float _329 = _305;
    if (_247)
    {
        float _331 = _283 * _185;
        _313 = _331;
    }
    float _333 = _313;
    if (_247)
    {
        float _335 = _283 * _179;
        _319 = _335;
    }
    float _337 = _319;
    if (_247)
    {
        float _339 = _283 * _191;
        _321 = _339;
    }
    float _341 = _321;
    int _343 = _303 << 4;
    int _345 = _343 + 1712;
    bool _347 = !_297;
    float _363;
    if (!_347)
    {
        float _349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _351 = _193 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _353 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[11].y, _153);
        float _355 = _353 * _349;
        float _357 = floor(_355);
        float _359 = -_357;
        float _361 = _355 + _359;
        _363 = _361;
        _365 = true;
    }
    else
    {
        float _367 = float(_119);
        float _369 = 1.0 / _367;
        float _371 = _153 * _369;
        _363 = _371;
    }
    _365 = false;
    float _373 = _363;
    int _375 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _377 = _375;
    int _379 = 0;
    int _381 = _110(_377, _379, (*spvDescriptorSet0.support_buffer));
    float _383 = in.m_71.y;
    float _385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _387 = in.m_73.z;
    float _389 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _193);
    float _391 = _389 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _393 = -_385;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _397 = fma(_395, _383, _385);
    float _399 = _391 * _397;
    float _401 = trunc(_387);
    int _403 = int(_401);
    float _405 = float(_381);
    int _407 = abs(_381);
    bool _409 = _381 == 0;
    float _411 = _399 * _405;
    float _413 = float(uint(_407));
    float _415 = trunc(_411);
    int _417 = int(_415);
    float _419 = 1.0 / _413;
    int _421 = abs(_417);
    uint _424 = uint(int(uint(_417) >> uint(31)));
    float _426 = float(uint(_421));
    int _428 = ~int(_424);
    int _430 = _428 + 1;
    int _432 = as_type<int>(_419) + (-2);
    float _434 = as_type<float>(_432) * _426;
    float _436 = trunc(_434);
    float _438 = precise::max(_436, 0.0);
    uint _440 = uint(_438);
    int _442 = ~int(_440);
    int _444 = _442 + 1;
    int _446 = _444 * _407;
    int _448 = _446 + _421;
    float _450 = float(uint(_448));
    float _452 = as_type<float>(_432) * _450;
    float _454 = trunc(_452);
    float _456 = precise::max(_454, 0.0);
    uint _458 = uint(_456);
    int _460 = int(_440) + int(_458);
    int _462 = ~_460;
    int _464 = _462 + 1;
    int _466 = _464 * _407;
    int _468 = _466 + _421;
    bool _470 = uint(_468) >= uint(_407);
    bool _472 = !_470;
    int _474 = _472 ? 0 : (-1);
    int _476 = ~_460;
    int _478 = _476 + _474;
    int _480 = _478 + 1;
    int _482 = _480 * _407;
    int _484 = _482 + _421;
    int _486 = _484 ^ _430;
    int _488 = ~_430;
    int _490 = _488 + _486;
    int _492 = _490 + 1;
    bool _494 = !_409;
    int _496 = _494 ? _492 : (-1);
    int _498 = _496;
    int _500 = 0;
    int _502 = _111(_498, _500, (*spvDescriptorSet0.support_buffer));
    int _504 = _403;
    int _506 = 0;
    int _508 = _111(_504, _506, (*spvDescriptorSet0.support_buffer));
    float4 _511 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_502, _508)), 0).xyzw;
    float _513 = _511.x;
    float _515 = _511.y;
    float _517 = _511.z;
    float _519 = _511.w;
    float _521 = _193 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _523 = _383 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _535 = _533 != 0;
    float _537 = 1.0 / _527;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _541 = _539 != 0;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _545 = in.m_73.x;
    int _547 = _345 + 8;
    uint _549 = uint(int(uint(_547) >> uint(2)));
    uint _551 = uint(int(uint(int(_549)) >> uint(2)));
    int _553 = int(_549) & 3;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[int(_551)][_553];
    bool _557 = _193 > 0.5;
    bool _559 = _557 && _535;
    float _561 = 1.0 / _531;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _565 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[78].z, _543);
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    uint _571 = uint(int(uint(_345) >> uint(2)));
    uint _573 = uint(int(uint(int(_571)) >> uint(2)));
    int _575 = int(_571) & 3;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[int(_573)][_575];
    int _579 = int(_571) + 1;
    uint _581 = uint(int(uint(_579) >> uint(2)));
    int _583 = _579 & 3;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[int(_581)][_583];
    float _587 = -_563;
    float _589 = fma(_521, 2.0, _587);
    float _591 = 1.0 / _569;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _593;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _603 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _605 = isnan(_373);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = in.m_73.y;
    float _617 = fma(_523, -2.0, _597);
    float _619 = _595 * _537;
    float _621 = _601 * _561;
    float _623 = -_613;
    float _625 = _623 + 1.0;
    bool _627 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _629 = isnan(_373);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _641 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _643 = isnan(_373);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _653;
    bool _657 = _383 > 0.5;
    bool _659 = _657 && _541;
    float _661 = -_637;
    float _663 = _661 + 1.0;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _667 = _373 + _665;
    float _669 = _655 * _591;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _673 = _373 + _671;
    float _675 = _613 * _663;
    bool _677 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _679 = isnan(_373);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = _651 * _625;
    float _691 = -_651;
    float _693 = _691 + 1.0;
    float _695 = fma(_619, _673, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _699 = _373 + _697;
    float _701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _703 = _687 * _693;
    float _705 = -_687;
    float _707 = _705 + 1.0;
    float _709 = fma(_621, _699, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _711 = _695 * _703;
    float _713 = _591;
    float _715 = _615;
    float _717 = _373;
    if (_535)
    {
        _713 = _545;
    }
    float _719 = _713;
    float _721 = fma(_669, _667, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _723 = _639 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _725 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[115].x, _711);
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _729 = _719;
    if (_559)
    {
        float _731 = -_719;
        float _733 = _731 + 1.0;
        _729 = _733;
    }
    float _735 = _729;
    if (_659)
    {
        float _737 = -_615;
        float _739 = _737 + 1.0;
        _715 = _739;
    }
    float _741 = _715;
    float _743 = fma(_709, _689, _725);
    float _745 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[78].w, _727);
    if (!_535)
    {
        _717 = _545;
    }
    float _747 = _717;
    float _749 = _701 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _751 = _747;
    if (_535)
    {
        _751 = _735;
    }
    float _753 = _751;
    float _755 = fma(_721, _675, _743);
    float _757 = fma(_723, _741, -0.5);
    float _759 = _577 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _761 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _745);
    float _763 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _617);
    int _765 = _496 + 1;
    float _767 = _759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _769 = fma(_749, _753, -0.5);
    float _771 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _565);
    float _773 = -_153;
    float _775 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[76].x, _589);
    float _777 = -_763;
    float _779 = fma(_761, _757, _777);
    int _781 = abs(_765);
    float _783 = _585 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _785 = fma(_771, _769, _775);
    float _787 = _555 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _789 = float(uint(_781));
    float _791 = _783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _793 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[118].x, _755);
    float _795 = _787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _797 = uint(int(uint(_765) >> uint(31)));
    float _799 = as_type<float>(_432) * _789;
    float _801 = _793 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _803 = ~int(_797);
    int _805 = _803 + 1;
    float _807 = _779 + 0.5;
    float _809 = _785 + 0.5;
    float _811 = trunc(_799);
    float _813 = precise::max(_811, 0.0);
    uint _815 = uint(_813);
    out.m_75.x = _767;
    out.m_75.y = _791;
    out.m_75.z = _795;
    out.m_75.w = _801;
    int _817 = ~int(_815);
    int _819 = _817 + 1;
    int _821 = _819 * _407;
    int _823 = _821 + _781;
    float _825 = float(uint(_823));
    float _827 = as_type<float>(_432) * _825;
    float _829 = trunc(_827);
    float _831 = precise::max(_829, 0.0);
    uint _833 = uint(_831);
    int _835 = int(_815) + int(_833);
    int _837 = ~_835;
    int _839 = _837 + 1;
    int _841 = _839 * _407;
    int _843 = _841 + _781;
    bool _845 = uint(_843) >= uint(_407);
    bool _847 = !_845;
    int _849 = _847 ? 0 : (-1);
    int _851 = ~_835;
    int _853 = _851 + _849;
    int _855 = _853 + 1;
    int _857 = _855 * _407;
    int _859 = _857 + _781;
    int _861 = _859 ^ _805;
    int _863 = ~_805;
    int _865 = _863 + _861;
    int _867 = _865 + 1;
    bool _869 = !_409;
    int _871 = _869 ? _867 : (-1);
    uint _873 = as_type<uint>(half2(float2(_519, 0.0)));
    uint _875 = extract_bits(_873, 0u, 8u);
    int _877 = int(_875) & 255;
    uint _879 = extract_bits(_873, 8u, 8u);
    int _881 = int(_879) & 255;
    int _883 = _881 << 8;
    int _885 = _877 | _883;
    bool _887 = _885 >= 32768;
    int _889 = _885 + (-1024);
    int _891 = _889;
    if (_887)
    {
        int _893 = ~_885;
        int _895 = _893 + 33792;
        int _897 = _895 + 1;
        _891 = _897;
    }
    int _899 = _891;
    int _901 = _899 + 30719;
    float _903 = float(_901);
    float _905 = fma(_903, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _907 = abs(_905);
    float _909 = -_907;
    float _911 = _909 + 1.0;
    bool _913 = _905 < 0.0;
    float _915 = float(_913);
    float _917 = abs(_905);
    float _919 = fma(_917, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _921 = as_type<int>(_911) + (-218103808);
    float _923 = abs(_905);
    float _925 = fma(_923, _919, -0.212114393711090087890625);
    bool _927 = uint(_921) >= 1920991232u;
    float _929 = abs(_905);
    float _931 = fma(_929, _925, 1.570728778839111328125);
    bool _933 = !_927;
    float _955;
    if (!_933)
    {
        int _935 = as_type<int>(_911);
        int _937 = as_type<int>(_779);
        int _939 = 3968;
        int _941 = as_type<int>(_689);
        int _943;
        int _945;
        int _947;
        int _949;
        int _951;
        int _953;
        _108(_935, _937, _939, _941, _943, _945, _947, _949, _951, _953, out.gl_Position, out.gl_PointSize);
        _955 = as_type<float>(_951);
        _957 = true;
    }
    else
    {
        float _959 = rsqrt(_911);
        float _961 = _911 * _959;
        float _963 = _959 * 0.5;
        float _965 = -_961;
        float _967 = 0.0 + _965;
        float _969 = fma(_963, _967, 0.5);
        float _971 = fma(_961, _969, _961);
        float _973 = -_971;
        float _975 = 0.0 + _973;
        float _977 = fma(_971, _975, _911);
        float _979 = fma(_963, _977, _971);
        _955 = _979;
    }
    _957 = false;
    float _981 = _955;
    int _983 = _871;
    int _985 = 0;
    int _987 = _111(_983, _985, (*spvDescriptorSet0.support_buffer));
    int _989 = _403;
    int _991 = 0;
    int _993 = _111(_989, _991, (*spvDescriptorSet0.support_buffer));
    float4 _995 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_987, _993)), 0).xyzw;
    float _997 = _995.x;
    float _999 = _995.y;
    float _1001 = _995.z;
    float _1003 = _995.w;
    float _1005 = _931 * _981;
    float _1007 = _915 * 2.0;
    float _1009 = floor(_411);
    float _1011 = _903 * 3.883221149444580078125;
    float _1013 = -_1007;
    float _1015 = fma(_1005, _1013, _1005);
    float _1017 = _1011 * 0.15915493667125701904296875;
    float _1019 = fma(_915, 3.1415927410125732421875, _1015);
    float _1021 = _1017 * 6.283185482025146484375;
    float _1023 = cos(_1021);
    float _1025 = _1019 * 0.15915493667125701904296875;
    float _1027 = -_1009;
    float _1029 = _411 + _1027;
    float _1031 = _1025 * 6.283185482025146484375;
    float _1033 = sin(_1031);
    float _1035 = _1017 * 6.283185482025146484375;
    float _1037 = sin(_1035);
    float _1039 = _1033 * _1023;
    float _1041 = _1033 * _1037;
    uint _1043 = as_type<uint>(half2(float2(_1003, 0.0)));
    float _1045 = -_513;
    float _1047 = _1045 + _997;
    float _1049 = -_515;
    float _1051 = _1049 + _999;
    float _1053 = -_517;
    float _1055 = _1053 + _1001;
    uint _1057 = extract_bits(_1043, 0u, 8u);
    int _1059 = int(_1057) & 255;
    uint _1061 = extract_bits(_1043, 8u, 8u);
    int _1063 = int(_1061) & 255;
    int _1065 = _1063 << 8;
    int _1067 = _1059 | _1065;
    float _1069 = fma(_1029, _1047, _513);
    float _1071 = fma(_1029, _1051, _515);
    float _1073 = fma(_1029, _1055, _517);
    bool _1075 = _1067 >= 32768;
    int _1077 = _1067 + (-1024);
    int _1079 = _1077;
    if (_1075)
    {
        int _1081 = ~_1067;
        int _1083 = _1081 + 33792;
        int _1085 = _1083 + 1;
        _1079 = _1085;
    }
    int _1087 = _1079;
    int _1089 = _1087 + 30719;
    float _1091 = float(_1089);
    float _1093 = fma(_1091, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1095 = abs(_1093);
    float _1097 = -_1095;
    float _1099 = _1097 + 1.0;
    float _1101 = abs(_1093);
    float _1103 = fma(_1101, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1105 = _1093 < 0.0;
    float _1107 = float(_1105);
    int _1109 = as_type<int>(_1099) + (-218103808);
    float _1111 = abs(_1093);
    float _1113 = fma(_1111, _1103, -0.212114393711090087890625);
    bool _1115 = uint(_1109) >= 1920991232u;
    float _1117 = abs(_1093);
    float _1119 = fma(_1117, _1113, 1.570728778839111328125);
    bool _1121 = !_1115;
    float _1143;
    if (!_1121)
    {
        int _1123 = as_type<int>(_1099);
        int _1125 = as_type<int>(_1099);
        int _1127 = 4864;
        int _1129 = as_type<int>(_1005);
        int _1131;
        int _1133;
        int _1135;
        int _1137;
        int _1139;
        int _1141;
        _108(_1123, _1125, _1127, _1129, _1131, _1133, _1135, _1137, _1139, _1141, out.gl_Position, out.gl_PointSize);
        _1143 = as_type<float>(_1139);
        _1145 = true;
    }
    else
    {
        float _1147 = rsqrt(_1099);
        float _1149 = _1099 * _1147;
        float _1151 = _1147 * 0.5;
        float _1153 = -_1149;
        float _1155 = 0.0 + _1153;
        float _1157 = fma(_1151, _1155, 0.5);
        float _1159 = fma(_1149, _1157, _1149);
        float _1161 = -_1159;
        float _1163 = 0.0 + _1161;
        float _1165 = fma(_1159, _1163, _1099);
        float _1167 = fma(_1151, _1165, _1159);
        _1143 = _1167;
    }
    _1145 = false;
    float _1169 = _1143;
    float _1171 = in.m_58.x;
    float _1173 = in.m_58.y;
    float _1175 = in.m_58.z;
    float _1177 = in.m_67.x;
    float _1179 = in.m_67.y;
    float _1181 = in.m_67.z;
    float _1183 = in.m_67.w;
    float _1185 = in.m_69.x;
    float _1187 = in.m_69.y;
    float _1189 = in.m_69.z;
    float _1191 = in.m_69.w;
    float _1193 = _1173 * _1179;
    float _1195 = _1173 * _1187;
    float _1197 = fma(_1171, _1177, _1193);
    float _1199 = fma(_1171, _1185, _1195);
    float _1201 = fma(_1175, _1181, _1197);
    float _1203 = fma(_1175, _1189, _1199);
    float _1205 = _1201 + _1183;
    float _1207 = _1203 + _1191;
    float _1209 = fma(_1205, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1211 = fma(_1207, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1213 = floor(_1209);
    float _1215 = floor(_1211);
    float _1217 = -_1213;
    float _1219 = _1209 + _1217;
    float _1221 = -_1215;
    float _1223 = _1211 + _1221;
    float2 _4682 = float2(_1219, _1223);
    float _1225 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4682, float2(0.0), isnan(_4682)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4682, float2(0.0), isnan(_4682)), level(0.0)).x;
    float _1227 = in.m_71.x;
    float _1229 = in.m_71.y;
    float _1231 = in.m_71.z;
    float _1233 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1235 = log2(_1233);
    float _1237 = in.m_65.x;
    float _1239 = in.m_65.y;
    float _1241 = in.m_65.z;
    float _1243 = in.m_65.w;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1247 = 1.0 + _1245;
    float _1249 = 1.0 / _1247;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1253 = _1251 != 0;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1257 = _1255 != 0;
    int _1259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1261 = _1259 != 0;
    bool _1263 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1265 = isnan(1.0);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1271 = _1267 || _1269;
    float _1273 = _1235 * _153;
    bool _1275 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1277 = isnan(0.0);
    bool _1279 = _1275 || _1277;
    bool _1281 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1283 = _1279 || _1281;
    float _1285 = exp2(_1273);
    float _1287 = _1231 * 2.0;
    float _1289 = _1173 * _1239;
    float _1291 = _1227 * 2.0;
    float _1293 = floor(_1287);
    float _1295 = _1231 + _1229;
    float _1297 = fma(_1171, _1237, _1289);
    float _1299 = _1229 * 2.0;
    float _1301 = _1295 + (-1.0);
    float _1303 = fma(_1175, _1241, _1297);
    float _1305 = -_1285;
    float _1307 = _1305 + 1.0;
    float _1309 = floor(_1291);
    float _1311 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1313 = _1229 + _1227;
    float _1315 = _1303 + _1243;
    float _1317 = _1283 ? _1307 : 0.0;
    float _1319 = _1313 + (-1.0);
    bool _1321 = !_1261;
    int _1323 = _1321 ? 0 : 1;
    float _1325 = floor(_1299);
    bool _1327 = _1293 > 0.0;
    int _1329 = 2;
    float _1331 = _1315;
    if (_1271)
    {
        float _1333 = _1317 * _1249;
        _155 = _1333;
    }
    float _1335 = _155;
    float _1337 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1339 = _1293 >= 0.0;
    bool _1341 = isnan(_1293);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan(0.0);
    bool _1347 = _1343 || _1345;
    float _1349 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1351 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1353 = _1309 > 0.0;
    float _1355 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1349);
    bool _1357 = _1309 >= 0.0;
    bool _1359 = isnan(_1309);
    bool _1361 = _1357 || _1359;
    bool _1363 = isnan(0.0);
    bool _1365 = _1361 || _1363;
    int _1367 = _1347 ? 0 : 1;
    float _1369 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1355);
    int _1371 = _1365 ? 0 : 1;
    int _1373 = ~_1367;
    int _1375 = _1373 + 1;
    int _1377 = _1375 + 1;
    float _1379 = _1369 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1381 = _1325 > 0.0;
    bool _1383 = _1325 >= 0.0;
    bool _1385 = isnan(_1325);
    bool _1387 = _1383 || _1385;
    bool _1389 = isnan(0.0);
    bool _1391 = _1387 || _1389;
    float _1393 = 1.0 / _1379;
    int _1395 = _1377;
    if (!_1327)
    {
        int _1397 = ~_1367;
        int _1399 = _1397 + 1;
        _1395 = _1399;
    }
    int _1401 = _1395;
    bool _1403 = !_1257;
    int _1405 = _1403 ? 0 : 1;
    float _1407 = in.m_77.x;
    float _1409 = in.m_77.y;
    float _1411 = in.m_77.z;
    int _1413 = ~_1371;
    int _1415 = _1413 + 1;
    int _1417 = _1415 + 1;
    int _1419 = _1417;
    if (!_1353)
    {
        int _1421 = ~_1371;
        int _1423 = _1421 + 1;
        _1419 = _1423;
    }
    int _1425 = _1419;
    bool _1427 = !_1253;
    int _1429 = _1427 ? 0 : 1;
    int _1431 = abs(_1405);
    float _1433 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1351);
    int _1435 = abs(_1429);
    float _1437 = float(_1401);
    float _1439 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1433);
    float _1441 = float(_1435);
    int _1443 = _1391 ? 0 : 1;
    float _1445 = _1439 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1447 = float(_1431);
    float _1449 = _1441 * _1437;
    float _1451 = float(_1425);
    float _1453 = _1445 + _1379;
    int _1455 = abs(_1323);
    float _1457 = _1449 * (-2.0);
    float _1459 = _1227 + (-0.5);
    float _1461 = _1447 * _1451;
    int _1463 = ~_1443;
    int _1465 = _1463 + 1;
    int _1467 = _1465 + 1;
    float _1469 = fma(_1457, _1407, _1407);
    int _1471 = _1467;
    if (!_1381)
    {
        int _1473 = ~_1443;
        int _1475 = _1473 + 1;
        _1471 = _1475;
    }
    int _1477 = _1471;
    float _1479 = _1461 * (-2.0);
    float _1481 = fma(_1337, _1457, _1337);
    float _1483 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1469);
    float _1485 = float(_1455);
    float _1487 = fma(_1311, _1479, _1311);
    float _1489 = fma(_1479, _1409, _1409);
    float _1491 = float(_1477);
    float _1493 = in.m_79.x;
    float _1495 = in.m_79.y;
    float _1497 = in.m_79.z;
    float _1499 = _1453 * _1393;
    float _1501 = _1499 * 0.5;
    float _1503 = _1231 + _1227;
    float _1505 = _1485 * _1491;
    float _1507 = _1229 + (-0.5);
    float _1509 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1511 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1509);
    float _1513 = _1503 + (-1.0);
    float _1515 = _1505 * (-2.0);
    float _1517 = fma(_1507, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1489);
    float _1519 = _1231 + (-0.5);
    float _1521 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1523 = fma(_1515, _1411, _1411);
    float _1525 = fma(_1481, _1335, _1483);
    float _1527 = fma(_1487, _1335, _1517);
    float _1529 = 1.0 / _1511;
    float _1531 = fma(_1521, _1515, _1521);
    float _1533 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1523);
    float _1535 = _1527 * 0.15915493667125701904296875;
    float _1537 = _1525 * 0.15915493667125701904296875;
    float _1539 = fma(_1531, _1335, _1533);
    float _1541 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1543 = _1495 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1545 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1071);
    float _1547 = _1539 * 0.15915493667125701904296875;
    float _1549 = _1537 * 6.283185482025146484375;
    float _1551 = sin(_1549);
    float _1553 = _1543 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1555 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1069);
    float _1559 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1561 = _1553 * _1545;
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1565 = _1529 * _1563;
    float _1567 = _1555 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1569 = _1535 * 6.283185482025146484375;
    float _1571 = cos(_1569);
    float _1573 = _1559 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1575 = _1315 + _1541;
    bool _1577 = _1565 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1579 = _1567 * _1557;
    bool _1581 = _1565 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1583 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1073);
    float _1585 = _1575 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1587 = _1547 * 6.283185482025146484375;
    float _1589 = sin(_1587);
    float _1591 = _1573 * _1583;
    float _1593 = fma(_1205, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1585);
    float _1595 = _1547 * 6.283185482025146484375;
    float _1597 = cos(_1595);
    if (!_1577)
    {
        _1329 = 1;
    }
    int _1599 = _1329;
    float _1601 = _1537 * 6.283185482025146484375;
    float _1603 = cos(_1601);
    float _1605 = _1551 * _1589;
    float _1607 = _1551 * _1571;
    float _1609 = _1571 * _1589;
    float _1611 = _1607 * _1561;
    float _1613 = _1535 * 6.283185482025146484375;
    float _1615 = sin(_1613);
    float _1617 = _1551 * _1597;
    bool _1619 = !_1577;
    int _1621 = _1619 ? 0 : 1;
    float _1623 = _1575 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _1625 = _1599;
    if (!_1581)
    {
        _1625 = _1621;
    }
    int _1627 = _1625;
    float _1629 = fma(_1207, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1593);
    float _1631 = _1603 * _1589;
    float _1633 = _1603 * _1597;
    int _1635 = _1627 << 6;
    float _1637 = _1571 * _1597;
    float _1639 = _1603 * _1571;
    float _1641 = fma(_1205, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1623);
    float _1643 = _1629 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1645 = _1635 + 72;
    uint _1647 = uint(int(uint(_1645) >> uint(2)));
    uint _1649 = uint(int(uint(int(_1647)) >> uint(2)));
    int _1651 = int(_1647) & 3;
    float _1653 = (*spvDescriptorSet0.vp_c15)._m0[int(_1649)][_1651];
    int _1655 = int(_1647) + 1;
    uint _1657 = uint(int(uint(_1655) >> uint(2)));
    int _1659 = _1655 & 3;
    float _1661 = (*spvDescriptorSet0.vp_c15)._m0[int(_1657)][_1659];
    float _1663 = fma(_1615, _1605, _1633);
    float _1665 = -_1631;
    float _1667 = fma(_1615, _1617, _1665);
    float _1669 = -_1617;
    float _1671 = fma(_1615, _1631, _1669);
    float _1673 = fma(_1615, _1633, _1605);
    float _1675 = _1663 * _1561;
    float _1677 = fma(_1207, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1641);
    float _1679 = _1667 * _1561;
    int _1681 = _1635 + 96;
    uint _1683 = uint(int(uint(_1681) >> uint(2)));
    uint _1685 = uint(int(uint(int(_1683)) >> uint(2)));
    int _1687 = int(_1683) & 3;
    float _1689 = (*spvDescriptorSet0.vp_c15)._m0[int(_1685)][_1687];
    int _1691 = int(_1683) + 1;
    uint _1693 = uint(int(uint(_1691) >> uint(2)));
    int _1695 = _1691 & 3;
    float _1697 = (*spvDescriptorSet0.vp_c15)._m0[int(_1693)][_1695];
    float _1699 = fma(_1609, _1579, _1675);
    float _1701 = _1677 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1703 = trunc(_1643);
    int _1705 = int(_1703);
    float _1707 = -_1615;
    float _1709 = fma(_1707, _1579, _1611);
    float _1711 = fma(_1637, _1579, _1679);
    float _1713 = fma(_1671, _1591, _1699);
    int _1715 = _1635 + 48;
    uint _1717 = uint(int(uint(_1715) >> uint(2)));
    uint _1719 = uint(int(uint(int(_1717)) >> uint(2)));
    int _1721 = int(_1717) & 3;
    float _1723 = (*spvDescriptorSet0.vp_c15)._m0[int(_1719)][_1721];
    int _1725 = int(_1717) + 1;
    uint _1727 = uint(int(uint(_1725) >> uint(2)));
    int _1729 = _1725 & 3;
    float _1731 = (*spvDescriptorSet0.vp_c15)._m0[int(_1727)][_1729];
    float _1733 = fma(_1639, _1591, _1709);
    float _1735 = fma(_1673, _1591, _1711);
    float _1737 = trunc(_1701);
    int _1739 = int(_1737);
    float _1741 = _1713 * _329;
    float _1743 = _1713 * _309;
    float _1745 = _1713 * _325;
    int _1747 = _1635 + 104;
    uint _1749 = uint(int(uint(_1747) >> uint(2)));
    uint _1751 = uint(int(uint(int(_1749)) >> uint(2)));
    int _1753 = int(_1749) & 3;
    float _1755 = (*spvDescriptorSet0.vp_c15)._m0[int(_1751)][_1753];
    int _1757 = int(_1749) + 1;
    uint _1759 = uint(int(uint(_1757) >> uint(2)));
    int _1761 = _1757 & 3;
    float _1763 = (*spvDescriptorSet0.vp_c15)._m0[int(_1759)][_1761];
    float _1765 = fma(_1735, _295, _1741);
    float _1767 = fma(_1735, _287, _1743);
    int _1769 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1771 = _1705 + _1769;
    int _1773 = _1771 + 1;
    float _1775 = fma(_1735, _291, _1745);
    float _1777 = fma(_1733, _341, _1765);
    float _1779 = fma(_1733, _333, _1767);
    int _1781 = _1635 + 64;
    uint _1783 = uint(int(uint(_1781) >> uint(2)));
    uint _1785 = uint(int(uint(int(_1783)) >> uint(2)));
    int _1787 = int(_1783) & 3;
    float _1789 = (*spvDescriptorSet0.vp_c15)._m0[int(_1785)][_1787];
    int _1791 = int(_1783) + 1;
    uint _1793 = uint(int(uint(_1791) >> uint(2)));
    int _1795 = _1791 & 3;
    float _1797 = (*spvDescriptorSet0.vp_c15)._m0[int(_1793)][_1795];
    float _1799 = _1207 + _1777;
    float _1801 = _1205 + _1779;
    int _1803 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1805 = _1739 + _1803;
    int _1807 = _1805 + 1;
    float _1809 = fma(_1733, _337, _1775);
    float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1813 = _1799 + _1811;
    float _1815 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1817 = _1801 + _1815;
    bool _1819 = _1807 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1821 = _1635 + 56;
    uint _1823 = uint(int(uint(_1821) >> uint(2)));
    uint _1825 = uint(int(uint(int(_1823)) >> uint(2)));
    int _1827 = int(_1823) & 3;
    float _1829 = (*spvDescriptorSet0.vp_c15)._m0[int(_1825)][_1827];
    int _1831 = int(_1823) + 1;
    uint _1833 = uint(int(uint(_1831) >> uint(2)));
    int _1835 = _1831 & 3;
    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[int(_1833)][_1835];
    int _1839 = _1807 | _1773;
    float _1841 = _1315 + _1809;
    bool _1843 = _1839 < 0;
    bool _1845 = _1843 || _1819;
    float _1847 = _1813 * _1813;
    int _1849 = _1635 + 80;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    uint _1853 = uint(int(uint(int(_1851)) >> uint(2)));
    int _1855 = int(_1851) & 3;
    float _1857 = (*spvDescriptorSet0.vp_c15)._m0[int(_1853)][_1855];
    int _1859 = int(_1851) + 1;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    int _1863 = _1859 & 3;
    float _1865 = (*spvDescriptorSet0.vp_c15)._m0[int(_1861)][_1863];
    bool _1867 = _1773 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1869 = _1867 || _1845;
    float _1871 = fma(_1817, _1817, _1847);
    float _1873 = sqrt(_1871);
    float _1875 = _1575 * _1697;
    float _1877 = fma(_1205, _1689, _1875);
    int _1879 = as_type<int>(_1689);
    int _1881 = as_type<int>(_1877);
    float _1883 = _1841;
    float _1885 = _1799;
    float _1887 = _1809;
    if (!_1869)
    {
        int _1889 = _1773 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1891 = _1889 + _1807;
        _1879 = _1891;
    }
    int _1893 = _1879;
    float _1895 = _1575 * _1731;
    float _1897 = as_type<float>(_1807);
    if (!_1869)
    {
        float _1899 = floor(_1701);
        _1897 = _1899;
    }
    float _1901 = _1897;
    float _1903 = fma(_1205, _1723, _1895);
    bool _1905 = _1873 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1907 = fma(_1207, _1755, _1877);
    int _1909 = as_type<int>(_1907);
    if (!_1869)
    {
        int _1911 = _1893 << 2;
        _1881 = _1911;
    }
    int _1913 = _1881;
    float _1915 = _1907 + _1763;
    int _1917 = _1913;
    if (!_1869)
    {
        uint _1919 = uint(int(uint(_1893) >> uint(2)));
        _1909 = int(_1919);
    }
    int _1921 = _1909;
    float _1923 = as_type<float>(_1921);
    if (!_1869)
    {
        int _1925 = 12 & _1913;
        _1917 = _1925;
    }
    int _1927 = _1917;
    float _1929 = _1575 * _1797;
    float _1931 = 1.0 / _1915;
    if (!_1869)
    {
        int _1933 = _1921 << 4;
        int _1935 = _1933 + _1927;
        _1923 = as_type<float>(_1935);
    }
    float _1937 = _1923;
    float _1939 = fma(_1205, _1789, _1929);
    if (!_1905)
    {
        _1331 = _1801;
    }
    float _1941 = _1331;
    float _1943 = fma(_1207, _1829, _1903);
    float _1945 = fma(_1207, _1653, _1939);
    float _1947 = _1943 + _1837;
    float _1949 = _1945 + _1661;
    bool _1951 = !_1905;
    float _1953 = _1941;
    float _1955 = _1901;
    if (!_1951)
    {
        float _1957 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1961 = _1873 + _1959;
        float _1963 = _1841 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1965 = rsqrt(_1871);
        float _1967 = _1961 * _1957;
        float _1969 = _1967 * 0.15915493667125701904296875;
        float _1971 = _1969 * 6.283185482025146484375;
        float _1973 = cos(_1971);
        float _1975 = _1969 * 6.283185482025146484375;
        float _1977 = sin(_1975);
        float _1979 = _1973 + (-1.0);
        float _1981 = _1979 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1983 = fma(_1977, _1963, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1985 = fma(_1841, _1973, _1981);
        float _1987 = _1965 * _1983;
        float _1989 = fma(_1817, _1987, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1991 = fma(_1813, _1987, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1883 = _1985;
        _1953 = _1989;
        _1885 = _1991;
    }
    float _1993 = _1883;
    float _1995 = _1953;
    float _1997 = _1885;
    float _1999 = _1937;
    if (!_1869)
    {
        int _2001 = as_type<int>(_1937) + 400;
        uint _2003 = uint(int(uint(_2001) >> uint(2)));
        uint _2005 = uint(int(uint(int(_2003)) >> uint(2)));
        int _2007 = int(_2003) & 3;
        float _2009 = (*spvDescriptorSet0.vp_c15)._m0[int(_2005)][_2007];
        _1999 = _2009;
    }
    float _2011 = _1999;
    float _2013 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2015 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2017 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2019 = _1947 * _1931;
    float _2021 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2013);
    float _2023 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2015);
    float _2025 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2017);
    int _2027 = _1635 + 88;
    uint _2029 = uint(int(uint(_2027) >> uint(2)));
    uint _2031 = uint(int(uint(int(_2029)) >> uint(2)));
    int _2033 = int(_2029) & 3;
    float _2035 = (*spvDescriptorSet0.vp_c15)._m0[int(_2031)][_2033];
    int _2037 = int(_2029) + 1;
    uint _2039 = uint(int(uint(_2037) >> uint(2)));
    int _2041 = _2037 & 3;
    float _2043 = (*spvDescriptorSet0.vp_c15)._m0[int(_2039)][_2041];
    float _2045 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2021);
    bool _2047 = _2019 >= 0.0;
    float _2049 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2023);
    float _2051 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2053 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2025);
    float _2055 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2057 = _1949 * _1931;
    bool _2059 = _2019 <= 1.0;
    bool _2061 = _2059 && _2047;
    float _2063 = _2049 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2065 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2051);
    float _2067 = _2053 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2069 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2071 = _2057 >= 0.0;
    bool _2073 = _2071 && _2061;
    float _2075 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2077 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2079 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2065);
    float _2081 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2069);
    bool _2083 = _2057 <= 1.0;
    bool _2085 = _2083 && _2073;
    float _2087 = -_2077;
    float _2089 = fma(_2087, _2075, 1.0);
    float _2091 = _2079 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2093 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2081);
    float _2095 = _1653;
    if (!_1869)
    {
        float _2097 = floor(_1643);
        _2095 = _2097;
    }
    float _2099 = _2095;
    float _2101 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2103 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2105 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2093);
    float _2107 = _1575 * _1865;
    float _2109 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2101);
    float _2111 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2103);
    float _2113 = log2(_2089);
    float _2115 = _2109;
    if (_2085)
    {
        float _2117 = float(_1627);
        _1887 = _2117;
    }
    float _2119 = _1887;
    float _2121 = fma(_1205, _1857, _2107);
    float _2123 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2109);
    float _2125 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2111);
    float _2127 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2123);
    float _2129 = 1.0 / _2105;
    if (!_1869)
    {
        float _2131 = -_2099;
        float _2133 = _1643 + _2131;
        _2115 = _2133;
    }
    float _2135 = _2115;
    float _2137 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2125);
    float _2139 = _2107;
    if (_2085)
    {
        float _2141 = rint(_2119);
        float _2143 = precise::max(_2141, 0.0);
        uint _2145 = uint(_2143);
        uint _2147 = clamp(_2145, 0u, 65535u);
        _2139 = as_type<float>(_2147);
    }
    float _2149 = _2139;
    float _2151 = _2113 * 0.693147182464599609375;
    float _2153 = fma(_1207, _2035, _2121);
    float _2155 = _2153 + _2043;
    float _2157 = _2011;
    float _2159 = _2151;
    if (!_1869)
    {
        float _2161 = rint(_2011);
        float _2163 = precise::max(_2161, 0.0);
        uint _2165 = uint(_2163);
        uint _2167 = clamp(_2165, 0u, 65535u);
        _2157 = as_type<float>(_2167);
    }
    float _2169 = _2157;
    float _2171 = _2127 * _2129;
    float _2173 = _2137 * _2129;
    float _2175 = _2155 * _1931;
    float _2177 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2179 = fma(_2171, 0.5, 0.5);
    float _2181 = fma(_2173, -0.5, 0.5);
    if (!_1869)
    {
        float _2183 = -_1901;
        float _2185 = _1701 + _2183;
        _2159 = _2185;
    }
    float _2187 = _2159;
    float _2189 = _2057;
    if (_2085)
    {
        float3 _6215 = float3(_2019, _2057, float(as_type<int>(_2149)));
        float3 _6219 = select(_6215, float3(0.0), isnan(_6215));
        float _2191 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6219.xy, uint(rint(_6219.z)), _2175, level(0.0));
        _2189 = _2191;
    }
    float _2193 = _2189;
    float3 _6229 = float3(_2179, _2181, _2177);
    float _2195 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6229, float3(0.0), isnan(_6229)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6229, float3(0.0), isnan(_6229)), level(0.0)).x;
    float3 _6238 = float3(_2179, _2181, _2177);
    float4 _2197 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6238, float3(0.0), isnan(_6238)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6238, float3(0.0), isnan(_6238)), level(0.0)).xyzw;
    float _2199 = _2197.x;
    float _2201 = _2197.y;
    float _2203 = _2197.z;
    float _2205 = _2197.w;
    float _2207 = _2103;
    if (!_1869)
    {
        float3 _6261 = float3(_2187, _2135, float(as_type<int>(_2169)));
        float3 _6263 = select(_6261, float3(0.0), isnan(_6261));
        float _2209 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6263.xy, uint(rint(_6263.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6263.xy, uint(rint(_6263.z)), level(0.0)).x;
        _2207 = _2209;
    }
    float _2211 = _2207;
    if (_1869)
    {
        _1955 = 1.0;
    }
    float _2213 = _1955;
    float _2215 = _2213;
    float _2217 = _2211;
    if (!_1869)
    {
        int _2219 = _1893 << 4;
        int _2221 = _2219 + 2048;
        uint _2223 = uint(int(uint(_2221) >> uint(2)));
        uint _2225 = uint(int(uint(int(_2223)) >> uint(2)));
        int _2227 = int(_2223) & 3;
        float _2229 = (*spvDescriptorSet0.vp_c15)._m0[int(_2225)][_2227];
        int _2231 = int(_2223) + 1;
        uint _2233 = uint(int(uint(_2231) >> uint(2)));
        int _2235 = _2231 & 3;
        float _2237 = (*spvDescriptorSet0.vp_c15)._m0[int(_2233)][_2235];
        int _2239 = _2221 + 8;
        uint _2241 = uint(int(uint(_2239) >> uint(2)));
        uint _2243 = uint(int(uint(int(_2241)) >> uint(2)));
        int _2245 = int(_2241) & 3;
        float _2247 = (*spvDescriptorSet0.vp_c15)._m0[int(_2243)][_2245];
        int _2249 = int(_2241) + 1;
        uint _2251 = uint(int(uint(_2249) >> uint(2)));
        int _2253 = _2249 & 3;
        float _2255 = (*spvDescriptorSet0.vp_c15)._m0[int(_2251)][_2253];
        float _2257 = _1575 * _2237;
        float _2259 = fma(_1205, _2229, _2257);
        float _2261 = fma(_1207, _2247, _2259);
        float _2263 = _2261 + _2255;
        float _2265 = precise::clamp(_2263, 0.0, 1.0);
        float _2267 = -_2265;
        float _2269 = _2267 + _2211;
        float _2271 = fma(_2269, 500.0, 1.5);
        float _2273 = exp2(_2271);
        float _2275 = 0.0 + _2273;
        float _2277 = precise::clamp(_2275, 0.0, 1.0);
        _2215 = _2277;
    }
    float _2279 = _2215;
    float _2281 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2283 = _1993 + _2281;
    float _2285 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2287 = _1995 + _2285;
    float _2289 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2291 = _1997 + _2289;
    float _2293 = _2283 * _2283;
    float _2295 = fma(_2287, _2287, _2293);
    float _2297 = fma(_2291, _2291, _2295);
    float _2299 = rsqrt(_2297);
    float _2301 = sqrt(_2297);
    float _2303 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2305 = _2287 * _2303;
    float _2307 = _2291 * _2303;
    float _2309 = _2305 * _2305;
    float _2311 = _2307 * _2307;
    float _2313 = _2309 + _2311;
    float _2315 = sqrt(_2313);
    bool _2317 = _2315 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2319 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2321 = _2315 + _2319;
    float _2323 = _2181;
    float _2325 = _2313;
    float _2327 = _2321;
    float _2329 = _2303;
    float _2331 = _2305;
    float _2333 = _2307;
    float _2335 = _2309;
    float _2337 = _2311;
    if (_2317)
    {
        float _2339 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2323 = _2339;
    }
    float _2341 = _2323;
    if (_2317)
    {
        float _2343 = rsqrt(_2313);
        _2325 = _2343;
    }
    float _2345 = _2325;
    if (_2317)
    {
        float _2347 = _2321 * _2341;
        _2327 = _2347;
    }
    float _2349 = _2327;
    if (_2317)
    {
        float _2351 = _2349 * 0.15915493667125701904296875;
        _2217 = _2351;
    }
    float _2353 = _2217;
    float _2355 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2357 = _2135;
    if (_2317)
    {
        float _2359 = _2353 * 6.283185482025146484375;
        float _2361 = sin(_2359);
        _2357 = _2361;
    }
    float _2363 = _2357;
    float _2365 = precise::max(0.0, _2355);
    float _2367 = _2349;
    float _2369 = _2365;
    if (_2317)
    {
        float _2371 = _2353 * 6.283185482025146484375;
        float _2373 = cos(_2371);
        _2367 = _2373;
    }
    float _2375 = _2367;
    float _2377 = -_2303;
    float _2379 = -_2365;
    float _2381 = fma(_2283, _2377, _2379);
    float _2383 = _2381;
    if (_2317)
    {
        float _2385 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2329 = _2385;
    }
    float _2387 = _2329;
    float _2389 = _2387;
    if (_2317)
    {
        float _2391 = fma(_2363, _2387, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2369 = _2391;
    }
    float _2393 = _2369;
    float _2395 = _2393;
    if (_2317)
    {
        float _2397 = _2345 * _2393;
        _2395 = _2397;
    }
    float _2399 = _2395;
    if (_2317)
    {
        float _2401 = _2375 + (-1.0);
        _2389 = _2401;
    }
    float _2403 = _2389;
    float _2405 = _2403;
    if (_2317)
    {
        float _2407 = _2305 * _2399;
        _2331 = _2407;
    }
    float _2409 = _2331;
    if (_2317)
    {
        float _2411 = _2307 * _2399;
        _2333 = _2411;
    }
    float _2413 = _2333;
    if (_2317)
    {
        float _2415 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2405 = _2415;
    }
    float _2417 = _2405;
    if (_2317)
    {
        float _2419 = _2409 * _2409;
        _2335 = _2419;
    }
    float _2421 = _2335;
    if (_2317)
    {
        float _2423 = _2413 * _2413;
        _2337 = _2423;
    }
    float _2425 = _2337;
    if (_2317)
    {
        float _2427 = fma(_2381, _2375, _2417);
        _2383 = _2427;
    }
    float _2429 = _2383;
    float _2431 = fma(_2429, _2429, _2421);
    float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2435 = fma(_2301, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2433);
    float _2437 = precise::clamp(_2435, 0.0, 1.0);
    float _2439 = _2431 + _2425;
    float _2441 = -_2437;
    float _2443 = _2441 + 1.0;
    float _2445 = rsqrt(_2439);
    float _2447 = _2445 * _2409;
    float _2449 = _2445 * _2429;
    float _2451 = _2445 * _2413;
    float _2453 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2455 = abs(_2443);
    float _2457 = log2(_2455);
    float _2459 = -_2453;
    float _2461 = fma(_2449, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2459);
    float _2463 = -_2451;
    float _2465 = fma(_2463, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2461);
    float _2467 = fma(_2465, -0.5, 0.5);
    float _2469 = fma(_2465, 0.5, 0.5);
    float _2471 = fma(_2469, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2473 = _2457 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2475 = sqrt(_2467);
    float _2477 = fma(_2469, _2471, -0.212114393711090087890625);
    float _2479 = _2449 + 1.0;
    float _2481 = fma(_2469, _2477, 1.570728778839111328125);
    float _2483 = exp2(_2473);
    float _2485 = _2475 * 0.636619746685028076171875;
    float _2487 = -_2449;
    float _2489 = fma(_2483, _2479, _2487);
    float _2491 = -_2481;
    float _2493 = fma(_2485, _2491, 1.0);
    float _2495 = fma(_2489, 0.5, 0.5);
    float2 _6700 = float2(_2493, _2495);
    float3 _2499 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6700, float2(0.0), isnan(_6700)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6700, float2(0.0), isnan(_6700)), level(0.0)).xyz;
    float _2501 = _2499.x;
    float _2503 = _2499.y;
    float _2505 = _2499.z;
    float _2507 = _1119 * _1169;
    float _2509 = _1107 * 2.0;
    float _2511 = _1091 * 3.883221149444580078125;
    bool _2513 = _1071 != 0.0;
    bool _2515 = isnan(_1071);
    bool _2517 = _2513 || _2515;
    bool _2519 = isnan(0.0);
    bool _2521 = _2517 || _2519;
    float _2523 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2525 = -_2509;
    float _2527 = fma(_2507, _2525, _2507);
    float _2529 = _2511 * 0.15915493667125701904296875;
    float _2531 = abs(_1565);
    float _2533 = log2(_2531);
    bool _2535 = _1069 == 0.0;
    bool _2537 = !_2521;
    bool _2539 = _2535 && _2537;
    float _2541 = fma(_1107, 3.1415927410125732421875, _2527);
    float _2543 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2523);
    float _2545 = -_1225;
    float _2547 = _2545 + 1.0;
    bool _2549 = _1073 == 0.0;
    bool _2551 = _2549 && _2539;
    float _2553 = _2541 * 0.15915493667125701904296875;
    float _2555 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2543);
    float _2557 = _2529 * 6.283185482025146484375;
    float _2559 = cos(_2557);
    out.m_81.x = _809;
    out.m_81.y = _807;
    float _2561 = _2553 * 6.283185482025146484375;
    float _2563 = sin(_2561);
    float _2565 = _2533 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2567 = -_905;
    float _2569 = _2567 + _1093;
    float _2571 = _2529 * 6.283185482025146484375;
    float _2573 = sin(_2571);
    float _2575 = -_1039;
    float _2577 = fma(_2563, _2559, _2575);
    float _2579 = exp2(_2565);
    float _2581 = fma(_1029, _2577, _1039);
    float _2583 = -_1041;
    float _2585 = fma(_2563, _2573, _2583);
    float _2587 = fma(_1029, _2569, _905);
    float _2589 = _2581;
    float _2591 = _2587;
    if (!_2551)
    {
        float _2593 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2581);
        _2589 = _2593;
    }
    float _2595 = _2589;
    float _2597 = fma(_1029, _2585, _1041);
    float _2599 = _2597;
    if (!_2551)
    {
        float _2601 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2587);
        _2591 = _2601;
    }
    float _2603 = _2591;
    if (!_2551)
    {
        float _2605 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2597);
        _2599 = _2605;
    }
    float _2607 = _2599;
    float _2609 = _1663 * _2603;
    float _2611 = _1667 * _2603;
    float _2613 = _1607 * _2603;
    float _2615 = fma(_2579, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2617 = precise::clamp(_2615, 0.0, 1.0);
    float _2619 = fma(_1609, _2595, _2609);
    float _2621 = fma(_1637, _2595, _2611);
    float _2623 = -_1615;
    float _2625 = fma(_2623, _2595, _2613);
    float _2627 = fma(_2617, -2.0, 3.0);
    float _2629 = fma(_1671, _2607, _2619);
    float _2631 = fma(_1673, _2607, _2621);
    float _2633 = fma(_1639, _2607, _2625);
    float _2635 = _2617 * _2617;
    float _2637 = _2629 * _329;
    float _2639 = _2629 * _309;
    float _2641 = _2629 * _325;
    float _2643 = _2635 * _2627;
    float _2645 = fma(_2631, _295, _2637);
    float _2647 = fma(_2631, _287, _2639);
    float _2649 = fma(_2631, _291, _2641);
    float _2651 = -_2643;
    float _2653 = _2651 + 1.0;
    float _2655 = fma(_2633, _341, _2645);
    float _2657 = _2457 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2659 = fma(_2633, _333, _2647);
    float _2661 = fma(_2633, _337, _2649);
    bool _2663 = _1565 <= 8000.0;
    bool _2665 = isnan(_1565);
    bool _2667 = _2663 || _2665;
    bool _2669 = isnan(8000.0);
    bool _2671 = _2667 || _2669;
    float _2673 = float(_2671);
    float _2675 = fma(_2653, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2643);
    float _2677 = exp2(_2657);
    float _2679 = _2673 * _2675;
    float _2681 = _2675;
    float _2683 = _2679;
    float _2685 = 1.0;
    if (!_2085)
    {
        _2681 = 1.0;
    }
    float _2687 = _2681;
    float _2689 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2555);
    float _2691 = _2687;
    if (_2085)
    {
        bool _2693 = _2193 >= _2175;
        bool _2695 = isnan(_2193);
        bool _2697 = _2693 || _2695;
        bool _2699 = isnan(_2175);
        bool _2701 = _2697 || _2699;
        float _2703 = float(_2701);
        _2691 = _2703;
    }
    float _2705 = _2691;
    float _2707 = _2679 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    float _2709 = _2689 + _2105;
    float _2711 = _2547 * _2707;
    float _2713 = precise::clamp(_2711, 0.0, 1.0);
    float _2715 = _2705 * _2279;
    float _2717 = _2709 * 0.5;
    float _2719 = -_2713;
    float _2721 = fma(_2719, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_85.x = _2659;
    out.m_85.y = _2661;
    out.m_85.z = _2655;
    float _2723 = -_2677;
    float _2725 = _2723 + 1.0;
    bool _2727 = _2301 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2729 = isnan(_2301);
    bool _2731 = _2727 || _2729;
    bool _2733 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2735 = _2731 || _2733;
    float _2737 = -_2715;
    float _2739 = fma(_2737, _2721, 1.0);
    float _2741 = precise::clamp(_2739, 0.0, 1.0);
    out.gl_Position.x = _2127;
    out.gl_Position.y = _2137;
    out.gl_Position.z = _2689;
    out.gl_Position.w = _2105;
    float _2743 = _2725 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_87.z = _2717;
    out.m_87.w = _2105;
    float _2745 = _2743 * _2195;
    float _2747 = -_2743;
    float _2749 = _2747 + 1.0;
    float _2751 = _2741 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2753 = _2205 * _2745;
    float _2755 = _2205 * _2749;
    float _2757 = _2741;
    float _2759 = _2709;
    float _2761 = _2749;
    float _2763 = _2753;
    if (!_2735)
    {
        _2683 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2765 = _2683;
    out.m_89.x = _2751;
    float _2767 = _2765;
    float _2769 = _2765;
    if (!_2735)
    {
        _2757 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2771 = _2757;
    float _2773 = _2771;
    float _2775 = _2771;
    if (!_2735)
    {
        _2759 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2777 = _2759;
    float _2779 = _2777;
    float _2781 = _2777;
    if (!_2735)
    {
        _2685 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2783 = _2685;
    float _2785 = _2783;
    float _2787 = _2783;
    if (!_2735)
    {
        _2761 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2789 = _2761;
    float _2791 = _2505 * _2745;
    float _2793 = fma(_2501, _2753, _2199);
    float _2795 = fma(_2503, _2753, _2201);
    float _2797 = _2789;
    float _2799 = _2789;
    if (!_2735)
    {
        _2763 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2801 = _2763;
    float _2803 = fma(_2205, _2791, _2203);
    out.m_91.x = _2793;
    out.m_91.y = _2795;
    out.m_91.z = _2803;
    out.m_91.w = _2755;
    bool _2805 = !_2735;
    float _2807 = _2801;
    float _2809 = _2801;
    if (!_2805)
    {
        bool _2811 = _2301 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2813 = isnan(_2301);
        bool _2815 = _2811 || _2813;
        bool _2817 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2819 = _2815 || _2817;
        if (!_2819)
        {
            float _2821 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2823 = _2301 + _2821;
            float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2827 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2825;
            float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2831 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2833 = 1.0 / _2827;
            float _2835 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2837 = _2835 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2839 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2841 = _2839 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2843 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2845 = _2843 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2847 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2851 = _2823 * _2833;
            float _2853 = precise::clamp(_2851, 0.0, 1.0);
            float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2857 = _2855 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2859 = fma(_2853, _2831, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2861 = fma(_2853, _2857, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2863 = fma(_2853, _2837, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2865 = fma(_2853, _2841, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2867 = fma(_2853, _2845, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2869 = fma(_2853, _2849, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2775 = _2863;
            _2809 = _2867;
            _2769 = _2859;
            _2787 = _2865;
            _2781 = _2861;
            _2799 = _2869;
            _2871 = true;
        }
        else
        {
            bool _2873 = _2301 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2875 = isnan(_2301);
            bool _2877 = _2873 || _2875;
            bool _2879 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2881 = _2877 || _2879;
            if (!_2881)
            {
                _2767 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2883 = _2767;
            _2769 = _2883;
            if (!_2881)
            {
                _2773 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2885 = _2773;
            _2775 = _2885;
            if (!_2881)
            {
                _2779 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2887 = _2779;
            _2781 = _2887;
            if (!_2881)
            {
                _2785 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2889 = _2785;
            _2787 = _2889;
            if (!_2881)
            {
                _2807 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2891 = _2807;
            _2809 = _2891;
            if (!_2881)
            {
                _2797 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2893 = _2797;
            bool _2895 = !_2881;
            _2799 = _2893;
            if (!_2895)
            {
                bool _2897 = _2301 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2899 = isnan(_2301);
                bool _2901 = _2897 || _2899;
                bool _2903 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2905 = _2901 || _2903;
                if (!_2905)
                {
                    float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2909 = _2301 + _2907;
                    float _2911 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2913 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2911;
                    float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2917 = _2915 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2919 = 1.0 / _2913;
                    float _2921 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2923 = _2921 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2925 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2929 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2931 = _2929 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2933 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2935 = _2933 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2937 = _2909 * _2919;
                    float _2939 = precise::clamp(_2937, 0.0, 1.0);
                    float _2941 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2943 = _2941 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2945 = fma(_2939, _2917, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2947 = fma(_2939, _2943, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2949 = fma(_2939, _2923, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2951 = fma(_2939, _2927, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2953 = fma(_2939, _2931, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2955 = fma(_2939, _2935, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2775 = _2949;
                    _2809 = _2953;
                    _2769 = _2945;
                    _2787 = _2951;
                    _2781 = _2947;
                    _2799 = _2955;
                    _2871 = true;
                }
                else
                {
                    _2775 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2809 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2769 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2787 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2781 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2799 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2871 = false;
    float _2957 = _2775;
    float _2959 = _2809;
    float _2961 = _2769;
    float _2963 = _2787;
    float _2965 = _2781;
    float _2967 = _2799;
    float _2969 = fma(_2661, -0.5, 0.5);
    float _2971 = precise::clamp(_2969, 0.0, 1.0);
    float _2973 = -_2957;
    float _2975 = _2973 + _2959;
    float _2977 = -_2961;
    float _2979 = _2977 + _2963;
    float _2981 = -_2965;
    float _2983 = _2981 + _2967;
    bool _2985 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2987 = fma(_2971, _2975, _2957);
    float _2989 = fma(_2971, _2979, _2961);
    float _2991 = fma(_2971, _2983, _2965);
    float _2993 = _2987 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _2995 = fma(_2989, 0.298911988735198974609375, _2993);
    float _2997 = fma(_2991, 0.114477999508380889892578125, _2995);
    float _2999 = -_2997;
    float _3001 = _2989 + _2999;
    float _3003 = -_2997;
    float _3005 = _2987 + _3003;
    float _3007 = -_2997;
    float _3009 = _2991 + _3007;
    float _3011 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3013 = fma(_3001, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2997);
    float _3015 = fma(_3005, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2997);
    float _3017 = fma(_3009, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2997);
    out.m_61.x = _3011;
    out.m_95.x = _3013;
    out.m_95.y = _3015;
    out.m_95.z = _3017;
    if (!_2985)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3019 = -_1993;
    float _3021 = _3019 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3023 = -_1995;
    float _3025 = _3023 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3027 = -_1997;
    float _3029 = _3027 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3031 = _3021 * _3021;
    float _3033 = fma(_3025, _3025, _3031);
    float _3035 = fma(_3029, _3029, _3033);
    float _3037 = sqrt(_3035);
    float _3039 = rsqrt(_3035);
    float _3041 = -_3037;
    float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3045 = _3043 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3047 = precise::clamp(_3045, 0.0, 1.0);
    float _3049 = _3025 * _3039;
    float _3051 = _3021 * _3039;
    float _3053 = abs(_3047);
    float _3055 = log2(_3053);
    float _3057 = _3029 * _3039;
    float _3059 = _3049 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3061 = _2661 * _3051;
    float _3063 = -_3051;
    float _3065 = -_3059;
    float _3067 = fma(_3063, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3065);
    float _3069 = fma(_2659, _3049, _3061);
    float _3071 = -_3057;
    float _3073 = fma(_3071, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3067);
    float _3075 = fma(_2655, _3057, _3069);
    float _3077 = precise::clamp(_3075, 0.0, 1.0);
    float _3079 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3081 = _3073 + _3079;
    float _3083 = _3055 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3085 = _3081 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3087 = precise::clamp(_3085, 0.0, 1.0);
    float _3089 = exp2(_3083);
    float _3091 = _3089 * _3087;
    float _3093 = _3077 * _3091;
    float _3095 = _3093 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3097 = _3093 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3099 = _3093 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _3095;
    out.m_93.y = _3097;
    out.m_93.z = _3099;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

