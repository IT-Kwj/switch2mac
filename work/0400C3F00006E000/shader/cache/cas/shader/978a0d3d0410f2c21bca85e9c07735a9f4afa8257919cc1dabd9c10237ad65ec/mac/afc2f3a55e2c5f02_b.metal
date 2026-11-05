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
    texture2d_array<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
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
    bool _122 = false;
    bool _120 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _412 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_412, float2(0.0), isnan(_412))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_412, float2(0.0), isnan(_412))).x;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float _60 = -_54;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _56;
    float _68 = -_64;
    bool _72 = _68 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _74 = _64 * _58;
    float _76 = -_64;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _80 = -_64;
    bool _82 = _80 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _84 = !_72;
    int _87 = _84 ? 0 : 1;
    int _89 = 2;
    if (!_72)
    {
        _89 = 1;
    }
    int _91 = _89;
    int _93 = _91;
    if (!_78)
    {
        _93 = _87;
    }
    int _95 = _93;
    int _97 = _95 + 1;
    uint _100 = uint(_97);
    if (!_82)
    {
        _100 = uint(_95);
    }
    uint _102 = _100;
    uint _104 = min(_102, 2u);
    int _106 = int(_104) << 2;
    uint _108 = uint(int(uint(_106) >> uint(2)));
    uint _110 = uint(int(uint(int(_108)) >> uint(2)));
    int _112 = int(_108) & 3;
    float _114 = (*spvDescriptorSet0.fp_c1)._m0[int(_110)][_112];
    bool _116 = as_type<int>(_114) == 384;
    if (!_116)
    {
        bool _118 = as_type<int>(_114) == 656;
        _120 = _118;
        if (!_120)
        {
            _122 = true;
        }
    }
    float _156;
    float _158;
    float _160;
    float _162;
    if (!_120)
    {
        if (!_122)
        {
            float _124 = _74 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _126 = _74 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _128 = _74 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _130 = _74 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _132 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _124);
            float _134 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _126);
            float _136 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _128);
            float _138 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _130);
            float _140 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _132);
            float _142 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _134);
            float _144 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _136);
            float _146 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _138);
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _156 = _154;
            _158 = _148;
            _160 = _152;
            _162 = _150;
        }
    }
    if ((false || _122) || _120)
    {
        if ((!_122) || _120)
        {
            _120 = false;
            float _164 = _74 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _166 = _74 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _168 = _74 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _170 = _74 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _172 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, _164);
            float _174 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].x, _166);
            float _176 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].x, _168);
            float _178 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].x, _170);
            float _180 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, _172);
            float _182 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].z, _174);
            float _184 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].z, _176);
            float _186 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].z, _178);
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _156 = _194;
            _158 = _188;
            _160 = _192;
            _162 = _190;
        }
        if (false || _122)
        {
            _122 = false;
            float _196 = _74 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _198 = _74 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _200 = _74 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _202 = _74 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _204 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].x, _196);
            float _206 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].x, _198);
            float _208 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].x, _200);
            float _210 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].x, _202);
            float _212 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].z, _204);
            float _214 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].z, _206);
            float _216 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].z, _208);
            float _218 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].z, _210);
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _156 = _226;
            _158 = _220;
            _160 = _224;
            _162 = _222;
        }
    }
    float _228 = _156;
    float _230 = _158;
    float _232 = _160;
    float _234 = _162;
    float _236 = _74 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _238 = float(int(_102));
    float _240 = 1.0 / _228;
    float _242 = _74 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _244 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].x, _236);
    float _246 = _74 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _248 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].x, _242);
    float _250 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].z, _244);
    float _252 = rint(_238);
    float _254 = precise::max(_252, 0.0);
    uint _256 = uint(_254);
    uint _258 = clamp(_256, 0u, 65535u);
    float _260 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].z, _248);
    float _262 = _250 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _264 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].x, _246);
    float _266 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _268 = _260 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _270 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].z, _264);
    float _272 = 1.0 / _262;
    float _274 = _240 * _230;
    float _276 = _240 * _232;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = _270 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _282 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _284 = _240 * _234;
    float _286 = fma(_278, _282, _274);
    float _288 = -_282;
    float _290 = fma(_278, _288, _274);
    float _292 = fma(_278, _266, _284);
    float _294 = -_266;
    float _296 = fma(_278, _294, _284);
    float _298 = _268 * _272;
    float _300 = _280 * _272;
    float3 _927 = float3(_274, _292, float(int(_258)));
    float3 _931 = select(_927, float3(0.0), isnan(_927));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _931.xy, uint(rint(_931.z)), _278);
    float3 _940 = float3(_286, _292, float(int(_258)));
    float3 _942 = select(_940, float3(0.0), isnan(_940));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _942.xy, uint(rint(_942.z)), _278);
    float3 _951 = float3(_290, _292, float(int(_258)));
    float3 _953 = select(_951, float3(0.0), isnan(_951));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _953.xy, uint(rint(_953.z)), _278);
    float3 _962 = float3(_286, _284, float(int(_258)));
    float3 _964 = select(_962, float3(0.0), isnan(_962));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _964.xy, uint(rint(_964.z)), _278);
    float3 _973 = float3(_274, _284, float(int(_258)));
    float3 _975 = select(_973, float3(0.0), isnan(_973));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _975.xy, uint(rint(_975.z)), _278);
    float3 _984 = float3(_290, _284, float(int(_258)));
    float3 _986 = select(_984, float3(0.0), isnan(_984));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _986.xy, uint(rint(_986.z)), _278);
    float2 _992 = float2(_300, _298);
    float2 _316 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_992, float2(0.0), isnan(_992))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_992, float2(0.0), isnan(_992))).xy;
    float _318 = _316.x;
    float _320 = _316.y;
    float3 _1007 = float3(_286, _296, float(int(_258)));
    float3 _1009 = select(_1007, float3(0.0), isnan(_1007));
    float _322 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1009.xy, uint(rint(_1009.z)), _278);
    float3 _1018 = float3(_274, _296, float(int(_258)));
    float3 _1020 = select(_1018, float3(0.0), isnan(_1018));
    float _324 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1020.xy, uint(rint(_1020.z)), _278);
    float3 _1029 = float3(_290, _296, float(int(_258)));
    float3 _1031 = select(_1029, float3(0.0), isnan(_1029));
    float _326 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1031.xy, uint(rint(_1031.z)), _278);
    float2 _1037 = float2(_50, _52);
    float _328 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1037, float2(0.0), isnan(_1037))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1037, float2(0.0), isnan(_1037))).x;
    float _330 = _74 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _332 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].x, _330);
    float _334 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].z, _332);
    float _336 = _334 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _338 = precise::min(_336, 1.0);
    float _340 = -_64;
    float _342 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _344 = _340 + _342;
    float _346 = -_64;
    float _348 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _350 = _346 + _348;
    float _352 = _344 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _354 = precise::clamp(_352, 0.0, 1.0);
    float _356 = _304 + _302;
    float _358 = _356 + _306;
    float _360 = _358 + _308;
    float _362 = _360 + _310;
    float _364 = -_318;
    float _366 = fma(_364, _318, _320);
    float _368 = -_318;
    float _370 = _338 + _368;
    float _372 = _362 + _312;
    float _374 = fma(_370, _370, _366);
    float _376 = _372 + _322;
    bool _378 = _370 <= 0.001000000047497451305389404296875;
    float _380 = float(_378);
    float _382 = 1.0 / _374;
    float _384 = _376 + _324;
    float _386 = _384 + _326;
    float _388 = fma(_386, 0.111111111938953399658203125, _354);
    float _390 = _366 * _382;
    float _392 = _350 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _394 = precise::clamp(_392, 0.0, 1.0);
    float _396 = precise::max(_390, _380);
    float _398 = precise::min(_396, 1.0);
    float _400 = _398 + _394;
    out.m_43.x = _328;
    out.m_43.y = _388;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _400;
    return out;
}

