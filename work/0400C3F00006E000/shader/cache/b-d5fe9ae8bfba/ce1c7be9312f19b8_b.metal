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
    float4 m_63 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
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
    float4 m_59 [[attribute(8)]];
};

static inline __attribute__((always_inline))
int _90(thread const int& _6181, thread const int& _6182, constant _10& support_buffer)
{
    float _6185 = as_type<float>(support_buffer._m4);
    int _6187 = _6182 + as_type<int>(_6185);
    int _6189 = 1 + _6187;
    float _6191 = support_buffer._m5[_6189].x;
    float _6193 = abs(_6191);
    bool _6195 = _6193 == 1.0;
    if (_6195)
    {
        return _6181;
    }
    float _6197 = float(_6181);
    float _6199 = _6197 / _6193;
    int _6201 = int(_6199);
    return _6201;
}

static inline __attribute__((always_inline))
int _91(thread const int& _6231, thread const int& _6232, constant _10& support_buffer)
{
    float _6235 = as_type<float>(support_buffer._m4);
    int _6237 = _6232 + as_type<int>(_6235);
    int _6239 = 1 + _6237;
    float _6241 = support_buffer._m5[_6239].x;
    bool _6243 = _6241 == 1.0;
    if (_6243)
    {
        return _6231;
    }
    float _6245 = float(_6231);
    float _6247 = _6245 * _6241;
    int _6249 = int(_6247);
    return _6249;
}

