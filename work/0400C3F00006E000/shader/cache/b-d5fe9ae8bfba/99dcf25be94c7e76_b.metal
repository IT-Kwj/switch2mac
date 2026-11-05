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
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _1010, thread const int& _1011, constant _10& support_buffer)
{
    int _1014 = 1 + _1011;
    float _1016 = support_buffer._m5[_1014].x;
    float _1018 = abs(_1016);
    bool _1020 = _1018 == 1.0;
    if (_1020)
    {
        return _1010;
    }
    float _1022 = float(_1010);
    float _1024 = _1022 / _1018;
    int _1026 = int(_1024);
    return _1026;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_31.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_31.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _462 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_462, float2(0.0), isnan(_462))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_462, float2(0.0), isnan(_462))).x;
    bool _70 = _66 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_70)
    {
        discard_fragment();
    }
    if (_70)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _72 = in.m_36.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_36.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_36.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _92 = precise::clamp(_90, 0.0, 1.0);
    float _94 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _96 = precise::clamp(_94, 0.0, 1.0);
    float _98 = _60 * _76;
    float _100 = precise::max(_92, _98);
    bool _102 = _100 != 0.0;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan(0.0);
    bool _110 = _106 || _108;
    float _112 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _114 = precise::clamp(_112, 0.0, 1.0);
    float _116 = _60 * _82;
    float _118 = _60 * _88;
    float _120 = precise::min(_114, _96);
    bool _122 = !_110;
    if (!_122)
    {
        float _124 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _126 = fma(_100, _124, 1.0);
        float _128 = log2(_126);
        float _130 = _128 + (-1.0);
        float _132 = trunc(_130);
        int _134 = int(_132);
        int _136 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).x;
        int _138 = _136;
        int _140 = 1;
        int _142 = _42(_138, _140, (*spvDescriptorSet0.support_buffer));
        int _144 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).y;
        int _146 = _144;
        int _148 = 1;
        int _150 = _42(_146, _148, (*spvDescriptorSet0.support_buffer));
        float _152 = float(_142);
        float _154 = float(_150);
        float _156 = fma(_62, _152, -0.5);
        float _158 = fma(_64, _154, -0.5);
        float _160 = 1.0 / _152;
        float _162 = floor(_156);
        float _164 = floor(_158);
        float _166 = -_162;
        float _168 = _156 + _166;
        float _170 = -_168;
        float _172 = _170 + 1.0;
        float _174 = -_168;
        float _176 = _174 + 2.0;
        float _178 = -_164;
        float _180 = _158 + _178;
        float _182 = _172 * _172;
        float _184 = _176 * _176;
        float _186 = -_180;
        float _188 = _186 + 1.0;
        float _190 = _172 * _182;
        float _192 = -_180;
        float _194 = _192 + 2.0;
        float _196 = _188 * _188;
        float _198 = -_190;
        float _200 = _198 + 6.0;
        float _202 = _194 * _194;
        float _204 = _188 * _196;
        float _206 = _190 * 4.0;
        float _208 = _204 * 4.0;
        float _210 = -_206;
        float _212 = fma(_176, _184, _210);
        float _214 = -_204;
        float _216 = _214 + 6.0;
        float _218 = 1.0 / _154;
        float _220 = -_208;
        float _222 = fma(_194, _202, _220);
        float _224 = _190 + _212;
        float _226 = -_212;
        float _228 = _226 + _200;
        float _230 = _212 * 0.16666667163372039794921875;
        float _232 = _204 + _222;
        float _234 = -_222;
        float _236 = _234 + _216;
        float _238 = _224 * 0.16666667163372039794921875;
        float _240 = _228 * 0.16666667163372039794921875;
        float _242 = _232 * 0.16666667163372039794921875;
        float _244 = _236 * 0.16666667163372039794921875;
        float _246 = 1.0 / _238;
        float _248 = _180 * _180;
        float _250 = _168 * _168;
        float _252 = _222 * 0.16666667163372039794921875;
        float _254 = _164 + 1.5;
        float _256 = _180 * _248;
        float _258 = _168 * _250;
        float _260 = _164 + (-0.5);
        float _262 = 1.0 / _242;
        float _264 = _162 + (-0.5);
        float _266 = _256 * 0.16666667163372039794921875;
        float _268 = _162 + 1.5;
        float _270 = _258 * 0.16666667163372039794921875;
        float _272 = 1.0 / _244;
        float _274 = fma(_230, _246, _264);
        float _276 = _274 * _160;
        float _278 = 1.0 / _240;
        float _280 = fma(_252, _262, _260);
        float _282 = fma(_266, _272, _254);
        float _284 = _280 * _218;
        float _286 = _282 * _218;
        float _288 = fma(_270, _278, _268);
        float _290 = _288 * _160;
        float2 _779 = float2(_276, _284);
        float3 _294 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_779, float2(0.0), isnan(_779)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_779, float2(0.0), isnan(_779)), level(_130)).xyz;
        float _296 = _294.x;
        float _298 = _294.y;
        float _300 = _294.z;
        float2 _794 = float2(_290, _284);
        float3 _302 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_794, float2(0.0), isnan(_794)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_794, float2(0.0), isnan(_794)), level(_130)).xyz;
        float _304 = _302.x;
        float _306 = _302.y;
        float _308 = _302.z;
        float2 _809 = float2(_276, _286);
        float3 _310 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_809, float2(0.0), isnan(_809)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_809, float2(0.0), isnan(_809)), level(_130)).xyz;
        float _312 = _310.x;
        float _314 = _310.y;
        float _316 = _310.z;
        float2 _824 = float2(_290, _286);
        float3 _318 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_824, float2(0.0), isnan(_824)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_824, float2(0.0), isnan(_824)), level(_130)).xyz;
        float _320 = _318.x;
        float _322 = _318.y;
        float _324 = _318.z;
        float _326 = 0.0 + _128;
        float _328 = precise::clamp(_326, 0.0, 1.0);
        float _330 = fma(_118, _328, _116);
        float _332 = -_306;
        float _334 = _298 + _332;
        float _336 = -_304;
        float _338 = _296 + _336;
        float _340 = -_322;
        float _342 = _314 + _340;
        float _344 = -_320;
        float _346 = _312 + _344;
        float _348 = fma(_238, _334, _306);
        float _350 = fma(_238, _338, _304);
        float _352 = fma(_238, _342, _322);
        float _354 = -_308;
        float _356 = _300 + _354;
        float _358 = -_324;
        float _360 = _316 + _358;
        float _362 = fma(_238, _346, _320);
        float _364 = -_352;
        float _366 = _364 + _348;
        float _368 = fma(_238, _356, _308);
        float _370 = fma(_238, _360, _324);
        float _372 = -_362;
        float _374 = _372 + _350;
        float _376 = fma(_242, _366, _352);
        float _378 = _120 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _380 = -_370;
        float _382 = _380 + _368;
        float _384 = fma(_242, _374, _362);
        float _386 = _376 * 0.586600005626678466796875;
        float _388 = fma(_242, _382, _370);
        float _390 = fma(_384, 0.29890000820159912109375, _386);
        float _392 = fma(_388, 0.1143999993801116943359375, _390);
        float _394 = -_384;
        float _396 = _394 + _392;
        float _398 = -_376;
        float _400 = _398 + _392;
        float _402 = -_388;
        float _404 = _402 + _392;
        float _406 = fma(_378, _396, _384);
        float _408 = fma(_378, _400, _376);
        float _410 = fma(_378, _404, _388);
        float _412 = -_406;
        float _414 = fma(_406, (*spvDescriptorSet0.fp_c3)._m0[13].x, _412);
        float _416 = -_408;
        float _418 = fma(_408, (*spvDescriptorSet0.fp_c3)._m0[13].y, _416);
        float _420 = -_410;
        float _422 = fma(_410, (*spvDescriptorSet0.fp_c3)._m0[13].z, _420);
        float _424 = fma(_120, _414, _406);
        float _426 = fma(_120, _418, _408);
        float _428 = fma(_120, _422, _410);
        out.m_34.x = _424;
        out.m_34.y = _426;
        out.m_34.z = _428;
        out.m_34.w = _330;
        return out;
    }
    discard_fragment();
    return out;
}

