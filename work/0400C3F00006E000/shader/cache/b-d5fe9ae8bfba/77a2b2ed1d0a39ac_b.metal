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
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_36 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _124 = false;
    bool _122 = false;
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _364 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_364, float2(0.0), isnan(_364))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_364, float2(0.0), isnan(_364))).x;
    float _54 = in.m_38.y;
    float _56 = -_52;
    float _58 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _60 = 1.0 / _58;
    float _62 = in.m_38.x;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _60 * _64;
    float _68 = -_66;
    bool _72 = _68 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _74 = -_66;
    bool _76 = _74 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _78 = -_66;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _82 = !_72;
    int _85 = _82 ? 0 : 1;
    int _87 = 2;
    if (!_72)
    {
        _87 = 1;
    }
    int _89 = _87;
    int _91 = _89;
    if (!_76)
    {
        _91 = _85;
    }
    int _93 = _91;
    int _95 = _93 + 1;
    uint _98 = uint(_95);
    if (!_80)
    {
        _98 = uint(_93);
    }
    uint _100 = _98;
    uint _102 = min(_100, 2u);
    int _104 = int(_102) << 2;
    float _106 = _66 * _62;
    float _108 = _66 * _54;
    uint _110 = uint(int(uint(_104) >> uint(2)));
    uint _112 = uint(int(uint(int(_110)) >> uint(2)));
    int _114 = int(_110) & 3;
    float _116 = (*spvDescriptorSet0.fp_c1)._m0[int(_112)][_114];
    bool _118 = as_type<int>(_116) == 416;
    if (!_118)
    {
        bool _120 = as_type<int>(_116) == 688;
        _122 = _120;
        if (!_122)
        {
            _124 = true;
        }
    }
    float _158;
    float _160;
    float _162;
    float _164;
    if (!_122)
    {
        if (!_124)
        {
            float _126 = _108 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _128 = _108 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _130 = _108 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _132 = _108 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _134 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[0].x, _126);
            float _136 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[1].x, _128);
            float _138 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[2].x, _130);
            float _140 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[3].x, _132);
            float _142 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _134);
            float _144 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _136);
            float _146 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _138);
            float _148 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _140);
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _158 = _156;
            _160 = _150;
            _162 = _152;
            _164 = _154;
        }
    }
    if ((false || _124) || _122)
    {
        if ((!_124) || _122)
        {
            _122 = false;
            float _166 = _108 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _168 = _108 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _170 = _108 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _172 = _108 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _174 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[4].x, _166);
            float _176 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[5].x, _168);
            float _178 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[6].x, _170);
            float _180 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[7].x, _172);
            float _182 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _174);
            float _184 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _176);
            float _186 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _178);
            float _188 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _180);
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _158 = _196;
            _160 = _190;
            _162 = _192;
            _164 = _194;
        }
        if (false || _124)
        {
            _124 = false;
            float _198 = _108 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _200 = _108 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _202 = _108 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _204 = _108 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _206 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[8].x, _198);
            float _208 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[9].x, _200);
            float _210 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[10].x, _202);
            float _212 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[11].x, _204);
            float _214 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _206);
            float _216 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _208);
            float _218 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _210);
            float _220 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _212);
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _158 = _228;
            _160 = _222;
            _162 = _224;
            _164 = _226;
        }
    }
    float _230 = _158;
    float _232 = _160;
    float _234 = _162;
    float _236 = _164;
    float _238 = _108 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _240 = _108 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _242 = 1.0 / _230;
    float _244 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[15].x, _238);
    float _246 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[13].x, _240);
    float _248 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].z, _244);
    float _250 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].z, _246);
    float _252 = _248 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _254 = _108 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _256 = _250 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _258 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[12].x, _254);
    float _260 = 1.0 / _252;
    float _262 = _242 * _232;
    float _264 = _242 * _234;
    float _266 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].z, _258);
    float _268 = _242 * _236;
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = _266 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _274 = _272 * _260;
    float _276 = _256 * _260;
    float _278 = float(int(_100));
    float2 _837 = float2(_274, _276);
    float2 _282 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_837, float2(0.0), isnan(_837))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_837, float2(0.0), isnan(_837))).xy;
    float _284 = _282.x;
    float _286 = _282.y;
    float _288 = rint(_278);
    float _290 = precise::max(_288, 0.0);
    uint _292 = uint(_290);
    uint _294 = clamp(_292, 0u, 65535u);
    float3 _863 = float3(_262, _264, float(int(_294)));
    float3 _867 = select(_863, float3(0.0), isnan(_863));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _867.xy, uint(rint(_867.z)), _270);
    float _298 = _108 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _300 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[14].x, _298);
    float _302 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].z, _300);
    float _304 = _302 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _306 = precise::min(_304, 1.0);
    float _308 = -_66;
    float _310 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _312 = _308 + _310;
    float _314 = _312 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = -_284;
    float _320 = fma(_318, _284, _286);
    float _322 = -_284;
    float _324 = _306 + _322;
    float _326 = -_66;
    float _328 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _330 = _326 + _328;
    float _332 = fma(_324, _324, _320);
    bool _334 = _324 <= 0.001000000047497451305389404296875;
    float _336 = float(_334);
    float _338 = _330 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _340 = precise::clamp(_338, 0.0, 1.0);
    float _342 = 1.0 / _332;
    float _344 = _296 + _340;
    float _346 = _320 * _342;
    float _348 = precise::max(_346, _336);
    float _350 = precise::min(_348, 1.0);
    float _352 = _350 + _316;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _344;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _352;
    return out;
}