static inline __attribute__((always_inline))
void _88(thread const int& _5876, thread const int& _5877, thread const int& _5878, thread const int& _5879, thread int& _5880, thread int& _5881, thread int& _5882, thread int& _5883, thread int& _5884, thread int& _5885, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _5888 = _5877;
    int _5890 = _5878;
    float _5892 = 0.0 + as_type<float>(_5876);
    bool _5894 = _5892 != 0.0;
    bool _5896 = isnan(_5892);
    bool _5898 = _5894 || _5896;
    bool _5900 = isnan(0.0);
    bool _5902 = _5898 || _5900;
    int _5904 = as_type<int>(_5892);
    int _5906 = _5902 ? (-1) : 0;
    if (!_5902)
    {
        float _5908 = as_type<float>(_5876) * 1.0;
        _5888 = as_type<int>(_5908);
    }
    int _5910 = _5888;
    bool _5912 = !_5902;
    int _5914 = _5910;
    int _5916 = _5910;
    if (!_5912)
    {
        bool _5918 = _5892 >= 0.0;
        bool _5920 = isnan(_5892);
        bool _5922 = _5918 || _5920;
        bool _5924 = isnan(0.0);
        bool _5926 = _5922 || _5924;
        _5906 = _5926 ? (-1) : 0;
        if (!_5926)
        {
            _5914 = 2147483647;
        }
        int _5928 = _5914;
        bool _5930 = !_5926;
        int _5932 = _5928;
        _5916 = _5928;
        if (!_5930)
        {
            float _5934 = abs(as_type<float>(_5876));
            float _5936 = 0.0 + _5934;
            bool _5938 = _5936 > as_type<float>(0x7f800000u /* inf */);
            bool _5940 = isnan(_5936);
            bool _5942 = _5938 || _5940;
            bool _5944 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _5946 = _5942 || _5944;
            _5904 = as_type<int>(_5936);
            _5906 = _5946 ? (-1) : 0;
            if (_5946)
            {
                float _5948 = as_type<float>(_5876) + 1.0;
                _5932 = as_type<int>(_5948);
            }
            int _5950 = _5932;
            int _5952 = _5950;
            _5916 = _5950;
            if (!_5946)
            {
                bool _5954 = _5936 != as_type<float>(0x7f800000u /* inf */);
                bool _5956 = isnan(_5936);
                bool _5958 = _5954 || _5956;
                bool _5960 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _5962 = _5958 || _5960;
                _5906 = _5962 ? (-1) : 0;
                if (!_5962)
                {
                    _5952 = _5876;
                }
                int _5964 = _5952;
                bool _5966 = !_5962;
                _5916 = _5964;
                if (!_5966)
                {
                    float _5968 = as_type<float>(_5876) * 18446744073709551616.0;
                    float _5970 = rsqrt(_5968);
                    float _5972 = _5968 * _5970;
                    float _5974 = _5970 * 0.5;
                    float _5976 = -_5972;
                    float _5978 = 0.0 + _5976;
                    float _5980 = fma(_5974, _5978, 0.5);
                    float _5982 = fma(_5972, _5980, _5972);
                    float _5984 = -_5982;
                    float _5986 = 0.0 + _5984;
                    float _5988 = fma(_5982, _5986, _5968);
                    float _5990 = fma(_5974, _5988, _5982);
                    float _5992 = _5990 * 2.3283064365386962890625e-10;
                    _5916 = as_type<int>(_5992);
                    _5904 = as_type<int>(_5978);
                    _5890 = as_type<int>(_5982);
                }
            }
        }
    }
    int _5994 = _5916;
    int _5996 = _5904;
    int _5998 = _5890;
    int _6000 = _5906;
    _5880 = _5994;
    _5881 = _5879;
    _5882 = 0;
    _5883 = _5996;
    _5884 = _5998;
    _5885 = _6000;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1925 = false;
    bool _1219 = false;
    bool _1027 = false;
    bool _423 = false;
    bool _299 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_46.w;
    float _97 = trunc(_95);
    int _99 = int(_97);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    float _107 = as_type<float>(_99);
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _105;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _109 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2403 = as_type<float>(_115);
        out.gl_Position.z = _2403;
    }
    if (!_103)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _119 = in.m_51.w;
    float _121 = float(_99);
    float _123 = -_119;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_119);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    bool _137 = _125 >= _121;
    bool _139 = !_135;
    bool _141 = _137 || _139;
    float _143 = _125;
    if (_141)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _107;
    if (_141)
    {
        out.m_49.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _117 = as_type<int>(_147);
    }
    int _149 = _117;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2467 = as_type<float>(_149);
        out.gl_Position.z = _2467;
    }
    if (_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = in.m_53.w;
    float _153 = 1.0 / _121;
    float _155 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = in.m_51.x;
    float _169 = in.m_51.y;
    float _171 = in.m_51.z;
    float _173 = in.m_46.x;
    float _175 = in.m_46.y;
    float _177 = in.m_46.z;
    float _179 = 0.0;
    float _181 = _155;
    if (!_165)
    {
        float _183 = _155 * _155;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = _187;
    if (!_165)
    {
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _191;
    }
    float _193 = _189;
    bool _195 = !_165;
    float _197 = _193;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _155 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _155);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    bool _231 = !_165;
    if (!_231)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _155 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _181 = _251;
    }
    float _253 = _181;
    bool _255 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _257 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _259 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _261 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _263 = fma(_253, _167, _257);
    float _265 = fma(_253, _169, _259);
    float _267 = fma(_253, _171, _261);
    float _269 = fma(_263, _151, _173);
    float _271 = fma(_265, _151, _175);
    float _273 = fma(_267, _151, _177);
    float _275 = _125 * _153;
    bool _277 = !_255;
    float _279 = _269;
    float _297;
    if (!_277)
    {
        float _281 = in.m_55.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        _297 = _275;
    }
    _299 = false;
    float _301 = _297;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _303;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _311 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _313 = 1.0 / _305;
    float _315 = _307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = _301 + _317;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _323 = _309 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _325 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _327 = isnan(_301);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _321 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _339 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_301);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -_335;
    float _353 = _351 + 1.0;
    float _355 = _319 * _313;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _359;
    out.m_57.x = _315;
    out.m_57.y = _337;
    out.m_57.z = _323;
    out.m_57.w = _357;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _367;
    float _371 = _349 * _353;
    float _373 = fma(_361, _355, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _375 = fma(_365, _355, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _377 = fma(_369, _355, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _379 = -_349;
    float _381 = _379 + 1.0;
    float _383 = _373 * _371;
    float _385 = _375 * _371;
    float _387 = _377 * _371;
    float _389 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[143].x, _383);
    float _391 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[143].y, _385);
    float _393 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[143].z, _387);
    float _395 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[144].x, _389);
    float _397 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[144].y, _391);
    float _399 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[144].z, _393);
    bool _401 = !_311;
    bool _403 = _311;
    float _421;
    if (!_401)
    {
        float _405 = in.m_55.x;
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _409 = _405 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        _421 = _275;
    }
    _423 = false;
    float _425 = _421;
    int _427 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _429 = _427;
    int _431 = 0;
    int _433 = _90(_429, _431, (*spvDescriptorSet0.support_buffer));
    float _435 = in.m_59.z;
    float _437 = 0.0 + _275;
    float _439 = precise::clamp(_437, 0.0, 1.0);
    float _441 = trunc(_435);
    int _443 = int(_441);
    int _445 = _433 + (-1);
    float _447 = float(_445);
    float _449 = _439 * _447;
    float _451 = trunc(_449);
    int _453 = int(_451);
    int _455 = _453;
    int _457 = 0;
    int _459 = _91(_455, _457, (*spvDescriptorSet0.support_buffer));
    int _461 = _443;
    int _463 = 0;
    int _465 = _91(_461, _463, (*spvDescriptorSet0.support_buffer));
    float4 _468 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_459, _465)), 0).xyzw;
    float _470 = _468.x;
    float _472 = _468.y;
    float _474 = _468.z;
    float _476 = _468.w;
    float _478 = in.m_53.x;
    float _480 = in.m_53.y;
    float _482 = in.m_53.z;
    float _484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _486 = in.m_59.x;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _490 = _488 != 0;
    float _492 = in.m_55.z;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _500 = _498 != 0;
    float _502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _504 = in.m_55.x;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _510 = _508 != 0;
    float _512 = in.m_55.w;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _516 = _514 != 0;
    float _518 = 1.0 / _496;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _522 = _520 != 0;
    float _524 = _395 * _478;
    float _526 = _397 * _480;
    float _528 = in.m_55.y;
    float _530 = _399 * _482;
    float _532 = -_486;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _542 = _540 != 0;
    float _544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _546 = _504 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_490)
    {
        bool _548 = _492 > 0.5;
        _403 = _548;
    }
    bool _550 = _403;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _554 = 0.0;
    if (!_490)
    {
        _554 = _486;
    }
    float _556 = _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _562 = _556;
    if (_490)
    {
        float _564 = _550 ? _534 : _486;
        _562 = _564;
    }
    float _566 = _562;
    float _568 = 1.0 / _538;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _572 = _570 != 0;
    float _574 = -_506;
    float _576 = fma(_546, 2.0, _574);
    bool _578 = _512 > 0.5;
    bool _580 = _578 && _522;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _582;
    bool _586 = _504 > 0.5;
    bool _588 = _586 && _510;
    float _590 = 1.0 / _560;
    float _592 = in.m_59.y;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _598 = _528 > 0.5;
    float _600 = _544 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _602 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _604 = isnan(_425);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _616 = _528 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _620 = _528 > 0.5;
    bool _622 = _620 && _516;
    float _624 = fma(_616, -2.0, _552);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _626;
    float _630 = _584 * _518;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _634 = _425 + _632;
    float _636 = _596 * _590;
    float _638 = _628 * _568;
    float _640 = _628;
    float _642 = _630;
    if (!_500)
    {
        _640 = _486;
    }
    float _644 = _640;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _648 = _425 + _646;
    float _650 = _588 ? _534 : _486;
    float _652 = fma(_638, _634, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _656 = _425 + _654;
    float _658 = _644;
    float _660 = _656;
    if (_500)
    {
        float _662 = _598 ? _534 : _486;
        _658 = _662;
    }
    float _664 = _658;
    float _666 = _614 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _668 = -_592;
    float _670 = _668 + 1.0;
    float _672 = fma(_636, _656, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _674 = fma(_630, _648, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _676 = fma(_666, _650, -0.5);
    float _678 = _484 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _680 = _502 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _682 = _580 ? _670 : _592;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _686 = fma(_678, _566, -0.5);
    float _688 = _684;
    if (!_542)
    {
        _660 = _528;
    }
    float _690 = _660;
    float _692 = fma(_680, _682, -0.5);
    float _694 = _690;
    if (_542)
    {
        _694 = _504;
    }
    float _696 = _694;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _700 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _702 = isnan(_425);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _624);
    bool _714 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _716 = isnan(_425);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[78].z, _698);
    float _728 = _698;
    if (!_542)
    {
        _728 = _504;
    }
    float _730 = _728;
    float _732 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[83].z, _684);
    float _734 = _730;
    if (_542)
    {
        _734 = _492;
    }
    float _736 = _734;
    float _738 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _726);
    if (!_542)
    {
        _688 = _528;
    }
    float _740 = _688;
    float _742 = -_710;
    float _744 = _742 + 1.0;
    float _746 = _740;
    if (_542)
    {
        _746 = _504;
    }
    float _748 = _746;
    float _750 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[84].z, _618);
    bool _752 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _754 = isnan(_425);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _766 = -_125;
    float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[76].x, _576);
    float _770 = -_612;
    float _772 = _770 + 1.0;
    float _774 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[84].x, _750);
    float _776 = _724 * _744;
    float _778 = fma(_738, _676, _768);
    float _780 = _762 * _772;
    float _782 = -_762;
    float _784 = _782 + 1.0;
    float _786 = _748 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _788 = -_724;
    float _790 = _788 + 1.0;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _794 = _652 * _780;
    float _796 = _774 * (-0.15915493667125701904296875);
    float _798 = -_792;
    float _800 = fma(_786, 2.0, _798);
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_542)
    {
        _642 = _492;
    }
    float _804 = _642;
    float _806 = _612 * _790;
    float _808 = _796 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[131].x, _794);
    float _814 = _764 * _592;
    bool _816 = _492 > 0.5;
    bool _818 = _816 && _572;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _822 = _804;
    float _824 = _814;
    if (!_542)
    {
        _802 = _804;
    }
    float _826 = _802;
    float _828 = fma(_672, _806, _812);
    float _830 = _796 * 6.283185482025146484375;
    float _832 = cos(_830);
    float _834 = _826;
    if (_542)
    {
        _822 = _528;
    }
    float _836 = _822;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_622)
    {
        float _840 = -_814;
        float _842 = _840 + 1.0;
        _824 = _842;
    }
    float _844 = _824;
    float _846 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[78].w, _820);
    if (_542)
    {
        _834 = _528;
    }
    float _848 = _834;
    float _850 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[83].w, _838);
    float _852 = fma(_600, _844, -0.5);
    float _854 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _856 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _846);
    float _858 = fma(_674, _776, _828);
    float _860 = _810 * _692;
    int _862 = _818 ? as_type<int>(_670) : as_type<int>(_592);
    float _864 = -_712;
    float _866 = fma(_856, _852, _864);
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _872 = _832 * _692;
    float _874 = _848 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _876 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[134].x, _858);
    float _878 = _664 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _880 = fma(_810, _686, _872);
    float _882 = as_type<float>(_862) * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _884 = fma(_874, -2.0, _868);
    float _886 = _876 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _888 = _882 * _854;
    float _890 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _850);
    float _892 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _884);
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _896 = _878 * _870;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _900 = -_892;
    float _902 = fma(_890, _880, _900);
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _906 = _453 + 1;
    float _908 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _910 = _898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _912 = _904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _896;
    out.m_61.y = _888;
    float _914 = -_860;
    float _916 = fma(_832, _686, _914);
    float _918 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _732);
    float _920 = -_125;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[81].x, _800);
    out.m_63.x = _908;
    out.m_63.y = _910;
    out.m_63.z = _912;
    out.m_63.w = _886;
    int _924 = min(_445, _906);
    float _926 = fma(_918, _916, _922);
    float _928 = _902 + 0.5;
    float _930 = _866 + 0.5;
    uint _933 = as_type<uint>(half2(float2(_476, 0.0)));
    uint _935 = extract_bits(_933, 0u, 8u);
    int _937 = int(_935) & 255;
    uint _939 = extract_bits(_933, 8u, 8u);
    int _941 = int(_939) & 255;
    int _943 = _941 << 8;
    int _945 = _937 | _943;
    bool _947 = _945 >= 32768;
    int _949 = _945 + (-1024);
    int _951 = _949;
    int _953 = _862;
    int _955 = as_type<int>(_892);
    float _957 = _928;
    if (_947)
    {
        int _959 = ~_945;
        int _961 = _959 + 33792;
        int _963 = _961 + 1;
        _951 = _963;
    }
    int _965 = _951;
    int _967 = _965 + 30719;
    float _969 = float(_967);
    float _971 = fma(_969, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _973 = abs(_971);
    float _975 = -_973;
    float _977 = _975 + 1.0;
    float _979 = abs(_971);
    float _981 = fma(_979, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _983 = _971 < 0.0;
    float _985 = float(_983);
    int _987 = as_type<int>(_977) + (-218103808);
    bool _989 = uint(_987) >= 1920991232u;
    float _991 = _778 + 0.5;
    float _993 = abs(_971);
    float _995 = fma(_993, _981, -0.212114393711090087890625);
    float _997 = _926 + 0.5;
    float _999 = abs(_971);
    float _1001 = fma(_999, _995, 1.570728778839111328125);
    bool _1003 = !_989;
    float _1025;
    if (!_1003)
    {
        int _1005 = as_type<int>(_977);
        int _1007 = _862;
        int _1009 = as_type<int>(_892);
        int _1011 = 5248;
        int _1013;
        int _1015;
        int _1017;
        int _1019;
        int _1021;
        int _1023;
        _88(_1005, _1007, _1009, _1011, _1013, _1015, _1017, _1019, _1021, _1023, out.gl_Position, out.gl_PointSize);
        _1025 = as_type<float>(_1013);
        _953 = _1015;
        _955 = _1021;
        _1027 = true;
    }
    else
    {
        float _1029 = rsqrt(_977);
        float _1031 = _977 * _1029;
        float _1033 = _1029 * 0.5;
        float _1035 = -_1031;
        float _1037 = 0.0 + _1035;
        float _1039 = fma(_1033, _1037, 0.5);
        float _1041 = fma(_1031, _1039, _1031);
        float _1043 = -_1041;
        float _1045 = 0.0 + _1043;
        float _1047 = fma(_1041, _1045, _977);
        float _1049 = fma(_1033, _1047, _1041);
        _1025 = _1049;
    }
    _1027 = false;
    float _1051 = _1025;
    int _1053 = _953;
    int _1055 = _955;
    int _1057 = _924;
    int _1059 = 0;
    int _1061 = _91(_1057, _1059, (*spvDescriptorSet0.support_buffer));
    int _1063 = _443;
    int _1065 = 0;
    int _1067 = _91(_1063, _1065, (*spvDescriptorSet0.support_buffer));
    float4 _1069 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1061, _1067)), 0).xyzw;
    float _1071 = _1069.x;
    float _1073 = _1069.y;
    float _1075 = _1069.z;
    float _1077 = _1069.w;
    float _1079 = floor(_449);
    float _1081 = _1001 * _1051;
    float _1083 = _985 * 2.0;
    float _1085 = _969 * 3.883221149444580078125;
    float _1087 = -_1083;
    float _1089 = fma(_1081, _1087, _1081);
    float _1091 = _1085 * 0.15915493667125701904296875;
    float _1093 = fma(_985, 3.1415927410125732421875, _1089);
    float _1095 = _1091 * 6.283185482025146484375;
    float _1097 = cos(_1095);
    float _1099 = _1093 * 0.15915493667125701904296875;
    float _1101 = -_1079;
    float _1103 = _449 + _1101;
    float _1105 = _1099 * 6.283185482025146484375;
    float _1107 = sin(_1105);
    float _1109 = _1091 * 6.283185482025146484375;
    float _1111 = sin(_1109);
    float _1113 = _1107 * _1097;
    float _1115 = _1107 * _1111;
    uint _1117 = as_type<uint>(half2(float2(_1077, 0.0)));
    uint _1119 = extract_bits(_1117, 0u, 8u);
    int _1121 = int(_1119) & 255;
    uint _1123 = extract_bits(_1117, 8u, 8u);
    int _1125 = int(_1123) & 255;
    int _1127 = _1125 << 8;
    int _1129 = _1121 | _1127;
    bool _1131 = _1129 >= 32768;
    int _1133 = _1129 + (-1024);
    int _1135 = _1133;
    if (_1131)
    {
        int _1137 = ~_1129;
        int _1139 = _1137 + 33792;
        int _1141 = _1139 + 1;
        _1135 = _1141;
    }
    int _1143 = _1135;
    int _1145 = _1143 + 30719;
    float _1147 = float(_1145);
    float _1149 = fma(_1147, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1151 = abs(_1149);
    float _1153 = -_1151;
    float _1155 = _1153 + 1.0;
    float _1157 = abs(_1149);
    float _1159 = fma(_1157, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1161 = _1149 < 0.0;
    float _1163 = float(_1161);
    int _1165 = as_type<int>(_1155) + (-218103808);
    float _1167 = abs(_1149);
    float _1169 = fma(_1167, _1159, -0.212114393711090087890625);
    bool _1171 = uint(_1165) >= 1920991232u;
    float _1173 = -_470;
    float _1175 = _1173 + _1071;
    float _1177 = -_472;
    float _1179 = _1177 + _1073;
    float _1181 = -_474;
    float _1183 = _1181 + _1075;
    float _1185 = abs(_1149);
    float _1187 = fma(_1185, _1169, 1.570728778839111328125);
    float _1189 = fma(_1103, _1175, _470);
    float _1191 = fma(_1103, _1179, _472);
    float _1193 = fma(_1103, _1183, _474);
    bool _1195 = !_1171;
    float _1217;
    if (!_1195)
    {
        int _1197 = as_type<int>(_1155);
        int _1199 = _1053;
        int _1201 = _1055;
        int _1203 = 6128;
        int _1205;
        int _1207;
        int _1209;
        int _1211;
        int _1213;
        int _1215;
        _88(_1197, _1199, _1201, _1203, _1205, _1207, _1209, _1211, _1213, _1215, out.gl_Position, out.gl_PointSize);
        _1217 = as_type<float>(_1205);
        _1219 = true;
    }
    else
    {
        float _1221 = rsqrt(_1155);
        float _1223 = _1155 * _1221;
        float _1225 = _1221 * 0.5;
        float _1227 = -_1223;
        float _1229 = 0.0 + _1227;
        float _1231 = fma(_1225, _1229, 0.5);
        float _1233 = fma(_1223, _1231, _1223);
        float _1235 = -_1233;
        float _1237 = 0.0 + _1235;
        float _1239 = fma(_1233, _1237, _1155);
        float _1241 = fma(_1225, _1239, _1233);
        _1217 = _1241;
    }
    _1219 = false;
    float _1243 = _1217;
    float _1245 = in.m_55.x;
    float _1247 = in.m_55.y;
    float _1249 = in.m_55.z;
    float _1251 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1253 = log2(_1251);
    float _1255 = _1187 * _1243;
    float _1257 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1259 = _1147 * 3.883221149444580078125;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1263 = _1261 != 0;
    int _1265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1267 = _1265 != 0;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1271 = _1269 != 0;
    bool _1273 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1275 = isnan(1.0);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1281 = _1277 || _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1285 = 1.0 + _1283;
    float _1287 = _1253 * _125;
    float _1289 = 1.0 / _1285;
    float _1291 = _1249 * 2.0;
    float _1293 = _1245 * 2.0;
    float _1295 = _1247 + _1249;
    float _1297 = exp2(_1287);
    float _1299 = _1247 * 2.0;
    float _1301 = _1295 + (-1.0);
    float _1303 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1305 = floor(_1291);
    float _1307 = _1247 + _1245;
    float _1309 = _1307 + (-1.0);
    float _1311 = floor(_1293);
    float _1313 = -_1297;
    float _1315 = _1313 + 1.0;
    bool _1317 = _1305 > 0.0;
    float _1319 = fma(_1309, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1321 = _1305 >= 0.0;
    bool _1323 = isnan(_1305);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan(0.0);
    bool _1329 = _1325 || _1327;
    float _1331 = floor(_1299);
    float _1333 = in.m_65.x;
    float _1335 = in.m_65.y;
    float _1337 = in.m_65.z;
    bool _1339 = !_1263;
    int _1341 = _1339 ? 0 : 1;
    int _1343 = _1329 ? 0 : 1;
    bool _1345 = _1311 > 0.0;
    bool _1347 = _1311 >= 0.0;
    bool _1349 = isnan(_1311);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.0);
    bool _1355 = _1351 || _1353;
    int _1357 = ~_1343;
    int _1359 = _1357 + 1;
    int _1361 = _1359 + 1;
    int _1363 = abs(_1341);
    int _1365 = _1361;
    if (!_1317)
    {
        int _1367 = ~_1343;
        int _1369 = _1367 + 1;
        _1365 = _1369;
    }
    int _1371 = _1365;
    bool _1373 = !_1267;
    int _1375 = _1373 ? 0 : 1;
    int _1377 = _1355 ? 0 : 1;
    float _1379 = float(_1363);
    float _1381 = float(_1371);
    int _1383 = abs(_1375);
    int _1385 = ~_1377;
    int _1387 = _1385 + 1;
    int _1389 = _1387 + 1;
    float _1391 = _1379 * _1381;
    bool _1393 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1395 = isnan(0.0);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1401 = _1397 || _1399;
    int _1403 = _1389;
    if (!_1345)
    {
        int _1405 = ~_1377;
        int _1407 = _1405 + 1;
        _1403 = _1407;
    }
    int _1409 = _1403;
    float _1411 = _1391 * (-2.0);
    float _1413 = _1401 ? _1315 : 0.0;
    float _1415 = float(_1383);
    float _1417 = float(_1409);
    if (_1281)
    {
        float _1419 = _1413 * _1289;
        _143 = _1419;
    }
    float _1421 = _143;
    bool _1423 = _1331 > 0.0;
    float _1425 = _1245 + (-0.5);
    bool _1427 = _1331 >= 0.0;
    bool _1429 = isnan(_1331);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan(0.0);
    bool _1435 = _1431 || _1433;
    float _1437 = _1415 * _1417;
    float _1439 = fma(_1411, _1333, _1333);
    float _1441 = fma(_1319, _1411, _1319);
    int _1443 = _1435 ? 0 : 1;
    float _1445 = _1437 * (-2.0);
    float _1447 = fma(_1425, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1439);
    bool _1449 = !_1271;
    int _1451 = _1449 ? 0 : 1;
    float _1453 = _1245 + _1249;
    int _1455 = ~_1443;
    int _1457 = _1455 + 1;
    int _1459 = _1457 + 1;
    float _1461 = fma(_1441, _1421, _1447);
    int _1463 = abs(_1451);
    float _1465 = fma(_1303, _1445, _1303);
    int _1467 = _1459;
    if (!_1423)
    {
        int _1469 = ~_1443;
        int _1471 = _1469 + 1;
        _1467 = _1471;
    }
    int _1473 = _1467;
    float _1475 = fma(_1445, _1335, _1335);
    float _1477 = _1247 + (-0.5);
    float _1479 = _1461 * 0.15915493667125701904296875;
    float _1481 = float(_1463);
    float _1483 = _1453 + (-1.0);
    float _1485 = float(_1473);
    float _1487 = fma(_1477, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1475);
    float _1489 = _1249 + (-0.5);
    float _1491 = _1479 * 6.283185482025146484375;
    float _1493 = sin(_1491);
    bool _1495 = _1191 != 0.0;
    bool _1497 = isnan(_1191);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan(0.0);
    bool _1503 = _1499 || _1501;
    float _1505 = _1481 * _1485;
    float _1507 = fma(_1465, _1421, _1487);
    float _1509 = _1505 * (-2.0);
    float _1511 = _1507 * 0.15915493667125701904296875;
    float _1513 = _1479 * 6.283185482025146484375;
    float _1515 = cos(_1513);
    float _1517 = fma(_1483, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1519 = fma(_1509, _1337, _1337);
    bool _1521 = _1189 == 0.0;
    bool _1523 = !_1503;
    bool _1525 = _1521 && _1523;
    float _1527 = fma(_1517, _1509, _1517);
    float _1529 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1519);
    bool _1531 = _1193 == 0.0;
    bool _1533 = _1531 && _1525;
    float _1535 = _1511 * 6.283185482025146484375;
    float _1537 = sin(_1535);
    float _1539 = fma(_1527, _1421, _1529);
    float _1541 = _1539 * 0.15915493667125701904296875;
    float _1543 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1545 = _1511 * 6.283185482025146484375;
    float _1547 = cos(_1545);
    float _1549 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1189);
    float _1551 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1191);
    float _1553 = _1163 * 2.0;
    float _1555 = _1543 * _1549;
    float _1557 = _764 * _1551;
    float _1559 = -_1553;
    float _1561 = fma(_1255, _1559, _1255);
    float _1563 = _1541 * 6.283185482025146484375;
    float _1565 = cos(_1563);
    float _1567 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1193);
    float _1569 = _1493 * _1537;
    float _1571 = _1515 * _1537;
    float _1573 = fma(_1163, 3.1415927410125732421875, _1561);
    float _1575 = _1257 * _1567;
    float _1577 = _1541 * 6.283185482025146484375;
    float _1579 = sin(_1577);
    float _1581 = _1493 * _1547;
    float _1583 = _1515 * _1547;
    float _1585 = _1493 * _1565;
    float _1587 = _1547 * _1565;
    float _1589 = _1515 * _1565;
    float _1591 = _1537 * _1565;
    float _1593 = _1585 * _1557;
    float _1595 = _271 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1597 = fma(_1579, _1583, _1569);
    float _1599 = fma(_1579, _1569, _1583);
    float _1601 = _1589 * _1557;
    float _1603 = -_1571;
    float _1605 = fma(_1579, _1581, _1603);
    float _1607 = -_1581;
    float _1609 = fma(_1579, _1571, _1607);
    float _1611 = -_1557;
    float _1613 = _1579 * _1611;
    float _1615 = fma(_1597, _1555, _1601);
    float _1617 = fma(_1605, _1555, _1593);
    float _1619 = _1259 * 0.15915493667125701904296875;
    float _1621 = fma(_1587, _1555, _1613);
    float _1623 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1595);
    float _1625 = _271 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1627 = fma(_1609, _1575, _1615);
    float _1629 = fma(_1591, _1575, _1621);
    float _1631 = fma(_1599, _1575, _1617);
    float _1633 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1625);
    float _1635 = _1627 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1637 = _1627 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1639 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1623);
    float _1641 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1633);
    float _1643 = fma(_1629, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1635);
    float _1645 = fma(_1629, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1637);
    float _1647 = _1639 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1649 = _1641 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1651 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1643);
    float _1653 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1645);
    float _1655 = _1619 * 6.283185482025146484375;
    float _1657 = cos(_1655);
    float _1659 = _271 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1661 = _1647 + _1651;
    float _1663 = _1649 + _1653;
    float _1665 = _1573 * 0.15915493667125701904296875;
    float _1667 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1659);
    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1671 = _1661 + _1669;
    float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1675 = _1663 + _1673;
    float _1677 = _1619 * 6.283185482025146484375;
    float _1679 = sin(_1677);
    float _1681 = _1627 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1683 = _1671 * _1671;
    float _1685 = _1675 * _1675;
    float _1687 = -_971;
    float _1689 = _1687 + _1149;
    float _1691 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1667);
    float _1693 = fma(_1629, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1681);
    float _1695 = _1683 + _1685;
    float _1697 = _1665 * 6.283185482025146484375;
    float _1699 = sin(_1697);
    float _1701 = fma(_1103, _1689, _971);
    float _1703 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1693);
    float _1705 = _1691 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1707 = _1701;
    float _1709 = _1585;
    float _1711 = _1705;
    float _1713 = _1579;
    if (!_1533)
    {
        float _1715 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1701);
        _1707 = _1715;
    }
    float _1717 = _1707;
    float _1719 = _1705 + _1703;
    float _1721 = sqrt(_1695);
    float _1723 = _1589 * _1717;
    float _1725 = _1585 * _1717;
    float _1727 = -_1113;
    float _1729 = fma(_1699, _1657, _1727);
    float _1731 = -_1115;
    float _1733 = fma(_1699, _1679, _1731);
    float _1735 = fma(_1103, _1729, _1113);
    float _1737 = fma(_1103, _1733, _1115);
    bool _1739 = _1721 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1741 = _1737;
    float _1743 = _1735;
    float _1745 = _1717;
    if (!_1533)
    {
        float _1747 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1737);
        _1741 = _1747;
    }
    float _1749 = _1741;
    float _1751 = -_1717;
    float _1753 = _1579 * _1751;
    if (!_1533)
    {
        float _1755 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1735);
        _1743 = _1755;
    }
    float _1757 = _1743;
    if (!_1739)
    {
        _1709 = _1685;
    }
    float _1759 = _1709;
    float _1761 = _1759;
    if (!_1739)
    {
        _1745 = _1683;
    }
    float _1763 = _1745;
    float _1765 = _1763;
    if (!_1739)
    {
        _1711 = _1661;
    }
    float _1767 = _1711;
    float _1769 = _1767;
    if (!_1739)
    {
        _1713 = _1663;
    }
    float _1771 = _1713;
    float _1773 = _1771;
    if (!_1739)
    {
        _279 = _1719;
    }
    float _1775 = _279;
    bool _1777 = !_1739;
    float _1779 = _1775;
    if (!_1777)
    {
        float _1781 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1783 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1785 = _1721 + _1783;
        float _1787 = _1719 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1789 = rsqrt(_1695);
        float _1791 = _1785 * _1781;
        float _1793 = _1791 * 0.15915493667125701904296875;
        float _1795 = _1793 * 6.283185482025146484375;
        float _1797 = sin(_1795);
        float _1799 = _1793 * 6.283185482025146484375;
        float _1801 = cos(_1799);
        float _1803 = fma(_1797, _1787, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1805 = _1789 * _1803;
        float _1807 = _1801 + (-1.0);
        float _1809 = _1671 * _1805;
        float _1811 = _1675 * _1805;
        float _1813 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1815 = _1809 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1817 = _1809 * _1809;
        float _1819 = fma(_1719, _1801, _1813);
        float _1821 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1823 = _1811 * _1811;
        _1779 = _1819;
        _1765 = _1817;
        _1761 = _1823;
        _1769 = _1815;
        _1773 = _1821;
    }
    float _1825 = _1779;
    float _1827 = _1765;
    float _1829 = _1761;
    float _1831 = _1769;
    float _1833 = _1773;
    float _1835 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1837 = _1825 + _1835;
    float _1839 = fma(_1597, _1757, _1723);
    float _1841 = fma(_1587, _1757, _1753);
    float _1843 = fma(_1605, _1757, _1725);
    float _1845 = fma(_1837, _1837, _1827);
    float _1847 = fma(_1609, _1749, _1839);
    float _1849 = fma(_1591, _1749, _1841);
    float _1851 = fma(_1599, _1749, _1843);
    float _1853 = _1845 + _1829;
    float _1855 = _1847 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1857 = _1847 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1859 = _1847 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_67.x = _991;
    out.m_67.y = _930;
    out.m_67.z = _997;
    out.m_67.w = _928;
    float _1861 = fma(_1849, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1855);
    float _1863 = sqrt(_1853);
    float _1865 = fma(_1849, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1857);
    float _1867 = fma(_1849, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1859);
    float _1869 = fma(_1851, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1861);
    float _1871 = fma(_1851, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1865);
    float _1873 = fma(_1851, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1867);
    out.m_69.x = _1869;
    out.m_69.y = _1871;
    out.m_69.z = _1873;
    bool _1875 = _1863 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1877 = isnan(_1863);
    bool _1879 = _1875 || _1877;
    bool _1881 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1883 = _1879 || _1881;
    float _1885 = _1861;
    float _1887 = _1865;
    float _1889 = _1873;
    if (!_1883)
    {
        _1885 = 1.0;
    }
    float _1891 = _1885;
    bool _1893 = !_1883;
    float _1895 = _1891;
    if (!_1893)
    {
        bool _1897 = _1863 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1899 = isnan(_1863);
        bool _1901 = _1897 || _1899;
        bool _1903 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1905 = _1901 || _1903;
        if (!_1905)
        {
            float _1907 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1909 = _1863 + _1907;
            float _1911 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1913 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1911;
            float _1915 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1917 = _1915 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1919 = 1.0 / _1913;
            float _1921 = _1909 * _1919;
            float _1923 = fma(_1921, _1917, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1895 = _1923;
            _1925 = true;
        }
        else
        {
            bool _1927 = _1863 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1929 = isnan(_1863);
            bool _1931 = _1927 || _1929;
            bool _1933 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1935 = _1931 || _1933;
            if (!_1935)
            {
                float _1937 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1939 = _1863 + _1937;
                float _1941 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1943 = _1941 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1945 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1947 = _1945 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1949 = 1.0 / _1943;
                float _1951 = _1939 * _1949;
                float _1953 = fma(_1951, _1947, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1895 = _1953;
                _1925 = true;
            }
            else
            {
                _1895 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1925 = false;
    float _1955 = _1895;
    float _1957 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1959 = _1825 + _1957;
    float _1961 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1963 = _1831 + _1961;
    float _1965 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1967 = _1833 + _1965;
    float _1969 = fma(_1959, _1955, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1971 = fma(_1963, _1955, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1973 = fma(_1967, _1955, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1977 = _1969 + _1975;
    float _1979 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1981 = _1971 + _1979;
    float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1985 = _1973 + _1983;
    float _1987 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1989 = _1977 * _1977;
    float _1991 = fma(_1981, _1981, _1989);
    float _1993 = fma(_1985, _1985, _1991);
    float _1995 = rsqrt(_1993);
    float _1997 = _1995 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1999 = _1981 * _1997;
    float _2001 = _1985 * _1997;
    float _2003 = _1999 * _1999;
    float _2005 = _2001 * _2001;
    float _2007 = _2003 + _2005;
    float _2009 = sqrt(_2007);
    bool _2011 = _2009 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2013 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2015 = _2009 + _2013;
    float _2017 = _1995;
    float _2019 = _2015;
    float _2021 = _1977;
    float _2023 = _1999;
    if (_2011)
    {
        float _2025 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2017 = _2025;
    }
    float _2027 = _2017;
    if (_2011)
    {
        float _2029 = rsqrt(_2007);
        _957 = _2029;
    }
    float _2031 = _957;
    float _2033 = _2031;
    if (_2011)
    {
        float _2035 = _2015 * _2027;
        _2019 = _2035;
    }
    float _2037 = _2019;
    float _2039 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2011)
    {
        float _2041 = _2037 * 0.15915493667125701904296875;
        _1887 = _2041;
    }
    float _2043 = _1887;
    float _2045 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2039);
    float _2047 = _1985;
    if (_2011)
    {
        float _2049 = _2043 * 6.283185482025146484375;
        float _2051 = sin(_2049);
        _2047 = _2051;
    }
    float _2053 = _2047;
    float _2055 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2057 = precise::max(0.0, _2055);
    float _2059 = _2027;
    float _2061 = _2057;
    if (_2011)
    {
        float _2063 = _2043 * 6.283185482025146484375;
        float _2065 = cos(_2063);
        _2059 = _2065;
    }
    float _2067 = _2059;
    float _2069 = -_1997;
    float _2071 = -_2057;
    float _2073 = fma(_1977, _2069, _2071);
    if (_2011)
    {
        float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2021 = _2075;
    }
    float _2077 = _2021;
    float _2079 = sqrt(_1993);
    float _2081 = _2077;
    float _2083 = _2053;
    if (_2011)
    {
        float _2085 = fma(_2053, _2077, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2081 = _2085;
    }
    float _2087 = _2081;
    float _2089 = _2087;
    if (!_2011)
    {
        _2083 = _2001;
    }
    float _2091 = _2083;
    float _2093 = _2091;
    if (_2011)
    {
        float _2095 = _2067 + (-1.0);
        _2061 = _2095;
    }
    float _2097 = _2061;
    float _2099 = _2097;
    if (_2011)
    {
        float _2101 = _2031 * _2087;
        _1889 = _2101;
    }
    float _2103 = _1889;
    if (!_2011)
    {
        _2033 = _2073;
    }
    float _2105 = _2033;
    float _2107 = _2105;
    if (_2011)
    {
        float _2109 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2099 = _2109;
    }
    float _2111 = _2099;
    float _2113 = _2111;
    if (_2011)
    {
        float _2115 = _1999 * _2103;
        _2023 = _2115;
    }
    float _2117 = _2023;
    if (!_2011)
    {
        _2089 = _2003;
    }
    float _2119 = _2089;
    float _2121 = _2119;
    if (_2011)
    {
        float _2123 = _2001 * _2103;
        _2093 = _2123;
    }
    float _2125 = _2093;
    if (_2011)
    {
        float _2127 = fma(_2073, _2067, _2111);
        _2107 = _2127;
    }
    float _2129 = _2107;
    if (_2011)
    {
        float _2131 = _2117 * _2117;
        _2121 = _2131;
    }
    float _2133 = _2121;
    if (!_2011)
    {
        _2113 = _2005;
    }
    float _2135 = _2113;
    float _2137 = _2135;
    if (_2011)
    {
        float _2139 = _2125 * _2125;
        _2137 = _2139;
    }
    float _2141 = _2137;
    float _2143 = fma(_2129, _2129, _2133);
    float _2145 = _2143 + _2141;
    float _2147 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2151 = fma(_2079, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2149);
    float _2153 = precise::clamp(_2151, 0.0, 1.0);
    float _2155 = rsqrt(_2145);
    float _2157 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2147);
    float _2159 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2161 = -_2153;
    float _2163 = _2161 + 1.0;
    float _2165 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2157);
    float _2167 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2169 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2159);
    float _2171 = _2165 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2173 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2167);
    float _2175 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2169);
    float _2177 = abs(_2163);
    float _2179 = log2(_2177);
    float _2181 = _2171 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2183 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2173);
    float _2185 = _2175 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2187 = _2155 * _2117;
    float _2189 = _2155 * _2129;
    float _2191 = _2183 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2193 = -_2181;
    float _2195 = fma(_2193, _1987, 1.0);
    float _2197 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2199 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2201 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2045);
    float _2203 = _2155 * _2125;
    float _2205 = -_2197;
    float _2207 = fma(_2189, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2205);
    float _2209 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2199);
    float _2211 = _2201 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2213 = log2(_2195);
    float _2215 = -_2203;
    float _2217 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2207);
    float _2219 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2209);
    float _2221 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2223 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2225 = fma(_2217, -0.5, 0.5);
    float _2227 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2219);
    float _2229 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2231 = exp2(_2221);
    float _2233 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2223);
    float _2235 = fma(_2217, 0.5, 0.5);
    float _2237 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2229);
    float _2239 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2233);
    float _2241 = fma(_2235, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2243 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2237);
    float _2245 = 1.0 / _2227;
    float _2247 = _2189 + 1.0;
    float _2249 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2239);
    float _2251 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2243);
    float _2253 = fma(_2235, _2241, -0.212114393711090087890625);
    float _2255 = _2213 * 0.693147182464599609375;
    float _2257 = sqrt(_2225);
    float _2259 = -_2189;
    float _2261 = fma(_2231, _2247, _2259);
    float _2263 = fma(_2235, _2253, 1.570728778839111328125);
    float _2265 = _2255 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2267 = fma(_2261, 0.5, 0.5);
    float _2269 = _2249 * _2245;
    float _2271 = _2251 * _2245;
    float _2273 = fma(_2269, 0.5, 0.5);
    float _2275 = fma(_2271, -0.5, 0.5);
    float _2277 = _2257 * 0.636619746685028076171875;
    float _2279 = -_2263;
    float _2281 = fma(_2277, _2279, 1.0);
    float3 _5737 = float3(_2273, _2275, _2265);
    float _2283 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5737, float3(0.0), isnan(_5737)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5737, float3(0.0), isnan(_5737)), level(0.0)).x;
    float3 _5748 = float3(_2273, _2275, _2265);
    float4 _2285 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5748, float3(0.0), isnan(_5748)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5748, float3(0.0), isnan(_5748)), level(0.0)).xyzw;
    float _2287 = _2285.x;
    float _2289 = _2285.y;
    float _2291 = _2285.z;
    float _2293 = _2285.w;
    float2 _5764 = float2(_2281, _2267);
    float3 _2297 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5764, float2(0.0), isnan(_5764)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5764, float2(0.0), isnan(_5764)), level(0.0)).xyz;
    float _2299 = _2297.x;
    float _2301 = _2297.y;
    float _2303 = _2297.z;
    float _2305 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2307 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_71.x = _1971;
    out.m_71.y = _1969;
    out.m_71.z = _1973;
    float _2309 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2307);
    float _2311 = exp2(_2305);
    float _2313 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2309);
    float _2315 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2313);
    float _2317 = _2315 + _2227;
    out.gl_Position.x = _2249;
    out.gl_Position.y = _2251;
    out.gl_Position.z = _2315;
    out.gl_Position.w = _2227;
    float _2319 = _2317 * 0.5;
    float _2321 = -_2311;
    float _2323 = _2321 + 1.0;
    float _2325 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2327 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.z = _2319;
    out.m_73.w = _2227;
    out.m_49.x = _2327;
    float _2329 = _2325 * _2283;
    float _2331 = -_2325;
    float _2333 = _2331 + 1.0;
    float _2335 = _2293 * _2329;
    float _2337 = _2303 * _2329;
    float _2339 = fma(_2299, _2335, _2287);
    float _2341 = fma(_2301, _2335, _2289);
    float _2343 = _2293 * _2333;
    float _2345 = fma(_2293, _2337, _2291);
    out.m_75.x = _2339;
    out.m_75.y = _2341;
    out.m_75.z = _2345;
    out.m_75.w = _2343;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1925 = false;
    bool _1219 = false;
    bool _1027 = false;
    bool _423 = false;
    bool _299 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_46.w;
    float _97 = trunc(_95);
    int _99 = int(_97);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    float _107 = as_type<float>(_99);
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _105;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _109 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2403 = as_type<float>(_115);
        out.gl_Position.z = _2403;
    }
    if (!_103)
    {
        return out;
    }
    float _119 = in.m_51.w;
    float _121 = float(_99);
    float _123 = -_119;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_119);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    bool _137 = _125 >= _121;
    bool _139 = !_135;
    bool _141 = _137 || _139;
    float _143 = _125;
    if (_141)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _107;
    if (_141)
    {
        out.m_49.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _117 = as_type<int>(_147);
    }
    int _149 = _117;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2467 = as_type<float>(_149);
        out.gl_Position.z = _2467;
    }
    if (_141)
    {
        return out;
    }
    float _151 = in.m_53.w;
    float _153 = 1.0 / _121;
    float _155 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = in.m_51.x;
    float _169 = in.m_51.y;
    float _171 = in.m_51.z;
    float _173 = in.m_46.x;
    float _175 = in.m_46.y;
    float _177 = in.m_46.z;
    float _179 = 0.0;
    float _181 = _155;
    if (!_165)
    {
        float _183 = _155 * _155;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = _187;
    if (!_165)
    {
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _191;
    }
    float _193 = _189;
    bool _195 = !_165;
    float _197 = _193;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _155 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _155);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    bool _231 = !_165;
    if (!_231)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _155 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _181 = _251;
    }
    float _253 = _181;
    bool _255 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _257 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _259 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _261 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _263 = fma(_253, _167, _257);
    float _265 = fma(_253, _169, _259);
    float _267 = fma(_253, _171, _261);
    float _269 = fma(_263, _151, _173);
    float _271 = fma(_265, _151, _175);
    float _273 = fma(_267, _151, _177);
    float _275 = _125 * _153;
    bool _277 = !_255;
    float _279 = _269;
    float _297;
    if (!_277)
    {
        float _281 = in.m_55.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        _297 = _275;
    }
    _299 = false;
    float _301 = _297;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _303;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _311 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _313 = 1.0 / _305;
    float _315 = _307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = _301 + _317;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _323 = _309 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _325 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _327 = isnan(_301);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _321 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _339 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_301);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -_335;
    float _353 = _351 + 1.0;
    float _355 = _319 * _313;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _359;
    out.m_57.x = _315;
    out.m_57.y = _337;
    out.m_57.z = _323;
    out.m_57.w = _357;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _367;
    float _371 = _349 * _353;
    float _373 = fma(_361, _355, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _375 = fma(_365, _355, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _377 = fma(_369, _355, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _379 = -_349;
    float _381 = _379 + 1.0;
    float _383 = _373 * _371;
    float _385 = _375 * _371;
    float _387 = _377 * _371;
    float _389 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[143].x, _383);
    float _391 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[143].y, _385);
    float _393 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[143].z, _387);
    float _395 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[144].x, _389);
    float _397 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[144].y, _391);
    float _399 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[144].z, _393);
    bool _401 = !_311;
    bool _403 = _311;
    float _421;
    if (!_401)
    {
        float _405 = in.m_55.x;
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _409 = _405 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        _421 = _275;
    }
    _423 = false;
    float _425 = _421;
    int _427 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _429 = _427;
    int _431 = 0;
    int _433 = _90(_429, _431, (*spvDescriptorSet0.support_buffer));
    float _435 = in.m_59.z;
    float _437 = 0.0 + _275;
    float _439 = precise::clamp(_437, 0.0, 1.0);
    float _441 = trunc(_435);
    int _443 = int(_441);
    int _445 = _433 + (-1);
    float _447 = float(_445);
    float _449 = _439 * _447;
    float _451 = trunc(_449);
    int _453 = int(_451);
    int _455 = _453;
    int _457 = 0;
    int _459 = _91(_455, _457, (*spvDescriptorSet0.support_buffer));
    int _461 = _443;
    int _463 = 0;
    int _465 = _91(_461, _463, (*spvDescriptorSet0.support_buffer));
    float4 _468 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_459, _465)), 0).xyzw;
    float _470 = _468.x;
    float _472 = _468.y;
    float _474 = _468.z;
    float _476 = _468.w;
    float _478 = in.m_53.x;
    float _480 = in.m_53.y;
    float _482 = in.m_53.z;
    float _484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _486 = in.m_59.x;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _490 = _488 != 0;
    float _492 = in.m_55.z;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _500 = _498 != 0;
    float _502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _504 = in.m_55.x;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _510 = _508 != 0;
    float _512 = in.m_55.w;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _516 = _514 != 0;
    float _518 = 1.0 / _496;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _522 = _520 != 0;
    float _524 = _395 * _478;
    float _526 = _397 * _480;
    float _528 = in.m_55.y;
    float _530 = _399 * _482;
    float _532 = -_486;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _542 = _540 != 0;
    float _544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _546 = _504 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_490)
    {
        bool _548 = _492 > 0.5;
        _403 = _548;
    }
    bool _550 = _403;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _554 = 0.0;
    if (!_490)
    {
        _554 = _486;
    }
    float _556 = _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _562 = _556;
    if (_490)
    {
        float _564 = _550 ? _534 : _486;
        _562 = _564;
    }
    float _566 = _562;
    float _568 = 1.0 / _538;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _572 = _570 != 0;
    float _574 = -_506;
    float _576 = fma(_546, 2.0, _574);
    bool _578 = _512 > 0.5;
    bool _580 = _578 && _522;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _582;
    bool _586 = _504 > 0.5;
    bool _588 = _586 && _510;
    float _590 = 1.0 / _560;
    float _592 = in.m_59.y;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _598 = _528 > 0.5;
    float _600 = _544 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _602 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _604 = isnan(_425);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _616 = _528 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _620 = _528 > 0.5;
    bool _622 = _620 && _516;
    float _624 = fma(_616, -2.0, _552);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _626;
    float _630 = _584 * _518;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _634 = _425 + _632;
    float _636 = _596 * _590;
    float _638 = _628 * _568;
    float _640 = _628;
    float _642 = _630;
    if (!_500)
    {
        _640 = _486;
    }
    float _644 = _640;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _648 = _425 + _646;
    float _650 = _588 ? _534 : _486;
    float _652 = fma(_638, _634, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _656 = _425 + _654;
    float _658 = _644;
    float _660 = _656;
    if (_500)
    {
        float _662 = _598 ? _534 : _486;
        _658 = _662;
    }
    float _664 = _658;
    float _666 = _614 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _668 = -_592;
    float _670 = _668 + 1.0;
    float _672 = fma(_636, _656, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _674 = fma(_630, _648, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _676 = fma(_666, _650, -0.5);
    float _678 = _484 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _680 = _502 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _682 = _580 ? _670 : _592;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _686 = fma(_678, _566, -0.5);
    float _688 = _684;
    if (!_542)
    {
        _660 = _528;
    }
    float _690 = _660;
    float _692 = fma(_680, _682, -0.5);
    float _694 = _690;
    if (_542)
    {
        _694 = _504;
    }
    float _696 = _694;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _700 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _702 = isnan(_425);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _624);
    bool _714 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _716 = isnan(_425);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[78].z, _698);
    float _728 = _698;
    if (!_542)
    {
        _728 = _504;
    }
    float _730 = _728;
    float _732 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[83].z, _684);
    float _734 = _730;
    if (_542)
    {
        _734 = _492;
    }
    float _736 = _734;
    float _738 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _726);
    if (!_542)
    {
        _688 = _528;
    }
    float _740 = _688;
    float _742 = -_710;
    float _744 = _742 + 1.0;
    float _746 = _740;
    if (_542)
    {
        _746 = _504;
    }
    float _748 = _746;
    float _750 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[84].z, _618);
    bool _752 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _754 = isnan(_425);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _766 = -_125;
    float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[76].x, _576);
    float _770 = -_612;
    float _772 = _770 + 1.0;
    float _774 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[84].x, _750);
    float _776 = _724 * _744;
    float _778 = fma(_738, _676, _768);
    float _780 = _762 * _772;
    float _782 = -_762;
    float _784 = _782 + 1.0;
    float _786 = _748 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _788 = -_724;
    float _790 = _788 + 1.0;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _794 = _652 * _780;
    float _796 = _774 * (-0.15915493667125701904296875);
    float _798 = -_792;
    float _800 = fma(_786, 2.0, _798);
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_542)
    {
        _642 = _492;
    }
    float _804 = _642;
    float _806 = _612 * _790;
    float _808 = _796 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[131].x, _794);
    float _814 = _764 * _592;
    bool _816 = _492 > 0.5;
    bool _818 = _816 && _572;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _822 = _804;
    float _824 = _814;
    if (!_542)
    {
        _802 = _804;
    }
    float _826 = _802;
    float _828 = fma(_672, _806, _812);
    float _830 = _796 * 6.283185482025146484375;
    float _832 = cos(_830);
    float _834 = _826;
    if (_542)
    {
        _822 = _528;
    }
    float _836 = _822;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_622)
    {
        float _840 = -_814;
        float _842 = _840 + 1.0;
        _824 = _842;
    }
    float _844 = _824;
    float _846 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[78].w, _820);
    if (_542)
    {
        _834 = _528;
    }
    float _848 = _834;
    float _850 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[83].w, _838);
    float _852 = fma(_600, _844, -0.5);
    float _854 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _856 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _846);
    float _858 = fma(_674, _776, _828);
    float _860 = _810 * _692;
    int _862 = _818 ? as_type<int>(_670) : as_type<int>(_592);
    float _864 = -_712;
    float _866 = fma(_856, _852, _864);
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _872 = _832 * _692;
    float _874 = _848 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _876 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[134].x, _858);
    float _878 = _664 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _880 = fma(_810, _686, _872);
    float _882 = as_type<float>(_862) * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _884 = fma(_874, -2.0, _868);
    float _886 = _876 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _888 = _882 * _854;
    float _890 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _850);
    float _892 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _884);
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _896 = _878 * _870;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _900 = -_892;
    float _902 = fma(_890, _880, _900);
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _906 = _453 + 1;
    float _908 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _910 = _898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _912 = _904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _896;
    out.m_61.y = _888;
    float _914 = -_860;
    float _916 = fma(_832, _686, _914);
    float _918 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _732);
    float _920 = -_125;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[81].x, _800);
    out.m_63.x = _908;
    out.m_63.y = _910;
    out.m_63.z = _912;
    out.m_63.w = _886;
    int _924 = min(_445, _906);
    float _926 = fma(_918, _916, _922);
    float _928 = _902 + 0.5;
    float _930 = _866 + 0.5;
    uint _933 = as_type<uint>(half2(float2(_476, 0.0)));
    uint _935 = extract_bits(_933, 0u, 8u);
    int _937 = int(_935) & 255;
    uint _939 = extract_bits(_933, 8u, 8u);
    int _941 = int(_939) & 255;
    int _943 = _941 << 8;
    int _945 = _937 | _943;
    bool _947 = _945 >= 32768;
    int _949 = _945 + (-1024);
    int _951 = _949;
    int _953 = _862;
    int _955 = as_type<int>(_892);
    float _957 = _928;
    if (_947)
    {
        int _959 = ~_945;
        int _961 = _959 + 33792;
        int _963 = _961 + 1;
        _951 = _963;
    }
    int _965 = _951;
    int _967 = _965 + 30719;
    float _969 = float(_967);
    float _971 = fma(_969, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _973 = abs(_971);
    float _975 = -_973;
    float _977 = _975 + 1.0;
    float _979 = abs(_971);
    float _981 = fma(_979, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _983 = _971 < 0.0;
    float _985 = float(_983);
    int _987 = as_type<int>(_977) + (-218103808);
    bool _989 = uint(_987) >= 1920991232u;
    float _991 = _778 + 0.5;
    float _993 = abs(_971);
    float _995 = fma(_993, _981, -0.212114393711090087890625);
    float _997 = _926 + 0.5;
    float _999 = abs(_971);
    float _1001 = fma(_999, _995, 1.570728778839111328125);
    bool _1003 = !_989;
    float _1025;
    if (!_1003)
    {
        int _1005 = as_type<int>(_977);
        int _1007 = _862;
        int _1009 = as_type<int>(_892);
        int _1011 = 5248;
        int _1013;
        int _1015;
        int _1017;
        int _1019;
        int _1021;
        int _1023;
        _88(_1005, _1007, _1009, _1011, _1013, _1015, _1017, _1019, _1021, _1023, out.gl_Position, out.gl_PointSize);
        _1025 = as_type<float>(_1013);
        _953 = _1015;
        _955 = _1021;
        _1027 = true;
    }
    else
    {
        float _1029 = rsqrt(_977);
        float _1031 = _977 * _1029;
        float _1033 = _1029 * 0.5;
        float _1035 = -_1031;
        float _1037 = 0.0 + _1035;
        float _1039 = fma(_1033, _1037, 0.5);
        float _1041 = fma(_1031, _1039, _1031);
        float _1043 = -_1041;
        float _1045 = 0.0 + _1043;
        float _1047 = fma(_1041, _1045, _977);
        float _1049 = fma(_1033, _1047, _1041);
        _1025 = _1049;
    }
    _1027 = false;
    float _1051 = _1025;
    int _1053 = _953;
    int _1055 = _955;
    int _1057 = _924;
    int _1059 = 0;
    int _1061 = _91(_1057, _1059, (*spvDescriptorSet0.support_buffer));
    int _1063 = _443;
    int _1065 = 0;
    int _1067 = _91(_1063, _1065, (*spvDescriptorSet0.support_buffer));
    float4 _1069 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1061, _1067)), 0).xyzw;
    float _1071 = _1069.x;
    float _1073 = _1069.y;
    float _1075 = _1069.z;
    float _1077 = _1069.w;
    float _1079 = floor(_449);
    float _1081 = _1001 * _1051;
    float _1083 = _985 * 2.0;
    float _1085 = _969 * 3.883221149444580078125;
    float _1087 = -_1083;
    float _1089 = fma(_1081, _1087, _1081);
    float _1091 = _1085 * 0.15915493667125701904296875;
    float _1093 = fma(_985, 3.1415927410125732421875, _1089);
    float _1095 = _1091 * 6.283185482025146484375;
    float _1097 = cos(_1095);
    float _1099 = _1093 * 0.15915493667125701904296875;
    float _1101 = -_1079;
    float _1103 = _449 + _1101;
    float _1105 = _1099 * 6.283185482025146484375;
    float _1107 = sin(_1105);
    float _1109 = _1091 * 6.283185482025146484375;
    float _1111 = sin(_1109);
    float _1113 = _1107 * _1097;
    float _1115 = _1107 * _1111;
    uint _1117 = as_type<uint>(half2(float2(_1077, 0.0)));
    uint _1119 = extract_bits(_1117, 0u, 8u);
    int _1121 = int(_1119) & 255;
    uint _1123 = extract_bits(_1117, 8u, 8u);
    int _1125 = int(_1123) & 255;
    int _1127 = _1125 << 8;
    int _1129 = _1121 | _1127;
    bool _1131 = _1129 >= 32768;
    int _1133 = _1129 + (-1024);
    int _1135 = _1133;
    if (_1131)
    {
        int _1137 = ~_1129;
        int _1139 = _1137 + 33792;
        int _1141 = _1139 + 1;
        _1135 = _1141;
    }
    int _1143 = _1135;
    int _1145 = _1143 + 30719;
    float _1147 = float(_1145);
    float _1149 = fma(_1147, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1151 = abs(_1149);
    float _1153 = -_1151;
    float _1155 = _1153 + 1.0;
    float _1157 = abs(_1149);
    float _1159 = fma(_1157, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1161 = _1149 < 0.0;
    float _1163 = float(_1161);
    int _1165 = as_type<int>(_1155) + (-218103808);
    float _1167 = abs(_1149);
    float _1169 = fma(_1167, _1159, -0.212114393711090087890625);
    bool _1171 = uint(_1165) >= 1920991232u;
    float _1173 = -_470;
    float _1175 = _1173 + _1071;
    float _1177 = -_472;
    float _1179 = _1177 + _1073;
    float _1181 = -_474;
    float _1183 = _1181 + _1075;
    float _1185 = abs(_1149);
    float _1187 = fma(_1185, _1169, 1.570728778839111328125);
    float _1189 = fma(_1103, _1175, _470);
    float _1191 = fma(_1103, _1179, _472);
    float _1193 = fma(_1103, _1183, _474);
    bool _1195 = !_1171;
    float _1217;
    if (!_1195)
    {
        int _1197 = as_type<int>(_1155);
        int _1199 = _1053;
        int _1201 = _1055;
        int _1203 = 6128;
        int _1205;
        int _1207;
        int _1209;
        int _1211;
        int _1213;
        int _1215;
        _88(_1197, _1199, _1201, _1203, _1205, _1207, _1209, _1211, _1213, _1215, out.gl_Position, out.gl_PointSize);
        _1217 = as_type<float>(_1205);
        _1219 = true;
    }
    else
    {
        float _1221 = rsqrt(_1155);
        float _1223 = _1155 * _1221;
        float _1225 = _1221 * 0.5;
        float _1227 = -_1223;
        float _1229 = 0.0 + _1227;
        float _1231 = fma(_1225, _1229, 0.5);
        float _1233 = fma(_1223, _1231, _1223);
        float _1235 = -_1233;
        float _1237 = 0.0 + _1235;
        float _1239 = fma(_1233, _1237, _1155);
        float _1241 = fma(_1225, _1239, _1233);
        _1217 = _1241;
    }
    _1219 = false;
    float _1243 = _1217;
    float _1245 = in.m_55.x;
    float _1247 = in.m_55.y;
    float _1249 = in.m_55.z;
    float _1251 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1253 = log2(_1251);
    float _1255 = _1187 * _1243;
    float _1257 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1259 = _1147 * 3.883221149444580078125;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1263 = _1261 != 0;
    int _1265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1267 = _1265 != 0;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1271 = _1269 != 0;
    bool _1273 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1275 = isnan(1.0);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1281 = _1277 || _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1285 = 1.0 + _1283;
    float _1287 = _1253 * _125;
    float _1289 = 1.0 / _1285;
    float _1291 = _1249 * 2.0;
    float _1293 = _1245 * 2.0;
    float _1295 = _1247 + _1249;
    float _1297 = exp2(_1287);
    float _1299 = _1247 * 2.0;
    float _1301 = _1295 + (-1.0);
    float _1303 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1305 = floor(_1291);
    float _1307 = _1247 + _1245;
    float _1309 = _1307 + (-1.0);
    float _1311 = floor(_1293);
    float _1313 = -_1297;
    float _1315 = _1313 + 1.0;
    bool _1317 = _1305 > 0.0;
    float _1319 = fma(_1309, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1321 = _1305 >= 0.0;
    bool _1323 = isnan(_1305);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan(0.0);
    bool _1329 = _1325 || _1327;
    float _1331 = floor(_1299);
    float _1333 = in.m_65.x;
    float _1335 = in.m_65.y;
    float _1337 = in.m_65.z;
    bool _1339 = !_1263;
    int _1341 = _1339 ? 0 : 1;
    int _1343 = _1329 ? 0 : 1;
    bool _1345 = _1311 > 0.0;
    bool _1347 = _1311 >= 0.0;
    bool _1349 = isnan(_1311);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.0);
    bool _1355 = _1351 || _1353;
    int _1357 = ~_1343;
    int _1359 = _1357 + 1;
    int _1361 = _1359 + 1;
    int _1363 = abs(_1341);
    int _1365 = _1361;
    if (!_1317)
    {
        int _1367 = ~_1343;
        int _1369 = _1367 + 1;
        _1365 = _1369;
    }
    int _1371 = _1365;
    bool _1373 = !_1267;
    int _1375 = _1373 ? 0 : 1;
    int _1377 = _1355 ? 0 : 1;
    float _1379 = float(_1363);
    float _1381 = float(_1371);
    int _1383 = abs(_1375);
    int _1385 = ~_1377;
    int _1387 = _1385 + 1;
    int _1389 = _1387 + 1;
    float _1391 = _1379 * _1381;
    bool _1393 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1395 = isnan(0.0);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1401 = _1397 || _1399;
    int _1403 = _1389;
    if (!_1345)
    {
        int _1405 = ~_1377;
        int _1407 = _1405 + 1;
        _1403 = _1407;
    }
    int _1409 = _1403;
    float _1411 = _1391 * (-2.0);
    float _1413 = _1401 ? _1315 : 0.0;
    float _1415 = float(_1383);
    float _1417 = float(_1409);
    if (_1281)
    {
        float _1419 = _1413 * _1289;
        _143 = _1419;
    }
    float _1421 = _143;
    bool _1423 = _1331 > 0.0;
    float _1425 = _1245 + (-0.5);
    bool _1427 = _1331 >= 0.0;
    bool _1429 = isnan(_1331);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan(0.0);
    bool _1435 = _1431 || _1433;
    float _1437 = _1415 * _1417;
    float _1439 = fma(_1411, _1333, _1333);
    float _1441 = fma(_1319, _1411, _1319);
    int _1443 = _1435 ? 0 : 1;
    float _1445 = _1437 * (-2.0);
    float _1447 = fma(_1425, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1439);
    bool _1449 = !_1271;
    int _1451 = _1449 ? 0 : 1;
    float _1453 = _1245 + _1249;
    int _1455 = ~_1443;
    int _1457 = _1455 + 1;
    int _1459 = _1457 + 1;
    float _1461 = fma(_1441, _1421, _1447);
    int _1463 = abs(_1451);
    float _1465 = fma(_1303, _1445, _1303);
    int _1467 = _1459;
    if (!_1423)
    {
        int _1469 = ~_1443;
        int _1471 = _1469 + 1;
        _1467 = _1471;
    }
    int _1473 = _1467;
    float _1475 = fma(_1445, _1335, _1335);
    float _1477 = _1247 + (-0.5);
    float _1479 = _1461 * 0.15915493667125701904296875;
    float _1481 = float(_1463);
    float _1483 = _1453 + (-1.0);
    float _1485 = float(_1473);
    float _1487 = fma(_1477, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1475);
    float _1489 = _1249 + (-0.5);
    float _1491 = _1479 * 6.283185482025146484375;
    float _1493 = sin(_1491);
    bool _1495 = _1191 != 0.0;
    bool _1497 = isnan(_1191);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan(0.0);
    bool _1503 = _1499 || _1501;
    float _1505 = _1481 * _1485;
    float _1507 = fma(_1465, _1421, _1487);
    float _1509 = _1505 * (-2.0);
    float _1511 = _1507 * 0.15915493667125701904296875;
    float _1513 = _1479 * 6.283185482025146484375;
    float _1515 = cos(_1513);
    float _1517 = fma(_1483, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1519 = fma(_1509, _1337, _1337);
    bool _1521 = _1189 == 0.0;
    bool _1523 = !_1503;
    bool _1525 = _1521 && _1523;
    float _1527 = fma(_1517, _1509, _1517);
    float _1529 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1519);
    bool _1531 = _1193 == 0.0;
    bool _1533 = _1531 && _1525;
    float _1535 = _1511 * 6.283185482025146484375;
    float _1537 = sin(_1535);
    float _1539 = fma(_1527, _1421, _1529);
    float _1541 = _1539 * 0.15915493667125701904296875;
    float _1543 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1545 = _1511 * 6.283185482025146484375;
    float _1547 = cos(_1545);
    float _1549 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1189);
    float _1551 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1191);
    float _1553 = _1163 * 2.0;
    float _1555 = _1543 * _1549;
    float _1557 = _764 * _1551;
    float _1559 = -_1553;
    float _1561 = fma(_1255, _1559, _1255);
    float _1563 = _1541 * 6.283185482025146484375;
    float _1565 = cos(_1563);
    float _1567 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1193);
    float _1569 = _1493 * _1537;
    float _1571 = _1515 * _1537;
    float _1573 = fma(_1163, 3.1415927410125732421875, _1561);
    float _1575 = _1257 * _1567;
    float _1577 = _1541 * 6.283185482025146484375;
    float _1579 = sin(_1577);
    float _1581 = _1493 * _1547;
    float _1583 = _1515 * _1547;
    float _1585 = _1493 * _1565;
    float _1587 = _1547 * _1565;
    float _1589 = _1515 * _1565;
    float _1591 = _1537 * _1565;
    float _1593 = _1585 * _1557;
    float _1595 = _271 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1597 = fma(_1579, _1583, _1569);
    float _1599 = fma(_1579, _1569, _1583);
    float _1601 = _1589 * _1557;
    float _1603 = -_1571;
    float _1605 = fma(_1579, _1581, _1603);
    float _1607 = -_1581;
    float _1609 = fma(_1579, _1571, _1607);
    float _1611 = -_1557;
    float _1613 = _1579 * _1611;
    float _1615 = fma(_1597, _1555, _1601);
    float _1617 = fma(_1605, _1555, _1593);
    float _1619 = _1259 * 0.15915493667125701904296875;
    float _1621 = fma(_1587, _1555, _1613);
    float _1623 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1595);
    float _1625 = _271 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1627 = fma(_1609, _1575, _1615);
    float _1629 = fma(_1591, _1575, _1621);
    float _1631 = fma(_1599, _1575, _1617);
    float _1633 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1625);
    float _1635 = _1627 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1637 = _1627 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1639 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1623);
    float _1641 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1633);
    float _1643 = fma(_1629, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1635);
    float _1645 = fma(_1629, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1637);
    float _1647 = _1639 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1649 = _1641 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1651 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1643);
    float _1653 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1645);
    float _1655 = _1619 * 6.283185482025146484375;
    float _1657 = cos(_1655);
    float _1659 = _271 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1661 = _1647 + _1651;
    float _1663 = _1649 + _1653;
    float _1665 = _1573 * 0.15915493667125701904296875;
    float _1667 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1659);
    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1671 = _1661 + _1669;
    float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1675 = _1663 + _1673;
    float _1677 = _1619 * 6.283185482025146484375;
    float _1679 = sin(_1677);
    float _1681 = _1627 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1683 = _1671 * _1671;
    float _1685 = _1675 * _1675;
    float _1687 = -_971;
    float _1689 = _1687 + _1149;
    float _1691 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1667);
    float _1693 = fma(_1629, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1681);
    float _1695 = _1683 + _1685;
    float _1697 = _1665 * 6.283185482025146484375;
    float _1699 = sin(_1697);
    float _1701 = fma(_1103, _1689, _971);
    float _1703 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1693);
    float _1705 = _1691 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1707 = _1701;
    float _1709 = _1585;
    float _1711 = _1705;
    float _1713 = _1579;
    if (!_1533)
    {
        float _1715 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1701);
        _1707 = _1715;
    }
    float _1717 = _1707;
    float _1719 = _1705 + _1703;
    float _1721 = sqrt(_1695);
    float _1723 = _1589 * _1717;
    float _1725 = _1585 * _1717;
    float _1727 = -_1113;
    float _1729 = fma(_1699, _1657, _1727);
    float _1731 = -_1115;
    float _1733 = fma(_1699, _1679, _1731);
    float _1735 = fma(_1103, _1729, _1113);
    float _1737 = fma(_1103, _1733, _1115);
    bool _1739 = _1721 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1741 = _1737;
    float _1743 = _1735;
    float _1745 = _1717;
    if (!_1533)
    {
        float _1747 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1737);
        _1741 = _1747;
    }
    float _1749 = _1741;
    float _1751 = -_1717;
    float _1753 = _1579 * _1751;
    if (!_1533)
    {
        float _1755 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1735);
        _1743 = _1755;
    }
    float _1757 = _1743;
    if (!_1739)
    {
        _1709 = _1685;
    }
    float _1759 = _1709;
    float _1761 = _1759;
    if (!_1739)
    {
        _1745 = _1683;
    }
    float _1763 = _1745;
    float _1765 = _1763;
    if (!_1739)
    {
        _1711 = _1661;
    }
    float _1767 = _1711;
    float _1769 = _1767;
    if (!_1739)
    {
        _1713 = _1663;
    }
    float _1771 = _1713;
    float _1773 = _1771;
    if (!_1739)
    {
        _279 = _1719;
    }
    float _1775 = _279;
    bool _1777 = !_1739;
    float _1779 = _1775;
    if (!_1777)
    {
        float _1781 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1783 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1785 = _1721 + _1783;
        float _1787 = _1719 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1789 = rsqrt(_1695);
        float _1791 = _1785 * _1781;
        float _1793 = _1791 * 0.15915493667125701904296875;
        float _1795 = _1793 * 6.283185482025146484375;
        float _1797 = sin(_1795);
        float _1799 = _1793 * 6.283185482025146484375;
        float _1801 = cos(_1799);
        float _1803 = fma(_1797, _1787, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1805 = _1789 * _1803;
        float _1807 = _1801 + (-1.0);
        float _1809 = _1671 * _1805;
        float _1811 = _1675 * _1805;
        float _1813 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1815 = _1809 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1817 = _1809 * _1809;
        float _1819 = fma(_1719, _1801, _1813);
        float _1821 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1823 = _1811 * _1811;
        _1779 = _1819;
        _1765 = _1817;
        _1761 = _1823;
        _1769 = _1815;
        _1773 = _1821;
    }
    float _1825 = _1779;
    float _1827 = _1765;
    float _1829 = _1761;
    float _1831 = _1769;
    float _1833 = _1773;
    float _1835 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1837 = _1825 + _1835;
    float _1839 = fma(_1597, _1757, _1723);
    float _1841 = fma(_1587, _1757, _1753);
    float _1843 = fma(_1605, _1757, _1725);
    float _1845 = fma(_1837, _1837, _1827);
    float _1847 = fma(_1609, _1749, _1839);
    float _1849 = fma(_1591, _1749, _1841);
    float _1851 = fma(_1599, _1749, _1843);
    float _1853 = _1845 + _1829;
    float _1855 = _1847 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1857 = _1847 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1859 = _1847 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_67.x = _991;
    out.m_67.y = _930;
    out.m_67.z = _997;
    out.m_67.w = _928;
    float _1861 = fma(_1849, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1855);
    float _1863 = sqrt(_1853);
    float _1865 = fma(_1849, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1857);
    float _1867 = fma(_1849, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1859);
    float _1869 = fma(_1851, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1861);
    float _1871 = fma(_1851, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1865);
    float _1873 = fma(_1851, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1867);
    out.m_69.x = _1869;
    out.m_69.y = _1871;
    out.m_69.z = _1873;
    bool _1875 = _1863 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1877 = isnan(_1863);
    bool _1879 = _1875 || _1877;
    bool _1881 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1883 = _1879 || _1881;
    float _1885 = _1861;
    float _1887 = _1865;
    float _1889 = _1873;
    if (!_1883)
    {
        _1885 = 1.0;
    }
    float _1891 = _1885;
    bool _1893 = !_1883;
    float _1895 = _1891;
    if (!_1893)
    {
        bool _1897 = _1863 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1899 = isnan(_1863);
        bool _1901 = _1897 || _1899;
        bool _1903 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1905 = _1901 || _1903;
        if (!_1905)
        {
            float _1907 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1909 = _1863 + _1907;
            float _1911 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1913 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1911;
            float _1915 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1917 = _1915 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1919 = 1.0 / _1913;
            float _1921 = _1909 * _1919;
            float _1923 = fma(_1921, _1917, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1895 = _1923;
            _1925 = true;
        }
        else
        {
            bool _1927 = _1863 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1929 = isnan(_1863);
            bool _1931 = _1927 || _1929;
            bool _1933 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1935 = _1931 || _1933;
            if (!_1935)
            {
                float _1937 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1939 = _1863 + _1937;
                float _1941 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1943 = _1941 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1945 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1947 = _1945 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1949 = 1.0 / _1943;
                float _1951 = _1939 * _1949;
                float _1953 = fma(_1951, _1947, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1895 = _1953;
                _1925 = true;
            }
            else
            {
                _1895 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1925 = false;
    float _1955 = _1895;
    float _1957 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1959 = _1825 + _1957;
    float _1961 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1963 = _1831 + _1961;
    float _1965 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1967 = _1833 + _1965;
    float _1969 = fma(_1959, _1955, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1971 = fma(_1963, _1955, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1973 = fma(_1967, _1955, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1977 = _1969 + _1975;
    float _1979 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1981 = _1971 + _1979;
    float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1985 = _1973 + _1983;
    float _1987 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1989 = _1977 * _1977;
    float _1991 = fma(_1981, _1981, _1989);
    float _1993 = fma(_1985, _1985, _1991);
    float _1995 = rsqrt(_1993);
    float _1997 = _1995 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1999 = _1981 * _1997;
    float _2001 = _1985 * _1997;
    float _2003 = _1999 * _1999;
    float _2005 = _2001 * _2001;
    float _2007 = _2003 + _2005;
    float _2009 = sqrt(_2007);
    bool _2011 = _2009 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2013 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2015 = _2009 + _2013;
    float _2017 = _1995;
    float _2019 = _2015;
    float _2021 = _1977;
    float _2023 = _1999;
    if (_2011)
    {
        float _2025 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2017 = _2025;
    }
    float _2027 = _2017;
    if (_2011)
    {
        float _2029 = rsqrt(_2007);
        _957 = _2029;
    }
    float _2031 = _957;
    float _2033 = _2031;
    if (_2011)
    {
        float _2035 = _2015 * _2027;
        _2019 = _2035;
    }
    float _2037 = _2019;
    float _2039 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2011)
    {
        float _2041 = _2037 * 0.15915493667125701904296875;
        _1887 = _2041;
    }
    float _2043 = _1887;
    float _2045 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2039);
    float _2047 = _1985;
    if (_2011)
    {
        float _2049 = _2043 * 6.283185482025146484375;
        float _2051 = sin(_2049);
        _2047 = _2051;
    }
    float _2053 = _2047;
    float _2055 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2057 = precise::max(0.0, _2055);
    float _2059 = _2027;
    float _2061 = _2057;
    if (_2011)
    {
        float _2063 = _2043 * 6.283185482025146484375;
        float _2065 = cos(_2063);
        _2059 = _2065;
    }
    float _2067 = _2059;
    float _2069 = -_1997;
    float _2071 = -_2057;
    float _2073 = fma(_1977, _2069, _2071);
    if (_2011)
    {
        float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2021 = _2075;
    }
    float _2077 = _2021;
    float _2079 = sqrt(_1993);
    float _2081 = _2077;
    float _2083 = _2053;
    if (_2011)
    {
        float _2085 = fma(_2053, _2077, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2081 = _2085;
    }
    float _2087 = _2081;
    float _2089 = _2087;
    if (!_2011)
    {
        _2083 = _2001;
    }
    float _2091 = _2083;
    float _2093 = _2091;
    if (_2011)
    {
        float _2095 = _2067 + (-1.0);
        _2061 = _2095;
    }
    float _2097 = _2061;
    float _2099 = _2097;
    if (_2011)
    {
        float _2101 = _2031 * _2087;
        _1889 = _2101;
    }
    float _2103 = _1889;
    if (!_2011)
    {
        _2033 = _2073;
    }
    float _2105 = _2033;
    float _2107 = _2105;
    if (_2011)
    {
        float _2109 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2099 = _2109;
    }
    float _2111 = _2099;
    float _2113 = _2111;
    if (_2011)
    {
        float _2115 = _1999 * _2103;
        _2023 = _2115;
    }
    float _2117 = _2023;
    if (!_2011)
    {
        _2089 = _2003;
    }
    float _2119 = _2089;
    float _2121 = _2119;
    if (_2011)
    {
        float _2123 = _2001 * _2103;
        _2093 = _2123;
    }
    float _2125 = _2093;
    if (_2011)
    {
        float _2127 = fma(_2073, _2067, _2111);
        _2107 = _2127;
    }
    float _2129 = _2107;
    if (_2011)
    {
        float _2131 = _2117 * _2117;
        _2121 = _2131;
    }
    float _2133 = _2121;
    if (!_2011)
    {
        _2113 = _2005;
    }
    float _2135 = _2113;
    float _2137 = _2135;
    if (_2011)
    {
        float _2139 = _2125 * _2125;
        _2137 = _2139;
    }
    float _2141 = _2137;
    float _2143 = fma(_2129, _2129, _2133);
    float _2145 = _2143 + _2141;
    float _2147 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2151 = fma(_2079, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2149);
    float _2153 = precise::clamp(_2151, 0.0, 1.0);
    float _2155 = rsqrt(_2145);
    float _2157 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2147);
    float _2159 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2161 = -_2153;
    float _2163 = _2161 + 1.0;
    float _2165 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2157);
    float _2167 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2169 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2159);
    float _2171 = _2165 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2173 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2167);
    float _2175 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2169);
    float _2177 = abs(_2163);
    float _2179 = log2(_2177);
    float _2181 = _2171 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2183 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2173);
    float _2185 = _2175 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2187 = _2155 * _2117;
    float _2189 = _2155 * _2129;
    float _2191 = _2183 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2193 = -_2181;
    float _2195 = fma(_2193, _1987, 1.0);
    float _2197 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2199 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2201 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2045);
    float _2203 = _2155 * _2125;
    float _2205 = -_2197;
    float _2207 = fma(_2189, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2205);
    float _2209 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2199);
    float _2211 = _2201 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2213 = log2(_2195);
    float _2215 = -_2203;
    float _2217 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2207);
    float _2219 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2209);
    float _2221 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2223 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2225 = fma(_2217, -0.5, 0.5);
    float _2227 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2219);
    float _2229 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2231 = exp2(_2221);
    float _2233 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2223);
    float _2235 = fma(_2217, 0.5, 0.5);
    float _2237 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2229);
    float _2239 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2233);
    float _2241 = fma(_2235, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2243 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2237);
    float _2245 = 1.0 / _2227;
    float _2247 = _2189 + 1.0;
    float _2249 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2239);
    float _2251 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2243);
    float _2253 = fma(_2235, _2241, -0.212114393711090087890625);
    float _2255 = _2213 * 0.693147182464599609375;
    float _2257 = sqrt(_2225);
    float _2259 = -_2189;
    float _2261 = fma(_2231, _2247, _2259);
    float _2263 = fma(_2235, _2253, 1.570728778839111328125);
    float _2265 = _2255 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2267 = fma(_2261, 0.5, 0.5);
    float _2269 = _2249 * _2245;
    float _2271 = _2251 * _2245;
    float _2273 = fma(_2269, 0.5, 0.5);
    float _2275 = fma(_2271, -0.5, 0.5);
    float _2277 = _2257 * 0.636619746685028076171875;
    float _2279 = -_2263;
    float _2281 = fma(_2277, _2279, 1.0);
    float3 _5737 = float3(_2273, _2275, _2265);
    float _2283 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5737, float3(0.0), isnan(_5737)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5737, float3(0.0), isnan(_5737)), level(0.0)).x;
    float3 _5748 = float3(_2273, _2275, _2265);
    float4 _2285 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5748, float3(0.0), isnan(_5748)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5748, float3(0.0), isnan(_5748)), level(0.0)).xyzw;
    float _2287 = _2285.x;
    float _2289 = _2285.y;
    float _2291 = _2285.z;
    float _2293 = _2285.w;
    float2 _5764 = float2(_2281, _2267);
    float3 _2297 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5764, float2(0.0), isnan(_5764)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5764, float2(0.0), isnan(_5764)), level(0.0)).xyz;
    float _2299 = _2297.x;
    float _2301 = _2297.y;
    float _2303 = _2297.z;
    float _2305 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2307 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_71.x = _1971;
    out.m_71.y = _1969;
    out.m_71.z = _1973;
    float _2309 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2307);
    float _2311 = exp2(_2305);
    float _2313 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2309);
    float _2315 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2313);
    float _2317 = _2315 + _2227;
    out.gl_Position.x = _2249;
    out.gl_Position.y = _2251;
    out.gl_Position.z = _2315;
    out.gl_Position.w = _2227;
    float _2319 = _2317 * 0.5;
    float _2321 = -_2311;
    float _2323 = _2321 + 1.0;
    float _2325 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2327 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.z = _2319;
    out.m_73.w = _2227;
    out.m_49.x = _2327;
    float _2329 = _2325 * _2283;
    float _2331 = -_2325;
    float _2333 = _2331 + 1.0;
    float _2335 = _2293 * _2329;
    float _2337 = _2303 * _2329;
    float _2339 = fma(_2299, _2335, _2287);
    float _2341 = fma(_2301, _2335, _2289);
    float _2343 = _2293 * _2333;
    float _2345 = fma(_2293, _2337, _2291);
    out.m_75.x = _2339;
    out.m_75.y = _2341;
    out.m_75.z = _2345;
    out.m_75.w = _2343;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1925 = false;
    bool _1219 = false;
    bool _1027 = false;
    bool _423 = false;
    bool _299 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_46.w;
    float _97 = trunc(_95);
    int _99 = int(_97);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    float _107 = as_type<float>(_99);
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _105;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _109 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2403 = as_type<float>(_115);
        out.gl_Position.z = _2403;
    }
    if (!_103)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _119 = in.m_51.w;
    float _121 = float(_99);
    float _123 = -_119;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_119);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    bool _137 = _125 >= _121;
    bool _139 = !_135;
    bool _141 = _137 || _139;
    float _143 = _125;
    if (_141)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _107;
    if (_141)
    {
        out.m_49.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _117 = as_type<int>(_147);
    }
    int _149 = _117;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2467 = as_type<float>(_149);
        out.gl_Position.z = _2467;
    }
    if (_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = in.m_53.w;
    float _153 = 1.0 / _121;
    float _155 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = in.m_51.x;
    float _169 = in.m_51.y;
    float _171 = in.m_51.z;
    float _173 = in.m_46.x;
    float _175 = in.m_46.y;
    float _177 = in.m_46.z;
    float _179 = 0.0;
    float _181 = _155;
    if (!_165)
    {
        float _183 = _155 * _155;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = _187;
    if (!_165)
    {
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _191;
    }
    float _193 = _189;
    bool _195 = !_165;
    float _197 = _193;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _155 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _155);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    bool _231 = !_165;
    if (!_231)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _155 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _181 = _251;
    }
    float _253 = _181;
    bool _255 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _257 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _259 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _261 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _263 = fma(_253, _167, _257);
    float _265 = fma(_253, _169, _259);
    float _267 = fma(_253, _171, _261);
    float _269 = fma(_263, _151, _173);
    float _271 = fma(_265, _151, _175);
    float _273 = fma(_267, _151, _177);
    float _275 = _125 * _153;
    bool _277 = !_255;
    float _279 = _269;
    float _297;
    if (!_277)
    {
        float _281 = in.m_55.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        _297 = _275;
    }
    _299 = false;
    float _301 = _297;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _303;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _311 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _313 = 1.0 / _305;
    float _315 = _307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = _301 + _317;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _323 = _309 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _325 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _327 = isnan(_301);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _321 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _339 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_301);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -_335;
    float _353 = _351 + 1.0;
    float _355 = _319 * _313;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _359;
    out.m_57.x = _315;
    out.m_57.y = _337;
    out.m_57.z = _323;
    out.m_57.w = _357;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _367;
    float _371 = _349 * _353;
    float _373 = fma(_361, _355, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _375 = fma(_365, _355, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _377 = fma(_369, _355, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _379 = -_349;
    float _381 = _379 + 1.0;
    float _383 = _373 * _371;
    float _385 = _375 * _371;
    float _387 = _377 * _371;
    float _389 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[143].x, _383);
    float _391 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[143].y, _385);
    float _393 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[143].z, _387);
    float _395 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[144].x, _389);
    float _397 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[144].y, _391);
    float _399 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[144].z, _393);
    bool _401 = !_311;
    bool _403 = _311;
    float _421;
    if (!_401)
    {
        float _405 = in.m_55.x;
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _409 = _405 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        _421 = _275;
    }
    _423 = false;
    float _425 = _421;
    int _427 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _429 = _427;
    int _431 = 0;
    int _433 = _90(_429, _431, (*spvDescriptorSet0.support_buffer));
    float _435 = in.m_59.z;
    float _437 = 0.0 + _275;
    float _439 = precise::clamp(_437, 0.0, 1.0);
    float _441 = trunc(_435);
    int _443 = int(_441);
    int _445 = _433 + (-1);
    float _447 = float(_445);
    float _449 = _439 * _447;
    float _451 = trunc(_449);
    int _453 = int(_451);
    int _455 = _453;
    int _457 = 0;
    int _459 = _91(_455, _457, (*spvDescriptorSet0.support_buffer));
    int _461 = _443;
    int _463 = 0;
    int _465 = _91(_461, _463, (*spvDescriptorSet0.support_buffer));
    float4 _468 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_459, _465)), 0).xyzw;
    float _470 = _468.x;
    float _472 = _468.y;
    float _474 = _468.z;
    float _476 = _468.w;
    float _478 = in.m_53.x;
    float _480 = in.m_53.y;
    float _482 = in.m_53.z;
    float _484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _486 = in.m_59.x;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _490 = _488 != 0;
    float _492 = in.m_55.z;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _500 = _498 != 0;
    float _502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _504 = in.m_55.x;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _510 = _508 != 0;
    float _512 = in.m_55.w;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _516 = _514 != 0;
    float _518 = 1.0 / _496;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _522 = _520 != 0;
    float _524 = _395 * _478;
    float _526 = _397 * _480;
    float _528 = in.m_55.y;
    float _530 = _399 * _482;
    float _532 = -_486;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _542 = _540 != 0;
    float _544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _546 = _504 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_490)
    {
        bool _548 = _492 > 0.5;
        _403 = _548;
    }
    bool _550 = _403;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _554 = 0.0;
    if (!_490)
    {
        _554 = _486;
    }
    float _556 = _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _562 = _556;
    if (_490)
    {
        float _564 = _550 ? _534 : _486;
        _562 = _564;
    }
    float _566 = _562;
    float _568 = 1.0 / _538;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _572 = _570 != 0;
    float _574 = -_506;
    float _576 = fma(_546, 2.0, _574);
    bool _578 = _512 > 0.5;
    bool _580 = _578 && _522;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _582;
    bool _586 = _504 > 0.5;
    bool _588 = _586 && _510;
    float _590 = 1.0 / _560;
    float _592 = in.m_59.y;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _598 = _528 > 0.5;
    float _600 = _544 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _602 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _604 = isnan(_425);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _616 = _528 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _620 = _528 > 0.5;
    bool _622 = _620 && _516;
    float _624 = fma(_616, -2.0, _552);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _626;
    float _630 = _584 * _518;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _634 = _425 + _632;
    float _636 = _596 * _590;
    float _638 = _628 * _568;
    float _640 = _628;
    float _642 = _630;
    if (!_500)
    {
        _640 = _486;
    }
    float _644 = _640;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _648 = _425 + _646;
    float _650 = _588 ? _534 : _486;
    float _652 = fma(_638, _634, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _656 = _425 + _654;
    float _658 = _644;
    float _660 = _656;
    if (_500)
    {
        float _662 = _598 ? _534 : _486;
        _658 = _662;
    }
    float _664 = _658;
    float _666 = _614 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _668 = -_592;
    float _670 = _668 + 1.0;
    float _672 = fma(_636, _656, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _674 = fma(_630, _648, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _676 = fma(_666, _650, -0.5);
    float _678 = _484 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _680 = _502 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _682 = _580 ? _670 : _592;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _686 = fma(_678, _566, -0.5);
    float _688 = _684;
    if (!_542)
    {
        _660 = _528;
    }
    float _690 = _660;
    float _692 = fma(_680, _682, -0.5);
    float _694 = _690;
    if (_542)
    {
        _694 = _504;
    }
    float _696 = _694;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _700 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _702 = isnan(_425);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _624);
    bool _714 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _716 = isnan(_425);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[78].z, _698);
    float _728 = _698;
    if (!_542)
    {
        _728 = _504;
    }
    float _730 = _728;
    float _732 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[83].z, _684);
    float _734 = _730;
    if (_542)
    {
        _734 = _492;
    }
    float _736 = _734;
    float _738 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _726);
    if (!_542)
    {
        _688 = _528;
    }
    float _740 = _688;
    float _742 = -_710;
    float _744 = _742 + 1.0;
    float _746 = _740;
    if (_542)
    {
        _746 = _504;
    }
    float _748 = _746;
    float _750 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[84].z, _618);
    bool _752 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _754 = isnan(_425);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _766 = -_125;
    float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[76].x, _576);
    float _770 = -_612;
    float _772 = _770 + 1.0;
    float _774 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[84].x, _750);
    float _776 = _724 * _744;
    float _778 = fma(_738, _676, _768);
    float _780 = _762 * _772;
    float _782 = -_762;
    float _784 = _782 + 1.0;
    float _786 = _748 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _788 = -_724;
    float _790 = _788 + 1.0;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _794 = _652 * _780;
    float _796 = _774 * (-0.15915493667125701904296875);
    float _798 = -_792;
    float _800 = fma(_786, 2.0, _798);
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_542)
    {
        _642 = _492;
    }
    float _804 = _642;
    float _806 = _612 * _790;
    float _808 = _796 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[131].x, _794);
    float _814 = _764 * _592;
    bool _816 = _492 > 0.5;
    bool _818 = _816 && _572;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _822 = _804;
    float _824 = _814;
    if (!_542)
    {
        _802 = _804;
    }
    float _826 = _802;
    float _828 = fma(_672, _806, _812);
    float _830 = _796 * 6.283185482025146484375;
    float _832 = cos(_830);
    float _834 = _826;
    if (_542)
    {
        _822 = _528;
    }
    float _836 = _822;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_622)
    {
        float _840 = -_814;
        float _842 = _840 + 1.0;
        _824 = _842;
    }
    float _844 = _824;
    float _846 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[78].w, _820);
    if (_542)
    {
        _834 = _528;
    }
    float _848 = _834;
    float _850 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[83].w, _838);
    float _852 = fma(_600, _844, -0.5);
    float _854 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _856 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _846);
    float _858 = fma(_674, _776, _828);
    float _860 = _810 * _692;
    int _862 = _818 ? as_type<int>(_670) : as_type<int>(_592);
    float _864 = -_712;
    float _866 = fma(_856, _852, _864);
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _872 = _832 * _692;
    float _874 = _848 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _876 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[134].x, _858);
    float _878 = _664 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _880 = fma(_810, _686, _872);
    float _882 = as_type<float>(_862) * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _884 = fma(_874, -2.0, _868);
    float _886 = _876 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _888 = _882 * _854;
    float _890 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _850);
    float _892 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _884);
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _896 = _878 * _870;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _900 = -_892;
    float _902 = fma(_890, _880, _900);
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _906 = _453 + 1;
    float _908 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _910 = _898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _912 = _904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _896;
    out.m_61.y = _888;
    float _914 = -_860;
    float _916 = fma(_832, _686, _914);
    float _918 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _732);
    float _920 = -_125;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[81].x, _800);
    out.m_63.x = _908;
    out.m_63.y = _910;
    out.m_63.z = _912;
    out.m_63.w = _886;
    int _924 = min(_445, _906);
    float _926 = fma(_918, _916, _922);
    float _928 = _902 + 0.5;
    float _930 = _866 + 0.5;
    uint _933 = as_type<uint>(half2(float2(_476, 0.0)));
    uint _935 = extract_bits(_933, 0u, 8u);
    int _937 = int(_935) & 255;
    uint _939 = extract_bits(_933, 8u, 8u);
    int _941 = int(_939) & 255;
    int _943 = _941 << 8;
    int _945 = _937 | _943;
    bool _947 = _945 >= 32768;
    int _949 = _945 + (-1024);
    int _951 = _949;
    int _953 = _862;
    int _955 = as_type<int>(_892);
    float _957 = _928;
    if (_947)
    {
        int _959 = ~_945;
        int _961 = _959 + 33792;
        int _963 = _961 + 1;
        _951 = _963;
    }
    int _965 = _951;
    int _967 = _965 + 30719;
    float _969 = float(_967);
    float _971 = fma(_969, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _973 = abs(_971);
    float _975 = -_973;
    float _977 = _975 + 1.0;
    float _979 = abs(_971);
    float _981 = fma(_979, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _983 = _971 < 0.0;
    float _985 = float(_983);
    int _987 = as_type<int>(_977) + (-218103808);
    bool _989 = uint(_987) >= 1920991232u;
    float _991 = _778 + 0.5;
    float _993 = abs(_971);
    float _995 = fma(_993, _981, -0.212114393711090087890625);
    float _997 = _926 + 0.5;
    float _999 = abs(_971);
    float _1001 = fma(_999, _995, 1.570728778839111328125);
    bool _1003 = !_989;
    float _1025;
    if (!_1003)
    {
        int _1005 = as_type<int>(_977);
        int _1007 = _862;
        int _1009 = as_type<int>(_892);
        int _1011 = 5248;
        int _1013;
        int _1015;
        int _1017;
        int _1019;
        int _1021;
        int _1023;
        _88(_1005, _1007, _1009, _1011, _1013, _1015, _1017, _1019, _1021, _1023, out.gl_Position, out.gl_PointSize);
        _1025 = as_type<float>(_1013);
        _953 = _1015;
        _955 = _1021;
        _1027 = true;
    }
    else
    {
        float _1029 = rsqrt(_977);
        float _1031 = _977 * _1029;
        float _1033 = _1029 * 0.5;
        float _1035 = -_1031;
        float _1037 = 0.0 + _1035;
        float _1039 = fma(_1033, _1037, 0.5);
        float _1041 = fma(_1031, _1039, _1031);
        float _1043 = -_1041;
        float _1045 = 0.0 + _1043;
        float _1047 = fma(_1041, _1045, _977);
        float _1049 = fma(_1033, _1047, _1041);
        _1025 = _1049;
    }
    _1027 = false;
    float _1051 = _1025;
    int _1053 = _953;
    int _1055 = _955;
    int _1057 = _924;
    int _1059 = 0;
    int _1061 = _91(_1057, _1059, (*spvDescriptorSet0.support_buffer));
    int _1063 = _443;
    int _1065 = 0;
    int _1067 = _91(_1063, _1065, (*spvDescriptorSet0.support_buffer));
    float4 _1069 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1061, _1067)), 0).xyzw;
    float _1071 = _1069.x;
    float _1073 = _1069.y;
    float _1075 = _1069.z;
    float _1077 = _1069.w;
    float _1079 = floor(_449);
    float _1081 = _1001 * _1051;
    float _1083 = _985 * 2.0;
    float _1085 = _969 * 3.883221149444580078125;
    float _1087 = -_1083;
    float _1089 = fma(_1081, _1087, _1081);
    float _1091 = _1085 * 0.15915493667125701904296875;
    float _1093 = fma(_985, 3.1415927410125732421875, _1089);
    float _1095 = _1091 * 6.283185482025146484375;
    float _1097 = cos(_1095);
    float _1099 = _1093 * 0.15915493667125701904296875;
    float _1101 = -_1079;
    float _1103 = _449 + _1101;
    float _1105 = _1099 * 6.283185482025146484375;
    float _1107 = sin(_1105);
    float _1109 = _1091 * 6.283185482025146484375;
    float _1111 = sin(_1109);
    float _1113 = _1107 * _1097;
    float _1115 = _1107 * _1111;
    uint _1117 = as_type<uint>(half2(float2(_1077, 0.0)));
    uint _1119 = extract_bits(_1117, 0u, 8u);
    int _1121 = int(_1119) & 255;
    uint _1123 = extract_bits(_1117, 8u, 8u);
    int _1125 = int(_1123) & 255;
    int _1127 = _1125 << 8;
    int _1129 = _1121 | _1127;
    bool _1131 = _1129 >= 32768;
    int _1133 = _1129 + (-1024);
    int _1135 = _1133;
    if (_1131)
    {
        int _1137 = ~_1129;
        int _1139 = _1137 + 33792;
        int _1141 = _1139 + 1;
        _1135 = _1141;
    }
    int _1143 = _1135;
    int _1145 = _1143 + 30719;
    float _1147 = float(_1145);
    float _1149 = fma(_1147, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1151 = abs(_1149);
    float _1153 = -_1151;
    float _1155 = _1153 + 1.0;
    float _1157 = abs(_1149);
    float _1159 = fma(_1157, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1161 = _1149 < 0.0;
    float _1163 = float(_1161);
    int _1165 = as_type<int>(_1155) + (-218103808);
    float _1167 = abs(_1149);
    float _1169 = fma(_1167, _1159, -0.212114393711090087890625);
    bool _1171 = uint(_1165) >= 1920991232u;
    float _1173 = -_470;
    float _1175 = _1173 + _1071;
    float _1177 = -_472;
    float _1179 = _1177 + _1073;
    float _1181 = -_474;
    float _1183 = _1181 + _1075;
    float _1185 = abs(_1149);
    float _1187 = fma(_1185, _1169, 1.570728778839111328125);
    float _1189 = fma(_1103, _1175, _470);
    float _1191 = fma(_1103, _1179, _472);
    float _1193 = fma(_1103, _1183, _474);
    bool _1195 = !_1171;
    float _1217;
    if (!_1195)
    {
        int _1197 = as_type<int>(_1155);
        int _1199 = _1053;
        int _1201 = _1055;
        int _1203 = 6128;
        int _1205;
        int _1207;
        int _1209;
        int _1211;
        int _1213;
        int _1215;
        _88(_1197, _1199, _1201, _1203, _1205, _1207, _1209, _1211, _1213, _1215, out.gl_Position, out.gl_PointSize);
        _1217 = as_type<float>(_1205);
        _1219 = true;
    }
    else
    {
        float _1221 = rsqrt(_1155);
        float _1223 = _1155 * _1221;
        float _1225 = _1221 * 0.5;
        float _1227 = -_1223;
        float _1229 = 0.0 + _1227;
        float _1231 = fma(_1225, _1229, 0.5);
        float _1233 = fma(_1223, _1231, _1223);
        float _1235 = -_1233;
        float _1237 = 0.0 + _1235;
        float _1239 = fma(_1233, _1237, _1155);
        float _1241 = fma(_1225, _1239, _1233);
        _1217 = _1241;
    }
    _1219 = false;
    float _1243 = _1217;
    float _1245 = in.m_55.x;
    float _1247 = in.m_55.y;
    float _1249 = in.m_55.z;
    float _1251 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1253 = log2(_1251);
    float _1255 = _1187 * _1243;
    float _1257 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1259 = _1147 * 3.883221149444580078125;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1263 = _1261 != 0;
    int _1265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1267 = _1265 != 0;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1271 = _1269 != 0;
    bool _1273 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1275 = isnan(1.0);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1281 = _1277 || _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1285 = 1.0 + _1283;
    float _1287 = _1253 * _125;
    float _1289 = 1.0 / _1285;
    float _1291 = _1249 * 2.0;
    float _1293 = _1245 * 2.0;
    float _1295 = _1247 + _1249;
    float _1297 = exp2(_1287);
    float _1299 = _1247 * 2.0;
    float _1301 = _1295 + (-1.0);
    float _1303 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1305 = floor(_1291);
    float _1307 = _1247 + _1245;
    float _1309 = _1307 + (-1.0);
    float _1311 = floor(_1293);
    float _1313 = -_1297;
    float _1315 = _1313 + 1.0;
    bool _1317 = _1305 > 0.0;
    float _1319 = fma(_1309, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1321 = _1305 >= 0.0;
    bool _1323 = isnan(_1305);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan(0.0);
    bool _1329 = _1325 || _1327;
    float _1331 = floor(_1299);
    float _1333 = in.m_65.x;
    float _1335 = in.m_65.y;
    float _1337 = in.m_65.z;
    bool _1339 = !_1263;
    int _1341 = _1339 ? 0 : 1;
    int _1343 = _1329 ? 0 : 1;
    bool _1345 = _1311 > 0.0;
    bool _1347 = _1311 >= 0.0;
    bool _1349 = isnan(_1311);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.0);
    bool _1355 = _1351 || _1353;
    int _1357 = ~_1343;
    int _1359 = _1357 + 1;
    int _1361 = _1359 + 1;
    int _1363 = abs(_1341);
    int _1365 = _1361;
    if (!_1317)
    {
        int _1367 = ~_1343;
        int _1369 = _1367 + 1;
        _1365 = _1369;
    }
    int _1371 = _1365;
    bool _1373 = !_1267;
    int _1375 = _1373 ? 0 : 1;
    int _1377 = _1355 ? 0 : 1;
    float _1379 = float(_1363);
    float _1381 = float(_1371);
    int _1383 = abs(_1375);
    int _1385 = ~_1377;
    int _1387 = _1385 + 1;
    int _1389 = _1387 + 1;
    float _1391 = _1379 * _1381;
    bool _1393 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1395 = isnan(0.0);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1401 = _1397 || _1399;
    int _1403 = _1389;
    if (!_1345)
    {
        int _1405 = ~_1377;
        int _1407 = _1405 + 1;
        _1403 = _1407;
    }
    int _1409 = _1403;
    float _1411 = _1391 * (-2.0);
    float _1413 = _1401 ? _1315 : 0.0;
    float _1415 = float(_1383);
    float _1417 = float(_1409);
    if (_1281)
    {
        float _1419 = _1413 * _1289;
        _143 = _1419;
    }
    float _1421 = _143;
    bool _1423 = _1331 > 0.0;
    float _1425 = _1245 + (-0.5);
    bool _1427 = _1331 >= 0.0;
    bool _1429 = isnan(_1331);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan(0.0);
    bool _1435 = _1431 || _1433;
    float _1437 = _1415 * _1417;
    float _1439 = fma(_1411, _1333, _1333);
    float _1441 = fma(_1319, _1411, _1319);
    int _1443 = _1435 ? 0 : 1;
    float _1445 = _1437 * (-2.0);
    float _1447 = fma(_1425, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1439);
    bool _1449 = !_1271;
    int _1451 = _1449 ? 0 : 1;
    float _1453 = _1245 + _1249;
    int _1455 = ~_1443;
    int _1457 = _1455 + 1;
    int _1459 = _1457 + 1;
    float _1461 = fma(_1441, _1421, _1447);
    int _1463 = abs(_1451);
    float _1465 = fma(_1303, _1445, _1303);
    int _1467 = _1459;
    if (!_1423)
    {
        int _1469 = ~_1443;
        int _1471 = _1469 + 1;
        _1467 = _1471;
    }
    int _1473 = _1467;
    float _1475 = fma(_1445, _1335, _1335);
    float _1477 = _1247 + (-0.5);
    float _1479 = _1461 * 0.15915493667125701904296875;
    float _1481 = float(_1463);
    float _1483 = _1453 + (-1.0);
    float _1485 = float(_1473);
    float _1487 = fma(_1477, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1475);
    float _1489 = _1249 + (-0.5);
    float _1491 = _1479 * 6.283185482025146484375;
    float _1493 = sin(_1491);
    bool _1495 = _1191 != 0.0;
    bool _1497 = isnan(_1191);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan(0.0);
    bool _1503 = _1499 || _1501;
    float _1505 = _1481 * _1485;
    float _1507 = fma(_1465, _1421, _1487);
    float _1509 = _1505 * (-2.0);
    float _1511 = _1507 * 0.15915493667125701904296875;
    float _1513 = _1479 * 6.283185482025146484375;
    float _1515 = cos(_1513);
    float _1517 = fma(_1483, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1519 = fma(_1509, _1337, _1337);
    bool _1521 = _1189 == 0.0;
    bool _1523 = !_1503;
    bool _1525 = _1521 && _1523;
    float _1527 = fma(_1517, _1509, _1517);
    float _1529 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1519);
    bool _1531 = _1193 == 0.0;
    bool _1533 = _1531 && _1525;
    float _1535 = _1511 * 6.283185482025146484375;
    float _1537 = sin(_1535);
    float _1539 = fma(_1527, _1421, _1529);
    float _1541 = _1539 * 0.15915493667125701904296875;
    float _1543 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1545 = _1511 * 6.283185482025146484375;
    float _1547 = cos(_1545);
    float _1549 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1189);
    float _1551 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1191);
    float _1553 = _1163 * 2.0;
    float _1555 = _1543 * _1549;
    float _1557 = _764 * _1551;
    float _1559 = -_1553;
    float _1561 = fma(_1255, _1559, _1255);
    float _1563 = _1541 * 6.283185482025146484375;
    float _1565 = cos(_1563);
    float _1567 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1193);
    float _1569 = _1493 * _1537;
    float _1571 = _1515 * _1537;
    float _1573 = fma(_1163, 3.1415927410125732421875, _1561);
    float _1575 = _1257 * _1567;
    float _1577 = _1541 * 6.283185482025146484375;
    float _1579 = sin(_1577);
    float _1581 = _1493 * _1547;
    float _1583 = _1515 * _1547;
    float _1585 = _1493 * _1565;
    float _1587 = _1547 * _1565;
    float _1589 = _1515 * _1565;
    float _1591 = _1537 * _1565;
    float _1593 = _1585 * _1557;
    float _1595 = _271 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1597 = fma(_1579, _1583, _1569);
    float _1599 = fma(_1579, _1569, _1583);
    float _1601 = _1589 * _1557;
    float _1603 = -_1571;
    float _1605 = fma(_1579, _1581, _1603);
    float _1607 = -_1581;
    float _1609 = fma(_1579, _1571, _1607);
    float _1611 = -_1557;
    float _1613 = _1579 * _1611;
    float _1615 = fma(_1597, _1555, _1601);
    float _1617 = fma(_1605, _1555, _1593);
    float _1619 = _1259 * 0.15915493667125701904296875;
    float _1621 = fma(_1587, _1555, _1613);
    float _1623 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1595);
    float _1625 = _271 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1627 = fma(_1609, _1575, _1615);
    float _1629 = fma(_1591, _1575, _1621);
    float _1631 = fma(_1599, _1575, _1617);
    float _1633 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1625);
    float _1635 = _1627 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1637 = _1627 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1639 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1623);
    float _1641 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1633);
    float _1643 = fma(_1629, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1635);
    float _1645 = fma(_1629, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1637);
    float _1647 = _1639 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1649 = _1641 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1651 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1643);
    float _1653 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1645);
    float _1655 = _1619 * 6.283185482025146484375;
    float _1657 = cos(_1655);
    float _1659 = _271 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1661 = _1647 + _1651;
    float _1663 = _1649 + _1653;
    float _1665 = _1573 * 0.15915493667125701904296875;
    float _1667 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1659);
    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1671 = _1661 + _1669;
    float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1675 = _1663 + _1673;
    float _1677 = _1619 * 6.283185482025146484375;
    float _1679 = sin(_1677);
    float _1681 = _1627 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1683 = _1671 * _1671;
    float _1685 = _1675 * _1675;
    float _1687 = -_971;
    float _1689 = _1687 + _1149;
    float _1691 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1667);
    float _1693 = fma(_1629, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1681);
    float _1695 = _1683 + _1685;
    float _1697 = _1665 * 6.283185482025146484375;
    float _1699 = sin(_1697);
    float _1701 = fma(_1103, _1689, _971);
    float _1703 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1693);
    float _1705 = _1691 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1707 = _1701;
    float _1709 = _1585;
    float _1711 = _1705;
    float _1713 = _1579;
    if (!_1533)
    {
        float _1715 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1701);
        _1707 = _1715;
    }
    float _1717 = _1707;
    float _1719 = _1705 + _1703;
    float _1721 = sqrt(_1695);
    float _1723 = _1589 * _1717;
    float _1725 = _1585 * _1717;
    float _1727 = -_1113;
    float _1729 = fma(_1699, _1657, _1727);
    float _1731 = -_1115;
    float _1733 = fma(_1699, _1679, _1731);
    float _1735 = fma(_1103, _1729, _1113);
    float _1737 = fma(_1103, _1733, _1115);
    bool _1739 = _1721 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1741 = _1737;
    float _1743 = _1735;
    float _1745 = _1717;
    if (!_1533)
    {
        float _1747 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1737);
        _1741 = _1747;
    }
    float _1749 = _1741;
    float _1751 = -_1717;
    float _1753 = _1579 * _1751;
    if (!_1533)
    {
        float _1755 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1735);
        _1743 = _1755;
    }
    float _1757 = _1743;
    if (!_1739)
    {
        _1709 = _1685;
    }
    float _1759 = _1709;
    float _1761 = _1759;
    if (!_1739)
    {
        _1745 = _1683;
    }
    float _1763 = _1745;
    float _1765 = _1763;
    if (!_1739)
    {
        _1711 = _1661;
    }
    float _1767 = _1711;
    float _1769 = _1767;
    if (!_1739)
    {
        _1713 = _1663;
    }
    float _1771 = _1713;
    float _1773 = _1771;
    if (!_1739)
    {
        _279 = _1719;
    }
    float _1775 = _279;
    bool _1777 = !_1739;
    float _1779 = _1775;
    if (!_1777)
    {
        float _1781 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1783 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1785 = _1721 + _1783;
        float _1787 = _1719 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1789 = rsqrt(_1695);
        float _1791 = _1785 * _1781;
        float _1793 = _1791 * 0.15915493667125701904296875;
        float _1795 = _1793 * 6.283185482025146484375;
        float _1797 = sin(_1795);
        float _1799 = _1793 * 6.283185482025146484375;
        float _1801 = cos(_1799);
        float _1803 = fma(_1797, _1787, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1805 = _1789 * _1803;
        float _1807 = _1801 + (-1.0);
        float _1809 = _1671 * _1805;
        float _1811 = _1675 * _1805;
        float _1813 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1815 = _1809 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1817 = _1809 * _1809;
        float _1819 = fma(_1719, _1801, _1813);
        float _1821 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1823 = _1811 * _1811;
        _1779 = _1819;
        _1765 = _1817;
        _1761 = _1823;
        _1769 = _1815;
        _1773 = _1821;
    }
    float _1825 = _1779;
    float _1827 = _1765;
    float _1829 = _1761;
    float _1831 = _1769;
    float _1833 = _1773;
    float _1835 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1837 = _1825 + _1835;
    float _1839 = fma(_1597, _1757, _1723);
    float _1841 = fma(_1587, _1757, _1753);
    float _1843 = fma(_1605, _1757, _1725);
    float _1845 = fma(_1837, _1837, _1827);
    float _1847 = fma(_1609, _1749, _1839);
    float _1849 = fma(_1591, _1749, _1841);
    float _1851 = fma(_1599, _1749, _1843);
    float _1853 = _1845 + _1829;
    float _1855 = _1847 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1857 = _1847 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1859 = _1847 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_67.x = _991;
    out.m_67.y = _930;
    out.m_67.z = _997;
    out.m_67.w = _928;
    float _1861 = fma(_1849, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1855);
    float _1863 = sqrt(_1853);
    float _1865 = fma(_1849, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1857);
    float _1867 = fma(_1849, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1859);
    float _1869 = fma(_1851, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1861);
    float _1871 = fma(_1851, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1865);
    float _1873 = fma(_1851, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1867);
    out.m_69.x = _1869;
    out.m_69.y = _1871;
    out.m_69.z = _1873;
    bool _1875 = _1863 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1877 = isnan(_1863);
    bool _1879 = _1875 || _1877;
    bool _1881 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1883 = _1879 || _1881;
    float _1885 = _1861;
    float _1887 = _1865;
    float _1889 = _1873;
    if (!_1883)
    {
        _1885 = 1.0;
    }
    float _1891 = _1885;
    bool _1893 = !_1883;
    float _1895 = _1891;
    if (!_1893)
    {
        bool _1897 = _1863 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1899 = isnan(_1863);
        bool _1901 = _1897 || _1899;
        bool _1903 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1905 = _1901 || _1903;
        if (!_1905)
        {
            float _1907 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1909 = _1863 + _1907;
            float _1911 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1913 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1911;
            float _1915 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1917 = _1915 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1919 = 1.0 / _1913;
            float _1921 = _1909 * _1919;
            float _1923 = fma(_1921, _1917, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1895 = _1923;
            _1925 = true;
        }
        else
        {
            bool _1927 = _1863 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1929 = isnan(_1863);
            bool _1931 = _1927 || _1929;
            bool _1933 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1935 = _1931 || _1933;
            if (!_1935)
            {
                float _1937 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1939 = _1863 + _1937;
                float _1941 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1943 = _1941 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1945 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1947 = _1945 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1949 = 1.0 / _1943;
                float _1951 = _1939 * _1949;
                float _1953 = fma(_1951, _1947, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1895 = _1953;
                _1925 = true;
            }
            else
            {
                _1895 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1925 = false;
    float _1955 = _1895;
    float _1957 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1959 = _1825 + _1957;
    float _1961 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1963 = _1831 + _1961;
    float _1965 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1967 = _1833 + _1965;
    float _1969 = fma(_1959, _1955, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1971 = fma(_1963, _1955, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1973 = fma(_1967, _1955, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1977 = _1969 + _1975;
    float _1979 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1981 = _1971 + _1979;
    float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1985 = _1973 + _1983;
    float _1987 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1989 = _1977 * _1977;
    float _1991 = fma(_1981, _1981, _1989);
    float _1993 = fma(_1985, _1985, _1991);
    float _1995 = rsqrt(_1993);
    float _1997 = _1995 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1999 = _1981 * _1997;
    float _2001 = _1985 * _1997;
    float _2003 = _1999 * _1999;
    float _2005 = _2001 * _2001;
    float _2007 = _2003 + _2005;
    float _2009 = sqrt(_2007);
    bool _2011 = _2009 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2013 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2015 = _2009 + _2013;
    float _2017 = _1995;
    float _2019 = _2015;
    float _2021 = _1977;
    float _2023 = _1999;
    if (_2011)
    {
        float _2025 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2017 = _2025;
    }
    float _2027 = _2017;
    if (_2011)
    {
        float _2029 = rsqrt(_2007);
        _957 = _2029;
    }
    float _2031 = _957;
    float _2033 = _2031;
    if (_2011)
    {
        float _2035 = _2015 * _2027;
        _2019 = _2035;
    }
    float _2037 = _2019;
    float _2039 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2011)
    {
        float _2041 = _2037 * 0.15915493667125701904296875;
        _1887 = _2041;
    }
    float _2043 = _1887;
    float _2045 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2039);
    float _2047 = _1985;
    if (_2011)
    {
        float _2049 = _2043 * 6.283185482025146484375;
        float _2051 = sin(_2049);
        _2047 = _2051;
    }
    float _2053 = _2047;
    float _2055 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2057 = precise::max(0.0, _2055);
    float _2059 = _2027;
    float _2061 = _2057;
    if (_2011)
    {
        float _2063 = _2043 * 6.283185482025146484375;
        float _2065 = cos(_2063);
        _2059 = _2065;
    }
    float _2067 = _2059;
    float _2069 = -_1997;
    float _2071 = -_2057;
    float _2073 = fma(_1977, _2069, _2071);
    if (_2011)
    {
        float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2021 = _2075;
    }
    float _2077 = _2021;
    float _2079 = sqrt(_1993);
    float _2081 = _2077;
    float _2083 = _2053;
    if (_2011)
    {
        float _2085 = fma(_2053, _2077, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2081 = _2085;
    }
    float _2087 = _2081;
    float _2089 = _2087;
    if (!_2011)
    {
        _2083 = _2001;
    }
    float _2091 = _2083;
    float _2093 = _2091;
    if (_2011)
    {
        float _2095 = _2067 + (-1.0);
        _2061 = _2095;
    }
    float _2097 = _2061;
    float _2099 = _2097;
    if (_2011)
    {
        float _2101 = _2031 * _2087;
        _1889 = _2101;
    }
    float _2103 = _1889;
    if (!_2011)
    {
        _2033 = _2073;
    }
    float _2105 = _2033;
    float _2107 = _2105;
    if (_2011)
    {
        float _2109 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2099 = _2109;
    }
    float _2111 = _2099;
    float _2113 = _2111;
    if (_2011)
    {
        float _2115 = _1999 * _2103;
        _2023 = _2115;
    }
    float _2117 = _2023;
    if (!_2011)
    {
        _2089 = _2003;
    }
    float _2119 = _2089;
    float _2121 = _2119;
    if (_2011)
    {
        float _2123 = _2001 * _2103;
        _2093 = _2123;
    }
    float _2125 = _2093;
    if (_2011)
    {
        float _2127 = fma(_2073, _2067, _2111);
        _2107 = _2127;
    }
    float _2129 = _2107;
    if (_2011)
    {
        float _2131 = _2117 * _2117;
        _2121 = _2131;
    }
    float _2133 = _2121;
    if (!_2011)
    {
        _2113 = _2005;
    }
    float _2135 = _2113;
    float _2137 = _2135;
    if (_2011)
    {
        float _2139 = _2125 * _2125;
        _2137 = _2139;
    }
    float _2141 = _2137;
    float _2143 = fma(_2129, _2129, _2133);
    float _2145 = _2143 + _2141;
    float _2147 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2151 = fma(_2079, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2149);
    float _2153 = precise::clamp(_2151, 0.0, 1.0);
    float _2155 = rsqrt(_2145);
    float _2157 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2147);
    float _2159 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2161 = -_2153;
    float _2163 = _2161 + 1.0;
    float _2165 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2157);
    float _2167 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2169 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2159);
    float _2171 = _2165 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2173 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2167);
    float _2175 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2169);
    float _2177 = abs(_2163);
    float _2179 = log2(_2177);
    float _2181 = _2171 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2183 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2173);
    float _2185 = _2175 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2187 = _2155 * _2117;
    float _2189 = _2155 * _2129;
    float _2191 = _2183 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2193 = -_2181;
    float _2195 = fma(_2193, _1987, 1.0);
    float _2197 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2199 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2201 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2045);
    float _2203 = _2155 * _2125;
    float _2205 = -_2197;
    float _2207 = fma(_2189, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2205);
    float _2209 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2199);
    float _2211 = _2201 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2213 = log2(_2195);
    float _2215 = -_2203;
    float _2217 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2207);
    float _2219 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2209);
    float _2221 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2223 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2225 = fma(_2217, -0.5, 0.5);
    float _2227 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2219);
    float _2229 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2231 = exp2(_2221);
    float _2233 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2223);
    float _2235 = fma(_2217, 0.5, 0.5);
    float _2237 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2229);
    float _2239 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2233);
    float _2241 = fma(_2235, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2243 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2237);
    float _2245 = 1.0 / _2227;
    float _2247 = _2189 + 1.0;
    float _2249 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2239);
    float _2251 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2243);
    float _2253 = fma(_2235, _2241, -0.212114393711090087890625);
    float _2255 = _2213 * 0.693147182464599609375;
    float _2257 = sqrt(_2225);
    float _2259 = -_2189;
    float _2261 = fma(_2231, _2247, _2259);
    float _2263 = fma(_2235, _2253, 1.570728778839111328125);
    float _2265 = _2255 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2267 = fma(_2261, 0.5, 0.5);
    float _2269 = _2249 * _2245;
    float _2271 = _2251 * _2245;
    float _2273 = fma(_2269, 0.5, 0.5);
    float _2275 = fma(_2271, -0.5, 0.5);
    float _2277 = _2257 * 0.636619746685028076171875;
    float _2279 = -_2263;
    float _2281 = fma(_2277, _2279, 1.0);
    float3 _5737 = float3(_2273, _2275, _2265);
    float _2283 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5737, float3(0.0), isnan(_5737)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5737, float3(0.0), isnan(_5737)), level(0.0)).x;
    float3 _5748 = float3(_2273, _2275, _2265);
    float4 _2285 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5748, float3(0.0), isnan(_5748)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5748, float3(0.0), isnan(_5748)), level(0.0)).xyzw;
    float _2287 = _2285.x;
    float _2289 = _2285.y;
    float _2291 = _2285.z;
    float _2293 = _2285.w;
    float2 _5764 = float2(_2281, _2267);
    float3 _2297 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5764, float2(0.0), isnan(_5764)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5764, float2(0.0), isnan(_5764)), level(0.0)).xyz;
    float _2299 = _2297.x;
    float _2301 = _2297.y;
    float _2303 = _2297.z;
    float _2305 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2307 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_71.x = _1971;
    out.m_71.y = _1969;
    out.m_71.z = _1973;
    float _2309 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2307);
    float _2311 = exp2(_2305);
    float _2313 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2309);
    float _2315 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2313);
    float _2317 = _2315 + _2227;
    out.gl_Position.x = _2249;
    out.gl_Position.y = _2251;
    out.gl_Position.z = _2315;
    out.gl_Position.w = _2227;
    float _2319 = _2317 * 0.5;
    float _2321 = -_2311;
    float _2323 = _2321 + 1.0;
    float _2325 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2327 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.z = _2319;
    out.m_73.w = _2227;
    out.m_49.x = _2327;
    float _2329 = _2325 * _2283;
    float _2331 = -_2325;
    float _2333 = _2331 + 1.0;
    float _2335 = _2293 * _2329;
    float _2337 = _2303 * _2329;
    float _2339 = fma(_2299, _2335, _2287);
    float _2341 = fma(_2301, _2335, _2289);
    float _2343 = _2293 * _2333;
    float _2345 = fma(_2293, _2337, _2291);
    out.m_75.x = _2339;
    out.m_75.y = _2341;
    out.m_75.z = _2345;
    out.m_75.w = _2343;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

