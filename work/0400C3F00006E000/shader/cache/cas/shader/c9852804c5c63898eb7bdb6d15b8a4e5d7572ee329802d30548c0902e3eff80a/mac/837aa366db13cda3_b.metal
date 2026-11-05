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
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 m_87 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 m_85 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_75 [[attribute(0)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_65 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _104(thread const int& _7117, thread const int& _7118, constant _10& support_buffer)
{
    float _7121 = as_type<float>(support_buffer._m4);
    int _7123 = _7118 + as_type<int>(_7121);
    int _7125 = 1 + _7123;
    float _7127 = support_buffer._m5[_7125].x;
    float _7129 = abs(_7127);
    bool _7131 = _7129 == 1.0;
    if (_7131)
    {
        return _7117;
    }
    float _7133 = float(_7117);
    float _7135 = _7133 / _7129;
    int _7137 = int(_7135);
    return _7137;
}

static inline __attribute__((always_inline))
int _105(thread const int& _7167, thread const int& _7168, constant _10& support_buffer)
{
    float _7171 = as_type<float>(support_buffer._m4);
    int _7173 = _7168 + as_type<int>(_7171);
    int _7175 = 1 + _7173;
    float _7177 = support_buffer._m5[_7175].x;
    bool _7179 = _7177 == 1.0;
    if (_7179)
    {
        return _7167;
    }
    float _7181 = float(_7167);
    float _7183 = _7181 * _7177;
    int _7185 = int(_7183);
    return _7185;
}

static inline __attribute__((always_inline))
void _102(thread const int& _6804, thread const int& _6805, thread const int& _6806, thread const int& _6807, thread const int& _6808, thread int& _6809, thread int& _6810, thread int& _6811, thread int& _6812, thread int& _6813, thread int& _6814, thread int& _6815, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _6818 = _6808;
    int _6820 = _6804;
    int _6822 = _6806;
    float _6824 = 0.0 + as_type<float>(_6804);
    bool _6826 = _6824 != 0.0;
    bool _6828 = isnan(_6824);
    bool _6830 = _6826 || _6828;
    bool _6832 = isnan(0.0);
    bool _6834 = _6830 || _6832;
    int _6836 = 0;
    int _6838 = _6834 ? (-1) : 0;
    if (!_6834)
    {
        float _6840 = as_type<float>(_6804) * 1.0;
        _6818 = as_type<int>(_6840);
    }
    int _6842 = _6818;
    bool _6844 = !_6834;
    int _6846 = _6842;
    int _6848 = _6842;
    if (!_6844)
    {
        bool _6850 = _6824 >= 0.0;
        bool _6852 = isnan(_6824);
        bool _6854 = _6850 || _6852;
        bool _6856 = isnan(0.0);
        bool _6858 = _6854 || _6856;
        _6838 = _6858 ? (-1) : 0;
        if (!_6858)
        {
            _6846 = 2147483647;
        }
        int _6860 = _6846;
        bool _6862 = !_6858;
        int _6864 = _6860;
        _6848 = _6860;
        if (!_6862)
        {
            float _6866 = abs(as_type<float>(_6804));
            float _6868 = 0.0 + _6866;
            bool _6870 = _6868 > as_type<float>(0x7f800000u /* inf */);
            bool _6872 = isnan(_6868);
            bool _6874 = _6870 || _6872;
            bool _6876 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _6878 = _6874 || _6876;
            _6836 = 2139095040;
            _6838 = _6878 ? (-1) : 0;
            if (_6878)
            {
                float _6880 = as_type<float>(_6804) + 1.0;
                _6864 = as_type<int>(_6880);
            }
            int _6882 = _6864;
            int _6884 = _6882;
            _6848 = _6882;
            if (!_6878)
            {
                bool _6886 = _6868 != as_type<float>(0x7f800000u /* inf */);
                bool _6888 = isnan(_6868);
                bool _6890 = _6886 || _6888;
                bool _6892 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _6894 = _6890 || _6892;
                _6838 = _6894 ? (-1) : 0;
                if (!_6894)
                {
                    _6884 = _6804;
                }
                int _6896 = _6884;
                bool _6898 = !_6894;
                _6848 = _6896;
                if (!_6898)
                {
                    float _6900 = as_type<float>(_6804) * 18446744073709551616.0;
                    float _6902 = rsqrt(_6900);
                    float _6904 = _6900 * _6902;
                    float _6906 = _6902 * 0.5;
                    float _6908 = -_6904;
                    float _6910 = 0.0 + _6908;
                    float _6912 = fma(_6906, _6910, 0.5);
                    float _6914 = fma(_6904, _6912, _6904);
                    float _6916 = -_6914;
                    float _6918 = 0.0 + _6916;
                    float _6920 = fma(_6914, _6918, _6900);
                    float _6922 = fma(_6906, _6920, _6914);
                    float _6924 = _6922 * 2.3283064365386962890625e-10;
                    _6820 = as_type<int>(_6900);
                    _6836 = as_type<int>(_6922);
                    _6822 = as_type<int>(_6914);
                    _6848 = as_type<int>(_6924);
                }
            }
        }
    }
    int _6926 = _6820;
    int _6928 = _6836;
    int _6930 = _6822;
    int _6932 = _6848;
    int _6934 = _6838;
    _6809 = _6926;
    _6810 = _6928;
    _6811 = _6807;
    _6812 = 0;
    _6813 = _6930;
    _6814 = _6932;
    _6815 = _6934;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2423 = false;
    bool _1097 = false;
    bool _905 = false;
    bool _445 = false;
    bool _297 = false;
    bool _189 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_48.w;
    float _111 = trunc(_109);
    int _113 = int(_111);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _123 = 0;
    if (!_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2727 = as_type<float>(_127);
        out.gl_Position.z = _2727;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_53.w;
    float _133 = float(_113);
    float _135 = -_131;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_131);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    bool _149 = _137 >= _133;
    bool _151 = !_147;
    bool _153 = _149 || _151;
    float _155 = _131;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _129 = as_type<int>(_159);
    }
    int _161 = _129;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2791 = as_type<float>(_161);
        out.gl_Position.z = _2791;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = 1.0 / _133;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _137 * _163;
    bool _169 = !_165;
    float _187;
    if (!_169)
    {
        float _171 = in.m_55.x;
        float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _179 = _177 * _173;
        float _181 = floor(_179);
        float _183 = -_181;
        float _185 = _179 + _183;
        _187 = _185;
        _189 = true;
    }
    else
    {
        _187 = _167;
    }
    _189 = false;
    float _191 = _187;
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _195 = _191 + _193;
    bool _197 = _191 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _199 = isnan(_191);
    bool _201 = _197 || _199;
    bool _203 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _205 = _201 || _203;
    float _207 = float(_205);
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _209;
    bool _213 = _191 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _215 = isnan(_191);
    bool _217 = _213 || _215;
    bool _219 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _221 = _217 || _219;
    float _223 = float(_221);
    float _225 = -_207;
    float _227 = _225 + 1.0;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _229;
    float _233 = 1.0 / _211;
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _237 = _223 * _227;
    float _239 = -_223;
    float _241 = _239 + 1.0;
    float _243 = _195 * _233;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _245;
    float _249 = fma(_231, _243, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _251;
    float _255 = fma(_247, _243, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _257 = _249 * _237;
    float _259 = fma(_253, _243, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _261 = _255 * _237;
    float _263 = _259 * _237;
    float _265 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[143].x, _257);
    float _267 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[143].y, _263);
    float _269 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[143].z, _261);
    float _271 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[144].x, _265);
    float _273 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[144].y, _267);
    float _275 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[144].z, _269);
    bool _277 = !_235;
    float _295;
    if (!_277)
    {
        float _279 = in.m_55.x;
        float _281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _283 = _279 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _287 = _285 * _281;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _295 = _293;
        _297 = true;
    }
    else
    {
        _295 = _167;
    }
    _297 = false;
    float _299 = _295;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _303 = _299 + _301;
    float _305 = in.m_57.x;
    float _307 = in.m_57.y;
    float _309 = in.m_57.z;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _315 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _317 = isnan(_299);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _331 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _333 = isnan(_299);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _343;
    bool _347 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _349 = isnan(_299);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = 1.0 / _313;
    float _361 = -_325;
    float _363 = _361 + 1.0;
    bool _365 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _367 = _341 * _363;
    float _369 = -_341;
    float _371 = _369 + 1.0;
    float _373 = 1.0 / _329;
    float _375 = _345 * _359;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _381 = _271 * _305;
    float _383 = fma(_375, _303, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _385 = _379 * _373;
    float _387 = _383 * _367;
    float _389 = -_357;
    float _391 = _389 + 1.0;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _395 = _299 + _393;
    float _397 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[115].x, _387);
    float _399 = _325 * _391;
    float _401 = fma(_385, _395, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _405 = fma(_401, _399, _397);
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _409 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[117].x, _405);
    float _413 = _273 * _307;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _417 = _407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = _411 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _421 = _415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = _275 * _309;
    out.m_59.x = _409;
    out.m_59.y = _421;
    out.m_59.z = _417;
    out.m_59.w = _419;
    bool _425 = !_365;
    float _443;
    if (!_425)
    {
        float _427 = in.m_55.x;
        float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _431 = _427 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _433 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[11].w, _137);
        float _435 = _433 * _429;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _443 = _441;
        _445 = true;
    }
    else
    {
        _443 = _167;
    }
    _445 = false;
    float _447 = _443;
    int _449 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _451 = _449;
    int _453 = 0;
    int _455 = _104(_451, _453, (*spvDescriptorSet0.support_buffer));
    float _457 = abs(_167);
    float _459 = log2(_457);
    float _461 = in.m_61.z;
    float _463 = _459 * 0.5;
    float _465 = exp2(_463);
    float _467 = trunc(_461);
    int _469 = int(_467);
    float _471 = 0.0 + _465;
    float _473 = precise::clamp(_471, 0.0, 1.0);
    int _475 = _455 + (-1);
    float _477 = float(_475);
    float _479 = _473 * _477;
    float _481 = trunc(_479);
    int _483 = int(_481);
    int _485 = _483;
    int _487 = 0;
    int _489 = _105(_485, _487, (*spvDescriptorSet0.support_buffer));
    int _491 = _469;
    int _493 = 0;
    int _495 = _105(_491, _493, (*spvDescriptorSet0.support_buffer));
    float4 _498 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_489, _495)), 0).xyzw;
    float _500 = _498.x;
    float _502 = _498.y;
    float _504 = _498.z;
    float _506 = _498.w;
    float _508 = in.m_55.x;
    float _510 = in.m_55.y;
    float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _516 = _514 != 0;
    float _518 = in.m_61.y;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _522 = _520 != 0;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _528 = in.m_55.w;
    float _530 = 1.0 / _526;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _534 = _532 != 0;
    float _536 = in.m_61.x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _540 = 0.0;
    if (_516)
    {
        float _542 = in.m_55.x;
        _540 = _542;
    }
    float _544 = _540;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _548 = _546 != 0;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _554 = _552 != 0;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _556;
    float _560 = 0.0;
    if (_522)
    {
        float _562 = in.m_55.z;
        _560 = _562;
    }
    float _564 = _560;
    float _566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _568 = _508 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _570 = _510 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _572 = _510 > 0.5;
    bool _574 = _572 && _548;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _578 = -_550;
    float _580 = fma(_568, 2.0, _578);
    float _582 = fma(_570, -2.0, _538);
    float _584 = _558 * _530;
    float _586 = _550;
    float _588 = _570;
    float _590 = _584;
    if (!_534)
    {
        float _592 = in.m_55.z;
        _586 = _592;
    }
    float _594 = _586;
    float _596 = -_518;
    float _598 = _596 + 1.0;
    bool _600 = _528 > 0.5;
    bool _602 = _600 && _554;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _606 = _447 + _604;
    float _608 = -_137;
    float _610 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[76].x, _580);
    int _612 = _602 ? as_type<int>(_598) : as_type<int>(_518);
    float _614 = fma(_584, _606, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _616 = _612;
    if (!_534)
    {
        _588 = _510;
    }
    float _618 = _588;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _622 = false;
    float _624 = _618;
    if (_516)
    {
        bool _626 = _544 > 0.5;
        _622 = _626;
    }
    bool _628 = _622;
    float _630 = _574 ? _598 : _518;
    float _632 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[78].z, _620);
    float _634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_534)
    {
        _624 = _508;
    }
    float _636 = _624;
    float _638 = _512 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _640 = fma(_638, _630, -0.5);
    bool _642 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _644 = isnan(_447);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _656 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _658 = isnan(_447);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[83].z, _576);
    bool _670 = false;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (_522)
    {
        bool _674 = _564 > 0.5;
        _670 = _674;
    }
    bool _676 = _670;
    float _678 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[78].w, _654);
    float _680 = -_666;
    float _682 = _680 + 1.0;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _686 = _634 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _688 = _636 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _690 = _594;
    int _692 = as_type<int>(_688);
    if (!_534)
    {
        _590 = _594;
    }
    float _694 = _590;
    float _696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _698 = _694;
    if (_534)
    {
        _698 = _510;
    }
    float _700 = _698;
    float _702 = fma(_686, as_type<float>(_612), -0.5);
    if (_534)
    {
        _690 = _510;
    }
    float _704 = _690;
    float _706 = _652 * _682;
    float _708 = -_684;
    float _710 = fma(_688, 2.0, _708);
    float _712 = _706;
    if (_522)
    {
        float _714 = -_536;
        float _716 = _714 + 1.0;
        _616 = as_type<int>(_716);
    }
    int _718 = _616;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_516)
    {
        float _722 = -_536;
        float _724 = _722 + 1.0;
        _692 = as_type<int>(_724);
    }
    int _726 = _692;
    float _728 = _614 * _706;
    if (!_522)
    {
        _712 = _536;
    }
    float _730 = _712;
    float _732 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[83].w, _720);
    float _734 = _730;
    if (!_516)
    {
        _672 = _536;
    }
    float _736 = _672;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _740 = _736;
    if (_522)
    {
        float _742 = _676 ? as_type<float>(_718) : _536;
        _734 = _742;
    }
    float _744 = _734;
    float _746 = _700 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_516)
    {
        float _748 = _628 ? as_type<float>(_726) : _536;
        _740 = _748;
    }
    float _750 = _740;
    float _752 = _566 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _754 = _696 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _756 = fma(_746, -2.0, _738);
    float _758 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _632);
    float _760 = fma(_752, _750, -0.5);
    float _762 = fma(_754, _744, -0.5);
    float _764 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _678);
    float _766 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _582);
    float _768 = fma(_758, _760, _610);
    float _770 = -_652;
    float _772 = _770 + 1.0;
    int _774 = _483 + 1;
    float _776 = -_766;
    float _778 = fma(_764, _640, _776);
    float _780 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[131].x, _728);
    int _782 = min(_475, _774);
    float _784 = -_137;
    float _786 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[81].x, _710);
    float _788 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[132].x, _780);
    float _790 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _668);
    float _792 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _732);
    float _794 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _756);
    float _796 = _788 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _798 = fma(_790, _762, _786);
    float _800 = _778 + 0.5;
    float _802 = -_794;
    float _804 = fma(_792, _702, _802);
    out.m_63.w = _796;
    float _806 = _798 + 0.5;
    uint _809 = as_type<uint>(half2(float2(_506, 0.0)));
    uint _811 = extract_bits(_809, 0u, 8u);
    int _813 = int(_811) & 255;
    uint _815 = extract_bits(_809, 8u, 8u);
    int _817 = int(_815) & 255;
    int _819 = _817 << 8;
    int _821 = _813 | _819;
    bool _823 = _821 >= 32768;
    int _825 = _821 + (-1024);
    int _827 = _825;
    if (_823)
    {
        int _829 = ~_821;
        int _831 = _829 + 33792;
        int _833 = _831 + 1;
        _827 = _833;
    }
    int _835 = _827;
    int _837 = _835 + 30719;
    float _839 = float(_837);
    float _841 = fma(_839, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _843 = abs(_841);
    float _845 = -_843;
    float _847 = _845 + 1.0;
    float _849 = abs(_841);
    float _851 = fma(_849, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _853 = _841 < 0.0;
    float _855 = float(_853);
    int _857 = as_type<int>(_847) + (-218103808);
    bool _859 = uint(_857) >= 1920991232u;
    float _861 = _768 + 0.5;
    float _863 = abs(_841);
    float _865 = fma(_863, _851, -0.212114393711090087890625);
    float _867 = _804 + 0.5;
    float _869 = abs(_841);
    float _871 = fma(_869, _865, 1.570728778839111328125);
    bool _873 = !_859;
    float _875 = _861;
    float _877 = _867;
    float _903;
    if (!_873)
    {
        int _879 = as_type<int>(_847);
        int _881 = as_type<int>(_847);
        int _883 = as_type<int>(_796);
        int _885 = 4304;
        int _887 = as_type<int>(_794);
        int _889;
        int _891;
        int _893;
        int _895;
        int _897;
        int _899;
        int _901;
        _102(_879, _881, _883, _885, _887, _889, _891, _893, _895, _897, _899, _901, out.gl_Position, out.gl_PointSize);
        _903 = as_type<float>(_899);
        _905 = true;
    }
    else
    {
        float _907 = rsqrt(_847);
        float _909 = _847 * _907;
        float _911 = _907 * 0.5;
        float _913 = -_909;
        float _915 = 0.0 + _913;
        float _917 = fma(_911, _915, 0.5);
        float _919 = fma(_909, _917, _909);
        float _921 = -_919;
        float _923 = 0.0 + _921;
        float _925 = fma(_919, _923, _847);
        float _927 = fma(_911, _925, _919);
        _903 = _927;
    }
    _905 = false;
    float _929 = _903;
    int _931 = _782;
    int _933 = 0;
    int _935 = _105(_931, _933, (*spvDescriptorSet0.support_buffer));
    int _937 = _469;
    int _939 = 0;
    int _941 = _105(_937, _939, (*spvDescriptorSet0.support_buffer));
    float4 _943 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_935, _941)), 0).xyzw;
    float _945 = _943.x;
    float _947 = _943.y;
    float _949 = _943.z;
    float _951 = _943.w;
    float _953 = _871 * _929;
    float _955 = _855 * 2.0;
    float _957 = _839 * 3.883221149444580078125;
    float _959 = floor(_479);
    float _961 = -_955;
    float _963 = fma(_953, _961, _953);
    float _965 = _957 * 0.15915493667125701904296875;
    float _967 = fma(_855, 3.1415927410125732421875, _963);
    float _969 = _965 * 6.283185482025146484375;
    float _971 = cos(_969);
    float _973 = _967 * 0.15915493667125701904296875;
    float _975 = _973 * 6.283185482025146484375;
    float _977 = sin(_975);
    float _979 = -_959;
    float _981 = _479 + _979;
    float _983 = _965 * 6.283185482025146484375;
    float _985 = sin(_983);
    float _987 = _977 * _971;
    float _989 = _977 * _985;
    uint _991 = as_type<uint>(half2(float2(_951, 0.0)));
    float _993 = -_500;
    float _995 = _993 + _945;
    float _997 = -_502;
    float _999 = _997 + _947;
    uint _1001 = extract_bits(_991, 0u, 8u);
    int _1003 = int(_1001) & 255;
    uint _1005 = extract_bits(_991, 8u, 8u);
    int _1007 = int(_1005) & 255;
    int _1009 = _1007 << 8;
    int _1011 = _1003 | _1009;
    float _1013 = fma(_981, _995, _500);
    float _1015 = fma(_981, _999, _502);
    bool _1017 = _1011 >= 32768;
    int _1019 = _1011 + (-1024);
    int _1021 = _1019;
    if (_1017)
    {
        int _1023 = ~_1011;
        int _1025 = _1023 + 33792;
        int _1027 = _1025 + 1;
        _1021 = _1027;
    }
    int _1029 = _1021;
    int _1031 = _1029 + 30719;
    float _1033 = float(_1031);
    float _1035 = fma(_1033, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1037 = abs(_1035);
    float _1039 = -_1037;
    float _1041 = _1039 + 1.0;
    float _1043 = abs(_1035);
    float _1045 = fma(_1043, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1047 = _1035 < 0.0;
    float _1049 = float(_1047);
    int _1051 = as_type<int>(_1041) + (-218103808);
    float _1053 = abs(_1035);
    float _1055 = fma(_1053, _1045, -0.212114393711090087890625);
    bool _1057 = uint(_1051) >= 1920991232u;
    float _1059 = -_504;
    float _1061 = _1059 + _949;
    float _1063 = abs(_1035);
    float _1065 = fma(_1063, _1055, 1.570728778839111328125);
    float _1067 = fma(_981, _1061, _504);
    bool _1069 = !_1057;
    float _1095;
    if (!_1069)
    {
        int _1071 = as_type<int>(_1041);
        int _1073 = as_type<int>(_947);
        int _1075 = as_type<int>(_1055);
        int _1077 = 5200;
        int _1079 = as_type<int>(_953);
        int _1081;
        int _1083;
        int _1085;
        int _1087;
        int _1089;
        int _1091;
        int _1093;
        _102(_1071, _1073, _1075, _1077, _1079, _1081, _1083, _1085, _1087, _1089, _1091, _1093, out.gl_Position, out.gl_PointSize);
        _1095 = as_type<float>(_1091);
        _1097 = true;
    }
    else
    {
        float _1099 = rsqrt(_1041);
        float _1101 = _1041 * _1099;
        float _1103 = _1099 * 0.5;
        float _1105 = -_1101;
        float _1107 = 0.0 + _1105;
        float _1109 = fma(_1103, _1107, 0.5);
        float _1111 = fma(_1101, _1109, _1101);
        float _1113 = -_1111;
        float _1115 = 0.0 + _1113;
        float _1117 = fma(_1111, _1115, _1041);
        float _1119 = fma(_1103, _1117, _1111);
        _1095 = _1119;
    }
    _1097 = false;
    float _1121 = _1095;
    float _1123 = in.m_48.x;
    float _1125 = in.m_48.y;
    float _1127 = in.m_48.z;
    float _1129 = _381 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1131 = in.m_55.x;
    float _1133 = in.m_65.x;
    float _1135 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1137 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1139 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1141 = _1131 * 6.283185482025146484375;
    float _1143 = fma(_1123, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1135);
    float _1145 = fma(_1123, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1137);
    float _1147 = fma(_1133, 6.0, _1141);
    float _1149 = fma(_1127, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1143);
    float _1151 = fma(_1123, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1139);
    float _1153 = fma(_1127, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1145);
    float _1155 = fma(_137, 0.0500000007450580596923828125, _1147);
    float _1157 = _1149 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1159 = fma(_1127, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1151);
    float _1161 = _1153 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1163 = in.m_67.x;
    float _1165 = in.m_67.y;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1169 = _1157 + _1167;
    float _1171 = _1159 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1175 = _1161 + _1173;
    float _1177 = _1155 * 0.15915493667125701904296875;
    float _1179 = _1169 * _1169;
    float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1183 = _1171 + _1181;
    float _1185 = _1177 * 6.283185482025146484375;
    float _1187 = sin(_1185);
    float _1189 = fma(_1175, _1175, _1179);
    float _1191 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1193 = fma(_1183, _1183, _1189);
    float _1195 = rsqrt(_1193);
    float _1197 = _1163 * _1163;
    float _1199 = _1187 * 0.20000000298023223876953125;
    float _1201 = fma(_1165, _1165, _1197);
    float _1203 = _1199 * 0.15915493667125701904296875;
    float _1205 = _1203 * 6.283185482025146484375;
    float _1207 = cos(_1205);
    float _1209 = _1191 * _1195;
    float _1211 = _1169 * _1209;
    float _1213 = _1175 * _1209;
    float _1215 = rsqrt(_1201);
    float _1217 = _1183 * _1209;
    float _1219 = -_1211;
    float _1221 = _1169 + _1219;
    float _1223 = -_1213;
    float _1225 = _1175 + _1223;
    float _1227 = -_1213;
    float _1229 = _1161 + _1227;
    float _1231 = -_1217;
    float _1233 = _1183 + _1231;
    float _1235 = _1221 * _1221;
    float _1237 = _1203 * 6.283185482025146484375;
    float _1239 = sin(_1237);
    float _1241 = -_1207;
    float _1243 = _1241 + 1.0;
    float _1245 = fma(_1225, _1225, _1235);
    float _1247 = fma(_1233, _1233, _1245);
    float _1249 = _1215 * _1163;
    float _1251 = _1215 * _1165;
    float _1253 = sqrt(_1247);
    float _1255 = _1249 * _1249;
    float _1257 = _1251 * _1243;
    float _1259 = -_1239;
    float _1261 = _1249 * _1259;
    float _1263 = fma(_1243, _1255, _1207);
    float _1265 = -_1257;
    float _1267 = _1249 * _1265;
    float _1269 = _1251 * _1239;
    float _1271 = fma(_1251, _1257, _1207);
    float _1273 = _1013 * _1261;
    float _1275 = _1015 * _1263;
    float _1277 = _1015 * _1267;
    float _1279 = -_1273;
    float _1281 = fma(_1015, _1269, _1279);
    float _1283 = fma(_1013, _1267, _1275);
    float _1285 = fma(_1013, _1271, _1277);
    float _1287 = _1195 * _1253;
    float _1289 = fma(_1067, _1207, _1281);
    float _1291 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1293 = fma(_1067, _1261, _1285);
    float _1295 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1297 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1289);
    float _1299 = _1287 * _1291;
    float _1301 = -_1269;
    float _1303 = fma(_1067, _1301, _1283);
    float _1305 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1293);
    float _1307 = _1129 * _1287;
    float _1309 = _1297 * _1299;
    float _1311 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1303);
    float _1313 = _1287 * _1295;
    float _1315 = _1305 * _1307;
    float _1317 = _1309 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1319 = _1309 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1321 = _1311 * _1313;
    bool _1323 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1325 = isnan(0.5);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1331 = _1327 || _1329;
    float _1333 = fma(_1315, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1317);
    float _1335 = fma(_1315, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1319);
    float _1337 = -_1321;
    float _1339 = fma(_1337, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1333);
    float _1341 = -_1321;
    float _1343 = fma(_1341, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1335);
    float _1345 = _1171 + _1339;
    float _1347 = _1161 + _1343;
    float _1349 = _1309 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1351 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1353 = _1345 + _1351;
    float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1357 = _1347 + _1355;
    float _1359 = fma(_1315, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1349);
    float _1361 = _1353 * _1353;
    float _1363 = -_1321;
    float _1365 = fma(_1363, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1359);
    float _1367 = fma(_1357, _1357, _1361);
    float _1369 = _1157 + _1365;
    float _1371 = sqrt(_1367);
    bool _1373 = _1371 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1375 = _1361;
    float _1377 = _1365;
    float _1379 = _1321;
    float _1381 = _1371;
    float _1383 = _1357;
    float _1385 = _1161;
    if (!_1373)
    {
        _1375 = _1347;
    }
    float _1387 = _1375;
    float _1389 = _1387;
    if (!_1373)
    {
        _1377 = _1345;
    }
    float _1391 = _1377;
    float _1393 = _1391;
    if (!_1373)
    {
        _1379 = _1369;
    }
    float _1395 = _1379;
    bool _1397 = !_1373;
    float _1399 = _1395;
    if (!_1397)
    {
        float _1401 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1403 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1405 = _1371 + _1403;
        float _1407 = _1369 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1409 = rsqrt(_1367);
        float _1411 = _1405 * _1401;
        float _1413 = _1411 * 0.15915493667125701904296875;
        float _1415 = _1413 * 6.283185482025146484375;
        float _1417 = cos(_1415);
        float _1419 = _1413 * 6.283185482025146484375;
        float _1421 = sin(_1419);
        float _1423 = _1417 + (-1.0);
        float _1425 = _1423 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1427 = fma(_1421, _1407, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1429 = fma(_1369, _1417, _1425);
        float _1431 = _1409 * _1427;
        float _1433 = fma(_1357, _1431, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1435 = fma(_1353, _1431, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1399 = _1429;
        _1393 = _1435;
        _1389 = _1433;
        _1381 = _1409;
    }
    float _1437 = _1399;
    float _1439 = _1393;
    float _1441 = _1389;
    float _1443 = _1381;
    float _1445 = -_1211;
    float _1447 = _1445 + _1437;
    float _1449 = -_1217;
    float _1451 = _1449 + _1439;
    float _1453 = -_1213;
    float _1455 = _1453 + _1441;
    float _1457 = -_1211;
    float _1459 = _1157 + _1457;
    float _1461 = -_1217;
    float _1463 = _1171 + _1461;
    float _1465 = _1447;
    float _1467 = _1455;
    float _1469 = _1451;
    float _1471 = _1443;
    if (!_1331)
    {
        float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1475 = _1459 + _1473;
        float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1479 = _1229 + _1477;
        float _1481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1483 = -_1157;
        float _1485 = _1483 + _1437;
        float _1487 = _1475 * _1475;
        float _1489 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1491 = _1463 + _1489;
        float _1493 = -_1171;
        float _1495 = _1493 + _1439;
        float _1497 = fma(_1479, _1479, _1487);
        float _1499 = 1.0 / _1287;
        float _1501 = fma(_1491, _1491, _1497);
        float _1503 = sqrt(_1501);
        float _1505 = precise::min(_1503, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1507 = _1505 * _1481;
        float _1509 = -_1161;
        float _1511 = _1509 + _1441;
        float _1513 = _1507 * _1499;
        float _1515 = fma(_1511, _1513, _1229);
        float _1517 = fma(_1485, _1513, _1459);
        float _1519 = fma(_1495, _1513, _1463);
        _1465 = _1517;
        _1467 = _1515;
        _1469 = _1519;
        _1471 = _1513;
    }
    float _1521 = _1465;
    float _1523 = _1467;
    float _1525 = _1469;
    float _1527 = _1471;
    float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1531 = _1521 + _1529;
    float _1533 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1535 = _1523 + _1533;
    float _1537 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1539 = _1525 + _1537;
    float _1541 = _1531 * _1531;
    float _1543 = fma(_1535, _1535, _1541);
    float _1545 = fma(_1539, _1539, _1543);
    float _1547 = rsqrt(_1545);
    float _1549 = sqrt(_1545);
    float _1551 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1553 = _1535 * _1551;
    float _1555 = _1539 * _1551;
    float _1557 = _1553 * _1553;
    float _1559 = _1555 * _1555;
    float _1561 = _1557 + _1559;
    float _1563 = sqrt(_1561);
    bool _1565 = _1563 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1567 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1569 = _1563 + _1567;
    float _1571 = _1539;
    float _1573 = _1561;
    float _1575 = _1569;
    float _1577 = _1527;
    float _1579 = _1531;
    float _1581 = _1551;
    if (_1565)
    {
        float _1583 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1571 = _1583;
    }
    float _1585 = _1571;
    if (_1565)
    {
        float _1587 = rsqrt(_1561);
        _1573 = _1587;
    }
    float _1589 = _1573;
    if (_1565)
    {
        float _1591 = _1569 * _1585;
        _1575 = _1591;
    }
    float _1593 = _1575;
    if (_1565)
    {
        float _1595 = _1593 * 0.15915493667125701904296875;
        _1577 = _1595;
    }
    float _1597 = _1577;
    float _1599 = _1547;
    if (_1565)
    {
        float _1601 = _1597 * 6.283185482025146484375;
        float _1603 = sin(_1601);
        _1599 = _1603;
    }
    float _1605 = _1599;
    float _1607 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1609 = precise::max(0.0, _1607);
    float _1611 = _1585;
    if (_1565)
    {
        float _1613 = _1597 * 6.283185482025146484375;
        float _1615 = cos(_1613);
        _1611 = _1615;
    }
    float _1617 = _1611;
    float _1619 = -_1551;
    float _1621 = -_1609;
    float _1623 = fma(_1531, _1619, _1621);
    float _1625 = _1623;
    if (_1565)
    {
        float _1627 = _1623 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1579 = _1627;
    }
    float _1629 = _1579;
    float _1631 = _1605;
    float _1633 = _1629;
    if (_1565)
    {
        float _1635 = fma(_1605, _1629, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1631 = _1635;
    }
    float _1637 = _1631;
    float _1639 = _1637;
    if (!_1565)
    {
        _1633 = _1557;
    }
    float _1641 = _1633;
    float _1643 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1645 = _1641;
    if (_1565)
    {
        float _1647 = _1617 + (-1.0);
        _1581 = _1647;
    }
    float _1649 = _1581;
    float _1651 = _1649;
    if (_1565)
    {
        float _1653 = _1589 * _1637;
        _1383 = _1653;
    }
    float _1655 = _1383;
    if (!_1565)
    {
        _1639 = _1553;
    }
    float _1657 = _1639;
    float _1659 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1643);
    float _1661 = _1657;
    if (_1565)
    {
        float _1663 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1385 = _1663;
    }
    float _1665 = _1385;
    float _1667 = _1665;
    if (_1565)
    {
        float _1669 = _1553 * _1655;
        _1661 = _1669;
    }
    float _1671 = _1661;
    if (!_1565)
    {
        _1651 = _1555;
    }
    float _1673 = _1651;
    float _1675 = _1673;
    if (_1565)
    {
        float _1677 = _1555 * _1655;
        _1675 = _1677;
    }
    float _1679 = _1675;
    if (_1565)
    {
        float _1681 = fma(_1623, _1617, _1665);
        _1625 = _1681;
    }
    float _1683 = _1625;
    if (_1565)
    {
        float _1685 = _1671 * _1671;
        _1645 = _1685;
    }
    float _1687 = _1645;
    if (!_1565)
    {
        _1667 = _1559;
    }
    float _1689 = _1667;
    float _1691 = _1689;
    if (_1565)
    {
        float _1693 = _1679 * _1679;
        _1691 = _1693;
    }
    float _1695 = _1691;
    float _1697 = fma(_1683, _1683, _1687);
    float _1699 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1701 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1659);
    float _1703 = _1697 + _1695;
    float _1705 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1699);
    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1709 = fma(_1549, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1707);
    float _1711 = precise::clamp(_1709, 0.0, 1.0);
    float _1713 = rsqrt(_1703);
    float _1715 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1705);
    float _1717 = -_1711;
    float _1719 = _1717 + 1.0;
    float _1721 = fma(_1229, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1723 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1725 = _1715 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1727 = _1701 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1729 = abs(_1719);
    float _1731 = log2(_1729);
    float _1733 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1735 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1737 = fma(_1463, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1739 = -_1733;
    float _1741 = fma(_1739, _1723, 1.0);
    float _1743 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1745 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1735);
    float _1747 = floor(_1721);
    float _1749 = _1713 * _1671;
    float _1751 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1743);
    float _1753 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1745);
    float _1755 = _1713 * _1683;
    float _1757 = _1713 * _1679;
    float _1759 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1751);
    float _1761 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1763 = floor(_1737);
    float _1765 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1767 = _1759 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1769 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1771 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1773 = -_1765;
    float _1775 = fma(_1755, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1773);
    float _1777 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1769);
    float _1779 = log2(_1741);
    float _1781 = -_1757;
    float _1783 = fma(_1781, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1775);
    float _1785 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1787 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1777);
    float _1789 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1791 = fma(_1783, -0.5, 0.5);
    float _1793 = fma(_1783, 0.5, 0.5);
    float _1795 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1785);
    float _1797 = exp2(_1771);
    float _1799 = -_1747;
    float _1801 = _1721 + _1799;
    float _1803 = -_1763;
    float _1805 = _1737 + _1803;
    float _1807 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1787);
    float _1809 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1789);
    float _1811 = _1755 + 1.0;
    float _1813 = fma(_1793, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float2 _5285 = float2(_1801, _1805);
    float _1815 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5285, float2(0.0), isnan(_5285)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5285, float2(0.0), isnan(_5285)), level(0.0)).x;
    float _1817 = 1.0 / _1807;
    float _1819 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1809);
    float _1821 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1795);
    float _1823 = fma(_1793, _1813, -0.212114393711090087890625);
    float _1825 = _1779 * 0.693147182464599609375;
    float _1827 = fma(_1793, _1823, 1.570728778839111328125);
    float _1829 = sqrt(_1791);
    float _1831 = -_1755;
    float _1833 = fma(_1797, _1811, _1831);
    float _1835 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1819);
    float _1837 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1821);
    float _1839 = _1825 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1841 = _1835 * _1817;
    float _1843 = _1837 * _1817;
    float _1845 = fma(_1833, 0.5, 0.5);
    float _1847 = fma(_1841, 0.5, 0.5);
    float _1849 = fma(_1843, -0.5, 0.5);
    float _1851 = _1829 * 0.636619746685028076171875;
    float3 _5354 = float3(_1847, _1849, _1839);
    float _1853 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5354, float3(0.0), isnan(_5354)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5354, float3(0.0), isnan(_5354)), level(0.0)).x;
    float _1855 = -_1827;
    float _1857 = fma(_1851, _1855, 1.0);
    float3 _5370 = float3(_1847, _1849, _1839);
    float4 _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5370, float3(0.0), isnan(_5370)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5370, float3(0.0), isnan(_5370)), level(0.0)).xyzw;
    float _1861 = _1859.x;
    float _1863 = _1859.y;
    float _1865 = _1859.z;
    float _1867 = _1859.w;
    float2 _5386 = float2(_1857, _1845);
    float3 _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5386, float2(0.0), isnan(_5386)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5386, float2(0.0), isnan(_5386)), level(0.0)).xyz;
    float _1873 = _1871.x;
    float _1875 = _1871.y;
    float _1877 = _1871.z;
    float _1879 = _1459 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1881 = _1459 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1883 = _1065 * _1121;
    float _1885 = _1049 * 2.0;
    float _1887 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1879);
    float _1889 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1881);
    float _1891 = -_841;
    float _1893 = _1891 + _1035;
    float _1895 = -_1885;
    float _1897 = fma(_1883, _1895, _1883);
    float _1899 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1887);
    float _1901 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1889);
    bool _1903 = _1303 != 0.0;
    bool _1905 = isnan(_1303);
    bool _1907 = _1903 || _1905;
    bool _1909 = isnan(0.0);
    bool _1911 = _1907 || _1909;
    float _1913 = fma(_1049, 3.1415927410125732421875, _1897);
    float _1915 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1917 = _1033 * 3.883221149444580078125;
    float _1919 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1921 = 1.0 / _1915;
    float _1923 = _1913 * 0.15915493667125701904296875;
    float _1925 = _1919 + _1915;
    float _1927 = _1917 * 0.15915493667125701904296875;
    bool _1929 = _1293 == 0.0;
    bool _1931 = !_1911;
    bool _1933 = _1929 && _1931;
    out.m_69.x = _861;
    out.m_69.y = _800;
    out.m_69.z = _806;
    out.m_69.w = _867;
    bool _1935 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1937 = isnan(0.5);
    bool _1939 = _1935 || _1937;
    bool _1941 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1943 = _1939 || _1941;
    float _1945 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1947 = _1927 * 6.283185482025146484375;
    float _1949 = cos(_1947);
    bool _1951 = _1289 == 0.0;
    bool _1953 = _1951 && _1933;
    float _1955 = in.m_65.w;
    float _1957 = _1925 * _1921;
    float _1959 = _1957 * 0.5;
    float _1961 = _1923 * 6.283185482025146484375;
    float _1963 = sin(_1961);
    float _1965 = fma(_981, _1893, _841);
    float _1967 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1969 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1967);
    float _1971 = _1965 * _1263;
    float _1973 = 1.0 / _1969;
    float _1975 = _1927 * 6.283185482025146484375;
    float _1977 = sin(_1975);
    float _1979 = -_987;
    float _1981 = fma(_1963, _1949, _1979);
    out.m_71.w = _1955;
    float _1983 = fma(_981, _1981, _987);
    float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1987 = _1973 * _1985;
    float _1989 = fma(_1983, _1267, _1971);
    float _1991 = _1983 * _1261;
    float _1993 = _1965 * _1267;
    float _1995 = abs(_1987);
    float _1997 = log2(_1995);
    float _1999 = _1807 * 0.5;
    float _2001 = -_1991;
    float _2003 = fma(_1965, _1269, _2001);
    float _2005 = fma(_1983, _1271, _1993);
    float _2007 = -_989;
    float _2009 = fma(_1963, _1977, _2007);
    float _2011 = fma(_981, _2009, _989);
    float _2013 = exp2(_1945);
    float _2015 = -_1269;
    float _2017 = fma(_2011, _2015, _1989);
    float _2019 = fma(_2011, _1207, _2003);
    float _2021 = fma(_2011, _1261, _2005);
    float _2023 = fma(_1303, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2017);
    float _2025 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2027 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2019);
    float _2029 = _2021;
    int _2031 = as_type<int>(_2003);
    float _2033 = _1987;
    if (_1953)
    {
        _875 = _2019;
    }
    float _2035 = _875;
    float _2037 = _2035;
    if (!_1953)
    {
        float _2039 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2021);
        _2029 = _2039;
    }
    float _2041 = _2029;
    if (_1953)
    {
        _2031 = as_type<int>(_2023);
    }
    int _2043 = _2031;
    float _2045 = exp2(_2025);
    int _2047 = _2043;
    if (!_1953)
    {
        _2047 = as_type<int>(_2023);
    }
    int _2049 = _2047;
    float _2051 = _1953 ? _2019 : _2027;
    float _2053 = -_2013;
    float _2055 = _2053 + 1.0;
    float _2057 = _1953 ? _2017 : as_type<float>(_2049);
    float _2059 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1953)
    {
        _2037 = _2027;
    }
    float _2061 = _2037;
    float _2063 = _2057 * _2057;
    if (_1953)
    {
        _877 = _2017;
    }
    float _2065 = _877;
    out.m_73.x = (*spvDescriptorSet0.vp_c10)._m0[8].x;
    out.m_73.y = (*spvDescriptorSet0.vp_c10)._m0[9].x;
    out.m_73.z = (*spvDescriptorSet0.vp_c10)._m0[10].x;
    float _2067 = _2065;
    if (!_1953)
    {
        _2067 = _2023;
    }
    float _2069 = _2067;
    float _2071 = fma(_2051, _2051, _2063);
    float _2073 = _2061 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2075 = fma(_2045, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2077 = precise::clamp(_2075, 0.0, 1.0);
    float _2079 = _2061 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2081 = in.m_75.x;
    bool _2083 = _1987 <= 8000.0;
    bool _2085 = isnan(_1987);
    bool _2087 = _2083 || _2085;
    bool _2089 = isnan(8000.0);
    bool _2091 = _2087 || _2089;
    float _2093 = float(_2091);
    float _2095 = rsqrt(_2071);
    float _2097 = fma(_2077, -2.0, 3.0);
    float _2099 = _2077 * _2077;
    bool _2101 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2103 = isnan(_1549);
    bool _2105 = _2101 || _2103;
    bool _2107 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2109 = _2105 || _2107;
    float _2111 = _2061 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2113 = fma(_2041, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2073);
    float _2115 = _2099 * _2097;
    float _2117 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2119 = fma(_2041, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2079);
    float _2121 = fma(_2041, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2111);
    float _2123 = -_2115;
    float _2125 = _2123 + 1.0;
    float _2127 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2117);
    float _2129 = _2111;
    float _2131 = _2069;
    if (!_1943)
    {
        _2129 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2133 = _2129;
    float _2135 = -_2069;
    float _2137 = fma(_2135, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2113);
    float _2139 = fma(_2125, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2115);
    float _2141 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2127);
    float _2143 = _2051 * _2095;
    float _2145 = _2057 * _2095;
    float _2147 = _2133;
    if (!_1943)
    {
        float _2149 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2151 = _2133 + _2149;
        _2147 = _2151;
    }
    float _2153 = _2147;
    float _2155 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2141);
    float _2157 = -(*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2159 = _2143 * _2157;
    float _2161 = -(*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2163 = _2143 * _2161;
    float _2165 = -(*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2167 = _2143 * _2165;
    float _2169 = _1993;
    float _2171 = _2167;
    float _2173 = _2163;
    if (!_1943)
    {
        float _2175 = 1.0 / _2153;
        _2169 = _2175;
    }
    float _2177 = _2169;
    float _2179 = -_2145;
    float _2181 = fma(_2179, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2159);
    float _2183 = -_2145;
    float _2185 = fma(_2183, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2163);
    float _2187 = -_2145;
    float _2189 = fma(_2187, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2167);
    float _2191 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2193 = _2155 + _2191;
    float _2195 = _2093 * _2139;
    float _2197 = fma(_1837, -0.5, _1999);
    float _2199 = _1835 + _1807;
    out.m_77.x = _2181;
    out.m_77.y = _2185;
    out.m_77.z = _2189;
    float _2201 = _1807 + _2193;
    float _2203 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2205 = _2199 * 0.5;
    out.gl_Position.x = _1835;
    out.gl_Position.y = _1837;
    out.gl_Position.z = _2193;
    out.gl_Position.w = _1807;
    float _2207 = _2201 * 0.5;
    float _2209 = -_2069;
    float _2211 = fma(_2209, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2119);
    float _2213 = -_2069;
    float _2215 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2121);
    float _2217 = _2189;
    float _2219 = _2193;
    if (!_1943)
    {
        _2131 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _2221 = _2131;
    float _2223 = _2221;
    if (!_1943)
    {
        float _2225 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2227 = _1987 + _2225;
        _2171 = _2227;
    }
    float _2229 = _2171;
    out.m_79.x = _2205;
    out.m_79.y = _2197;
    out.m_79.z = _2207;
    out.m_79.w = _1807;
    if (!_1943)
    {
        float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2233 = _1987 + _2231;
        _2033 = _2233;
    }
    float _2235 = _2033;
    out.m_81.x = _2137;
    out.m_81.y = _2211;
    out.m_81.z = _2215;
    float _2237 = _2235;
    float _2239 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (_1943)
    {
        _2173 = 1.0;
    }
    float _2241 = _2173;
    float _2243 = _2241;
    if (!_1943)
    {
        float _2245 = _2229 * _2177;
        float _2247 = precise::clamp(_2245, 0.0, 1.0);
        _2243 = _2247;
    }
    float _2249 = _2243;
    if (!_2109)
    {
        _2217 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2251 = _2217;
    float _2253 = _2251;
    float _2255 = _2251;
    if (!_1943)
    {
        float _2257 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2259 = _2221 + _2257;
        _2219 = _2259;
    }
    float _2261 = _2219;
    if (!_2109)
    {
        _2223 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2263 = _2223;
    float _2265 = _2185;
    float _2267 = _2263;
    float _2269 = _2263;
    if (!_1943)
    {
        float _2271 = 1.0 / _2261;
        _2265 = _2271;
    }
    float _2273 = _2265;
    if (!_1943)
    {
        float _2275 = _2235 * _2273;
        float _2277 = precise::clamp(_2275, 0.0, 1.0);
        _2237 = _2277;
    }
    float _2279 = _2237;
    float _2281 = -_1815;
    float _2283 = _2281 + 1.0;
    float _2285 = _2283 * _2203;
    float _2287 = precise::clamp(_2285, 0.0, 1.0);
    float _2289 = -_2287;
    float _2291 = fma(_2289, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2293 = _1861;
    if (_1943)
    {
        _2239 = 1.0;
    }
    float _2295 = _2239;
    float _2297 = _2295;
    if (!_1943)
    {
        float _2299 = -_2279;
        float _2301 = _2299 + 1.0;
        _2297 = _2301;
    }
    float _2303 = _2297;
    float _2305 = _2291 * _2081;
    float _2307 = _2249 * _2303;
    float _2309 = _2305 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_83.x = _2309;
    float _2311 = _2059 * _1853;
    float _2313 = -_2059;
    float _2315 = _2313 + 1.0;
    float _2317 = _1867 * _2311;
    float _2319 = _1867 * _2315;
    float _2321 = _1877 * _2311;
    float _2323 = fma(_1873, _2317, _1861);
    float _2325 = fma(_1875, _2317, _1863);
    float _2327 = _2307 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2329 = fma(_1867, _2321, _1865);
    float _2331 = _2307;
    float _2333 = _2325;
    float _2335 = _2323;
    if (!_2109)
    {
        _2293 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2337 = _2293;
    float _2339 = _2337;
    float _2341 = _2337;
    if (!_2109)
    {
        _2331 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2343 = _2331;
    out.m_85.x = _2323;
    out.m_85.y = _2325;
    out.m_85.z = _2329;
    out.m_85.w = _2319;
    float _2345 = _2343;
    float _2347 = _2343;
    if (!_2109)
    {
        _2333 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2349 = _2333;
    float _2351 = _2349;
    float _2353 = _2349;
    if (!_2109)
    {
        _2335 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2355 = _2335;
    bool _2357 = !_2109;
    float _2359 = _2355;
    float _2361 = _2355;
    if (!_2357)
    {
        bool _2363 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2365 = isnan(_1549);
        bool _2367 = _2363 || _2365;
        bool _2369 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2371 = _2367 || _2369;
        if (!_2371)
        {
            float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2375 = _1549 + _2373;
            float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2379 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2377;
            float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2383 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2385 = 1.0 / _2379;
            float _2387 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2389 = _2387 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2403 = _2375 * _2385;
            float _2405 = precise::clamp(_2403, 0.0, 1.0);
            float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2411 = fma(_2405, _2383, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2413 = fma(_2405, _2409, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2415 = fma(_2405, _2389, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2417 = fma(_2405, _2393, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2419 = fma(_2405, _2397, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2421 = fma(_2405, _2401, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2255 = _2415;
            _2353 = _2419;
            _2341 = _2411;
            _2347 = _2417;
            _2269 = _2413;
            _2361 = _2421;
            _2423 = true;
        }
        else
        {
            bool _2425 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2427 = isnan(_1549);
            bool _2429 = _2425 || _2427;
            bool _2431 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2433 = _2429 || _2431;
            if (!_2433)
            {
                _2339 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2435 = _2339;
            _2341 = _2435;
            if (!_2433)
            {
                _2253 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2437 = _2253;
            _2255 = _2437;
            if (!_2433)
            {
                _2267 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2439 = _2267;
            _2269 = _2439;
            if (!_2433)
            {
                _2345 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2441 = _2345;
            _2347 = _2441;
            if (!_2433)
            {
                _2351 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2443 = _2351;
            _2353 = _2443;
            if (!_2433)
            {
                _2359 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2445 = _2359;
            bool _2447 = !_2433;
            _2361 = _2445;
            if (!_2447)
            {
                bool _2449 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2451 = isnan(_1549);
                bool _2453 = _2449 || _2451;
                bool _2455 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2457 = _2453 || _2455;
                if (!_2457)
                {
                    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2461 = _1549 + _2459;
                    float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2465 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2463;
                    float _2467 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2469 = _2467 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2471 = 1.0 / _2465;
                    float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2483 = _2481 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2489 = _2461 * _2471;
                    float _2491 = precise::clamp(_2489, 0.0, 1.0);
                    float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2497 = fma(_2491, _2469, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2499 = fma(_2491, _2495, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2501 = fma(_2491, _2475, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2503 = fma(_2491, _2479, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2505 = fma(_2491, _2483, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2507 = fma(_2491, _2487, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2255 = _2501;
                    _2353 = _2505;
                    _2341 = _2497;
                    _2347 = _2503;
                    _2269 = _2499;
                    _2361 = _2507;
                    _2423 = true;
                }
                else
                {
                    _2255 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2353 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2341 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2347 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2269 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2361 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2423 = false;
    float _2509 = _2255;
    float _2511 = _2353;
    float _2513 = _2341;
    float _2515 = _2347;
    float _2517 = _2269;
    float _2519 = _2361;
    float _2521 = fma(_2211, -0.5, 0.5);
    float _2523 = precise::clamp(_2521, 0.0, 1.0);
    float _2525 = -_2509;
    float _2527 = _2525 + _2511;
    float _2529 = _2327 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2531 = -_2513;
    float _2533 = _2531 + _2515;
    out.m_87.x = 0.0;
    float _2535 = fma(_2523, _2527, _2509);
    float _2537 = -_2517;
    float _2539 = _2537 + _2519;
    out.m_51.x = _2529;
    float _2541 = fma(_2523, _2533, _2513);
    float _2543 = _2535 * 0.586610972881317138671875;
    bool _2545 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2547 = fma(_2523, _2539, _2517);
    float _2549 = fma(_2541, 0.298911988735198974609375, _2543);
    bool _2551 = _2249 > 0.0;
    bool _2553 = isnan(_2249);
    bool _2555 = _2551 || _2553;
    bool _2557 = isnan(0.0);
    bool _2559 = _2555 || _2557;
    float _2561 = fma(_2547, 0.114477999508380889892578125, _2549);
    bool _2563 = _2303 <= 0.0;
    bool _2565 = !_2559;
    bool _2567 = _2563 || _2565;
    float _2569 = -_2561;
    float _2571 = _2541 + _2569;
    float _2573 = -_2561;
    float _2575 = _2535 + _2573;
    float _2577 = -_2561;
    float _2579 = _2547 + _2577;
    float _2581 = fma(_2571, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2561);
    float _2583 = fma(_2575, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2561);
    float _2585 = fma(_2579, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2561);
    bool _2587 = !_2545;
    if (!_2587)
    {
        float _2589 = -_1521;
        float _2591 = _2589 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2593 = -_1523;
        float _2595 = _2593 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2597 = -_1525;
        float _2599 = _2597 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2601 = _2591 * _2591;
        float _2603 = fma(_2595, _2595, _2601);
        float _2605 = fma(_2599, _2599, _2603);
        float _2607 = sqrt(_2605);
        float _2609 = rsqrt(_2605);
        float _2611 = -_2607;
        float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2615 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2617 = precise::clamp(_2615, 0.0, 1.0);
        float _2619 = _2595 * _2609;
        float _2621 = _2591 * _2609;
        float _2623 = abs(_2617);
        float _2625 = log2(_2623);
        float _2627 = _2599 * _2609;
        float _2629 = _2619 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2631 = _2211 * _2621;
        float _2633 = -_2621;
        float _2635 = -_2629;
        float _2637 = fma(_2633, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2635);
        float _2639 = fma(_2137, _2619, _2631);
        float _2641 = -_2627;
        float _2643 = fma(_2641, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2637);
        float _2645 = fma(_2215, _2627, _2639);
        float _2647 = precise::clamp(_2645, 0.0, 1.0);
        float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2651 = _2643 + _2649;
        float _2653 = _2625 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2655 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2657 = precise::clamp(_2655, 0.0, 1.0);
        float _2659 = exp2(_2653);
        float _2661 = _2659 * _2657;
        float _2663 = _2647 * _2661;
        float _2665 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2667 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2669 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2665;
        out.m_87.y = _2667;
        out.m_87.z = _2669;
    }
    out.m_89.x = _2581;
    out.m_89.y = _2583;
    out.m_89.z = _2585;
    if (!_2567)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2671 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2671;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2423 = false;
    bool _1097 = false;
    bool _905 = false;
    bool _445 = false;
    bool _297 = false;
    bool _189 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_48.w;
    float _111 = trunc(_109);
    int _113 = int(_111);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _123 = 0;
    if (!_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2727 = as_type<float>(_127);
        out.gl_Position.z = _2727;
    }
    if (!_117)
    {
        return out;
    }
    float _131 = in.m_53.w;
    float _133 = float(_113);
    float _135 = -_131;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_131);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    bool _149 = _137 >= _133;
    bool _151 = !_147;
    bool _153 = _149 || _151;
    float _155 = _131;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _129 = as_type<int>(_159);
    }
    int _161 = _129;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2791 = as_type<float>(_161);
        out.gl_Position.z = _2791;
    }
    if (_153)
    {
        return out;
    }
    float _163 = 1.0 / _133;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _137 * _163;
    bool _169 = !_165;
    float _187;
    if (!_169)
    {
        float _171 = in.m_55.x;
        float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _179 = _177 * _173;
        float _181 = floor(_179);
        float _183 = -_181;
        float _185 = _179 + _183;
        _187 = _185;
        _189 = true;
    }
    else
    {
        _187 = _167;
    }
    _189 = false;
    float _191 = _187;
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _195 = _191 + _193;
    bool _197 = _191 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _199 = isnan(_191);
    bool _201 = _197 || _199;
    bool _203 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _205 = _201 || _203;
    float _207 = float(_205);
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _209;
    bool _213 = _191 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _215 = isnan(_191);
    bool _217 = _213 || _215;
    bool _219 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _221 = _217 || _219;
    float _223 = float(_221);
    float _225 = -_207;
    float _227 = _225 + 1.0;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _229;
    float _233 = 1.0 / _211;
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _237 = _223 * _227;
    float _239 = -_223;
    float _241 = _239 + 1.0;
    float _243 = _195 * _233;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _245;
    float _249 = fma(_231, _243, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _251;
    float _255 = fma(_247, _243, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _257 = _249 * _237;
    float _259 = fma(_253, _243, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _261 = _255 * _237;
    float _263 = _259 * _237;
    float _265 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[143].x, _257);
    float _267 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[143].y, _263);
    float _269 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[143].z, _261);
    float _271 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[144].x, _265);
    float _273 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[144].y, _267);
    float _275 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[144].z, _269);
    bool _277 = !_235;
    float _295;
    if (!_277)
    {
        float _279 = in.m_55.x;
        float _281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _283 = _279 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _287 = _285 * _281;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _295 = _293;
        _297 = true;
    }
    else
    {
        _295 = _167;
    }
    _297 = false;
    float _299 = _295;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _303 = _299 + _301;
    float _305 = in.m_57.x;
    float _307 = in.m_57.y;
    float _309 = in.m_57.z;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _315 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _317 = isnan(_299);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _331 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _333 = isnan(_299);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _343;
    bool _347 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _349 = isnan(_299);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = 1.0 / _313;
    float _361 = -_325;
    float _363 = _361 + 1.0;
    bool _365 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _367 = _341 * _363;
    float _369 = -_341;
    float _371 = _369 + 1.0;
    float _373 = 1.0 / _329;
    float _375 = _345 * _359;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _381 = _271 * _305;
    float _383 = fma(_375, _303, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _385 = _379 * _373;
    float _387 = _383 * _367;
    float _389 = -_357;
    float _391 = _389 + 1.0;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _395 = _299 + _393;
    float _397 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[115].x, _387);
    float _399 = _325 * _391;
    float _401 = fma(_385, _395, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _405 = fma(_401, _399, _397);
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _409 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[117].x, _405);
    float _413 = _273 * _307;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _417 = _407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = _411 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _421 = _415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = _275 * _309;
    out.m_59.x = _409;
    out.m_59.y = _421;
    out.m_59.z = _417;
    out.m_59.w = _419;
    bool _425 = !_365;
    float _443;
    if (!_425)
    {
        float _427 = in.m_55.x;
        float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _431 = _427 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _433 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[11].w, _137);
        float _435 = _433 * _429;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _443 = _441;
        _445 = true;
    }
    else
    {
        _443 = _167;
    }
    _445 = false;
    float _447 = _443;
    int _449 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _451 = _449;
    int _453 = 0;
    int _455 = _104(_451, _453, (*spvDescriptorSet0.support_buffer));
    float _457 = abs(_167);
    float _459 = log2(_457);
    float _461 = in.m_61.z;
    float _463 = _459 * 0.5;
    float _465 = exp2(_463);
    float _467 = trunc(_461);
    int _469 = int(_467);
    float _471 = 0.0 + _465;
    float _473 = precise::clamp(_471, 0.0, 1.0);
    int _475 = _455 + (-1);
    float _477 = float(_475);
    float _479 = _473 * _477;
    float _481 = trunc(_479);
    int _483 = int(_481);
    int _485 = _483;
    int _487 = 0;
    int _489 = _105(_485, _487, (*spvDescriptorSet0.support_buffer));
    int _491 = _469;
    int _493 = 0;
    int _495 = _105(_491, _493, (*spvDescriptorSet0.support_buffer));
    float4 _498 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_489, _495)), 0).xyzw;
    float _500 = _498.x;
    float _502 = _498.y;
    float _504 = _498.z;
    float _506 = _498.w;
    float _508 = in.m_55.x;
    float _510 = in.m_55.y;
    float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _516 = _514 != 0;
    float _518 = in.m_61.y;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _522 = _520 != 0;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _528 = in.m_55.w;
    float _530 = 1.0 / _526;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _534 = _532 != 0;
    float _536 = in.m_61.x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _540 = 0.0;
    if (_516)
    {
        float _542 = in.m_55.x;
        _540 = _542;
    }
    float _544 = _540;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _548 = _546 != 0;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _554 = _552 != 0;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _556;
    float _560 = 0.0;
    if (_522)
    {
        float _562 = in.m_55.z;
        _560 = _562;
    }
    float _564 = _560;
    float _566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _568 = _508 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _570 = _510 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _572 = _510 > 0.5;
    bool _574 = _572 && _548;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _578 = -_550;
    float _580 = fma(_568, 2.0, _578);
    float _582 = fma(_570, -2.0, _538);
    float _584 = _558 * _530;
    float _586 = _550;
    float _588 = _570;
    float _590 = _584;
    if (!_534)
    {
        float _592 = in.m_55.z;
        _586 = _592;
    }
    float _594 = _586;
    float _596 = -_518;
    float _598 = _596 + 1.0;
    bool _600 = _528 > 0.5;
    bool _602 = _600 && _554;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _606 = _447 + _604;
    float _608 = -_137;
    float _610 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[76].x, _580);
    int _612 = _602 ? as_type<int>(_598) : as_type<int>(_518);
    float _614 = fma(_584, _606, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _616 = _612;
    if (!_534)
    {
        _588 = _510;
    }
    float _618 = _588;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _622 = false;
    float _624 = _618;
    if (_516)
    {
        bool _626 = _544 > 0.5;
        _622 = _626;
    }
    bool _628 = _622;
    float _630 = _574 ? _598 : _518;
    float _632 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[78].z, _620);
    float _634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_534)
    {
        _624 = _508;
    }
    float _636 = _624;
    float _638 = _512 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _640 = fma(_638, _630, -0.5);
    bool _642 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _644 = isnan(_447);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _656 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _658 = isnan(_447);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[83].z, _576);
    bool _670 = false;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (_522)
    {
        bool _674 = _564 > 0.5;
        _670 = _674;
    }
    bool _676 = _670;
    float _678 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[78].w, _654);
    float _680 = -_666;
    float _682 = _680 + 1.0;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _686 = _634 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _688 = _636 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _690 = _594;
    int _692 = as_type<int>(_688);
    if (!_534)
    {
        _590 = _594;
    }
    float _694 = _590;
    float _696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _698 = _694;
    if (_534)
    {
        _698 = _510;
    }
    float _700 = _698;
    float _702 = fma(_686, as_type<float>(_612), -0.5);
    if (_534)
    {
        _690 = _510;
    }
    float _704 = _690;
    float _706 = _652 * _682;
    float _708 = -_684;
    float _710 = fma(_688, 2.0, _708);
    float _712 = _706;
    if (_522)
    {
        float _714 = -_536;
        float _716 = _714 + 1.0;
        _616 = as_type<int>(_716);
    }
    int _718 = _616;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_516)
    {
        float _722 = -_536;
        float _724 = _722 + 1.0;
        _692 = as_type<int>(_724);
    }
    int _726 = _692;
    float _728 = _614 * _706;
    if (!_522)
    {
        _712 = _536;
    }
    float _730 = _712;
    float _732 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[83].w, _720);
    float _734 = _730;
    if (!_516)
    {
        _672 = _536;
    }
    float _736 = _672;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _740 = _736;
    if (_522)
    {
        float _742 = _676 ? as_type<float>(_718) : _536;
        _734 = _742;
    }
    float _744 = _734;
    float _746 = _700 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_516)
    {
        float _748 = _628 ? as_type<float>(_726) : _536;
        _740 = _748;
    }
    float _750 = _740;
    float _752 = _566 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _754 = _696 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _756 = fma(_746, -2.0, _738);
    float _758 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _632);
    float _760 = fma(_752, _750, -0.5);
    float _762 = fma(_754, _744, -0.5);
    float _764 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _678);
    float _766 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _582);
    float _768 = fma(_758, _760, _610);
    float _770 = -_652;
    float _772 = _770 + 1.0;
    int _774 = _483 + 1;
    float _776 = -_766;
    float _778 = fma(_764, _640, _776);
    float _780 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[131].x, _728);
    int _782 = min(_475, _774);
    float _784 = -_137;
    float _786 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[81].x, _710);
    float _788 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[132].x, _780);
    float _790 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _668);
    float _792 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _732);
    float _794 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _756);
    float _796 = _788 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _798 = fma(_790, _762, _786);
    float _800 = _778 + 0.5;
    float _802 = -_794;
    float _804 = fma(_792, _702, _802);
    out.m_63.w = _796;
    float _806 = _798 + 0.5;
    uint _809 = as_type<uint>(half2(float2(_506, 0.0)));
    uint _811 = extract_bits(_809, 0u, 8u);
    int _813 = int(_811) & 255;
    uint _815 = extract_bits(_809, 8u, 8u);
    int _817 = int(_815) & 255;
    int _819 = _817 << 8;
    int _821 = _813 | _819;
    bool _823 = _821 >= 32768;
    int _825 = _821 + (-1024);
    int _827 = _825;
    if (_823)
    {
        int _829 = ~_821;
        int _831 = _829 + 33792;
        int _833 = _831 + 1;
        _827 = _833;
    }
    int _835 = _827;
    int _837 = _835 + 30719;
    float _839 = float(_837);
    float _841 = fma(_839, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _843 = abs(_841);
    float _845 = -_843;
    float _847 = _845 + 1.0;
    float _849 = abs(_841);
    float _851 = fma(_849, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _853 = _841 < 0.0;
    float _855 = float(_853);
    int _857 = as_type<int>(_847) + (-218103808);
    bool _859 = uint(_857) >= 1920991232u;
    float _861 = _768 + 0.5;
    float _863 = abs(_841);
    float _865 = fma(_863, _851, -0.212114393711090087890625);
    float _867 = _804 + 0.5;
    float _869 = abs(_841);
    float _871 = fma(_869, _865, 1.570728778839111328125);
    bool _873 = !_859;
    float _875 = _861;
    float _877 = _867;
    float _903;
    if (!_873)
    {
        int _879 = as_type<int>(_847);
        int _881 = as_type<int>(_847);
        int _883 = as_type<int>(_796);
        int _885 = 4304;
        int _887 = as_type<int>(_794);
        int _889;
        int _891;
        int _893;
        int _895;
        int _897;
        int _899;
        int _901;
        _102(_879, _881, _883, _885, _887, _889, _891, _893, _895, _897, _899, _901, out.gl_Position, out.gl_PointSize);
        _903 = as_type<float>(_899);
        _905 = true;
    }
    else
    {
        float _907 = rsqrt(_847);
        float _909 = _847 * _907;
        float _911 = _907 * 0.5;
        float _913 = -_909;
        float _915 = 0.0 + _913;
        float _917 = fma(_911, _915, 0.5);
        float _919 = fma(_909, _917, _909);
        float _921 = -_919;
        float _923 = 0.0 + _921;
        float _925 = fma(_919, _923, _847);
        float _927 = fma(_911, _925, _919);
        _903 = _927;
    }
    _905 = false;
    float _929 = _903;
    int _931 = _782;
    int _933 = 0;
    int _935 = _105(_931, _933, (*spvDescriptorSet0.support_buffer));
    int _937 = _469;
    int _939 = 0;
    int _941 = _105(_937, _939, (*spvDescriptorSet0.support_buffer));
    float4 _943 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_935, _941)), 0).xyzw;
    float _945 = _943.x;
    float _947 = _943.y;
    float _949 = _943.z;
    float _951 = _943.w;
    float _953 = _871 * _929;
    float _955 = _855 * 2.0;
    float _957 = _839 * 3.883221149444580078125;
    float _959 = floor(_479);
    float _961 = -_955;
    float _963 = fma(_953, _961, _953);
    float _965 = _957 * 0.15915493667125701904296875;
    float _967 = fma(_855, 3.1415927410125732421875, _963);
    float _969 = _965 * 6.283185482025146484375;
    float _971 = cos(_969);
    float _973 = _967 * 0.15915493667125701904296875;
    float _975 = _973 * 6.283185482025146484375;
    float _977 = sin(_975);
    float _979 = -_959;
    float _981 = _479 + _979;
    float _983 = _965 * 6.283185482025146484375;
    float _985 = sin(_983);
    float _987 = _977 * _971;
    float _989 = _977 * _985;
    uint _991 = as_type<uint>(half2(float2(_951, 0.0)));
    float _993 = -_500;
    float _995 = _993 + _945;
    float _997 = -_502;
    float _999 = _997 + _947;
    uint _1001 = extract_bits(_991, 0u, 8u);
    int _1003 = int(_1001) & 255;
    uint _1005 = extract_bits(_991, 8u, 8u);
    int _1007 = int(_1005) & 255;
    int _1009 = _1007 << 8;
    int _1011 = _1003 | _1009;
    float _1013 = fma(_981, _995, _500);
    float _1015 = fma(_981, _999, _502);
    bool _1017 = _1011 >= 32768;
    int _1019 = _1011 + (-1024);
    int _1021 = _1019;
    if (_1017)
    {
        int _1023 = ~_1011;
        int _1025 = _1023 + 33792;
        int _1027 = _1025 + 1;
        _1021 = _1027;
    }
    int _1029 = _1021;
    int _1031 = _1029 + 30719;
    float _1033 = float(_1031);
    float _1035 = fma(_1033, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1037 = abs(_1035);
    float _1039 = -_1037;
    float _1041 = _1039 + 1.0;
    float _1043 = abs(_1035);
    float _1045 = fma(_1043, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1047 = _1035 < 0.0;
    float _1049 = float(_1047);
    int _1051 = as_type<int>(_1041) + (-218103808);
    float _1053 = abs(_1035);
    float _1055 = fma(_1053, _1045, -0.212114393711090087890625);
    bool _1057 = uint(_1051) >= 1920991232u;
    float _1059 = -_504;
    float _1061 = _1059 + _949;
    float _1063 = abs(_1035);
    float _1065 = fma(_1063, _1055, 1.570728778839111328125);
    float _1067 = fma(_981, _1061, _504);
    bool _1069 = !_1057;
    float _1095;
    if (!_1069)
    {
        int _1071 = as_type<int>(_1041);
        int _1073 = as_type<int>(_947);
        int _1075 = as_type<int>(_1055);
        int _1077 = 5200;
        int _1079 = as_type<int>(_953);
        int _1081;
        int _1083;
        int _1085;
        int _1087;
        int _1089;
        int _1091;
        int _1093;
        _102(_1071, _1073, _1075, _1077, _1079, _1081, _1083, _1085, _1087, _1089, _1091, _1093, out.gl_Position, out.gl_PointSize);
        _1095 = as_type<float>(_1091);
        _1097 = true;
    }
    else
    {
        float _1099 = rsqrt(_1041);
        float _1101 = _1041 * _1099;
        float _1103 = _1099 * 0.5;
        float _1105 = -_1101;
        float _1107 = 0.0 + _1105;
        float _1109 = fma(_1103, _1107, 0.5);
        float _1111 = fma(_1101, _1109, _1101);
        float _1113 = -_1111;
        float _1115 = 0.0 + _1113;
        float _1117 = fma(_1111, _1115, _1041);
        float _1119 = fma(_1103, _1117, _1111);
        _1095 = _1119;
    }
    _1097 = false;
    float _1121 = _1095;
    float _1123 = in.m_48.x;
    float _1125 = in.m_48.y;
    float _1127 = in.m_48.z;
    float _1129 = _381 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1131 = in.m_55.x;
    float _1133 = in.m_65.x;
    float _1135 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1137 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1139 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1141 = _1131 * 6.283185482025146484375;
    float _1143 = fma(_1123, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1135);
    float _1145 = fma(_1123, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1137);
    float _1147 = fma(_1133, 6.0, _1141);
    float _1149 = fma(_1127, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1143);
    float _1151 = fma(_1123, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1139);
    float _1153 = fma(_1127, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1145);
    float _1155 = fma(_137, 0.0500000007450580596923828125, _1147);
    float _1157 = _1149 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1159 = fma(_1127, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1151);
    float _1161 = _1153 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1163 = in.m_67.x;
    float _1165 = in.m_67.y;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1169 = _1157 + _1167;
    float _1171 = _1159 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1175 = _1161 + _1173;
    float _1177 = _1155 * 0.15915493667125701904296875;
    float _1179 = _1169 * _1169;
    float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1183 = _1171 + _1181;
    float _1185 = _1177 * 6.283185482025146484375;
    float _1187 = sin(_1185);
    float _1189 = fma(_1175, _1175, _1179);
    float _1191 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1193 = fma(_1183, _1183, _1189);
    float _1195 = rsqrt(_1193);
    float _1197 = _1163 * _1163;
    float _1199 = _1187 * 0.20000000298023223876953125;
    float _1201 = fma(_1165, _1165, _1197);
    float _1203 = _1199 * 0.15915493667125701904296875;
    float _1205 = _1203 * 6.283185482025146484375;
    float _1207 = cos(_1205);
    float _1209 = _1191 * _1195;
    float _1211 = _1169 * _1209;
    float _1213 = _1175 * _1209;
    float _1215 = rsqrt(_1201);
    float _1217 = _1183 * _1209;
    float _1219 = -_1211;
    float _1221 = _1169 + _1219;
    float _1223 = -_1213;
    float _1225 = _1175 + _1223;
    float _1227 = -_1213;
    float _1229 = _1161 + _1227;
    float _1231 = -_1217;
    float _1233 = _1183 + _1231;
    float _1235 = _1221 * _1221;
    float _1237 = _1203 * 6.283185482025146484375;
    float _1239 = sin(_1237);
    float _1241 = -_1207;
    float _1243 = _1241 + 1.0;
    float _1245 = fma(_1225, _1225, _1235);
    float _1247 = fma(_1233, _1233, _1245);
    float _1249 = _1215 * _1163;
    float _1251 = _1215 * _1165;
    float _1253 = sqrt(_1247);
    float _1255 = _1249 * _1249;
    float _1257 = _1251 * _1243;
    float _1259 = -_1239;
    float _1261 = _1249 * _1259;
    float _1263 = fma(_1243, _1255, _1207);
    float _1265 = -_1257;
    float _1267 = _1249 * _1265;
    float _1269 = _1251 * _1239;
    float _1271 = fma(_1251, _1257, _1207);
    float _1273 = _1013 * _1261;
    float _1275 = _1015 * _1263;
    float _1277 = _1015 * _1267;
    float _1279 = -_1273;
    float _1281 = fma(_1015, _1269, _1279);
    float _1283 = fma(_1013, _1267, _1275);
    float _1285 = fma(_1013, _1271, _1277);
    float _1287 = _1195 * _1253;
    float _1289 = fma(_1067, _1207, _1281);
    float _1291 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1293 = fma(_1067, _1261, _1285);
    float _1295 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1297 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1289);
    float _1299 = _1287 * _1291;
    float _1301 = -_1269;
    float _1303 = fma(_1067, _1301, _1283);
    float _1305 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1293);
    float _1307 = _1129 * _1287;
    float _1309 = _1297 * _1299;
    float _1311 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1303);
    float _1313 = _1287 * _1295;
    float _1315 = _1305 * _1307;
    float _1317 = _1309 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1319 = _1309 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1321 = _1311 * _1313;
    bool _1323 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1325 = isnan(0.5);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1331 = _1327 || _1329;
    float _1333 = fma(_1315, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1317);
    float _1335 = fma(_1315, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1319);
    float _1337 = -_1321;
    float _1339 = fma(_1337, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1333);
    float _1341 = -_1321;
    float _1343 = fma(_1341, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1335);
    float _1345 = _1171 + _1339;
    float _1347 = _1161 + _1343;
    float _1349 = _1309 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1351 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1353 = _1345 + _1351;
    float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1357 = _1347 + _1355;
    float _1359 = fma(_1315, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1349);
    float _1361 = _1353 * _1353;
    float _1363 = -_1321;
    float _1365 = fma(_1363, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1359);
    float _1367 = fma(_1357, _1357, _1361);
    float _1369 = _1157 + _1365;
    float _1371 = sqrt(_1367);
    bool _1373 = _1371 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1375 = _1361;
    float _1377 = _1365;
    float _1379 = _1321;
    float _1381 = _1371;
    float _1383 = _1357;
    float _1385 = _1161;
    if (!_1373)
    {
        _1375 = _1347;
    }
    float _1387 = _1375;
    float _1389 = _1387;
    if (!_1373)
    {
        _1377 = _1345;
    }
    float _1391 = _1377;
    float _1393 = _1391;
    if (!_1373)
    {
        _1379 = _1369;
    }
    float _1395 = _1379;
    bool _1397 = !_1373;
    float _1399 = _1395;
    if (!_1397)
    {
        float _1401 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1403 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1405 = _1371 + _1403;
        float _1407 = _1369 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1409 = rsqrt(_1367);
        float _1411 = _1405 * _1401;
        float _1413 = _1411 * 0.15915493667125701904296875;
        float _1415 = _1413 * 6.283185482025146484375;
        float _1417 = cos(_1415);
        float _1419 = _1413 * 6.283185482025146484375;
        float _1421 = sin(_1419);
        float _1423 = _1417 + (-1.0);
        float _1425 = _1423 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1427 = fma(_1421, _1407, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1429 = fma(_1369, _1417, _1425);
        float _1431 = _1409 * _1427;
        float _1433 = fma(_1357, _1431, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1435 = fma(_1353, _1431, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1399 = _1429;
        _1393 = _1435;
        _1389 = _1433;
        _1381 = _1409;
    }
    float _1437 = _1399;
    float _1439 = _1393;
    float _1441 = _1389;
    float _1443 = _1381;
    float _1445 = -_1211;
    float _1447 = _1445 + _1437;
    float _1449 = -_1217;
    float _1451 = _1449 + _1439;
    float _1453 = -_1213;
    float _1455 = _1453 + _1441;
    float _1457 = -_1211;
    float _1459 = _1157 + _1457;
    float _1461 = -_1217;
    float _1463 = _1171 + _1461;
    float _1465 = _1447;
    float _1467 = _1455;
    float _1469 = _1451;
    float _1471 = _1443;
    if (!_1331)
    {
        float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1475 = _1459 + _1473;
        float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1479 = _1229 + _1477;
        float _1481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1483 = -_1157;
        float _1485 = _1483 + _1437;
        float _1487 = _1475 * _1475;
        float _1489 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1491 = _1463 + _1489;
        float _1493 = -_1171;
        float _1495 = _1493 + _1439;
        float _1497 = fma(_1479, _1479, _1487);
        float _1499 = 1.0 / _1287;
        float _1501 = fma(_1491, _1491, _1497);
        float _1503 = sqrt(_1501);
        float _1505 = precise::min(_1503, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1507 = _1505 * _1481;
        float _1509 = -_1161;
        float _1511 = _1509 + _1441;
        float _1513 = _1507 * _1499;
        float _1515 = fma(_1511, _1513, _1229);
        float _1517 = fma(_1485, _1513, _1459);
        float _1519 = fma(_1495, _1513, _1463);
        _1465 = _1517;
        _1467 = _1515;
        _1469 = _1519;
        _1471 = _1513;
    }
    float _1521 = _1465;
    float _1523 = _1467;
    float _1525 = _1469;
    float _1527 = _1471;
    float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1531 = _1521 + _1529;
    float _1533 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1535 = _1523 + _1533;
    float _1537 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1539 = _1525 + _1537;
    float _1541 = _1531 * _1531;
    float _1543 = fma(_1535, _1535, _1541);
    float _1545 = fma(_1539, _1539, _1543);
    float _1547 = rsqrt(_1545);
    float _1549 = sqrt(_1545);
    float _1551 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1553 = _1535 * _1551;
    float _1555 = _1539 * _1551;
    float _1557 = _1553 * _1553;
    float _1559 = _1555 * _1555;
    float _1561 = _1557 + _1559;
    float _1563 = sqrt(_1561);
    bool _1565 = _1563 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1567 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1569 = _1563 + _1567;
    float _1571 = _1539;
    float _1573 = _1561;
    float _1575 = _1569;
    float _1577 = _1527;
    float _1579 = _1531;
    float _1581 = _1551;
    if (_1565)
    {
        float _1583 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1571 = _1583;
    }
    float _1585 = _1571;
    if (_1565)
    {
        float _1587 = rsqrt(_1561);
        _1573 = _1587;
    }
    float _1589 = _1573;
    if (_1565)
    {
        float _1591 = _1569 * _1585;
        _1575 = _1591;
    }
    float _1593 = _1575;
    if (_1565)
    {
        float _1595 = _1593 * 0.15915493667125701904296875;
        _1577 = _1595;
    }
    float _1597 = _1577;
    float _1599 = _1547;
    if (_1565)
    {
        float _1601 = _1597 * 6.283185482025146484375;
        float _1603 = sin(_1601);
        _1599 = _1603;
    }
    float _1605 = _1599;
    float _1607 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1609 = precise::max(0.0, _1607);
    float _1611 = _1585;
    if (_1565)
    {
        float _1613 = _1597 * 6.283185482025146484375;
        float _1615 = cos(_1613);
        _1611 = _1615;
    }
    float _1617 = _1611;
    float _1619 = -_1551;
    float _1621 = -_1609;
    float _1623 = fma(_1531, _1619, _1621);
    float _1625 = _1623;
    if (_1565)
    {
        float _1627 = _1623 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1579 = _1627;
    }
    float _1629 = _1579;
    float _1631 = _1605;
    float _1633 = _1629;
    if (_1565)
    {
        float _1635 = fma(_1605, _1629, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1631 = _1635;
    }
    float _1637 = _1631;
    float _1639 = _1637;
    if (!_1565)
    {
        _1633 = _1557;
    }
    float _1641 = _1633;
    float _1643 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1645 = _1641;
    if (_1565)
    {
        float _1647 = _1617 + (-1.0);
        _1581 = _1647;
    }
    float _1649 = _1581;
    float _1651 = _1649;
    if (_1565)
    {
        float _1653 = _1589 * _1637;
        _1383 = _1653;
    }
    float _1655 = _1383;
    if (!_1565)
    {
        _1639 = _1553;
    }
    float _1657 = _1639;
    float _1659 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1643);
    float _1661 = _1657;
    if (_1565)
    {
        float _1663 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1385 = _1663;
    }
    float _1665 = _1385;
    float _1667 = _1665;
    if (_1565)
    {
        float _1669 = _1553 * _1655;
        _1661 = _1669;
    }
    float _1671 = _1661;
    if (!_1565)
    {
        _1651 = _1555;
    }
    float _1673 = _1651;
    float _1675 = _1673;
    if (_1565)
    {
        float _1677 = _1555 * _1655;
        _1675 = _1677;
    }
    float _1679 = _1675;
    if (_1565)
    {
        float _1681 = fma(_1623, _1617, _1665);
        _1625 = _1681;
    }
    float _1683 = _1625;
    if (_1565)
    {
        float _1685 = _1671 * _1671;
        _1645 = _1685;
    }
    float _1687 = _1645;
    if (!_1565)
    {
        _1667 = _1559;
    }
    float _1689 = _1667;
    float _1691 = _1689;
    if (_1565)
    {
        float _1693 = _1679 * _1679;
        _1691 = _1693;
    }
    float _1695 = _1691;
    float _1697 = fma(_1683, _1683, _1687);
    float _1699 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1701 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1659);
    float _1703 = _1697 + _1695;
    float _1705 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1699);
    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1709 = fma(_1549, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1707);
    float _1711 = precise::clamp(_1709, 0.0, 1.0);
    float _1713 = rsqrt(_1703);
    float _1715 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1705);
    float _1717 = -_1711;
    float _1719 = _1717 + 1.0;
    float _1721 = fma(_1229, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1723 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1725 = _1715 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1727 = _1701 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1729 = abs(_1719);
    float _1731 = log2(_1729);
    float _1733 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1735 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1737 = fma(_1463, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1739 = -_1733;
    float _1741 = fma(_1739, _1723, 1.0);
    float _1743 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1745 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1735);
    float _1747 = floor(_1721);
    float _1749 = _1713 * _1671;
    float _1751 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1743);
    float _1753 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1745);
    float _1755 = _1713 * _1683;
    float _1757 = _1713 * _1679;
    float _1759 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1751);
    float _1761 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1763 = floor(_1737);
    float _1765 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1767 = _1759 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1769 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1771 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1773 = -_1765;
    float _1775 = fma(_1755, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1773);
    float _1777 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1769);
    float _1779 = log2(_1741);
    float _1781 = -_1757;
    float _1783 = fma(_1781, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1775);
    float _1785 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1787 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1777);
    float _1789 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1791 = fma(_1783, -0.5, 0.5);
    float _1793 = fma(_1783, 0.5, 0.5);
    float _1795 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1785);
    float _1797 = exp2(_1771);
    float _1799 = -_1747;
    float _1801 = _1721 + _1799;
    float _1803 = -_1763;
    float _1805 = _1737 + _1803;
    float _1807 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1787);
    float _1809 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1789);
    float _1811 = _1755 + 1.0;
    float _1813 = fma(_1793, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float2 _5285 = float2(_1801, _1805);
    float _1815 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5285, float2(0.0), isnan(_5285)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5285, float2(0.0), isnan(_5285)), level(0.0)).x;
    float _1817 = 1.0 / _1807;
    float _1819 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1809);
    float _1821 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1795);
    float _1823 = fma(_1793, _1813, -0.212114393711090087890625);
    float _1825 = _1779 * 0.693147182464599609375;
    float _1827 = fma(_1793, _1823, 1.570728778839111328125);
    float _1829 = sqrt(_1791);
    float _1831 = -_1755;
    float _1833 = fma(_1797, _1811, _1831);
    float _1835 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1819);
    float _1837 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1821);
    float _1839 = _1825 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1841 = _1835 * _1817;
    float _1843 = _1837 * _1817;
    float _1845 = fma(_1833, 0.5, 0.5);
    float _1847 = fma(_1841, 0.5, 0.5);
    float _1849 = fma(_1843, -0.5, 0.5);
    float _1851 = _1829 * 0.636619746685028076171875;
    float3 _5354 = float3(_1847, _1849, _1839);
    float _1853 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5354, float3(0.0), isnan(_5354)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5354, float3(0.0), isnan(_5354)), level(0.0)).x;
    float _1855 = -_1827;
    float _1857 = fma(_1851, _1855, 1.0);
    float3 _5370 = float3(_1847, _1849, _1839);
    float4 _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5370, float3(0.0), isnan(_5370)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5370, float3(0.0), isnan(_5370)), level(0.0)).xyzw;
    float _1861 = _1859.x;
    float _1863 = _1859.y;
    float _1865 = _1859.z;
    float _1867 = _1859.w;
    float2 _5386 = float2(_1857, _1845);
    float3 _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5386, float2(0.0), isnan(_5386)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5386, float2(0.0), isnan(_5386)), level(0.0)).xyz;
    float _1873 = _1871.x;
    float _1875 = _1871.y;
    float _1877 = _1871.z;
    float _1879 = _1459 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1881 = _1459 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1883 = _1065 * _1121;
    float _1885 = _1049 * 2.0;
    float _1887 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1879);
    float _1889 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1881);
    float _1891 = -_841;
    float _1893 = _1891 + _1035;
    float _1895 = -_1885;
    float _1897 = fma(_1883, _1895, _1883);
    float _1899 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1887);
    float _1901 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1889);
    bool _1903 = _1303 != 0.0;
    bool _1905 = isnan(_1303);
    bool _1907 = _1903 || _1905;
    bool _1909 = isnan(0.0);
    bool _1911 = _1907 || _1909;
    float _1913 = fma(_1049, 3.1415927410125732421875, _1897);
    float _1915 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1917 = _1033 * 3.883221149444580078125;
    float _1919 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1921 = 1.0 / _1915;
    float _1923 = _1913 * 0.15915493667125701904296875;
    float _1925 = _1919 + _1915;
    float _1927 = _1917 * 0.15915493667125701904296875;
    bool _1929 = _1293 == 0.0;
    bool _1931 = !_1911;
    bool _1933 = _1929 && _1931;
    out.m_69.x = _861;
    out.m_69.y = _800;
    out.m_69.z = _806;
    out.m_69.w = _867;
    bool _1935 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1937 = isnan(0.5);
    bool _1939 = _1935 || _1937;
    bool _1941 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1943 = _1939 || _1941;
    float _1945 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1947 = _1927 * 6.283185482025146484375;
    float _1949 = cos(_1947);
    bool _1951 = _1289 == 0.0;
    bool _1953 = _1951 && _1933;
    float _1955 = in.m_65.w;
    float _1957 = _1925 * _1921;
    float _1959 = _1957 * 0.5;
    float _1961 = _1923 * 6.283185482025146484375;
    float _1963 = sin(_1961);
    float _1965 = fma(_981, _1893, _841);
    float _1967 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1969 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1967);
    float _1971 = _1965 * _1263;
    float _1973 = 1.0 / _1969;
    float _1975 = _1927 * 6.283185482025146484375;
    float _1977 = sin(_1975);
    float _1979 = -_987;
    float _1981 = fma(_1963, _1949, _1979);
    out.m_71.w = _1955;
    float _1983 = fma(_981, _1981, _987);
    float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1987 = _1973 * _1985;
    float _1989 = fma(_1983, _1267, _1971);
    float _1991 = _1983 * _1261;
    float _1993 = _1965 * _1267;
    float _1995 = abs(_1987);
    float _1997 = log2(_1995);
    float _1999 = _1807 * 0.5;
    float _2001 = -_1991;
    float _2003 = fma(_1965, _1269, _2001);
    float _2005 = fma(_1983, _1271, _1993);
    float _2007 = -_989;
    float _2009 = fma(_1963, _1977, _2007);
    float _2011 = fma(_981, _2009, _989);
    float _2013 = exp2(_1945);
    float _2015 = -_1269;
    float _2017 = fma(_2011, _2015, _1989);
    float _2019 = fma(_2011, _1207, _2003);
    float _2021 = fma(_2011, _1261, _2005);
    float _2023 = fma(_1303, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2017);
    float _2025 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2027 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2019);
    float _2029 = _2021;
    int _2031 = as_type<int>(_2003);
    float _2033 = _1987;
    if (_1953)
    {
        _875 = _2019;
    }
    float _2035 = _875;
    float _2037 = _2035;
    if (!_1953)
    {
        float _2039 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2021);
        _2029 = _2039;
    }
    float _2041 = _2029;
    if (_1953)
    {
        _2031 = as_type<int>(_2023);
    }
    int _2043 = _2031;
    float _2045 = exp2(_2025);
    int _2047 = _2043;
    if (!_1953)
    {
        _2047 = as_type<int>(_2023);
    }
    int _2049 = _2047;
    float _2051 = _1953 ? _2019 : _2027;
    float _2053 = -_2013;
    float _2055 = _2053 + 1.0;
    float _2057 = _1953 ? _2017 : as_type<float>(_2049);
    float _2059 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1953)
    {
        _2037 = _2027;
    }
    float _2061 = _2037;
    float _2063 = _2057 * _2057;
    if (_1953)
    {
        _877 = _2017;
    }
    float _2065 = _877;
    out.m_73.x = (*spvDescriptorSet0.vp_c10)._m0[8].x;
    out.m_73.y = (*spvDescriptorSet0.vp_c10)._m0[9].x;
    out.m_73.z = (*spvDescriptorSet0.vp_c10)._m0[10].x;
    float _2067 = _2065;
    if (!_1953)
    {
        _2067 = _2023;
    }
    float _2069 = _2067;
    float _2071 = fma(_2051, _2051, _2063);
    float _2073 = _2061 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2075 = fma(_2045, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2077 = precise::clamp(_2075, 0.0, 1.0);
    float _2079 = _2061 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2081 = in.m_75.x;
    bool _2083 = _1987 <= 8000.0;
    bool _2085 = isnan(_1987);
    bool _2087 = _2083 || _2085;
    bool _2089 = isnan(8000.0);
    bool _2091 = _2087 || _2089;
    float _2093 = float(_2091);
    float _2095 = rsqrt(_2071);
    float _2097 = fma(_2077, -2.0, 3.0);
    float _2099 = _2077 * _2077;
    bool _2101 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2103 = isnan(_1549);
    bool _2105 = _2101 || _2103;
    bool _2107 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2109 = _2105 || _2107;
    float _2111 = _2061 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2113 = fma(_2041, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2073);
    float _2115 = _2099 * _2097;
    float _2117 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2119 = fma(_2041, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2079);
    float _2121 = fma(_2041, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2111);
    float _2123 = -_2115;
    float _2125 = _2123 + 1.0;
    float _2127 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2117);
    float _2129 = _2111;
    float _2131 = _2069;
    if (!_1943)
    {
        _2129 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2133 = _2129;
    float _2135 = -_2069;
    float _2137 = fma(_2135, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2113);
    float _2139 = fma(_2125, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2115);
    float _2141 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2127);
    float _2143 = _2051 * _2095;
    float _2145 = _2057 * _2095;
    float _2147 = _2133;
    if (!_1943)
    {
        float _2149 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2151 = _2133 + _2149;
        _2147 = _2151;
    }
    float _2153 = _2147;
    float _2155 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2141);
    float _2157 = -(*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2159 = _2143 * _2157;
    float _2161 = -(*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2163 = _2143 * _2161;
    float _2165 = -(*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2167 = _2143 * _2165;
    float _2169 = _1993;
    float _2171 = _2167;
    float _2173 = _2163;
    if (!_1943)
    {
        float _2175 = 1.0 / _2153;
        _2169 = _2175;
    }
    float _2177 = _2169;
    float _2179 = -_2145;
    float _2181 = fma(_2179, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2159);
    float _2183 = -_2145;
    float _2185 = fma(_2183, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2163);
    float _2187 = -_2145;
    float _2189 = fma(_2187, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2167);
    float _2191 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2193 = _2155 + _2191;
    float _2195 = _2093 * _2139;
    float _2197 = fma(_1837, -0.5, _1999);
    float _2199 = _1835 + _1807;
    out.m_77.x = _2181;
    out.m_77.y = _2185;
    out.m_77.z = _2189;
    float _2201 = _1807 + _2193;
    float _2203 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2205 = _2199 * 0.5;
    out.gl_Position.x = _1835;
    out.gl_Position.y = _1837;
    out.gl_Position.z = _2193;
    out.gl_Position.w = _1807;
    float _2207 = _2201 * 0.5;
    float _2209 = -_2069;
    float _2211 = fma(_2209, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2119);
    float _2213 = -_2069;
    float _2215 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2121);
    float _2217 = _2189;
    float _2219 = _2193;
    if (!_1943)
    {
        _2131 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _2221 = _2131;
    float _2223 = _2221;
    if (!_1943)
    {
        float _2225 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2227 = _1987 + _2225;
        _2171 = _2227;
    }
    float _2229 = _2171;
    out.m_79.x = _2205;
    out.m_79.y = _2197;
    out.m_79.z = _2207;
    out.m_79.w = _1807;
    if (!_1943)
    {
        float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2233 = _1987 + _2231;
        _2033 = _2233;
    }
    float _2235 = _2033;
    out.m_81.x = _2137;
    out.m_81.y = _2211;
    out.m_81.z = _2215;
    float _2237 = _2235;
    float _2239 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (_1943)
    {
        _2173 = 1.0;
    }
    float _2241 = _2173;
    float _2243 = _2241;
    if (!_1943)
    {
        float _2245 = _2229 * _2177;
        float _2247 = precise::clamp(_2245, 0.0, 1.0);
        _2243 = _2247;
    }
    float _2249 = _2243;
    if (!_2109)
    {
        _2217 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2251 = _2217;
    float _2253 = _2251;
    float _2255 = _2251;
    if (!_1943)
    {
        float _2257 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2259 = _2221 + _2257;
        _2219 = _2259;
    }
    float _2261 = _2219;
    if (!_2109)
    {
        _2223 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2263 = _2223;
    float _2265 = _2185;
    float _2267 = _2263;
    float _2269 = _2263;
    if (!_1943)
    {
        float _2271 = 1.0 / _2261;
        _2265 = _2271;
    }
    float _2273 = _2265;
    if (!_1943)
    {
        float _2275 = _2235 * _2273;
        float _2277 = precise::clamp(_2275, 0.0, 1.0);
        _2237 = _2277;
    }
    float _2279 = _2237;
    float _2281 = -_1815;
    float _2283 = _2281 + 1.0;
    float _2285 = _2283 * _2203;
    float _2287 = precise::clamp(_2285, 0.0, 1.0);
    float _2289 = -_2287;
    float _2291 = fma(_2289, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2293 = _1861;
    if (_1943)
    {
        _2239 = 1.0;
    }
    float _2295 = _2239;
    float _2297 = _2295;
    if (!_1943)
    {
        float _2299 = -_2279;
        float _2301 = _2299 + 1.0;
        _2297 = _2301;
    }
    float _2303 = _2297;
    float _2305 = _2291 * _2081;
    float _2307 = _2249 * _2303;
    float _2309 = _2305 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_83.x = _2309;
    float _2311 = _2059 * _1853;
    float _2313 = -_2059;
    float _2315 = _2313 + 1.0;
    float _2317 = _1867 * _2311;
    float _2319 = _1867 * _2315;
    float _2321 = _1877 * _2311;
    float _2323 = fma(_1873, _2317, _1861);
    float _2325 = fma(_1875, _2317, _1863);
    float _2327 = _2307 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2329 = fma(_1867, _2321, _1865);
    float _2331 = _2307;
    float _2333 = _2325;
    float _2335 = _2323;
    if (!_2109)
    {
        _2293 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2337 = _2293;
    float _2339 = _2337;
    float _2341 = _2337;
    if (!_2109)
    {
        _2331 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2343 = _2331;
    out.m_85.x = _2323;
    out.m_85.y = _2325;
    out.m_85.z = _2329;
    out.m_85.w = _2319;
    float _2345 = _2343;
    float _2347 = _2343;
    if (!_2109)
    {
        _2333 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2349 = _2333;
    float _2351 = _2349;
    float _2353 = _2349;
    if (!_2109)
    {
        _2335 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2355 = _2335;
    bool _2357 = !_2109;
    float _2359 = _2355;
    float _2361 = _2355;
    if (!_2357)
    {
        bool _2363 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2365 = isnan(_1549);
        bool _2367 = _2363 || _2365;
        bool _2369 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2371 = _2367 || _2369;
        if (!_2371)
        {
            float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2375 = _1549 + _2373;
            float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2379 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2377;
            float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2383 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2385 = 1.0 / _2379;
            float _2387 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2389 = _2387 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2403 = _2375 * _2385;
            float _2405 = precise::clamp(_2403, 0.0, 1.0);
            float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2411 = fma(_2405, _2383, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2413 = fma(_2405, _2409, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2415 = fma(_2405, _2389, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2417 = fma(_2405, _2393, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2419 = fma(_2405, _2397, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2421 = fma(_2405, _2401, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2255 = _2415;
            _2353 = _2419;
            _2341 = _2411;
            _2347 = _2417;
            _2269 = _2413;
            _2361 = _2421;
            _2423 = true;
        }
        else
        {
            bool _2425 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2427 = isnan(_1549);
            bool _2429 = _2425 || _2427;
            bool _2431 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2433 = _2429 || _2431;
            if (!_2433)
            {
                _2339 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2435 = _2339;
            _2341 = _2435;
            if (!_2433)
            {
                _2253 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2437 = _2253;
            _2255 = _2437;
            if (!_2433)
            {
                _2267 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2439 = _2267;
            _2269 = _2439;
            if (!_2433)
            {
                _2345 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2441 = _2345;
            _2347 = _2441;
            if (!_2433)
            {
                _2351 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2443 = _2351;
            _2353 = _2443;
            if (!_2433)
            {
                _2359 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2445 = _2359;
            bool _2447 = !_2433;
            _2361 = _2445;
            if (!_2447)
            {
                bool _2449 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2451 = isnan(_1549);
                bool _2453 = _2449 || _2451;
                bool _2455 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2457 = _2453 || _2455;
                if (!_2457)
                {
                    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2461 = _1549 + _2459;
                    float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2465 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2463;
                    float _2467 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2469 = _2467 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2471 = 1.0 / _2465;
                    float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2483 = _2481 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2489 = _2461 * _2471;
                    float _2491 = precise::clamp(_2489, 0.0, 1.0);
                    float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2497 = fma(_2491, _2469, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2499 = fma(_2491, _2495, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2501 = fma(_2491, _2475, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2503 = fma(_2491, _2479, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2505 = fma(_2491, _2483, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2507 = fma(_2491, _2487, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2255 = _2501;
                    _2353 = _2505;
                    _2341 = _2497;
                    _2347 = _2503;
                    _2269 = _2499;
                    _2361 = _2507;
                    _2423 = true;
                }
                else
                {
                    _2255 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2353 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2341 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2347 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2269 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2361 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2423 = false;
    float _2509 = _2255;
    float _2511 = _2353;
    float _2513 = _2341;
    float _2515 = _2347;
    float _2517 = _2269;
    float _2519 = _2361;
    float _2521 = fma(_2211, -0.5, 0.5);
    float _2523 = precise::clamp(_2521, 0.0, 1.0);
    float _2525 = -_2509;
    float _2527 = _2525 + _2511;
    float _2529 = _2327 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2531 = -_2513;
    float _2533 = _2531 + _2515;
    out.m_87.x = 0.0;
    float _2535 = fma(_2523, _2527, _2509);
    float _2537 = -_2517;
    float _2539 = _2537 + _2519;
    out.m_51.x = _2529;
    float _2541 = fma(_2523, _2533, _2513);
    float _2543 = _2535 * 0.586610972881317138671875;
    bool _2545 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2547 = fma(_2523, _2539, _2517);
    float _2549 = fma(_2541, 0.298911988735198974609375, _2543);
    bool _2551 = _2249 > 0.0;
    bool _2553 = isnan(_2249);
    bool _2555 = _2551 || _2553;
    bool _2557 = isnan(0.0);
    bool _2559 = _2555 || _2557;
    float _2561 = fma(_2547, 0.114477999508380889892578125, _2549);
    bool _2563 = _2303 <= 0.0;
    bool _2565 = !_2559;
    bool _2567 = _2563 || _2565;
    float _2569 = -_2561;
    float _2571 = _2541 + _2569;
    float _2573 = -_2561;
    float _2575 = _2535 + _2573;
    float _2577 = -_2561;
    float _2579 = _2547 + _2577;
    float _2581 = fma(_2571, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2561);
    float _2583 = fma(_2575, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2561);
    float _2585 = fma(_2579, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2561);
    bool _2587 = !_2545;
    if (!_2587)
    {
        float _2589 = -_1521;
        float _2591 = _2589 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2593 = -_1523;
        float _2595 = _2593 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2597 = -_1525;
        float _2599 = _2597 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2601 = _2591 * _2591;
        float _2603 = fma(_2595, _2595, _2601);
        float _2605 = fma(_2599, _2599, _2603);
        float _2607 = sqrt(_2605);
        float _2609 = rsqrt(_2605);
        float _2611 = -_2607;
        float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2615 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2617 = precise::clamp(_2615, 0.0, 1.0);
        float _2619 = _2595 * _2609;
        float _2621 = _2591 * _2609;
        float _2623 = abs(_2617);
        float _2625 = log2(_2623);
        float _2627 = _2599 * _2609;
        float _2629 = _2619 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2631 = _2211 * _2621;
        float _2633 = -_2621;
        float _2635 = -_2629;
        float _2637 = fma(_2633, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2635);
        float _2639 = fma(_2137, _2619, _2631);
        float _2641 = -_2627;
        float _2643 = fma(_2641, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2637);
        float _2645 = fma(_2215, _2627, _2639);
        float _2647 = precise::clamp(_2645, 0.0, 1.0);
        float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2651 = _2643 + _2649;
        float _2653 = _2625 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2655 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2657 = precise::clamp(_2655, 0.0, 1.0);
        float _2659 = exp2(_2653);
        float _2661 = _2659 * _2657;
        float _2663 = _2647 * _2661;
        float _2665 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2667 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2669 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2665;
        out.m_87.y = _2667;
        out.m_87.z = _2669;
    }
    out.m_89.x = _2581;
    out.m_89.y = _2583;
    out.m_89.z = _2585;
    if (!_2567)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2671 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2671;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2423 = false;
    bool _1097 = false;
    bool _905 = false;
    bool _445 = false;
    bool _297 = false;
    bool _189 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_48.w;
    float _111 = trunc(_109);
    int _113 = int(_111);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _123 = 0;
    if (!_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2727 = as_type<float>(_127);
        out.gl_Position.z = _2727;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_53.w;
    float _133 = float(_113);
    float _135 = -_131;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_131);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    bool _149 = _137 >= _133;
    bool _151 = !_147;
    bool _153 = _149 || _151;
    float _155 = _131;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _129 = as_type<int>(_159);
    }
    int _161 = _129;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2791 = as_type<float>(_161);
        out.gl_Position.z = _2791;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = 1.0 / _133;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _137 * _163;
    bool _169 = !_165;
    float _187;
    if (!_169)
    {
        float _171 = in.m_55.x;
        float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _179 = _177 * _173;
        float _181 = floor(_179);
        float _183 = -_181;
        float _185 = _179 + _183;
        _187 = _185;
        _189 = true;
    }
    else
    {
        _187 = _167;
    }
    _189 = false;
    float _191 = _187;
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _195 = _191 + _193;
    bool _197 = _191 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _199 = isnan(_191);
    bool _201 = _197 || _199;
    bool _203 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _205 = _201 || _203;
    float _207 = float(_205);
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _209;
    bool _213 = _191 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _215 = isnan(_191);
    bool _217 = _213 || _215;
    bool _219 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _221 = _217 || _219;
    float _223 = float(_221);
    float _225 = -_207;
    float _227 = _225 + 1.0;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _229;
    float _233 = 1.0 / _211;
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _237 = _223 * _227;
    float _239 = -_223;
    float _241 = _239 + 1.0;
    float _243 = _195 * _233;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _245;
    float _249 = fma(_231, _243, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _251;
    float _255 = fma(_247, _243, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _257 = _249 * _237;
    float _259 = fma(_253, _243, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _261 = _255 * _237;
    float _263 = _259 * _237;
    float _265 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[143].x, _257);
    float _267 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[143].y, _263);
    float _269 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[143].z, _261);
    float _271 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[144].x, _265);
    float _273 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[144].y, _267);
    float _275 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[144].z, _269);
    bool _277 = !_235;
    float _295;
    if (!_277)
    {
        float _279 = in.m_55.x;
        float _281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _283 = _279 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _287 = _285 * _281;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _295 = _293;
        _297 = true;
    }
    else
    {
        _295 = _167;
    }
    _297 = false;
    float _299 = _295;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _303 = _299 + _301;
    float _305 = in.m_57.x;
    float _307 = in.m_57.y;
    float _309 = in.m_57.z;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _315 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _317 = isnan(_299);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _331 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _333 = isnan(_299);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _343;
    bool _347 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _349 = isnan(_299);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = 1.0 / _313;
    float _361 = -_325;
    float _363 = _361 + 1.0;
    bool _365 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _367 = _341 * _363;
    float _369 = -_341;
    float _371 = _369 + 1.0;
    float _373 = 1.0 / _329;
    float _375 = _345 * _359;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _381 = _271 * _305;
    float _383 = fma(_375, _303, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _385 = _379 * _373;
    float _387 = _383 * _367;
    float _389 = -_357;
    float _391 = _389 + 1.0;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _395 = _299 + _393;
    float _397 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[115].x, _387);
    float _399 = _325 * _391;
    float _401 = fma(_385, _395, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _405 = fma(_401, _399, _397);
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _409 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[117].x, _405);
    float _413 = _273 * _307;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _417 = _407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = _411 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _421 = _415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = _275 * _309;
    out.m_59.x = _409;
    out.m_59.y = _421;
    out.m_59.z = _417;
    out.m_59.w = _419;
    bool _425 = !_365;
    float _443;
    if (!_425)
    {
        float _427 = in.m_55.x;
        float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _431 = _427 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _433 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[11].w, _137);
        float _435 = _433 * _429;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _443 = _441;
        _445 = true;
    }
    else
    {
        _443 = _167;
    }
    _445 = false;
    float _447 = _443;
    int _449 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _451 = _449;
    int _453 = 0;
    int _455 = _104(_451, _453, (*spvDescriptorSet0.support_buffer));
    float _457 = abs(_167);
    float _459 = log2(_457);
    float _461 = in.m_61.z;
    float _463 = _459 * 0.5;
    float _465 = exp2(_463);
    float _467 = trunc(_461);
    int _469 = int(_467);
    float _471 = 0.0 + _465;
    float _473 = precise::clamp(_471, 0.0, 1.0);
    int _475 = _455 + (-1);
    float _477 = float(_475);
    float _479 = _473 * _477;
    float _481 = trunc(_479);
    int _483 = int(_481);
    int _485 = _483;
    int _487 = 0;
    int _489 = _105(_485, _487, (*spvDescriptorSet0.support_buffer));
    int _491 = _469;
    int _493 = 0;
    int _495 = _105(_491, _493, (*spvDescriptorSet0.support_buffer));
    float4 _498 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_489, _495)), 0).xyzw;
    float _500 = _498.x;
    float _502 = _498.y;
    float _504 = _498.z;
    float _506 = _498.w;
    float _508 = in.m_55.x;
    float _510 = in.m_55.y;
    float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _516 = _514 != 0;
    float _518 = in.m_61.y;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _522 = _520 != 0;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _528 = in.m_55.w;
    float _530 = 1.0 / _526;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _534 = _532 != 0;
    float _536 = in.m_61.x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _540 = 0.0;
    if (_516)
    {
        float _542 = in.m_55.x;
        _540 = _542;
    }
    float _544 = _540;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _548 = _546 != 0;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _554 = _552 != 0;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _556;
    float _560 = 0.0;
    if (_522)
    {
        float _562 = in.m_55.z;
        _560 = _562;
    }
    float _564 = _560;
    float _566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _568 = _508 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _570 = _510 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _572 = _510 > 0.5;
    bool _574 = _572 && _548;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _578 = -_550;
    float _580 = fma(_568, 2.0, _578);
    float _582 = fma(_570, -2.0, _538);
    float _584 = _558 * _530;
    float _586 = _550;
    float _588 = _570;
    float _590 = _584;
    if (!_534)
    {
        float _592 = in.m_55.z;
        _586 = _592;
    }
    float _594 = _586;
    float _596 = -_518;
    float _598 = _596 + 1.0;
    bool _600 = _528 > 0.5;
    bool _602 = _600 && _554;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _606 = _447 + _604;
    float _608 = -_137;
    float _610 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[76].x, _580);
    int _612 = _602 ? as_type<int>(_598) : as_type<int>(_518);
    float _614 = fma(_584, _606, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _616 = _612;
    if (!_534)
    {
        _588 = _510;
    }
    float _618 = _588;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _622 = false;
    float _624 = _618;
    if (_516)
    {
        bool _626 = _544 > 0.5;
        _622 = _626;
    }
    bool _628 = _622;
    float _630 = _574 ? _598 : _518;
    float _632 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[78].z, _620);
    float _634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_534)
    {
        _624 = _508;
    }
    float _636 = _624;
    float _638 = _512 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _640 = fma(_638, _630, -0.5);
    bool _642 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _644 = isnan(_447);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _656 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _658 = isnan(_447);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[83].z, _576);
    bool _670 = false;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (_522)
    {
        bool _674 = _564 > 0.5;
        _670 = _674;
    }
    bool _676 = _670;
    float _678 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[78].w, _654);
    float _680 = -_666;
    float _682 = _680 + 1.0;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _686 = _634 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _688 = _636 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _690 = _594;
    int _692 = as_type<int>(_688);
    if (!_534)
    {
        _590 = _594;
    }
    float _694 = _590;
    float _696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _698 = _694;
    if (_534)
    {
        _698 = _510;
    }
    float _700 = _698;
    float _702 = fma(_686, as_type<float>(_612), -0.5);
    if (_534)
    {
        _690 = _510;
    }
    float _704 = _690;
    float _706 = _652 * _682;
    float _708 = -_684;
    float _710 = fma(_688, 2.0, _708);
    float _712 = _706;
    if (_522)
    {
        float _714 = -_536;
        float _716 = _714 + 1.0;
        _616 = as_type<int>(_716);
    }
    int _718 = _616;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_516)
    {
        float _722 = -_536;
        float _724 = _722 + 1.0;
        _692 = as_type<int>(_724);
    }
    int _726 = _692;
    float _728 = _614 * _706;
    if (!_522)
    {
        _712 = _536;
    }
    float _730 = _712;
    float _732 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[83].w, _720);
    float _734 = _730;
    if (!_516)
    {
        _672 = _536;
    }
    float _736 = _672;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _740 = _736;
    if (_522)
    {
        float _742 = _676 ? as_type<float>(_718) : _536;
        _734 = _742;
    }
    float _744 = _734;
    float _746 = _700 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_516)
    {
        float _748 = _628 ? as_type<float>(_726) : _536;
        _740 = _748;
    }
    float _750 = _740;
    float _752 = _566 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _754 = _696 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _756 = fma(_746, -2.0, _738);
    float _758 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _632);
    float _760 = fma(_752, _750, -0.5);
    float _762 = fma(_754, _744, -0.5);
    float _764 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _678);
    float _766 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _582);
    float _768 = fma(_758, _760, _610);
    float _770 = -_652;
    float _772 = _770 + 1.0;
    int _774 = _483 + 1;
    float _776 = -_766;
    float _778 = fma(_764, _640, _776);
    float _780 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[131].x, _728);
    int _782 = min(_475, _774);
    float _784 = -_137;
    float _786 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[81].x, _710);
    float _788 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[132].x, _780);
    float _790 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _668);
    float _792 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _732);
    float _794 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _756);
    float _796 = _788 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _798 = fma(_790, _762, _786);
    float _800 = _778 + 0.5;
    float _802 = -_794;
    float _804 = fma(_792, _702, _802);
    out.m_63.w = _796;
    float _806 = _798 + 0.5;
    uint _809 = as_type<uint>(half2(float2(_506, 0.0)));
    uint _811 = extract_bits(_809, 0u, 8u);
    int _813 = int(_811) & 255;
    uint _815 = extract_bits(_809, 8u, 8u);
    int _817 = int(_815) & 255;
    int _819 = _817 << 8;
    int _821 = _813 | _819;
    bool _823 = _821 >= 32768;
    int _825 = _821 + (-1024);
    int _827 = _825;
    if (_823)
    {
        int _829 = ~_821;
        int _831 = _829 + 33792;
        int _833 = _831 + 1;
        _827 = _833;
    }
    int _835 = _827;
    int _837 = _835 + 30719;
    float _839 = float(_837);
    float _841 = fma(_839, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _843 = abs(_841);
    float _845 = -_843;
    float _847 = _845 + 1.0;
    float _849 = abs(_841);
    float _851 = fma(_849, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _853 = _841 < 0.0;
    float _855 = float(_853);
    int _857 = as_type<int>(_847) + (-218103808);
    bool _859 = uint(_857) >= 1920991232u;
    float _861 = _768 + 0.5;
    float _863 = abs(_841);
    float _865 = fma(_863, _851, -0.212114393711090087890625);
    float _867 = _804 + 0.5;
    float _869 = abs(_841);
    float _871 = fma(_869, _865, 1.570728778839111328125);
    bool _873 = !_859;
    float _875 = _861;
    float _877 = _867;
    float _903;
    if (!_873)
    {
        int _879 = as_type<int>(_847);
        int _881 = as_type<int>(_847);
        int _883 = as_type<int>(_796);
        int _885 = 4304;
        int _887 = as_type<int>(_794);
        int _889;
        int _891;
        int _893;
        int _895;
        int _897;
        int _899;
        int _901;
        _102(_879, _881, _883, _885, _887, _889, _891, _893, _895, _897, _899, _901, out.gl_Position, out.gl_PointSize);
        _903 = as_type<float>(_899);
        _905 = true;
    }
    else
    {
        float _907 = rsqrt(_847);
        float _909 = _847 * _907;
        float _911 = _907 * 0.5;
        float _913 = -_909;
        float _915 = 0.0 + _913;
        float _917 = fma(_911, _915, 0.5);
        float _919 = fma(_909, _917, _909);
        float _921 = -_919;
        float _923 = 0.0 + _921;
        float _925 = fma(_919, _923, _847);
        float _927 = fma(_911, _925, _919);
        _903 = _927;
    }
    _905 = false;
    float _929 = _903;
    int _931 = _782;
    int _933 = 0;
    int _935 = _105(_931, _933, (*spvDescriptorSet0.support_buffer));
    int _937 = _469;
    int _939 = 0;
    int _941 = _105(_937, _939, (*spvDescriptorSet0.support_buffer));
    float4 _943 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_935, _941)), 0).xyzw;
    float _945 = _943.x;
    float _947 = _943.y;
    float _949 = _943.z;
    float _951 = _943.w;
    float _953 = _871 * _929;
    float _955 = _855 * 2.0;
    float _957 = _839 * 3.883221149444580078125;
    float _959 = floor(_479);
    float _961 = -_955;
    float _963 = fma(_953, _961, _953);
    float _965 = _957 * 0.15915493667125701904296875;
    float _967 = fma(_855, 3.1415927410125732421875, _963);
    float _969 = _965 * 6.283185482025146484375;
    float _971 = cos(_969);
    float _973 = _967 * 0.15915493667125701904296875;
    float _975 = _973 * 6.283185482025146484375;
    float _977 = sin(_975);
    float _979 = -_959;
    float _981 = _479 + _979;
    float _983 = _965 * 6.283185482025146484375;
    float _985 = sin(_983);
    float _987 = _977 * _971;
    float _989 = _977 * _985;
    uint _991 = as_type<uint>(half2(float2(_951, 0.0)));
    float _993 = -_500;
    float _995 = _993 + _945;
    float _997 = -_502;
    float _999 = _997 + _947;
    uint _1001 = extract_bits(_991, 0u, 8u);
    int _1003 = int(_1001) & 255;
    uint _1005 = extract_bits(_991, 8u, 8u);
    int _1007 = int(_1005) & 255;
    int _1009 = _1007 << 8;
    int _1011 = _1003 | _1009;
    float _1013 = fma(_981, _995, _500);
    float _1015 = fma(_981, _999, _502);
    bool _1017 = _1011 >= 32768;
    int _1019 = _1011 + (-1024);
    int _1021 = _1019;
    if (_1017)
    {
        int _1023 = ~_1011;
        int _1025 = _1023 + 33792;
        int _1027 = _1025 + 1;
        _1021 = _1027;
    }
    int _1029 = _1021;
    int _1031 = _1029 + 30719;
    float _1033 = float(_1031);
    float _1035 = fma(_1033, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1037 = abs(_1035);
    float _1039 = -_1037;
    float _1041 = _1039 + 1.0;
    float _1043 = abs(_1035);
    float _1045 = fma(_1043, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1047 = _1035 < 0.0;
    float _1049 = float(_1047);
    int _1051 = as_type<int>(_1041) + (-218103808);
    float _1053 = abs(_1035);
    float _1055 = fma(_1053, _1045, -0.212114393711090087890625);
    bool _1057 = uint(_1051) >= 1920991232u;
    float _1059 = -_504;
    float _1061 = _1059 + _949;
    float _1063 = abs(_1035);
    float _1065 = fma(_1063, _1055, 1.570728778839111328125);
    float _1067 = fma(_981, _1061, _504);
    bool _1069 = !_1057;
    float _1095;
    if (!_1069)
    {
        int _1071 = as_type<int>(_1041);
        int _1073 = as_type<int>(_947);
        int _1075 = as_type<int>(_1055);
        int _1077 = 5200;
        int _1079 = as_type<int>(_953);
        int _1081;
        int _1083;
        int _1085;
        int _1087;
        int _1089;
        int _1091;
        int _1093;
        _102(_1071, _1073, _1075, _1077, _1079, _1081, _1083, _1085, _1087, _1089, _1091, _1093, out.gl_Position, out.gl_PointSize);
        _1095 = as_type<float>(_1091);
        _1097 = true;
    }
    else
    {
        float _1099 = rsqrt(_1041);
        float _1101 = _1041 * _1099;
        float _1103 = _1099 * 0.5;
        float _1105 = -_1101;
        float _1107 = 0.0 + _1105;
        float _1109 = fma(_1103, _1107, 0.5);
        float _1111 = fma(_1101, _1109, _1101);
        float _1113 = -_1111;
        float _1115 = 0.0 + _1113;
        float _1117 = fma(_1111, _1115, _1041);
        float _1119 = fma(_1103, _1117, _1111);
        _1095 = _1119;
    }
    _1097 = false;
    float _1121 = _1095;
    float _1123 = in.m_48.x;
    float _1125 = in.m_48.y;
    float _1127 = in.m_48.z;
    float _1129 = _381 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1131 = in.m_55.x;
    float _1133 = in.m_65.x;
    float _1135 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1137 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1139 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1141 = _1131 * 6.283185482025146484375;
    float _1143 = fma(_1123, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1135);
    float _1145 = fma(_1123, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1137);
    float _1147 = fma(_1133, 6.0, _1141);
    float _1149 = fma(_1127, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1143);
    float _1151 = fma(_1123, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1139);
    float _1153 = fma(_1127, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1145);
    float _1155 = fma(_137, 0.0500000007450580596923828125, _1147);
    float _1157 = _1149 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1159 = fma(_1127, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1151);
    float _1161 = _1153 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1163 = in.m_67.x;
    float _1165 = in.m_67.y;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1169 = _1157 + _1167;
    float _1171 = _1159 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1175 = _1161 + _1173;
    float _1177 = _1155 * 0.15915493667125701904296875;
    float _1179 = _1169 * _1169;
    float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1183 = _1171 + _1181;
    float _1185 = _1177 * 6.283185482025146484375;
    float _1187 = sin(_1185);
    float _1189 = fma(_1175, _1175, _1179);
    float _1191 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1193 = fma(_1183, _1183, _1189);
    float _1195 = rsqrt(_1193);
    float _1197 = _1163 * _1163;
    float _1199 = _1187 * 0.20000000298023223876953125;
    float _1201 = fma(_1165, _1165, _1197);
    float _1203 = _1199 * 0.15915493667125701904296875;
    float _1205 = _1203 * 6.283185482025146484375;
    float _1207 = cos(_1205);
    float _1209 = _1191 * _1195;
    float _1211 = _1169 * _1209;
    float _1213 = _1175 * _1209;
    float _1215 = rsqrt(_1201);
    float _1217 = _1183 * _1209;
    float _1219 = -_1211;
    float _1221 = _1169 + _1219;
    float _1223 = -_1213;
    float _1225 = _1175 + _1223;
    float _1227 = -_1213;
    float _1229 = _1161 + _1227;
    float _1231 = -_1217;
    float _1233 = _1183 + _1231;
    float _1235 = _1221 * _1221;
    float _1237 = _1203 * 6.283185482025146484375;
    float _1239 = sin(_1237);
    float _1241 = -_1207;
    float _1243 = _1241 + 1.0;
    float _1245 = fma(_1225, _1225, _1235);
    float _1247 = fma(_1233, _1233, _1245);
    float _1249 = _1215 * _1163;
    float _1251 = _1215 * _1165;
    float _1253 = sqrt(_1247);
    float _1255 = _1249 * _1249;
    float _1257 = _1251 * _1243;
    float _1259 = -_1239;
    float _1261 = _1249 * _1259;
    float _1263 = fma(_1243, _1255, _1207);
    float _1265 = -_1257;
    float _1267 = _1249 * _1265;
    float _1269 = _1251 * _1239;
    float _1271 = fma(_1251, _1257, _1207);
    float _1273 = _1013 * _1261;
    float _1275 = _1015 * _1263;
    float _1277 = _1015 * _1267;
    float _1279 = -_1273;
    float _1281 = fma(_1015, _1269, _1279);
    float _1283 = fma(_1013, _1267, _1275);
    float _1285 = fma(_1013, _1271, _1277);
    float _1287 = _1195 * _1253;
    float _1289 = fma(_1067, _1207, _1281);
    float _1291 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1293 = fma(_1067, _1261, _1285);
    float _1295 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1297 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1289);
    float _1299 = _1287 * _1291;
    float _1301 = -_1269;
    float _1303 = fma(_1067, _1301, _1283);
    float _1305 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1293);
    float _1307 = _1129 * _1287;
    float _1309 = _1297 * _1299;
    float _1311 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1303);
    float _1313 = _1287 * _1295;
    float _1315 = _1305 * _1307;
    float _1317 = _1309 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1319 = _1309 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1321 = _1311 * _1313;
    bool _1323 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1325 = isnan(0.5);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1331 = _1327 || _1329;
    float _1333 = fma(_1315, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1317);
    float _1335 = fma(_1315, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1319);
    float _1337 = -_1321;
    float _1339 = fma(_1337, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1333);
    float _1341 = -_1321;
    float _1343 = fma(_1341, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1335);
    float _1345 = _1171 + _1339;
    float _1347 = _1161 + _1343;
    float _1349 = _1309 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1351 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1353 = _1345 + _1351;
    float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1357 = _1347 + _1355;
    float _1359 = fma(_1315, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1349);
    float _1361 = _1353 * _1353;
    float _1363 = -_1321;
    float _1365 = fma(_1363, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1359);
    float _1367 = fma(_1357, _1357, _1361);
    float _1369 = _1157 + _1365;
    float _1371 = sqrt(_1367);
    bool _1373 = _1371 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1375 = _1361;
    float _1377 = _1365;
    float _1379 = _1321;
    float _1381 = _1371;
    float _1383 = _1357;
    float _1385 = _1161;
    if (!_1373)
    {
        _1375 = _1347;
    }
    float _1387 = _1375;
    float _1389 = _1387;
    if (!_1373)
    {
        _1377 = _1345;
    }
    float _1391 = _1377;
    float _1393 = _1391;
    if (!_1373)
    {
        _1379 = _1369;
    }
    float _1395 = _1379;
    bool _1397 = !_1373;
    float _1399 = _1395;
    if (!_1397)
    {
        float _1401 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1403 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1405 = _1371 + _1403;
        float _1407 = _1369 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1409 = rsqrt(_1367);
        float _1411 = _1405 * _1401;
        float _1413 = _1411 * 0.15915493667125701904296875;
        float _1415 = _1413 * 6.283185482025146484375;
        float _1417 = cos(_1415);
        float _1419 = _1413 * 6.283185482025146484375;
        float _1421 = sin(_1419);
        float _1423 = _1417 + (-1.0);
        float _1425 = _1423 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1427 = fma(_1421, _1407, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1429 = fma(_1369, _1417, _1425);
        float _1431 = _1409 * _1427;
        float _1433 = fma(_1357, _1431, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1435 = fma(_1353, _1431, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1399 = _1429;
        _1393 = _1435;
        _1389 = _1433;
        _1381 = _1409;
    }
    float _1437 = _1399;
    float _1439 = _1393;
    float _1441 = _1389;
    float _1443 = _1381;
    float _1445 = -_1211;
    float _1447 = _1445 + _1437;
    float _1449 = -_1217;
    float _1451 = _1449 + _1439;
    float _1453 = -_1213;
    float _1455 = _1453 + _1441;
    float _1457 = -_1211;
    float _1459 = _1157 + _1457;
    float _1461 = -_1217;
    float _1463 = _1171 + _1461;
    float _1465 = _1447;
    float _1467 = _1455;
    float _1469 = _1451;
    float _1471 = _1443;
    if (!_1331)
    {
        float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1475 = _1459 + _1473;
        float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1479 = _1229 + _1477;
        float _1481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1483 = -_1157;
        float _1485 = _1483 + _1437;
        float _1487 = _1475 * _1475;
        float _1489 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1491 = _1463 + _1489;
        float _1493 = -_1171;
        float _1495 = _1493 + _1439;
        float _1497 = fma(_1479, _1479, _1487);
        float _1499 = 1.0 / _1287;
        float _1501 = fma(_1491, _1491, _1497);
        float _1503 = sqrt(_1501);
        float _1505 = precise::min(_1503, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1507 = _1505 * _1481;
        float _1509 = -_1161;
        float _1511 = _1509 + _1441;
        float _1513 = _1507 * _1499;
        float _1515 = fma(_1511, _1513, _1229);
        float _1517 = fma(_1485, _1513, _1459);
        float _1519 = fma(_1495, _1513, _1463);
        _1465 = _1517;
        _1467 = _1515;
        _1469 = _1519;
        _1471 = _1513;
    }
    float _1521 = _1465;
    float _1523 = _1467;
    float _1525 = _1469;
    float _1527 = _1471;
    float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1531 = _1521 + _1529;
    float _1533 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1535 = _1523 + _1533;
    float _1537 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1539 = _1525 + _1537;
    float _1541 = _1531 * _1531;
    float _1543 = fma(_1535, _1535, _1541);
    float _1545 = fma(_1539, _1539, _1543);
    float _1547 = rsqrt(_1545);
    float _1549 = sqrt(_1545);
    float _1551 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1553 = _1535 * _1551;
    float _1555 = _1539 * _1551;
    float _1557 = _1553 * _1553;
    float _1559 = _1555 * _1555;
    float _1561 = _1557 + _1559;
    float _1563 = sqrt(_1561);
    bool _1565 = _1563 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1567 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1569 = _1563 + _1567;
    float _1571 = _1539;
    float _1573 = _1561;
    float _1575 = _1569;
    float _1577 = _1527;
    float _1579 = _1531;
    float _1581 = _1551;
    if (_1565)
    {
        float _1583 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1571 = _1583;
    }
    float _1585 = _1571;
    if (_1565)
    {
        float _1587 = rsqrt(_1561);
        _1573 = _1587;
    }
    float _1589 = _1573;
    if (_1565)
    {
        float _1591 = _1569 * _1585;
        _1575 = _1591;
    }
    float _1593 = _1575;
    if (_1565)
    {
        float _1595 = _1593 * 0.15915493667125701904296875;
        _1577 = _1595;
    }
    float _1597 = _1577;
    float _1599 = _1547;
    if (_1565)
    {
        float _1601 = _1597 * 6.283185482025146484375;
        float _1603 = sin(_1601);
        _1599 = _1603;
    }
    float _1605 = _1599;
    float _1607 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1609 = precise::max(0.0, _1607);
    float _1611 = _1585;
    if (_1565)
    {
        float _1613 = _1597 * 6.283185482025146484375;
        float _1615 = cos(_1613);
        _1611 = _1615;
    }
    float _1617 = _1611;
    float _1619 = -_1551;
    float _1621 = -_1609;
    float _1623 = fma(_1531, _1619, _1621);
    float _1625 = _1623;
    if (_1565)
    {
        float _1627 = _1623 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1579 = _1627;
    }
    float _1629 = _1579;
    float _1631 = _1605;
    float _1633 = _1629;
    if (_1565)
    {
        float _1635 = fma(_1605, _1629, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1631 = _1635;
    }
    float _1637 = _1631;
    float _1639 = _1637;
    if (!_1565)
    {
        _1633 = _1557;
    }
    float _1641 = _1633;
    float _1643 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1645 = _1641;
    if (_1565)
    {
        float _1647 = _1617 + (-1.0);
        _1581 = _1647;
    }
    float _1649 = _1581;
    float _1651 = _1649;
    if (_1565)
    {
        float _1653 = _1589 * _1637;
        _1383 = _1653;
    }
    float _1655 = _1383;
    if (!_1565)
    {
        _1639 = _1553;
    }
    float _1657 = _1639;
    float _1659 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1643);
    float _1661 = _1657;
    if (_1565)
    {
        float _1663 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1385 = _1663;
    }
    float _1665 = _1385;
    float _1667 = _1665;
    if (_1565)
    {
        float _1669 = _1553 * _1655;
        _1661 = _1669;
    }
    float _1671 = _1661;
    if (!_1565)
    {
        _1651 = _1555;
    }
    float _1673 = _1651;
    float _1675 = _1673;
    if (_1565)
    {
        float _1677 = _1555 * _1655;
        _1675 = _1677;
    }
    float _1679 = _1675;
    if (_1565)
    {
        float _1681 = fma(_1623, _1617, _1665);
        _1625 = _1681;
    }
    float _1683 = _1625;
    if (_1565)
    {
        float _1685 = _1671 * _1671;
        _1645 = _1685;
    }
    float _1687 = _1645;
    if (!_1565)
    {
        _1667 = _1559;
    }
    float _1689 = _1667;
    float _1691 = _1689;
    if (_1565)
    {
        float _1693 = _1679 * _1679;
        _1691 = _1693;
    }
    float _1695 = _1691;
    float _1697 = fma(_1683, _1683, _1687);
    float _1699 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1701 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1659);
    float _1703 = _1697 + _1695;
    float _1705 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1699);
    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1709 = fma(_1549, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1707);
    float _1711 = precise::clamp(_1709, 0.0, 1.0);
    float _1713 = rsqrt(_1703);
    float _1715 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1705);
    float _1717 = -_1711;
    float _1719 = _1717 + 1.0;
    float _1721 = fma(_1229, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1723 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1725 = _1715 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1727 = _1701 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1729 = abs(_1719);
    float _1731 = log2(_1729);
    float _1733 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1735 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1737 = fma(_1463, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1739 = -_1733;
    float _1741 = fma(_1739, _1723, 1.0);
    float _1743 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1745 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1735);
    float _1747 = floor(_1721);
    float _1749 = _1713 * _1671;
    float _1751 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1743);
    float _1753 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1745);
    float _1755 = _1713 * _1683;
    float _1757 = _1713 * _1679;
    float _1759 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1751);
    float _1761 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1763 = floor(_1737);
    float _1765 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1767 = _1759 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1769 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1771 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1773 = -_1765;
    float _1775 = fma(_1755, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1773);
    float _1777 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1769);
    float _1779 = log2(_1741);
    float _1781 = -_1757;
    float _1783 = fma(_1781, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1775);
    float _1785 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1787 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1777);
    float _1789 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1791 = fma(_1783, -0.5, 0.5);
    float _1793 = fma(_1783, 0.5, 0.5);
    float _1795 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1785);
    float _1797 = exp2(_1771);
    float _1799 = -_1747;
    float _1801 = _1721 + _1799;
    float _1803 = -_1763;
    float _1805 = _1737 + _1803;
    float _1807 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1787);
    float _1809 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1789);
    float _1811 = _1755 + 1.0;
    float _1813 = fma(_1793, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float2 _5285 = float2(_1801, _1805);
    float _1815 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5285, float2(0.0), isnan(_5285)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5285, float2(0.0), isnan(_5285)), level(0.0)).x;
    float _1817 = 1.0 / _1807;
    float _1819 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1809);
    float _1821 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1795);
    float _1823 = fma(_1793, _1813, -0.212114393711090087890625);
    float _1825 = _1779 * 0.693147182464599609375;
    float _1827 = fma(_1793, _1823, 1.570728778839111328125);
    float _1829 = sqrt(_1791);
    float _1831 = -_1755;
    float _1833 = fma(_1797, _1811, _1831);
    float _1835 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1819);
    float _1837 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1821);
    float _1839 = _1825 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1841 = _1835 * _1817;
    float _1843 = _1837 * _1817;
    float _1845 = fma(_1833, 0.5, 0.5);
    float _1847 = fma(_1841, 0.5, 0.5);
    float _1849 = fma(_1843, -0.5, 0.5);
    float _1851 = _1829 * 0.636619746685028076171875;
    float3 _5354 = float3(_1847, _1849, _1839);
    float _1853 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5354, float3(0.0), isnan(_5354)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5354, float3(0.0), isnan(_5354)), level(0.0)).x;
    float _1855 = -_1827;
    float _1857 = fma(_1851, _1855, 1.0);
    float3 _5370 = float3(_1847, _1849, _1839);
    float4 _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5370, float3(0.0), isnan(_5370)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5370, float3(0.0), isnan(_5370)), level(0.0)).xyzw;
    float _1861 = _1859.x;
    float _1863 = _1859.y;
    float _1865 = _1859.z;
    float _1867 = _1859.w;
    float2 _5386 = float2(_1857, _1845);
    float3 _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5386, float2(0.0), isnan(_5386)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5386, float2(0.0), isnan(_5386)), level(0.0)).xyz;
    float _1873 = _1871.x;
    float _1875 = _1871.y;
    float _1877 = _1871.z;
    float _1879 = _1459 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1881 = _1459 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1883 = _1065 * _1121;
    float _1885 = _1049 * 2.0;
    float _1887 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1879);
    float _1889 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1881);
    float _1891 = -_841;
    float _1893 = _1891 + _1035;
    float _1895 = -_1885;
    float _1897 = fma(_1883, _1895, _1883);
    float _1899 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1887);
    float _1901 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1889);
    bool _1903 = _1303 != 0.0;
    bool _1905 = isnan(_1303);
    bool _1907 = _1903 || _1905;
    bool _1909 = isnan(0.0);
    bool _1911 = _1907 || _1909;
    float _1913 = fma(_1049, 3.1415927410125732421875, _1897);
    float _1915 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1917 = _1033 * 3.883221149444580078125;
    float _1919 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1921 = 1.0 / _1915;
    float _1923 = _1913 * 0.15915493667125701904296875;
    float _1925 = _1919 + _1915;
    float _1927 = _1917 * 0.15915493667125701904296875;
    bool _1929 = _1293 == 0.0;
    bool _1931 = !_1911;
    bool _1933 = _1929 && _1931;
    out.m_69.x = _861;
    out.m_69.y = _800;
    out.m_69.z = _806;
    out.m_69.w = _867;
    bool _1935 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1937 = isnan(0.5);
    bool _1939 = _1935 || _1937;
    bool _1941 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1943 = _1939 || _1941;
    float _1945 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1947 = _1927 * 6.283185482025146484375;
    float _1949 = cos(_1947);
    bool _1951 = _1289 == 0.0;
    bool _1953 = _1951 && _1933;
    float _1955 = in.m_65.w;
    float _1957 = _1925 * _1921;
    float _1959 = _1957 * 0.5;
    float _1961 = _1923 * 6.283185482025146484375;
    float _1963 = sin(_1961);
    float _1965 = fma(_981, _1893, _841);
    float _1967 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1969 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1967);
    float _1971 = _1965 * _1263;
    float _1973 = 1.0 / _1969;
    float _1975 = _1927 * 6.283185482025146484375;
    float _1977 = sin(_1975);
    float _1979 = -_987;
    float _1981 = fma(_1963, _1949, _1979);
    out.m_71.w = _1955;
    float _1983 = fma(_981, _1981, _987);
    float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1987 = _1973 * _1985;
    float _1989 = fma(_1983, _1267, _1971);
    float _1991 = _1983 * _1261;
    float _1993 = _1965 * _1267;
    float _1995 = abs(_1987);
    float _1997 = log2(_1995);
    float _1999 = _1807 * 0.5;
    float _2001 = -_1991;
    float _2003 = fma(_1965, _1269, _2001);
    float _2005 = fma(_1983, _1271, _1993);
    float _2007 = -_989;
    float _2009 = fma(_1963, _1977, _2007);
    float _2011 = fma(_981, _2009, _989);
    float _2013 = exp2(_1945);
    float _2015 = -_1269;
    float _2017 = fma(_2011, _2015, _1989);
    float _2019 = fma(_2011, _1207, _2003);
    float _2021 = fma(_2011, _1261, _2005);
    float _2023 = fma(_1303, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2017);
    float _2025 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2027 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2019);
    float _2029 = _2021;
    int _2031 = as_type<int>(_2003);
    float _2033 = _1987;
    if (_1953)
    {
        _875 = _2019;
    }
    float _2035 = _875;
    float _2037 = _2035;
    if (!_1953)
    {
        float _2039 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2021);
        _2029 = _2039;
    }
    float _2041 = _2029;
    if (_1953)
    {
        _2031 = as_type<int>(_2023);
    }
    int _2043 = _2031;
    float _2045 = exp2(_2025);
    int _2047 = _2043;
    if (!_1953)
    {
        _2047 = as_type<int>(_2023);
    }
    int _2049 = _2047;
    float _2051 = _1953 ? _2019 : _2027;
    float _2053 = -_2013;
    float _2055 = _2053 + 1.0;
    float _2057 = _1953 ? _2017 : as_type<float>(_2049);
    float _2059 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1953)
    {
        _2037 = _2027;
    }
    float _2061 = _2037;
    float _2063 = _2057 * _2057;
    if (_1953)
    {
        _877 = _2017;
    }
    float _2065 = _877;
    out.m_73.x = (*spvDescriptorSet0.vp_c10)._m0[8].x;
    out.m_73.y = (*spvDescriptorSet0.vp_c10)._m0[9].x;
    out.m_73.z = (*spvDescriptorSet0.vp_c10)._m0[10].x;
    float _2067 = _2065;
    if (!_1953)
    {
        _2067 = _2023;
    }
    float _2069 = _2067;
    float _2071 = fma(_2051, _2051, _2063);
    float _2073 = _2061 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2075 = fma(_2045, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2077 = precise::clamp(_2075, 0.0, 1.0);
    float _2079 = _2061 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2081 = in.m_75.x;
    bool _2083 = _1987 <= 8000.0;
    bool _2085 = isnan(_1987);
    bool _2087 = _2083 || _2085;
    bool _2089 = isnan(8000.0);
    bool _2091 = _2087 || _2089;
    float _2093 = float(_2091);
    float _2095 = rsqrt(_2071);
    float _2097 = fma(_2077, -2.0, 3.0);
    float _2099 = _2077 * _2077;
    bool _2101 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2103 = isnan(_1549);
    bool _2105 = _2101 || _2103;
    bool _2107 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2109 = _2105 || _2107;
    float _2111 = _2061 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2113 = fma(_2041, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2073);
    float _2115 = _2099 * _2097;
    float _2117 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2119 = fma(_2041, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2079);
    float _2121 = fma(_2041, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2111);
    float _2123 = -_2115;
    float _2125 = _2123 + 1.0;
    float _2127 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2117);
    float _2129 = _2111;
    float _2131 = _2069;
    if (!_1943)
    {
        _2129 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2133 = _2129;
    float _2135 = -_2069;
    float _2137 = fma(_2135, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2113);
    float _2139 = fma(_2125, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2115);
    float _2141 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2127);
    float _2143 = _2051 * _2095;
    float _2145 = _2057 * _2095;
    float _2147 = _2133;
    if (!_1943)
    {
        float _2149 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2151 = _2133 + _2149;
        _2147 = _2151;
    }
    float _2153 = _2147;
    float _2155 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2141);
    float _2157 = -(*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2159 = _2143 * _2157;
    float _2161 = -(*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2163 = _2143 * _2161;
    float _2165 = -(*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2167 = _2143 * _2165;
    float _2169 = _1993;
    float _2171 = _2167;
    float _2173 = _2163;
    if (!_1943)
    {
        float _2175 = 1.0 / _2153;
        _2169 = _2175;
    }
    float _2177 = _2169;
    float _2179 = -_2145;
    float _2181 = fma(_2179, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2159);
    float _2183 = -_2145;
    float _2185 = fma(_2183, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2163);
    float _2187 = -_2145;
    float _2189 = fma(_2187, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2167);
    float _2191 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2193 = _2155 + _2191;
    float _2195 = _2093 * _2139;
    float _2197 = fma(_1837, -0.5, _1999);
    float _2199 = _1835 + _1807;
    out.m_77.x = _2181;
    out.m_77.y = _2185;
    out.m_77.z = _2189;
    float _2201 = _1807 + _2193;
    float _2203 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2205 = _2199 * 0.5;
    out.gl_Position.x = _1835;
    out.gl_Position.y = _1837;
    out.gl_Position.z = _2193;
    out.gl_Position.w = _1807;
    float _2207 = _2201 * 0.5;
    float _2209 = -_2069;
    float _2211 = fma(_2209, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2119);
    float _2213 = -_2069;
    float _2215 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2121);
    float _2217 = _2189;
    float _2219 = _2193;
    if (!_1943)
    {
        _2131 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _2221 = _2131;
    float _2223 = _2221;
    if (!_1943)
    {
        float _2225 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2227 = _1987 + _2225;
        _2171 = _2227;
    }
    float _2229 = _2171;
    out.m_79.x = _2205;
    out.m_79.y = _2197;
    out.m_79.z = _2207;
    out.m_79.w = _1807;
    if (!_1943)
    {
        float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2233 = _1987 + _2231;
        _2033 = _2233;
    }
    float _2235 = _2033;
    out.m_81.x = _2137;
    out.m_81.y = _2211;
    out.m_81.z = _2215;
    float _2237 = _2235;
    float _2239 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (_1943)
    {
        _2173 = 1.0;
    }
    float _2241 = _2173;
    float _2243 = _2241;
    if (!_1943)
    {
        float _2245 = _2229 * _2177;
        float _2247 = precise::clamp(_2245, 0.0, 1.0);
        _2243 = _2247;
    }
    float _2249 = _2243;
    if (!_2109)
    {
        _2217 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2251 = _2217;
    float _2253 = _2251;
    float _2255 = _2251;
    if (!_1943)
    {
        float _2257 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2259 = _2221 + _2257;
        _2219 = _2259;
    }
    float _2261 = _2219;
    if (!_2109)
    {
        _2223 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2263 = _2223;
    float _2265 = _2185;
    float _2267 = _2263;
    float _2269 = _2263;
    if (!_1943)
    {
        float _2271 = 1.0 / _2261;
        _2265 = _2271;
    }
    float _2273 = _2265;
    if (!_1943)
    {
        float _2275 = _2235 * _2273;
        float _2277 = precise::clamp(_2275, 0.0, 1.0);
        _2237 = _2277;
    }
    float _2279 = _2237;
    float _2281 = -_1815;
    float _2283 = _2281 + 1.0;
    float _2285 = _2283 * _2203;
    float _2287 = precise::clamp(_2285, 0.0, 1.0);
    float _2289 = -_2287;
    float _2291 = fma(_2289, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2293 = _1861;
    if (_1943)
    {
        _2239 = 1.0;
    }
    float _2295 = _2239;
    float _2297 = _2295;
    if (!_1943)
    {
        float _2299 = -_2279;
        float _2301 = _2299 + 1.0;
        _2297 = _2301;
    }
    float _2303 = _2297;
    float _2305 = _2291 * _2081;
    float _2307 = _2249 * _2303;
    float _2309 = _2305 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_83.x = _2309;
    float _2311 = _2059 * _1853;
    float _2313 = -_2059;
    float _2315 = _2313 + 1.0;
    float _2317 = _1867 * _2311;
    float _2319 = _1867 * _2315;
    float _2321 = _1877 * _2311;
    float _2323 = fma(_1873, _2317, _1861);
    float _2325 = fma(_1875, _2317, _1863);
    float _2327 = _2307 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2329 = fma(_1867, _2321, _1865);
    float _2331 = _2307;
    float _2333 = _2325;
    float _2335 = _2323;
    if (!_2109)
    {
        _2293 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2337 = _2293;
    float _2339 = _2337;
    float _2341 = _2337;
    if (!_2109)
    {
        _2331 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2343 = _2331;
    out.m_85.x = _2323;
    out.m_85.y = _2325;
    out.m_85.z = _2329;
    out.m_85.w = _2319;
    float _2345 = _2343;
    float _2347 = _2343;
    if (!_2109)
    {
        _2333 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2349 = _2333;
    float _2351 = _2349;
    float _2353 = _2349;
    if (!_2109)
    {
        _2335 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2355 = _2335;
    bool _2357 = !_2109;
    float _2359 = _2355;
    float _2361 = _2355;
    if (!_2357)
    {
        bool _2363 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2365 = isnan(_1549);
        bool _2367 = _2363 || _2365;
        bool _2369 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2371 = _2367 || _2369;
        if (!_2371)
        {
            float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2375 = _1549 + _2373;
            float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2379 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2377;
            float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2383 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2385 = 1.0 / _2379;
            float _2387 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2389 = _2387 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2403 = _2375 * _2385;
            float _2405 = precise::clamp(_2403, 0.0, 1.0);
            float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2411 = fma(_2405, _2383, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2413 = fma(_2405, _2409, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2415 = fma(_2405, _2389, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2417 = fma(_2405, _2393, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2419 = fma(_2405, _2397, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2421 = fma(_2405, _2401, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2255 = _2415;
            _2353 = _2419;
            _2341 = _2411;
            _2347 = _2417;
            _2269 = _2413;
            _2361 = _2421;
            _2423 = true;
        }
        else
        {
            bool _2425 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2427 = isnan(_1549);
            bool _2429 = _2425 || _2427;
            bool _2431 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2433 = _2429 || _2431;
            if (!_2433)
            {
                _2339 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2435 = _2339;
            _2341 = _2435;
            if (!_2433)
            {
                _2253 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2437 = _2253;
            _2255 = _2437;
            if (!_2433)
            {
                _2267 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2439 = _2267;
            _2269 = _2439;
            if (!_2433)
            {
                _2345 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2441 = _2345;
            _2347 = _2441;
            if (!_2433)
            {
                _2351 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2443 = _2351;
            _2353 = _2443;
            if (!_2433)
            {
                _2359 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2445 = _2359;
            bool _2447 = !_2433;
            _2361 = _2445;
            if (!_2447)
            {
                bool _2449 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2451 = isnan(_1549);
                bool _2453 = _2449 || _2451;
                bool _2455 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2457 = _2453 || _2455;
                if (!_2457)
                {
                    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2461 = _1549 + _2459;
                    float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2465 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2463;
                    float _2467 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2469 = _2467 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2471 = 1.0 / _2465;
                    float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2483 = _2481 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2489 = _2461 * _2471;
                    float _2491 = precise::clamp(_2489, 0.0, 1.0);
                    float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2497 = fma(_2491, _2469, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2499 = fma(_2491, _2495, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2501 = fma(_2491, _2475, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2503 = fma(_2491, _2479, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2505 = fma(_2491, _2483, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2507 = fma(_2491, _2487, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2255 = _2501;
                    _2353 = _2505;
                    _2341 = _2497;
                    _2347 = _2503;
                    _2269 = _2499;
                    _2361 = _2507;
                    _2423 = true;
                }
                else
                {
                    _2255 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2353 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2341 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2347 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2269 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2361 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2423 = false;
    float _2509 = _2255;
    float _2511 = _2353;
    float _2513 = _2341;
    float _2515 = _2347;
    float _2517 = _2269;
    float _2519 = _2361;
    float _2521 = fma(_2211, -0.5, 0.5);
    float _2523 = precise::clamp(_2521, 0.0, 1.0);
    float _2525 = -_2509;
    float _2527 = _2525 + _2511;
    float _2529 = _2327 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2531 = -_2513;
    float _2533 = _2531 + _2515;
    out.m_87.x = 0.0;
    float _2535 = fma(_2523, _2527, _2509);
    float _2537 = -_2517;
    float _2539 = _2537 + _2519;
    out.m_51.x = _2529;
    float _2541 = fma(_2523, _2533, _2513);
    float _2543 = _2535 * 0.586610972881317138671875;
    bool _2545 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2547 = fma(_2523, _2539, _2517);
    float _2549 = fma(_2541, 0.298911988735198974609375, _2543);
    bool _2551 = _2249 > 0.0;
    bool _2553 = isnan(_2249);
    bool _2555 = _2551 || _2553;
    bool _2557 = isnan(0.0);
    bool _2559 = _2555 || _2557;
    float _2561 = fma(_2547, 0.114477999508380889892578125, _2549);
    bool _2563 = _2303 <= 0.0;
    bool _2565 = !_2559;
    bool _2567 = _2563 || _2565;
    float _2569 = -_2561;
    float _2571 = _2541 + _2569;
    float _2573 = -_2561;
    float _2575 = _2535 + _2573;
    float _2577 = -_2561;
    float _2579 = _2547 + _2577;
    float _2581 = fma(_2571, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2561);
    float _2583 = fma(_2575, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2561);
    float _2585 = fma(_2579, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2561);
    bool _2587 = !_2545;
    if (!_2587)
    {
        float _2589 = -_1521;
        float _2591 = _2589 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2593 = -_1523;
        float _2595 = _2593 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2597 = -_1525;
        float _2599 = _2597 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2601 = _2591 * _2591;
        float _2603 = fma(_2595, _2595, _2601);
        float _2605 = fma(_2599, _2599, _2603);
        float _2607 = sqrt(_2605);
        float _2609 = rsqrt(_2605);
        float _2611 = -_2607;
        float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2615 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2617 = precise::clamp(_2615, 0.0, 1.0);
        float _2619 = _2595 * _2609;
        float _2621 = _2591 * _2609;
        float _2623 = abs(_2617);
        float _2625 = log2(_2623);
        float _2627 = _2599 * _2609;
        float _2629 = _2619 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2631 = _2211 * _2621;
        float _2633 = -_2621;
        float _2635 = -_2629;
        float _2637 = fma(_2633, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2635);
        float _2639 = fma(_2137, _2619, _2631);
        float _2641 = -_2627;
        float _2643 = fma(_2641, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2637);
        float _2645 = fma(_2215, _2627, _2639);
        float _2647 = precise::clamp(_2645, 0.0, 1.0);
        float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2651 = _2643 + _2649;
        float _2653 = _2625 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2655 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2657 = precise::clamp(_2655, 0.0, 1.0);
        float _2659 = exp2(_2653);
        float _2661 = _2659 * _2657;
        float _2663 = _2647 * _2661;
        float _2665 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2667 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2669 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2665;
        out.m_87.y = _2667;
        out.m_87.z = _2669;
    }
    out.m_89.x = _2581;
    out.m_89.y = _2583;
    out.m_89.z = _2585;
    if (!_2567)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2671 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2671;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

