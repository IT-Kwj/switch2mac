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
    bool _128 = false;
    bool _126 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _388 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_388, float2(0.0), isnan(_388))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_388, float2(0.0), isnan(_388))).x;
    float _58 = in.m_42.x;
    float _60 = -_56;
    float _62 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _64 = 1.0 / _62;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = _64 * _66;
    float _70 = _68 * _58;
    float _72 = -_68;
    bool _76 = _72 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _78 = -_68;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _82 = -_68;
    bool _84 = _82 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _86 = !_76;
    int _89 = _86 ? 0 : 1;
    int _91 = 2;
    if (!_76)
    {
        _91 = 1;
    }
    int _93 = _91;
    int _95 = _93;
    if (!_80)
    {
        _95 = _89;
    }
    int _97 = _95;
    int _99 = _97 + 1;
    uint _102 = uint(_99);
    if (!_84)
    {
        _102 = uint(_97);
    }
    uint _104 = _102;
    uint _106 = min(_104, 2u);
    int _108 = int(_106) << 2;
    float _110 = in.m_42.y;
    uint _112 = uint(int(uint(_108) >> uint(2)));
    uint _114 = uint(int(uint(int(_112)) >> uint(2)));
    int _116 = int(_112) & 3;
    float _118 = (*spvDescriptorSet0.fp_c1)._m0[int(_114)][_116];
    float _120 = _68 * _110;
    bool _122 = as_type<int>(_118) == 416;
    if (!_122)
    {
        bool _124 = as_type<int>(_118) == 688;
        _126 = _124;
        if (!_126)
        {
            _128 = true;
        }
    }
    float _162;
    float _164;
    float _166;
    float _168;
    if (!_126)
    {
        if (!_128)
        {
            float _130 = _120 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _132 = _120 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _134 = _120 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _136 = _120 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _138 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _130);
            float _140 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _132);
            float _142 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _134);
            float _144 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _136);
            float _146 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _138);
            float _148 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _140);
            float _150 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _142);
            float _152 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _144);
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _160 = _152 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _162 = _160;
            _164 = _156;
            _166 = _154;
            _168 = _158;
        }
    }
    if ((false || _128) || _126)
    {
        if ((!_128) || _126)
        {
            _126 = false;
            float _170 = _120 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _172 = _120 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _174 = _120 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _176 = _120 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _178 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].x, _170);
            float _180 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[5].x, _172);
            float _182 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].x, _174);
            float _184 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[7].x, _176);
            float _186 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].z, _178);
            float _188 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].z, _180);
            float _190 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].z, _182);
            float _192 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].z, _184);
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _200 = _192 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _162 = _200;
            _164 = _196;
            _166 = _194;
            _168 = _198;
        }
        if (false || _128)
        {
            _128 = false;
            float _202 = _120 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _204 = _120 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _206 = _120 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _208 = _120 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _210 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[8].x, _202);
            float _212 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[9].x, _204);
            float _214 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].x, _206);
            float _216 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[11].x, _208);
            float _218 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].z, _210);
            float _220 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].z, _212);
            float _222 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].z, _214);
            float _224 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].z, _216);
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _230 = _222 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _232 = _224 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _162 = _232;
            _164 = _228;
            _166 = _226;
            _168 = _230;
        }
    }
    float _234 = _162;
    float _236 = _164;
    float _238 = _166;
    float _240 = _168;
    float _242 = _120 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _244 = _120 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _246 = 1.0 / _234;
    float _248 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[15].x, _242);
    float _250 = _120 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _252 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[13].x, _244);
    float _254 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].z, _248);
    float _256 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].z, _252);
    float _258 = _254 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _260 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[12].x, _250);
    float _262 = float(int(_104));
    float _264 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].z, _260);
    float _266 = 1.0 / _258;
    float _268 = _246 * _236;
    float _270 = _246 * _238;
    float _272 = _264 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _274 = _256 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _276 = _246 * _240;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = rint(_262);
    float _282 = precise::max(_280, 0.0);
    uint _284 = uint(_282);
    uint _286 = clamp(_284, 0u, 65535u);
    float _288 = _272 * _266;
    float _290 = _274 * _266;
    float2 _871 = float2(_52, _54);
    float2 _294 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_871, float2(0.0), isnan(_871))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_871, float2(0.0), isnan(_871))).xy;
    float _296 = _294.x;
    float _298 = _294.y;
    float2 _883 = float2(_288, _290);
    float2 _300 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_883, float2(0.0), isnan(_883))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_883, float2(0.0), isnan(_883))).xy;
    float _302 = _300.x;
    float _304 = _300.y;
    float3 _899 = float3(_270, _268, float(int(_286)));
    float3 _903 = select(_899, float3(0.0), isnan(_899));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _903.xy, uint(rint(_903.z)), _278);
    float _308 = fma(_296, 2.0, -1.0);
    float _310 = fma(_298, 2.0, -1.0);
    float _312 = _308 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _314 = _310 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _316 = fma(_312, 2.0, _52);
    float _318 = fma(_314, 2.0, _54);
    float2 _930 = float2(_316, _318);
    float _320 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_930, float2(0.0), isnan(_930))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_930, float2(0.0), isnan(_930))).x;
    float _322 = _120 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _324 = -_302;
    float _326 = fma(_324, _302, _304);
    float _328 = -_68;
    float _330 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _332 = _328 + _330;
    float _334 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[14].x, _322);
    float _336 = -_68;
    float _338 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _340 = _336 + _338;
    float _342 = _332 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _344 = precise::clamp(_342, 0.0, 1.0);
    float _346 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].z, _334);
    float _348 = _340 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _350 = precise::clamp(_348, 0.0, 1.0);
    float _352 = _306 + _344;
    float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _356 = precise::min(_354, 1.0);
    float _358 = -_302;
    float _360 = _356 + _358;
    float _362 = fma(_360, _360, _326);
    bool _364 = _360 <= 0.001000000047497451305389404296875;
    float _366 = float(_364);
    float _368 = 1.0 / _362;
    float _370 = _326 * _368;
    float _372 = precise::max(_370, _366);
    float _374 = precise::min(_372, 1.0);
    float _376 = _374 + _350;
    out.m_45.x = _320;
    out.m_45.y = _352;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _376;
    return out;
}

