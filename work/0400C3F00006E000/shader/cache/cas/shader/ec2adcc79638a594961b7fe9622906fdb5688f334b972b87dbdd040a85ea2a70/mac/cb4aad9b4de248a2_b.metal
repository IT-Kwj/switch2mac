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
    texture2d<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _126 = false;
    bool _124 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _368 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_368, float2(0.0), isnan(_368))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_368, float2(0.0), isnan(_368))).x;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float _60 = -_54;
    float _62 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _64 = 1.0 / _62;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = _64 * _66;
    float _70 = _68 * _56;
    float _72 = -_68;
    bool _76 = _72 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _78 = _68 * _58;
    float _80 = -_68;
    bool _82 = _80 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _84 = -_68;
    bool _86 = _84 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _88 = !_76;
    int _91 = _88 ? 0 : 1;
    int _93 = 2;
    if (!_76)
    {
        _93 = 1;
    }
    int _95 = _93;
    int _97 = _95;
    if (!_82)
    {
        _97 = _91;
    }
    int _99 = _97;
    int _101 = _99 + 1;
    uint _104 = uint(_101);
    if (!_86)
    {
        _104 = uint(_99);
    }
    uint _106 = _104;
    uint _108 = min(_106, 2u);
    int _110 = int(_108) << 2;
    uint _112 = uint(int(uint(_110) >> uint(2)));
    uint _114 = uint(int(uint(int(_112)) >> uint(2)));
    int _116 = int(_112) & 3;
    float _118 = (*spvDescriptorSet0.fp_c1)._m0[int(_114)][_116];
    bool _120 = as_type<int>(_118) == 416;
    if (!_120)
    {
        bool _122 = as_type<int>(_118) == 688;
        _124 = _122;
        if (!_124)
        {
            _126 = true;
        }
    }
    float _160;
    float _162;
    float _164;
    float _166;
    if (!_124)
    {
        if (!_126)
        {
            float _128 = _78 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _130 = _78 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _132 = _78 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _134 = _78 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _136 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _128);
            float _138 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _130);
            float _140 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _132);
            float _142 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _134);
            float _144 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _136);
            float _146 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _138);
            float _148 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _140);
            float _150 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _142);
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _160 = _158;
            _162 = _154;
            _164 = _152;
            _166 = _156;
        }
    }
    if ((false || _126) || _124)
    {
        if ((!_126) || _124)
        {
            _124 = false;
            float _168 = _78 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _170 = _78 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _172 = _78 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _174 = _78 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _176 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].x, _168);
            float _178 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[5].x, _170);
            float _180 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].x, _172);
            float _182 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[7].x, _174);
            float _184 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].z, _176);
            float _186 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].z, _178);
            float _188 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].z, _180);
            float _190 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].z, _182);
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _160 = _198;
            _162 = _194;
            _164 = _192;
            _166 = _196;
        }
        if (false || _126)
        {
            _126 = false;
            float _200 = _78 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _202 = _78 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _204 = _78 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _206 = _78 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _208 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[8].x, _200);
            float _210 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[9].x, _202);
            float _212 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].x, _204);
            float _214 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[11].x, _206);
            float _216 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].z, _208);
            float _218 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].z, _210);
            float _220 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].z, _212);
            float _222 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].z, _214);
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _230 = _222 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _160 = _230;
            _162 = _226;
            _164 = _224;
            _166 = _228;
        }
    }
    float _232 = _160;
    float _234 = _162;
    float _236 = _164;
    float _238 = _166;
    float _240 = _78 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _242 = _78 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _244 = 1.0 / _232;
    float _246 = float(int(_106));
    float _248 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[15].x, _240);
    float _250 = _78 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _252 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[13].x, _242);
    float _254 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].z, _248);
    float _256 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].z, _252);
    float _258 = rint(_246);
    float _260 = precise::max(_258, 0.0);
    uint _262 = uint(_260);
    uint _264 = clamp(_262, 0u, 65535u);
    float _266 = _254 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _268 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[12].x, _250);
    float _270 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].z, _268);
    float _272 = _244 * _234;
    float _274 = 1.0 / _266;
    float _276 = _244 * _236;
    float _278 = _270 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _280 = _256 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _282 = _244 * _238;
    float _284 = precise::clamp(_282, 0.0, 1.0);
    float _286 = _278 * _274;
    float _288 = _280 * _274;
    float2 _851 = float2(_286, _288);
    float2 _292 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_851, float2(0.0), isnan(_851))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_851, float2(0.0), isnan(_851))).xy;
    float _294 = _292.x;
    float _296 = _292.y;
    float3 _867 = float3(_276, _272, float(int(_264)));
    float3 _871 = select(_867, float3(0.0), isnan(_867));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _871.xy, uint(rint(_871.z)), _284);
    float2 _877 = float2(_50, _52);
    float _300 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_877, float2(0.0), isnan(_877))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_877, float2(0.0), isnan(_877))).x;
    float _302 = _78 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _304 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[14].x, _302);
    float _306 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].z, _304);
    float _308 = _306 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _310 = precise::min(_308, 1.0);
    float _312 = -_68;
    float _314 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _316 = _312 + _314;
    float _318 = -_68;
    float _320 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _322 = _318 + _320;
    float _324 = _316 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _326 = precise::clamp(_324, 0.0, 1.0);
    float _328 = _322 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _330 = precise::clamp(_328, 0.0, 1.0);
    float _332 = -_294;
    float _334 = fma(_332, _294, _296);
    float _336 = -_294;
    float _338 = _310 + _336;
    float _340 = _298 + _326;
    float _342 = fma(_338, _338, _334);
    bool _344 = _338 <= 0.001000000047497451305389404296875;
    float _346 = float(_344);
    float _348 = 1.0 / _342;
    float _350 = _334 * _348;
    float _352 = precise::max(_350, _346);
    float _354 = precise::min(_352, 1.0);
    float _356 = _354 + _330;
    out.m_43.x = _300;
    out.m_43.y = _340;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _356;
    return out;
}

