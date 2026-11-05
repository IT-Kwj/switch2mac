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
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _124 = false;
    bool _122 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _384 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_384, float2(0.0), isnan(_384))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_384, float2(0.0), isnan(_384))).x;
    float _58 = in.m_42.x;
    float _60 = -_56;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _58;
    float _68 = -_64;
    bool _72 = _68 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _74 = -_64;
    bool _76 = _74 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _78 = -_64;
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
    float _106 = in.m_42.y;
    uint _108 = uint(int(uint(_104) >> uint(2)));
    uint _110 = uint(int(uint(int(_108)) >> uint(2)));
    int _112 = int(_108) & 3;
    float _114 = (*spvDescriptorSet0.fp_c1)._m0[int(_110)][_112];
    float _116 = _64 * _106;
    bool _118 = as_type<int>(_114) == 384;
    if (!_118)
    {
        bool _120 = as_type<int>(_114) == 656;
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
            float _126 = _116 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _128 = _116 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _130 = _116 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _132 = _116 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _134 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _126);
            float _136 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _128);
            float _138 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _130);
            float _140 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _132);
            float _142 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _134);
            float _144 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _136);
            float _146 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _138);
            float _148 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _140);
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _158 = _156;
            _160 = _152;
            _162 = _150;
            _164 = _154;
        }
    }
    if ((false || _124) || _122)
    {
        if ((!_124) || _122)
        {
            _122 = false;
            float _166 = _116 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _168 = _116 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _170 = _116 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _172 = _116 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _174 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, _166);
            float _176 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].x, _168);
            float _178 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].x, _170);
            float _180 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].x, _172);
            float _182 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, _174);
            float _184 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].z, _176);
            float _186 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].z, _178);
            float _188 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].z, _180);
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _158 = _196;
            _160 = _192;
            _162 = _190;
            _164 = _194;
        }
        if (false || _124)
        {
            _124 = false;
            float _198 = _116 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _200 = _116 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _202 = _116 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _204 = _116 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _206 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].x, _198);
            float _208 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].x, _200);
            float _210 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].x, _202);
            float _212 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].x, _204);
            float _214 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].z, _206);
            float _216 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].z, _208);
            float _218 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].z, _210);
            float _220 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].z, _212);
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _158 = _228;
            _160 = _224;
            _162 = _222;
            _164 = _226;
        }
    }
    float _230 = _158;
    float _232 = _160;
    float _234 = _162;
    float _236 = _164;
    float _238 = _116 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _240 = _116 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _242 = 1.0 / _230;
    float _244 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].x, _238);
    float _246 = _116 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _248 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].x, _240);
    float _250 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].z, _244);
    float _252 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].z, _248);
    float _254 = _250 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _256 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].x, _246);
    float _258 = float(int(_100));
    float _260 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].z, _256);
    float _262 = 1.0 / _254;
    float _264 = _242 * _232;
    float _266 = _242 * _234;
    float _268 = _260 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _270 = _252 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _272 = _242 * _236;
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = rint(_258);
    float _278 = precise::max(_276, 0.0);
    uint _280 = uint(_278);
    uint _282 = clamp(_280, 0u, 65535u);
    float _284 = _268 * _262;
    float _286 = _270 * _262;
    float2 _863 = float2(_52, _54);
    float2 _290 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_863, float2(0.0), isnan(_863))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_863, float2(0.0), isnan(_863))).xy;
    float _292 = _290.x;
    float _294 = _290.y;
    float2 _875 = float2(_284, _286);
    float2 _296 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_875, float2(0.0), isnan(_875))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_875, float2(0.0), isnan(_875))).xy;
    float _298 = _296.x;
    float _300 = _296.y;
    float3 _891 = float3(_266, _264, float(int(_282)));
    float3 _895 = select(_891, float3(0.0), isnan(_891));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _895.xy, uint(rint(_895.z)), _274);
    float _304 = fma(_292, 2.0, -1.0);
    float _306 = fma(_294, 2.0, -1.0);
    float _308 = _304 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _310 = _306 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _312 = fma(_308, 2.0, _52);
    float _314 = fma(_310, 2.0, _54);
    float2 _922 = float2(_312, _314);
    float _316 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_922, float2(0.0), isnan(_922))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_922, float2(0.0), isnan(_922))).x;
    float _318 = _116 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _320 = -_298;
    float _322 = fma(_320, _298, _300);
    float _324 = -_64;
    float _326 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _328 = _324 + _326;
    float _330 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].x, _318);
    float _332 = -_64;
    float _334 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _336 = _332 + _334;
    float _338 = _328 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _340 = precise::clamp(_338, 0.0, 1.0);
    float _342 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].z, _330);
    float _344 = _336 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _346 = precise::clamp(_344, 0.0, 1.0);
    float _348 = _302 + _340;
    float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _352 = precise::min(_350, 1.0);
    float _354 = -_298;
    float _356 = _352 + _354;
    float _358 = fma(_356, _356, _322);
    bool _360 = _356 <= 0.001000000047497451305389404296875;
    float _362 = float(_360);
    float _364 = 1.0 / _358;
    float _366 = _322 * _364;
    float _368 = precise::max(_366, _362);
    float _370 = precise::min(_368, 1.0);
    float _372 = _370 + _346;
    out.m_45.x = _316;
    out.m_45.y = _348;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _372;
    return out;
}

