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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    device _23* cp_s0 [[id(1)]];
    texturecube<float> cp_t_tcb_A [[id(2)]];
    sampler cp_t_tcb_ASmplr [[id(3)]];
    texturecube<float> cp_t_tcb_8 [[id(4)]];
    sampler cp_t_tcb_8Smplr [[id(5)]];
    sampler cp_t_tcb_ASmplr_w [[id(6)]];
    sampler cp_t_tcb_8Smplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    float _40 = 0.0;
    float _42 = 0.0;
    float _44 = 0.0;
    float _46 = 0.0;
    float _48 = 0.0;
    float _50 = 0.0;
    float _52 = 0.0;
    float _54 = 0.0;
    float _56 = 0.0;
    float _58 = 0.0;
    float _60 = 0.0;
    float _62 = 0.0;
    float _64 = 0.0;
    bool _68;
    bool _154;
    float _310;
    float _312;
    float _314;
    float _316;
    float _318;
    float _320;
    float _322;
    float _324;
    float _326;
    float _328;
    float _330;
    float _332;
    do
    {
        float _70 = _40;
        float _72 = _42;
        float _74 = _44;
        float _76 = _46;
        float _78 = _48;
        float _80 = _50;
        float _82 = _52;
        float _84 = _54;
        float _86 = _56;
        float _88 = _58;
        float _90 = _60;
        float _92 = _62;
        float _94 = _64;
        float _96 = _70 * 0.15915493667125701904296875;
        bool _98 = 0.0 != (*spvDescriptorSet0.cp_c3)._m0[3].z;
        bool _100 = isnan(0.0);
        bool _102 = _98 || _100;
        bool _104 = isnan((*spvDescriptorSet0.cp_c3)._m0[3].z);
        bool _106 = _102 || _104;
        float _108 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[3].w;
        bool _110 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[3].w;
        bool _112 = _110 && _106;
        float _114 = _112 ? (*spvDescriptorSet0.cp_c3)._m0[2].w : 1.0;
        float _116 = _96 * 6.283185482025146484375;
        float _118 = cos(_116);
        float _120 = _114 * (*spvDescriptorSet0.cp_c3)._m0[2].x;
        float _122 = _96 * 6.283185482025146484375;
        float _124 = sin(_122);
        float _126 = _118 * _118;
        float _128 = -3.1415927410125732421875;
        float _130 = _72;
        float _132 = _74;
        float _134 = _76;
        float _136 = _78;
        float _138 = _80;
        float _140 = _82;
        float _142 = _84;
        float _144 = _86;
        float _146 = _88;
        float _148 = _90;
        float _150 = _92;
        float _152 = _94;
        do
        {
            float _156 = _128;
            float _158 = _130;
            float _160 = _132;
            float _162 = _134;
            float _164 = _136;
            float _166 = _138;
            float _168 = _140;
            float _170 = _142;
            float _172 = _144;
            float _174 = _146;
            float _176 = _148;
            float _178 = _150;
            float _180 = _152;
            float _182 = _156 * 0.15915493667125701904296875;
            float _184 = _182 * 6.283185482025146484375;
            float _186 = cos(_184);
            float _188 = _182 * 6.283185482025146484375;
            float _190 = sin(_188);
            float _192 = _124 * _186;
            float _194 = fma(_192, _192, _126);
            float _196 = _124 * _190;
            float _198 = fma(_196, _196, _194);
            float _200 = rsqrt(_198);
            float _202 = _192 * _200;
            float _204 = _118 * _200;
            float _206 = _196 * _200;
            float _208 = abs(_202);
            float _210 = abs(_204);
            float _212 = precise::max(_208, _210);
            float _214 = abs(_206);
            float _216 = precise::max(_214, _212);
            float _218 = 1.0 / _216;
            float _220 = -_218;
            float _222 = _206 * _220;
            float _224 = _202 * _218;
            float _226 = _204 * _218;
            float3 _528 = float3(_224, _226, _222);
            float _228 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_528, float3(0.0), isnan(_528)), level((*spvDescriptorSet0.cp_c3)._m0[1].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_528, float3(0.0), isnan(_528)), level((*spvDescriptorSet0.cp_c3)._m0[1].y)).x;
            float3 _542 = float3(_224, _226, _222);
            float3 _232 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_542, float3(0.0), isnan(_542)), level((*spvDescriptorSet0.cp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_542, float3(0.0), isnan(_542)), level((*spvDescriptorSet0.cp_c3)._m0[1].x)).xyz;
            float _234 = _232.x;
            float _236 = _232.y;
            float _238 = _232.z;
            float _240 = _156 + (*spvDescriptorSet0.cp_c3)._m0[0].y;
            float _242 = _204 * 0.48860299587249755859375;
            float _244 = -_228;
            float _246 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
            float _248 = fma(_244, (*spvDescriptorSet0.cp_c3)._m0[3].y, _246);
            float _250 = abs(_248);
            float _252 = -_250;
            float _254 = _252 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
            float _256 = abs(_248);
            bool _258 = _256 > (*spvDescriptorSet0.cp_c3)._m0[2].z;
            bool _260 = isnan(_256);
            bool _262 = _258 || _260;
            bool _264 = isnan((*spvDescriptorSet0.cp_c3)._m0[2].z);
            bool _266 = _262 || _264;
            float _268 = precise::max(0.0, _254);
            float _270 = _268 * _108;
            float _272 = precise::clamp(_270, 0.0, 1.0);
            float _274 = abs(_272);
            float _276 = log2(_274);
            float _278 = _276 * (*spvDescriptorSet0.cp_c3)._m0[3].z;
            float _280 = exp2(_278);
            float _282 = _112 ? _280 : 1.0;
            float _284 = _282 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
            bool _286 = !_266;
            float _288 = _286 ? _284 : _120;
            bool _290 = _240 >= 3.1415927410125732421875;
            bool _292 = isnan(_240);
            bool _294 = _290 || _292;
            bool _296 = isnan(3.1415927410125732421875);
            bool _298 = _294 || _296;
            float _300 = _234 * _288;
            float _302 = _236 * _288;
            float _304 = _238 * _288;
            float _306 = _206 * 0.48860299587249755859375;
            float _308 = _202 * 0.48860299587249755859375;
            _310 = fma(_300, 0.2820949852466583251953125, _158);
            _312 = fma(_300, _242, _160);
            _314 = fma(_300, _306, _162);
            _316 = fma(_300, _308, _164);
            _318 = fma(_302, 0.2820949852466583251953125, _166);
            _320 = fma(_302, _242, _168);
            _322 = fma(_302, _306, _170);
            _324 = fma(_302, _308, _172);
            _326 = fma(_304, _242, _174);
            _328 = fma(_304, _306, _176);
            _330 = fma(_304, _308, _178);
            _332 = fma(_304, 0.2820949852466583251953125, _180);
            _154 = !_298;
            _42 = _310;
            _44 = _312;
            _46 = _314;
            _48 = _316;
            _50 = _318;
            _52 = _320;
            _54 = _322;
            _56 = _324;
            _58 = _326;
            _60 = _328;
            _62 = _330;
            _64 = _332;
            _128 = _240;
            _130 = _310;
            _132 = _312;
            _134 = _314;
            _136 = _316;
            _138 = _318;
            _140 = _320;
            _142 = _322;
            _144 = _324;
            _146 = _326;
            _148 = _328;
            _150 = _330;
            _152 = _332;
        } while (_154);
        float _334 = _70 + (*spvDescriptorSet0.cp_c3)._m0[0].x;
        bool _336 = _334 > 3.1415927410125732421875;
        bool _338 = isnan(_334);
        bool _340 = _336 || _338;
        bool _342 = isnan(3.1415927410125732421875);
        bool _344 = _340 || _342;
        _68 = !_344;
        _40 = _334;
    } while (_68);
    float _346 = _312 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _348 = _314 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _350 = _316 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _352 = _320 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _354 = _322 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _356 = _324 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _358 = _310 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _360 = _318 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _362 = _332 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _364 = _326 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _366 = _328 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _368 = _330 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    (*spvDescriptorSet0.cp_s0)._m0[0] = as_type<uint>(_358);
    (*spvDescriptorSet0.cp_s0)._m0[1] = as_type<uint>(_346);
    (*spvDescriptorSet0.cp_s0)._m0[2] = as_type<uint>(_348);
    (*spvDescriptorSet0.cp_s0)._m0[3] = as_type<uint>(_350);
    (*spvDescriptorSet0.cp_s0)._m0[4] = as_type<uint>(_360);
    (*spvDescriptorSet0.cp_s0)._m0[5] = as_type<uint>(_352);
    (*spvDescriptorSet0.cp_s0)._m0[6] = as_type<uint>(_354);
    (*spvDescriptorSet0.cp_s0)._m0[7] = as_type<uint>(_356);
    (*spvDescriptorSet0.cp_s0)._m0[8] = as_type<uint>(_362);
    (*spvDescriptorSet0.cp_s0)._m0[9] = as_type<uint>(_364);
    (*spvDescriptorSet0.cp_s0)._m0[10] = as_type<uint>(_366);
    (*spvDescriptorSet0.cp_s0)._m0[11] = as_type<uint>(_368);
}

